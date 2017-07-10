FROM ubuntu:latest

# Install cron
RUN apt-get update \
  && apt-get install -y cron curl \
  && rm -rf /var/lib/apt/lists/*

ADD start.sh /bin/start.sh
RUN chmod +x /bin/start.sh

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/thecron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/thecron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# start script
CMD /bin/bash /bin/start.sh
