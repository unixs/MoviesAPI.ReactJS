FROM node:18

ENV APP_ROOT=/home/app
ENV HOME=${APP_ROOT}
ENV USER=daemon

WORKDIR $APP_ROOT

COPY . .

RUN chown ${USER}:${USER} . && npm ci

USER ${USER}:${USER}

EXPOSE 4000/tcp

ENTRYPOINT npm start
