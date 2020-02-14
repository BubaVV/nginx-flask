# NGINX - uWSGI - Flask setup

Probably, the simpliest way to combine these tools. Definitely not production ready,
but may be useful as example for AWS Elastic Beanstalk Multicontainer app. 

## How to use

    docker-compose up
    curl 127.0.0.1:80/flask
    curl 127.0.0.1:80/django
    
As result, you get `Hello, world!` output 