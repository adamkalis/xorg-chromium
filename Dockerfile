FROM resin/nuc-node

RUN mkdir -p /usr/src/app && ln -s /usr/src/app /app
ONBUILD COPY . /usr/src/app
ONBUILD WORKDIR /usr/src/app
ONBUILD RUN DEBIAN_FRONTEND=noninteractive JOBS=MAX npm install --unsafe-perm

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xorg chromium xinput

CMD [ "npm", "start" ]
