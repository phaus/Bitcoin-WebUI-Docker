# Docker Container of Bitcoin-WebUI

The Source of the Application can be found here:

https://github.com/TheSeven/Bitcoin-WebUI.git


## BUILD IT

   docker build -t phaus/bitcoin-webui:latest .

## RUN IT

Create your own certificate or request one (e.g. via ACME)

    openssl req -new -newkey rsa:1024 -days 365 -nodes -x509 -keyout server.pem -out server.cert

    docker run -v $(pwd)/config.py:/webui/config.py -v $(pwd)/server.cert:/webui/server.cert -v $(pwd)/server.pem:/webui/server.pem -p 8338:8338 phaus/bitcoin-webui:latest

## Configuration

You should use `config.py.example` as a template.
However, if you run `bitcoind` in another container, you should consider using `--link <bitcond>:bitcoind` and use `bitcoind` instead `localhost` in your configuration.