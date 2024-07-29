#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi
file=$1
mkdir process-parent
grep "process" $file > process-parent/found_processes.txt
df -h > process-parent/system_resources.log
free -h >> process-parent/system_resources.log
ps aux --sort=-%mem | head -n 6 > process-parent/process.log
mkdir process-jar
cp java_app/myapp.jar process-jar/
sudo useradd -g root linuxUser
sudo chown linuxUser:root process-jar/myapp.jar
sudo chmod 700 process-jar/myapp.jar
sudo -u linuxUser java -jar process-jar/myapp.jar
mkdir process-final
HOST_IP=$(hostname -I | awk '{print $1}')
CURRENT_DATETIME=$(date)
echo "hi iam @Raja, logged into machine @${HOST_IP}, at ${CURRENT_DATETIME}, have observations listed" > process-final/final_log.log
echo "" >> process-final/final_log.log
echo "Contents of process.log:" >> process-final/final_log.log
cat process-parent/process.log >> process-final/final_log.log
rm -rf process-parent process-jar process-final
sudo userdel linuxUser