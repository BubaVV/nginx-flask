FROM python:3.6-slim

COPY django_app/requirements.txt /django_app/requirements.txt

RUN apt-get update && apt-get install -y build-essential && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r /django_app/requirements.txt && \
    apt-get --purge autoremove -y build-essential && \
    rm -rf /var/lib/apt/lists

# RUN apt-get update && apt-get install -y uwsgi && rm -rf /var/lib/apt/lists

COPY ./django_app /django_app

ENV PYTHONPATH "${PYTONPATH}:/django_app"

ENTRYPOINT ["uwsgi", "/django_app/uwsgi.ini"]