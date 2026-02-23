# my-vivliostyle-book-template

Vivliostyle を使った書籍執筆のためのテンプレートリポジトリです。Markdown で原稿を書き、PDF として出力します。

## 開発環境

- [mise](https://mise.jdx.dev/) で Node.js と pnpm を管理
- Cursor と Claude Code を使って開発

## 環境構築

### 前提条件

- mise がインストールされていること
- (PDF ビルド用) Podman がインストールされていること

### セットアップ

```bash
# mise で Node.js と pnpm をインストール
mise install

# 依存パッケージのインストール
make install
```

## 操作コマンド

```bash
# ローカルで PDF をビルド
make build

# プレビュー (ブラウザが開く)
make preview

# textlint で原稿をチェック
make lint

# Podman コンテナで PDF をビルド
make container-pdf

# 利用可能なコマンド一覧
make help
```

## 原稿の書き方

`manuscripts/` ディレクトリ内に Markdown ファイルを作成し、`vivliostyle.config.js` の `entry` に追加してください。

```javascript
// vivliostyle.config.js
entry: [
  { path: 'manuscripts/index.md', title: '表紙' },
  { path: 'manuscripts/chapter-01.md', title: '第1章 はじめに' },
  // 新しい章を追加する場合はここに追記
  { path: 'manuscripts/chapter-02.md', title: '第2章 ...' },
  { path: 'manuscripts/afterword.md', title: 'あとがき' },
  { path: 'manuscripts/colophon.md', title: '奥付' },
],
```

## textlint

`make lint` で原稿の文章をチェックできます。以下のルールが設定されています。

| ルール | 説明 |
|---|---|
| `preset-japanese` | 日本語の基本的なルール (読点の数など) |
| `preset-ja-spacing` | 半角・全角間のスペースルール |
| `preset-ja-technical-writing` | 技術文書向けルール |
| `preset-ai-writing` | AI 生成文章の検出 |
| `spellcheck-tech-word` | 技術用語のスペルチェック |
| `prh` | `prh.yml` によるカスタム表記ゆれチェック |

表紙 (`manuscripts/index.md`) と奥付 (`manuscripts/colophon.md`) は `.textlintignore` で除外されています。

カスタムの表記ゆれルールは `prh.yml` に追加してください。

## 参照しているツール/フレームワークのライセンス

- [Vivliostyle CLI](https://github.com/vivliostyle/vivliostyle-cli) - AGPL-3.0
- [Vivliostyle Theme Techbook](https://github.com/vivliostyle/themes) - MIT
- [textlint](https://github.com/textlint/textlint) - MIT

## ライセンス

MIT License
