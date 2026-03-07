# プロジェクト構成

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
│   ├── build.yml           # CI: push/PR 時に textlint + PDF ビルド、artifact を1日保持
│   └── release.yml         # CD: v* タグ push 時に PDF をビルドし GitHub Release に添付
├── .claude/
│   └── docs/
│       └── project-structure.md  # このファイル
├── CLAUDE.md               # AI アシスタント向け指示
├── AGENTS.md               # AI エージェント向け参照
├── README.md               # プロジェクト説明
└── LICENSE                 # MIT ライセンス
```
