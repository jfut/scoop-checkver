# https://mcr.microsoft.com/product/powershell
FROM mcr.microsoft.com/powershell:lts-7.2-mariner-2.0

MAINTAINER Jun Futagawa <jfut@integ.jp>
LABEL maintainer="Jun Futagawa <jfut@integ.jp>"

ENV SCOOP_HOME /scoop/apps/scoop/current
ENV PATH $PATH:$SCOOP_HOME/bin

RUN tdnf -y update \
    && tdnf -y install git \
    && tdnf clean all \
    && mkdir -p $SCOOP_HOME \
    && git clone https://github.com/lukesampson/scoop.git /scoop/apps/scoop/current \
    && install -d -m 700 /root/.ssh

COPY bin /scoop/bin

CMD ["pwsh", "/scoop/bin/checkver-all.ps1"]

