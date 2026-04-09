---
name: lint-md
description: manuscripts/ 配下の Markdown ファイルに textlint を実行します
---

# Lint Markdown

`manuscripts/` 配下の Markdown ファイルに textlint を実行します。
自動修正できるものは `--fix` で修正し、残ったエラーを表示します。

## 実行手順

### 1. まず自動修正を試みる

```bash
pnpm exec textlint --fix manuscripts/
```

### 2. 残ったエラーを確認

```bash
pnpm run lint
```

エラーがなければ完了です。エラーが残っている場合は内容を確認し、手動で修正してください。

## エラーの種類と対処

| エラー | 対処 |
|---|---|
| `ja-spacing` (✓) | `--fix` で自動修正済み |
| `spellcheck-tech-word` (✓) | `--fix` で自動修正済み |
| `no-doubled-joshi` | 助詞の重複。文を言い換える |
| `sentence-length` | 文を分割する（100文字以内に） |
| `max-ten` | 読点を減らす（1文3つ以内に） |

## 注意事項

- 実行は必ずプロジェクトのルートディレクトリで行うこと
- `pnpm` がインストール済みであること
