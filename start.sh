# export all environment variables to use in cron
echo "export TOKEN=${TOKEN}" > /root/envs.sh
echo "export NAME=${NAME}" >> /root/envs.sh
chmod +x /root/envs.sh

# Run the command on container startup
cron && tail -f /var/log/cron.log
