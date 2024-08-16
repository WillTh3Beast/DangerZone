# Use the official Ubuntu base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    samba \
    openssh-server \
    python3 \
    python3-pip \
    python3-pwntools \
    socat \
    coreutils \
    cron \
    netcat-openbsd \
    net-tools \
    git \
    grep \
    findutils \
    sudo \
    && apt-get clean


# Create users
RUN useradd -m mitsuko && echo "mitsuko:guest" | chpasswd
RUN useradd -m DrKrieger && echo "DrKrieger:jI5cSSMNHx2NRNNK" | chpasswd
RUN useradd -m Pam && echo "Pam:cheryl" | chpasswd
RUN useradd -m Archer && echo "Archer:xOQeizIVNjJoBHvB" | chpasswd
RUN useradd -m Lana && echo "Lana:jI5cSSMNHx2NRNNK" | chpasswd
RUN useradd -m Cyril && echo "Cyril:0W0vpzCTcILj18t6" | chpasswd
RUN useradd -m Malory && echo "Malory:LlCAiK+mH+uTKOtF" | chpasswd
RUN useradd -m Cheryl && echo "Cheryl:I4MZem0vX7KMU9A1" | chpasswd
RUN useradd -m Ray && echo "Ray:yRRAJu67jorNG4Xg" | chpasswd


COPY ./dangerzone/key1.txt /home/Archer/
COPY ./dangerzone/key2.txt /home/Lana
COPY ./dangerzone/key3.txt /home/Ray
COPY ./dangerzone/malory/ /home/Malory/
COPY ./dangerzone/crypto/ /root/


# GTFObins

RUN chmod u+s /usr/bin/base64
RUN chmod u+s /usr/bin/find
RUN echo "mitsuko ALL=(ALL) NOPASSWD: /usr/bin/base64" >> /etc/sudoers
RUN echo "Pam ALL=(ALL) NOPASSWD: /usr/bin/find" >> /etc/sudoers


# Give the webserver user access to Python and pwntools
RUN chown -R www-data:www-data /usr/local/lib/python3.*/dist-packages/
RUN chown -R www-data:www-data /usr/local/bin/
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Copy website files to the default Apache directory
COPY ./dangerzone/website/ /var/www/html/


# Configure Samba
COPY ./dangerzone/smb.conf /etc/samba/smb.conf

# Create samba share and set permissions
RUN mkdir -p /var/www/html/deaddrop \
    && chown -R DrKrieger:DrKrieger /var/www/html/deaddrop \
    && chmod -R 0777 /var/www/html/deaddrop

# Change ownership of binary
COPY ./dangerzone/binary/ /var/www/html/deaddrop
COPY ./dangerzone/DrKrieger/ /home/DrKrieger/
COPY ./dangerzone/DrKrieger/lab/.git /home/DrKrieger/lab/.git

RUN chown -R DrKrieger:DrKrieger /home/DrKrieger/
RUN chown -R DrKrieger:DrKrieger /home/DrKrieger/lab/
RUN chown DrKrieger:DrKrieger /var/www/html/deaddrop/kill_bang_marry.exe
RUN chown DrKrieger:DrKrieger /var/www/html/deaddrop/kill_bang_marry.c
RUN chown DrKrieger:DrKrieger /var/www/html/deaddrop/note.txt
RUN chown DrKrieger:DrKrieger /usr/bin/python3
RUN chmod -x /var/www/html/deaddrop/kill_bang_marry.exe
RUN chmod u+s /usr/bin/python3
RUN chown DrKrieger:DrKrieger /home/DrKrieger/kill_bang_marry.exe
RUN chown DrKrieger:DrKrieger /home/DrKrieger/start_server.sh
RUN chmod u+s /home/DrKrieger/kill_bang_marry.exe
RUN chmod u+s /home/DrKrieger/start_server.sh
RUN chmod 777 /home/DrKrieger/

USER DrKrieger
run echo "* * * * * /home/DrKrieger/run.sh" > /home/DrKrieger/server-cron \
         && crontab /home/DrKrieger/server-cron

USER root

# Configure SSH
RUN mkdir /var/run/sshd
RUN echo "root:cobracobracobracobracobracobra" | chpasswd
RUN echo "AllowUsers root mitsuko" >> /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config


# Expose ports
EXPOSE 22 80 445 

# Start services
CMD service ssh start && service smbd start && service nmbd start && service cron start && apachectl -D FOREGROUND
