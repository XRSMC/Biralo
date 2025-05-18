FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies including curl, openssh-client, Python, etc.
RUN apt-get update && \
    apt-get install -y curl openssh-client python3 tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Install sshx
RUN curl -sSf https://sshx.io/get | sh

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
