FROM alpine:3.10.9

EXPOSE 5432 4321 35729

ENV NPM_CONFIG_PREFIX=/usr/app/.npm-global \
  PATH=$PATH:/usr/app/.npm-global/bin

VOLUME /usr/app/spfx
WORKDIR /usr/app/spfx

RUN apk add --no-cache sudo nodejs npm && \
	sed -e 's;^# \(%wheel.*NOPASSWD.*\);\1;g' -i /etc/sudoers && \
	adduser -h /home/spfx -s /bin/sh -D -G wheel spfx && \
	chown -R spfx:wheel /usr/app

USER spfx
RUN npm i -g gulp yo@3.1.1 @microsoft/generator-sharepoint

CMD /bin/sh