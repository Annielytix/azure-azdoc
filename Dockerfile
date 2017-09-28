FROM python:3.6.2
MAINTAINER Chris Joakim

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "./azdoc_docker.sh" ]

# example docker commands:
# docker build -t cjoakim/azdoc . 
# docker run -d -p 80:3000 cjoakim/azdoc:latest
# docker ps
# docker stop -t 2 86b125ed43e5
# docker push cjoakim/azdoc:latest
# docker info cjoakim/azdoc:latest
