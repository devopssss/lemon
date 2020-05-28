#!/bin/bash
#恢复数据目录位置
dir_db=/backup/mysql/mer/

#数据库用户名
db_user=root

#数据库密码
db_pass=123123

#数据恢复
mer_db=`ls $dir_db`

innobackupex --copy-back /backup/mysql/mer/$mer_db &> /backup/mysql/logs/recover.log

chown -R mysql.mysql /usr/local/mysql/data/

killall -9 mysqld mysqld_safe;systemctl start mysqld

#判断是否ok，MySQL端口号
MYSQL_PORT=`netstat -anptu|grep 3306|awk -F ":" '{print $4}'`
if [ $MYSQL_PORT = 3306 ];then
   echo "数据恢复成功~~"
else
   echo "数据恢复失败!!"
fi