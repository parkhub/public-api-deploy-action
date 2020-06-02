FROM mhart/alpine-node
LABEL maintainer Trace Baxter "trace.baxter@parkhub.com"

RUN apk add --update git

COPY run.sh ./

RUN npm install --global serverless

ENTRYPOINT ["sh", "/run.sh"]