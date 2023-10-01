package com.muling.db.runner.service;

import com.muling.db.runner.common.MsgConstants;
import com.muling.db.runner.po.VersionResult;
import com.muling.db.runner.util.FileUtil;
import com.muling.db.runner.util.StringUtil;
import jodd.mail.Email;
import jodd.mail.SendMailSession;
import jodd.mail.SmtpServer;
import jodd.util.StringPool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.io.File;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class MailService {

    private static final String NOTIFY_EMAIL = "notifyEmail.txt";

    private static Logger logger = LoggerFactory.getLogger(MailService.class);

    @Value("${mail.host:unknow}")
    private String host;

    @Value("${mail.port:0}")
    private int port;

    @Value("${mail.username:unknow}")
    private String username;

    @Value("${mail.password:unknow}")
    private String password;

    @Value("${mail.to:unknow}")
    private String mailTo;

    /**
     * 邮件通知执行结果
     *
     * @param service
     * @param versionResults
     */
    public void emailNotify(String service, List<VersionResult> versionResults) {

        if (!checkEnable() || CollectionUtils.isEmpty(versionResults)) {
            return;
        }

        StringBuilder subjectBuilder = new StringBuilder();
        StringBuilder contentBuilder = new StringBuilder();

        subjectBuilder.append("【");
        subjectBuilder.append(service);
        subjectBuilder.append("】");

        if (versionResults.get(versionResults.size() - 1).isSuccess()) {

            subjectBuilder.append(MsgConstants.EXE_SUCCESS);

            VersionResult result = versionResults.get(versionResults.size() - 1);
            contentBuilder.append("【");
            contentBuilder.append(service);
            contentBuilder.append("-");
            contentBuilder.append(result.getVersion());
            contentBuilder.append("】");
            contentBuilder.append(MsgConstants.EXE_SUCCESS);

        } else {

            subjectBuilder.append(MsgConstants.EXE_FAILED);
            contentBuilder.append(MsgConstants.EXE_FAILED);

            for (int i = versionResults.size() - 1; i >= 0; i--) {

                VersionResult result = versionResults.get(i);

                contentBuilder.append(result.getVersion());
                contentBuilder.append(" ");

                if (result.isSuccess()) {
                    contentBuilder.append(MsgConstants.EXE_SUCCESS);
                    contentBuilder.append(" \n\n");
                } else {
                    contentBuilder.append(MsgConstants.EXE_FAILED);
                    contentBuilder.append(" ");
                    contentBuilder.append(result.getMessage());
                    contentBuilder.append("\n\n");
                }
            }
        }

        try {
            sendSimpleMail(subjectBuilder.toString(), contentBuilder.toString());
        } catch (Exception e) {
            logger.error("", e);
        }
    }

    /**
     * 组装Email对象 调用doSend
     *
     * @param subject
     * @param content
     */
    public void sendSimpleMail(String subject, String content) {

        if (!checkEnable()) {
            return;
        }

        Email email = Email.create()
                .from(username)
                .subject(subject, StringPool.UTF_8)
                .textMessage(content, StringPool.UTF_8)
                .sentDate(new Date());

        //获取文件中需要通知的email 【ci变量配置、环境变量】
        File emailFile = new File(NOTIFY_EMAIL);
        Set<String> toEmails = new HashSet<>();

        if (emailFile.exists()) {
            String emailStr = FileUtil.readToString(emailFile);
            StringUtil.splitToWithComma(emailStr, toEmails);
        }

        StringUtil.splitToWithComma(mailTo, toEmails);

        if (toEmails.size() == 0) {
            return;
        }

        for (String to : toEmails) {
            email.to(to);
        }

        if (!doSend(email)) {
            //失败重试一次
            doSend(email);
        }

    }


    /**
     * 创建一个SmtpServer
     *
     * @return
     */
    protected SmtpServer createSendServer() {
        return SmtpServer.create()
                .host(host)
                .port(port)
                .auth(username, password)
                .ssl(true)
                .timeout(30000)
                .property(jodd.mail.MailServer.MAIL_SMTP_STARTTLS_ENABLE, Boolean.FALSE.toString())
                .buildSmtpMailServer();
    }

    /**
     * 底层发送函数
     *
     * @param email
     * @return
     */
    protected boolean doSend(Email email) {

        SendMailSession session = createSendServer().createSession();

        try {
            logger.info("[MAIL] 开始发送邮件");
            logger.info("[MAIL] To：{} , Subject：{}", email.to(), email.subject());

            session.open();
            session.sendMail(email);

            logger.info("[MAIL] 邮件发送结束");

        } catch (Exception e) {
            logger.error("", e);
            return false;
        } finally {
            session.close();
        }
        return true;
    }

    private boolean checkEnable() {

        if ("unknow".equalsIgnoreCase(host) || port == 0) {
            return false;
        }
        return true;
    }
}
