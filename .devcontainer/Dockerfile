FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Chromium と日本語フォントをインストール
RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium \
    fonts-noto-cjk \
    fonts-noto-cjk-extra \
    make \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Chromium のパスを環境変数に設定
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
