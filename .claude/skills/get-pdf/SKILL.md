---
name: get-pdf
description: 最新の CI ビルドから PDF アーティファクトを取得して output/book.pdf に上書きし、PDF ビューアで開きます
---

# Get PDF

最新の CI ビルド（GitHub Actions）から PDF アーティファクトをダウンロードし、ローカルの `output/book.pdf` に上書きして PDF ビューアで開きます。

アーティファクトは `archive: false` で zip 化せずにアップロードされているため、展開は不要です。
その代わりアーティファクト名は `book.pdf`（アップロードしたファイル名そのもの）になります。

> PR のビルドであれば、CI が PR に貼るコメントのリンクからブラウザで直接開けます。
> このスキルはローカルの `output/book.pdf` を実際に差し替えたいときに使います。

## 実行手順

### 1. 最新の成功した CI ラン ID を取得

main ブランチの最新成功ランを探します。

```bash
gh run list --branch main --status success --limit 5
```

### 2. アーティファクトのダウンロード URL を取得

上記で特定したラン ID を使います。

```bash
gh api "repos/{owner}/{repo}/actions/runs/<RUN_ID>/artifacts" \
  --jq '.artifacts[] | select(.name == "book.pdf") | .archive_download_url'
```

### 3. output/book.pdf にダウンロード

取得した URL をそのまま `gh api` に渡し、`output/book.pdf` へ書き出します。

```bash
mkdir -p output
gh api "<ARCHIVE_DOWNLOAD_URL>" > output/book.pdf
```

2 と 3 はまとめて実行してもかまいません。

```bash
mkdir -p output
gh api "$(gh api "repos/{owner}/{repo}/actions/runs/<RUN_ID>/artifacts" \
  --jq '.artifacts[] | select(.name == "book.pdf") | .archive_download_url')" \
  > output/book.pdf
```

### 4. 中身が PDF であることを確認

```bash
file output/book.pdf
```

`PDF document` と表示されれば成功です。

### 5. PDF ビューアで開く

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
- 実行は必ずプロジェクトのルートディレクトリで行うこと（`{owner}` / `{repo}` は `gh` がリポジトリから補完します）
- **`gh run download` は使えません。** GitHub CLI は取得したアーティファクトを常に zip として展開しようとするため、zip 化していないアーティファクトでは `zip: not a valid zip file` で失敗します。上記の `gh api` を使う手順はこれを回避するためのものです。将来 GitHub CLI が対応したら `gh run download --name book.pdf` に戻せます
- アーティファクトの保存期間（1 日）が切れている場合はダウンロードに失敗します
- PDF を開くコマンドは環境ごとに使い分けること（Linux: `xdg-open` / Windows + Git Bash: `start`）
