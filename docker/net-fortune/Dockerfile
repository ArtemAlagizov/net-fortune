FROM alagiz/haskell-web-base

COPY . /opt/net-fortune

WORKDIR /opt/net-fortune

RUN stack build

EXPOSE 8080
ENTRYPOINT ["stack", "exec", "netFortune-exe"]