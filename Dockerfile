FROM alpine:3.14.1  

#author section
LABEL MAINTAINER="Tony Chan Chiu Yuk"
LABEL APPLICATION="Mkdocs"

#install dependencies
RUN apk update
RUN apk add python3
RUN pip3 install mkdocs

#expose port 8000 for mkdocs serve
EXPOSE 8000

#setup working directory
WORKDIR /mkdocs
COPY mkdockerize.sh /mkdocs/scripts/mkdockerize.sh

#make the script executable
RUN chmod 755 /mkdocs/scripts/mkdockerize.sh

ENTRYPOINT ["/mkdocs/scripts/mkdockerize.sh"]