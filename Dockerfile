FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
  && apt install -y aptitude software-properties-common wget curl httpie git zip unzip python3-pip build-essential libssl-dev libffi-dev python3-dev python3-distutils supervisor python3-setuptools python3-venv

ENV DEBCONF_NONINTERACTIVE_SEEN=true
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update -y \
  && apt-get install -y build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info binwalk 

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 5000

RUN cd app/app

CMD [ "python3","app.py"]

