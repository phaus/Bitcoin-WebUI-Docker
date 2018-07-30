FROM alpine:3.4
RUN apk add --update git
RUN git clone https://github.com/TheSeven/Bitcoin-WebUI.git /Bitcoin-WebUI

FROM python:3.4.8-alpine3.8
RUN apk add --update ca-certificates openssl
RUN pip install --upgrade pip
RUN pip install config
COPY --from=0 /Bitcoin-WebUI /webui
RUN chmod +x /webui/webui.py
EXPOSE 8338
WORKDIR /webui
ENTRYPOINT ["python", "webui.py"]