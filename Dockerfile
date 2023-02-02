FROM python:3.6

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 5000

RUN cd app

RUN mkdir static

RUN mv static app/static

CMD [ "python3","app/app.py"]

