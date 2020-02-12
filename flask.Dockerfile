FROM python:3.6-slim

COPY requirements.txt /app/requirements.txt

RUN apt-get update && apt-get install -y build-essential && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r /app/requirements.txt && \
    apt-get --purge autoremove -y build-essential && \
    rm -rf /var/lib/apt/lists

# RUN apt-get update && apt-get install -y uwsgi && rm -rf /var/lib/apt/lists

COPY uwsgi.ini .
COPY ./app /app

EXPOSE 8080

ENTRYPOINT ["uwsgi", "uwsgi.ini"]