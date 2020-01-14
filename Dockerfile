FROM php:7.3.13-apache-stretch

RUN apt update && apt -y upgrade
RUN cd ~

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

# Install Python
RUN apt-get install -y build-essential libssl-dev zlib1g-dev
RUN apt-get install -y libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
RUN apt-get install -y libncurses5-dev libncursesw5-dev xz-utils tk-dev
RUN wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tgz
RUN tar xvf Python-3.6.4.tgz
RUN ls -la
RUN bash Python-3.6.4/configure --enable-optimizations
RUN make -j 8
RUN make altinstall
RUN apt install python3-pip -y