FROM debian

LABEL org.opencontainers.image.source https://github.com/Rakbaal/ci-cd-petit

COPY . /app
RUN apt update \ 
&& apt install nodejs -yq \ 
&& apt install npm -yq

WORKDIR /app

RUN npm i 
RUN npm run build

EXPOSE 3000

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT [ "docker-entrypoint" ]
CMD npm run start 
