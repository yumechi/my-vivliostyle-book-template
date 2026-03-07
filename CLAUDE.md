## コミュニケーション言語

このプロジェクトでは日本語でコミュニケーションを取ります。日本語を利用できない場合のみ英語でコミュニケーションします。

## プロジェクトの目的

Vivliostyle CLI を利用した書籍執筆のためのテンプレートリポジトリです。Markdown で原稿を書き、PDF として出力します。

## 利用技術

- Node.js 24 (mise で管理)
- pnpm 10 (mise で管理)
- @vivliostyle/cli ^10.3.1
- @vivliostyle/theme-techbook (latest)
- textlint (preset-japanese, preset-ja-spacing, preset-ja-technical-writing, preset-ai-writing, spellcheck-tech-word, prh)
- prh (表記ゆれチェック)
- Podman (PDF ビルド用コンテナ)
- Make (タスクランナー)

## プロジェクト構成

詳細は [.claude/docs/project-structure.md](.claude/docs/project-structure.md) を参照してください。
