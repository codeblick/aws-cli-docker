FROM python:alpine

ENV AWS_SECRET_ACCESS_KEY=""
ENV AWS_ACCESS_KEY_ID=""

RUN pip install awscli

ENTRYPOINT ["aws"]
