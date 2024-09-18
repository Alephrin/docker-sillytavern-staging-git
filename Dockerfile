FROM bitnami/minideb:latest
SHELL ["/bin/bash", "-c"]
ENV NODE_ENV=production
RUN install_packages ca-certificates curl git && \
    mkdir /app && \
    cd app && \ 
    git clone https://github.com/SillyTavern/SillyTavern -b staging && \
    cd SillyTavern && \ 
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash && \
    source ~/.bashrc && \
    nvm install --lts && \
    nvm use --lts && \
    npm i --no-audit --no-fund --quiet --omit=dev && \
    rm -f "config.yaml" && \
    ln -s "./config/config.yaml" "config.yaml" && \
    rm -f "./public/css/user.css" && \
    ln -s "./config/user.css" "./public/css/user.css" && \
    mkdir "config"
COPY update.sh /app/update.sh
RUN chmod +x /app/update.sh
ENTRYPOINT /app/update.sh
