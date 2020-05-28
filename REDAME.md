使用说明

1.需安装xtrabackup ！！！

2.如果合并后想保留全备和增备的数据请注释掉已有脚本中的包含rm的命令行

3.脚本文件（给予执行权限，并将其脚本移动到/opt/目录下）
backup_all.sh      全备脚本
backup_inc.sh      增备脚本
backup_mer.sh      合并脚本
backup_recover.sh  恢复脚本

注释：在运行增被脚本时同时就会执行合并脚本

4.添加到计划任务：crontab -e -u root
00   1   1   *   *   /usr/bin/bash /opt/backup_all.sh
00   3   *   *   *   /usr/bin/bash /opt/backup_inc.sh