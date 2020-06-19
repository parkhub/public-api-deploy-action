FROM node:14.4.0-alpine
LABEL maintainer Trace Baxter "trace.baxter@parkhub.com"

RUN apk add --update git

RUN npm install --global serverless@1.71.3

ENTRYPOINT  serverless --msg "$INPUT_MSG" --stage "$INPUT_STAGE" --debug INPUT_DEBUG
# ENTRYPOINT ["serverless", "--msg", ]