#!/bin/bash
#合并目录位置
dir_db=/backup/mysql/mer

#数据库用户名
db_user=root

#数据库密码
db_pass=123123

#创建合并位置目录
if [ ! -d "$dir_db" ];then
     mkdir -p $dir_db
fi

#获取全备目录名
all_db=`ls /backup/mysql/all/`

#获取增备目录名
inc_db=`ls /backup/mysql/inc/`

#执行数据合并
innobackupex --apply-log --redo-only /backup/mysql/all/$all_db &>> /backup/mysql/logs/mer.log
innobackupex --apply-log --redo-only /backup/mysql/all/$all_db --incremental-dir=/backup/mysql/inc/$inc_db &>> /backup/mysql/logs/mer.log

#删除之前的合并目录，再将新的合并目录拷贝过去,并且删除已合并的增备目录
rm -rf /backup/mysql/mer/* && echo '****已删除之前的合并数据~~~'
rm -rf /backup/mysql/inc/* && echo '****已删除合并后的增备数据目录~~~'
cp -r /backup/mysql/all/* /backup/mysql/mer/ && echo "****已将新的数据合并到/backup/mysql/mer/ ~~~"
