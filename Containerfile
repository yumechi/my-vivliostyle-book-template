FROM node:24-slim

# Chromium の依存パッケージをインストール
RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium \
    fonts-noto-cjk \
    fonts-noto-cjk-extra \
    && rm -rf /var/lib/apt/lists/*

# Chromium のパスを環境変数に設定
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# pnpm をインストール
RUN corepack enable && corepack prepare pnpm@latest --activate

WORKDIR /workspace

# 依存関係のインストール (キャッシュ効率のため先にコピー)
COPY package.json pnpm-lock.yaml* ./
RUN pnpm install --frozen-lockfile || pnpm install

# ソースコードをコピー
COPY . .

# デフォルトコマンドはビルド
CMD ["pnpm", "run", "build"]
