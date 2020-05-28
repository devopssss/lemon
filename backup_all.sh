#!/bin/bash
#备份目录位置
dir_db=/backup/mysql

#数据库用户名
db_user=root

#数据库密码
db_pass=123123

#创建全备位置目录
if [ ! -d "$dir_db" ];then
     mkdir -p $dir_db/all
     mkdir -p $dir_db/logs
     mkdir -p $dir_db/old_backup
fi

#执行全备
cp -r /backup/mysql/all/* /backup/mysql/old_backup/ && echo '****已备份好这份全备数据,请在old_backup目录下查看~~~'

rm -rf $dir_db/all/* && echo '****已成功删除这份全备数据~~~'

innobackupex --user=$db_user --password=$db_pass $dir_db/all &> $dir_db/logs/all.log

sleep 2 && echo '****新的全备成功，请在all目录下查看~~~'
