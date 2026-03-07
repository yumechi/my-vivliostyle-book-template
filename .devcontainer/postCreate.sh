#!/bin/bash
set -e

# mise のインストール
curl https://mise.run | sh

# mise を現在のセッションの PATH に追加
export PATH="$HOME/.local/bin:$PATH"

# 新しいシェルセッション用に mise アクティベーションを追加
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(mise activate bash)"' >> ~/.bashrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.profile
echo 'eval "$(mise activate bash)"' >> ~/.profile

# .mise.toml を信頼してツールをインストール
mise trust
mise install

# pnpm のパスを現在のセッションに追加
export PATH="$(mise which pnpm | xargs dirname):$PATH"

# 依存パッケージのインストール (非対話環境のため CI=true を設定)
CI=true pnpm install
