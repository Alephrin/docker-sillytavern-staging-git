FROM bitnami/minideb:latest
ENV NODE_ENV=production
RUN install_packages git node npm &&
    mkdir /app &&
    cd app &&
    git clone https://github.com/SillyTavern/SillyTavern -b staging &&
    cd SillyTavern &&
    npm i --no-audit --no-fund --quiet --omit=dev
ENTRYPOINT exec bash -c cd /app/SillyTavern && git pull ; ./start.sh
