FROM python
RUN apt-get update && apt-get install default-mysql-client python3 python3-pip -y && apt-get clean
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN mkdir /opt/app
RUN mkdir /opt/app/logs
COPY app/ /opt/app
RUN pip install -r /opt/app/requirements.txt
WORKDIR /opt/
CMD python3 /opt/app/main.py