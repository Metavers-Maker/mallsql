# 如何在特定服务器上执行脚本程序
- 拉取本项目
- 导入开发工具，idea或者其他
- 修改 src/main/resources/application.yml数据库配置

```yaml
db:
  type: mysql
  host: 目标ip
  port: 目标端口
  database: demodb
  username: 用户名
  password: 密码
  superusername:
  superpassword:
  rolelist: LOGIN,CREATEDB
  platform:  #用于支持特定存储引擎执行特定sql,如脚本文件以 ".mysql.sql"、".tidb.sql"结尾只在特定存储引擎执行

```
- 运行项目