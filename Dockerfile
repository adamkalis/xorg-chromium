FROM resin/nuc-node

RUN mkdir -p /usr/src/app && ln -s /usr/src/app /app
ONBUILD COPY . /usr/src/app
ONBUILD WORKDIR /usr/src/app
ONBUILD RUN DEBIAN_FRONTEND=noninteractive JOBS=MAX npm install --unsafe-perm
ONBUILD RUN node_modules/.bin/bower --allow-root --config.interactive=false install

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xorg chromium xinput

CMD [ "npm", "start" ]
