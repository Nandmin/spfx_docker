FROM node:10.24

EXPOSE 5432 4321 35729

ENV NPM_CONFIG_PREFIX=/usr/app/.npm-global \
  PATH=$PATH:/usr/app/.npm-global/bin

VOLUME /usr/app/spfx
WORKDIR /usr/app/spfx
RUN useradd --create-home --shell /bin/bash spfx && \
    usermod -aG sudo spfx && \
    chown -R spfx:spfx /usr/app

USER spfx

RUN npm i -g gulp yo@3.1.1 @microsoft/generator-sharepoint

CMD /bin/bash