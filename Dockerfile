FROM resin/nuc-node

RUN mkdir -p /usr/src/app && ln -s /usr/src/app /app
COPY . /usr/src/app
WORKDIR /usr/src/app

RUN DEBIAN_FRONTEND=noninteractive JOBS=MAX npm install --unsafe-perm
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xorg chromium

CMD [ "npm", "start" ]
