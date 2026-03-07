FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Chrome/Chromium の実行に必要なシステムライブラリと日本語フォントをインストール
# Ubuntu 24.04 では chromium パッケージは snap リダイレクトのため使用不可
# vivliostyle CLI が内蔵の Chrome を自動ダウンロードして利用する
RUN apt-get update && apt-get install -y --no-install-recommends \
    fonts-noto-cjk \
    fonts-noto-cjk-extra \
    make \
    curl \
    libglib2.0-0 \
    libnss3 \
    libnspr4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libdbus-1-3 \
    libxcb1 \
    libxkbcommon0 \
    libatspi2.0-0 \
    libx11-6 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libpango-1.0-0 \
    libcairo2 \
    libasound2t64 \
    && rm -rf /var/lib/apt/lists/*
