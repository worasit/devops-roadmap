cd /home/ec2-user/self-hosted
echo "[01- teardown sentry self-hosted]"
docker-compose down
echo "[02- reclaim storage - cleanup overlay2, docker system prune]"
systemctl stop docker
rm -rf /var/lib/docker/overlay2/*
systemctl start docker
docker system prune -af
echo "y" | ./install.sh > /dev/null 2>&1
echo "[03- the total available disks]"
df -h | grep /$
echo "[04- start sentry self-hosted]"
docker-compose up -d
echo "Clean up completed!!!"


#log file: /home/ec2-user/self-hosted/cleanup.log
#0 0 * * 0 /home/ec2-user/self-hosted/cleanup.sh >> /home/ec2-user/self-hosted/cleanup.log 2>&1
