FROM mysql:5.5 as img1
ENV MYSQL_DATABASE crud_flask
ENV MYSQL_USER dev
ENV MYSQL_PASSWORD dev
ENV MYSQL_RANDOM_ROOT_PASSWORD yes
COPY database/ /docker-entrypoint-initdb.d/

FROM python:3.8-alpine as img2
WORKDIR /app
COPY source_code/ /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python", "server.py"]
