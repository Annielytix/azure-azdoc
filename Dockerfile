FROM python:3
MAINTAINER Chris Joakim

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY azdoc.py ./
COPY azdoc_docker.sh ./

CMD [ "./azdoc_docker.sh" ]

# shell scripts to build and execute this container:
# docker_build.sh
# docker_run.sh
#
# example docker commands:
# docker ps
# docker stop -t 2 86b125ed43e5
# docker push cjoakim/azdoc:latest
# docker info cjoakim/azdoc:latest
