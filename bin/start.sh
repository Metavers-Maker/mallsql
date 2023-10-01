#!/bin/bash
if [ "$TRACE" = "1" ]; then
	set -x
fi

error_exit ()
{
    echo "ERROR: $1 !!"
    exit 1
}

#===========================================================================================
# Java Environment Setting
#===========================================================================================
[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=$HOME/jdk/java
[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=/usr/java
[ ! -e "$JAVA_HOME/bin/java" ] && error_exit "Please set the JAVA_HOME variable in your environment, We need java(x64)!"

export JAVA_HOME
export JAVA="$JAVA_HOME/bin/java"
export BASE_DIR=$(dirname $0)/..
# export CLASSPATH=.:${BASE_DIR}/conf:${CLASSPATH}

#===========================================================================================
# Service Configuration
#===========================================================================================

COMMAND_LINE_ARGS=${COMMAND_LINE_ARGS}

SERVICE_NAME=cloud-db-upgrade

DB_TYPE=${DB_TYPE:-postgresql}
DB_HOST=${DB_HOST:-127.0.0.1}
DB_PORT=${DB_PORT:-9032}
DB_DATABASE=${DB_DATABASE:-demodb}
DB_USER=${DB_USER}
DB_PWD=${DB_PWD}

DB_SUPER_USER=${DB_SUPER_USER}
DB_SUPER_PWD=${DB_SUPER_PWD}
ROLE_LIST=${ROLE_LIST:-LOGIN,CREATEDB}

OUTSIDE_RES_ENABLE=${OUTSIDE_RES_ENABLE:-false}
OUTSIDE_RES_ROOT=${OUTSIDE_RES_ROOT:-data}

MAIL_HOST=${MAIL_HOST:-unknow}
MAIL_PORT=${MAIL_PORT:-0}
MAIL_USER=${MAIL_USER}
MAIL_PWD=${MAIL_PWD}
MAIL_TO=${MAIL_TO}

# --------------- log dir setting --------------------
LOG_DIR=${LOG_DIR:-$BASE_DIR/log}
[[ -d ${LOG_DIR} ]] || mkdir -p $LOG_DIR

#===========================================================================================
# JVM Configuration
#===========================================================================================

JAVA_OPTS="$JAVA_OPTS -Xloggc:$LOG_DIR/gc.log \
  -XX:NumberOfGCLogFiles=5 \
  -XX:GCLogFileSize=5M \
  -XX:HeapDumpPath=$LOG_DIR/HeapDumpOnOutOfMemoryError/\
  -Dclient.encoding.override=UTF-8 \
  -Dfile.encoding=UTF-8 \
"
JAVA_OPTS="$JAVA_OPTS -Dspring.config.location=classpath:/,classpath:/conf/,file:./,file:../conf/"
JAVA_OPTS="$JAVA_OPTS -Dspring.profiles.active=${SERVICE_PROFILES}"
JAVA_OPTS="$JAVA_OPTS -Dlogging.file=${LOG_DIR}/${SERVICE_NAME}.log"

JAVA_OPTS="$JAVA_OPTS -Des.servers=${ES_SERVERS}"
JAVA_OPTS="$JAVA_OPTS -Dlogstash.servers=${LOGSTASH_SERVERS}"

JAVA_OPTS="$JAVA_OPTS -Ddb.type=${DB_TYPE}"
JAVA_OPTS="$JAVA_OPTS -Ddb.host=${DB_HOST}"
JAVA_OPTS="$JAVA_OPTS -Ddb.port=${DB_PORT}"
JAVA_OPTS="$JAVA_OPTS -Ddb.database=${DB_DATABASE}"
JAVA_OPTS="$JAVA_OPTS -Ddb.username=${DB_USER}"
JAVA_OPTS="$JAVA_OPTS -Ddb.password=${DB_PWD}"

JAVA_OPTS="$JAVA_OPTS -Ddb.superusername=${DB_SUPER_USER}"
JAVA_OPTS="$JAVA_OPTS -Ddb.superpassword=${DB_SUPER_PWD}"
JAVA_OPTS="$JAVA_OPTS -Ddb.rolelist=${ROLE_LIST}"

JAVA_OPTS="$JAVA_OPTS -Doutside.res.enable=${OUTSIDE_RES_ENABLE}"
JAVA_OPTS="$JAVA_OPTS -Doutside.res.root=${OUTSIDE_RES_ROOT}"

JAVA_OPTS="$JAVA_OPTS -Dmail.host=${MAIL_HOST}"
JAVA_OPTS="$JAVA_OPTS -Dmail.port=${MAIL_PORT}"
JAVA_OPTS="$JAVA_OPTS -Dmail.username=${MAIL_USER}"
JAVA_OPTS="$JAVA_OPTS -Dmail.password=${MAIL_PWD}"
JAVA_OPTS="$JAVA_OPTS -Dmail.to=${MAIL_TO}"

JAVA_OPTS="$JAVA_OPTS -Dserver.tomcat.basedir=${SERVICE_HOME}/tomcat/base/${SERVICE_NAME}"

export JAVA_OPTS

#===========================================================================================
# Start Service
#===========================================================================================
exec ${JAVA} ${JAVA_OPTS} -jar $BASE_DIR/lib/${SERVICE_NAME}.jar ${COMMAND_LINE_ARGS}
# $BASE_DIR/lib/${SERVICE_NAME}.jar start

