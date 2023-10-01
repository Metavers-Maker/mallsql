package com.muling.db.runner.util;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class FileUtil {

    private static Logger logger = LoggerFactory.getLogger(FileUtil.class);

    private static final String UTF8 = "UTF-8";

    public static File rename(File source, String desName){

        File des = new File(source.getParent()+File.separator+desName);

        try {
            FileUtils.moveDirectory(source,des);
        } catch (Exception e){
            logger.error("",e);
            return source;
        }

        return des;
    }

    public static String readToString(File fileOrign) {
        try {
            String content = FileUtils.readFileToString(fileOrign);
            //修复带bom头的sql，运行报错问题
            if (content.startsWith("\uFEFF")){
                content = content.replace("\uFEFF", "");
            }
            return content;
        }catch (Exception e){
            logger.error("",e);
        }
        return "";
    }

    public static String readToString2(File fileOrign) {

        FileInputStream in = null;
        try {
            File file = fileOrign;
            if (!fileOrign.exists()){
                String fileOrignPath = new String(fileOrign.getPath().getBytes(),UTF8);
                file = new File(fileOrignPath);
            }

            Long fileLength = file.length();
            byte[] fileByte = new byte[fileLength.intValue()];

            in = new FileInputStream(file);
            in.read(fileByte);
            return new String(fileByte, UTF8);
        } catch (Exception e) {
            logger.error("",e);
            return "";
        } finally {
            if (in != null){
                try {
                    in.close();
                } catch (Exception e){
                    logger.error("",e);
                }
            }
        }
    }

    public static StringBuilder mergeFileContent(File[] files){
        StringBuilder content = new StringBuilder();
        if (files == null || files.length == 0){
            return content;
        }

        for (int i = 0; i < files.length; i++){
            content.append(readToString(files[i]));
            content.append(";\n");
        }
        return content;
    }

    public static StringBuilder mergeFileName(File[] files){
        StringBuilder name = new StringBuilder();
        if (files == null || files.length == 0){
            return name;
        }
        for (int i = 0; i < files.length; i++){
            String fileName;
            try {
                //兼容linux下中文名乱码
                fileName = new String(files[i].getName().getBytes(),UTF8);
            } catch (Exception e){
                logger.error("",e);
                fileName = files[i].getName();
            }

            int dot = fileName.lastIndexOf('.');
            name.append(files[i].getName().substring(0,dot));
            name.append("  ");
        }
        return name;
    }

    public static void writeFile(File path, String content, String name){

        try {
            File file = new File(path.getAbsolutePath()+File.separator + name);
            Files.write(file.toPath(), content.getBytes());
        } catch (Exception e){
            logger.error("",e);
        }
    }

    public static File[] versionSortAsc(File[] versionDirs){
        return versionSortAsc(Arrays.asList(versionDirs));
    }

    public static File[] versionSortAsc(List<File> fileList){

        Collections.sort(fileList, new Comparator<File>() {
            @Override
            public int compare(File o1, File o2) {
                return NumUtils.compareVersion(o1.getName(),o2.getName());
            }
        });

        File[] versionDirArray = new File[fileList.size()];
        fileList.toArray(versionDirArray);
        return versionDirArray;
    }

}
