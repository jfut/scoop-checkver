FROM mcr.microsoft.com/powershell

MAINTAINER Jun Futagawa <jfut@integ.jp>
LABEL maintainer="Jun Futagawa <jfut@integ.jp>"

ENV SCOOP_HOME /scoop/apps/scoop/current
ENV PATH $PATH:$SCOOP_HOME/bin

RUN apt-get update \
    && apt-get install -y git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p $SCOOP_HOME \
    && git clone https://github.com/lukesampson/scoop.git /scoop/apps/scoop/current

COPY checkver-all.ps1 /scoop/

CMD ["pwsh", "/scoop/checkver-all.ps1"]