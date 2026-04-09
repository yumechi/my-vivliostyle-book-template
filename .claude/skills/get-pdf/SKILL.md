---
name: get-pdf
description: 最新の CI ビルドから PDF アーティファクトを取得して output/book.pdf に上書きし、PDF ビューアで開きます
---

# Get PDF

最新の CI ビルド（GitHub Actions）から PDF アーティファクトをダウンロードし、ローカルの `output/book.pdf` に上書きして PDF ビューアで開きます。

## 実行手順

### 1. 最新の成功した CI ラン ID を取得

main ブランチの最新成功ランを探します。

```bash
gh run list --branch main --status success --limit 5
```

### 2. book-pdf アーティファクトをダウンロード

上記で特定したラン ID を使ってダウンロードします。

```bash
gh run download <RUN_ID> --name book-pdf --dir /tmp/get-pdf-tmp
```

### 3. output/book.pdf に上書き

```bash
cp /tmp/get-pdf-tmp/book.pdf output/book.pdf
```

### 4. PDF ビューアで開く

利用環境に応じて以下のいずれかを実行します。

```bash
# Linux
xdg-open output/book.pdf
```

```bash
# Windows (Git Bash)
start msedge "$(pwd -W)\\output\\book.pdf"
```

## 注意事項

- `gh` コマンド（GitHub CLI）がインストール・認証済みであること
- 実行は必ずプロジェクトのルートディレクトリで行うこと
- `output/` ディレクトリが存在しない場合は `mkdir -p output` で作成すること
- アーティファクトの保存期間（デフォルト 1 日）が切れている場合はダウンロードに失敗します
- PDF を開くコマンドは環境ごとに使い分けること（Linux: `xdg-open` / Windows + Git Bash: `start`）
