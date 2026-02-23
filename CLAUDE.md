## コミュニケーション言語

このプロジェクトでは日本語でコミュニケーションを取ります。日本語を利用できない場合のみ英語でコミュニケーションします。

## プロジェクトの目的

Vivliostyle CLI を利用した書籍執筆のためのテンプレートリポジトリです。Markdown で原稿を書き、PDF として出力します。

## 利用技術

- Node.js 24 (mise で管理)
- pnpm 10 (mise で管理)
- @vivliostyle/cli ^10.3.1
- @vivliostyle/theme-techbook
- textlint (preset-japanese, preset-ja-spacing, preset-ja-technical-writing, preset-ai-writing, spellcheck-tech-word, prh)
- prh (表記ゆれチェック)
- Podman (PDF ビルド用コンテナ)
- Make (タスクランナー)

## プロジェクト構成

```
.
├── .mise.toml              # mise 設定 (Node.js, pnpm バージョン管理)
├── package.json            # パッケージ管理
├── pnpm-lock.yaml          # pnpm ロックファイル (pnpm install 後に生成)
├── vivliostyle.config.js   # Vivliostyle 設定 (章構成、出力設定)
├── .textlintrc.json        # textlint 設定
├── .textlintignore         # textlint 除外設定
├── prh.yml                 # 表記ゆれルール
├── Containerfile           # Podman 用コンテナ定義
├── Makefile                # ビルド/開発用コマンド
├── manuscripts/            # 原稿ディレクトリ
│   ├── index.md            # 表紙
│   ├── chapter-01.md       # 第1章
│   ├── afterword.md        # あとがき
│   └── colophon.md         # 奥付
├── output/                 # ビルド成果物 (gitignore)
├── .github/workflows/      # GitHub Actions
│   ├── build.yml           # CI: PDF ビルドと textlint
│   └── release.yml         # タグ push 時に PDF を Release にアップロード
├── CLAUDE.md               # AI アシスタント向け指示
├── AGENTS.md               # AI エージェント向け参照
├── README.md               # プロジェクト説明
└── LICENSE                 # MIT ライセンス
```
