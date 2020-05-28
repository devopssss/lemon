#!/bin/bash
#增备目录位置
dir_db=/backup/mysql/inc/

#数据库用户名
db_user=root

#数据库密码
db_pass=123123

#创建增备位置目录
if [ ! -d "$dir_db" ];then
     mkdir -p $dir_db
fi

#获取全备目录名
all_db=`ls /backup/mysql/all/`

#执行增备
innobackupex --user=$db_user --password=$db_pass --incremental $dir_db --incremental-basedir=/backup/mysql/all/$all_db &> /backup/mysql/logs/inc.log && echo '****增备成功~~~'

#执行合并数据脚本
/usr/bin/bash  /opt/backup_mer.sh
