FROM debian:10.0
LABEL maintainer="nutthaphon@gmail.com"

ARG VERSION=v10.16.2
ARG DISTRO=linux-x64
ARG NODEJS_HOME=/usr/local/lib/nodejs
ARG PATH=/usr/local/lib/nodejs/node-${VERSION}-${DISTRO}/bin
ARG NODEJS_SOURCE=https://nodejs.org/dist/${VERSION}/node-${VERSION}-${DISTRO}.tar.xz

USER root
RUN apt-get update && apt-get install --no-install-recommends -y \
	wget \
	xz-utils \
	gconf-service \
	libasound2 \
	libatk1.0-0 \
	libatk-bridge2.0-0 \
	libc6 \
	libcairo2 \
	libcups2 \
	libdbus-1-3 \
	libexpat1 \
	libfontconfig1 \
	libgcc1 \
	libgconf-2-4 \
	libgdk-pixbuf2.0-0 \
	libglib2.0-0 \
	libgtk-3-0 \
	libnspr4 \
	libpango-1.0-0 \
	libpangocairo-1.0-0 \
	libstdc++6 \
	libx11-6 \
	libx11-xcb1 \
	libxcb1 \
	libxcomposite1 \
	libxcursor1 \
	libxdamage1 \
	libxext6 \
	libxfixes3 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxss1 \
	libxtst6 \
	ca-certificates \
	fonts-liberation \
	libappindicator1 \
	libnss3 \
	lsb-release \
	xdg-utils 

RUN wget ${NODEJS_SOURCE} -O /tmp/node.tar.xz && \
	mkdir -p ${NODEJS_HOME} && \
	tar -xJvf /tmp/node.tar.xz -C ${NODEJS_HOME} --strip-components 1 && \
	rm /tmp/node.tar.xz

RUN ln -s /usr/local/lib/nodejs/bin/node /usr/bin/node && \
	ln -s /usr/local/lib/nodejs/bin/npm /usr/bin/npm && \
	ln -s /usr/local/lib/nodejs/bin/npx /usr/bin/npx

RUN npm i puppeteer
#RUN npm i puppeteer-core
#RUN node -v && npm version && npm list --depth=0 && npx -v

CMD [ "node" ]
