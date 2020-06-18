FROM node:14.4.0-slim
LABEL maintainer Trace Baxter "trace.baxter@parkhub.com"

RUN apk add --update git

COPY run.sh ./

RUN npm install --global serverless

ENTRYPOINT ["sh", "/run.sh"]