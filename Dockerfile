FROM python:3.7-slim-buster

WORKDIR /usr/src/app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY sample sample
COPY main.py main.py

ENTRYPOINT ["python", "main.py"]