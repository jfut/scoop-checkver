FROM mcr.microsoft.com/powershell

MAINTAINER Jun Futagawa <jfut@integ.jp>
LABEL maintainer="Jun Futagawa <jfut@integ.jp>"

ENV SCOOP_HOME /scoop/apps/scoop/current
ENV PATH $PATH:$SCOOP_HOME/bin

RUN apt-get update \
    && apt-get install -y curl git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p $SCOOP_HOME \
    && git clone https://github.com/lukesampson/scoop.git /scoop/apps/scoop/current \
    && install -d -m 700 /root/.ssh

COPY bin /scoop/bin

CMD ["pwsh", "/scoop/bin/checkver-all.ps1"]

