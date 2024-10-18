FROM python:3.8-slim

COPY flask_app/requirements.txt /flask_app/requirements.txt

RUN apt-get update && apt-get install -y build-essential && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r /flask_app/requirements.txt && \
    apt-get --purge autoremove -y build-essential && \
    rm -rf /var/lib/apt/lists

# RUN apt-get update && apt-get install -y uwsgi && rm -rf /var/lib/apt/lists

COPY ./flask_app /flask_app

ENTRYPOINT ["uwsgi", "/flask_app/uwsgi.ini"]
