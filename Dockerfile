FROM debian

LABEL org.opencontainers.image.source https://github.com/Rakbaal/ci-cd-petit

COPY . /app
RUN apt update \ 
&& apt install nodejs -yq \ 
&& apt install npm -yq

WORKDIR /app

RUN npm i && npm run build

EXPOSE 3000

CMD npm run start 
