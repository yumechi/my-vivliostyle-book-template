.PHONY: install build preview lint container-build container-pdf clean help

# デフォルトターゲット
help:
	@echo "利用可能なコマンド:"
	@echo "  make install         - 依存パッケージのインストール"
	@echo "  make build           - PDF のビルド (ローカル)"
	@echo "  make preview         - プレビューの起動"
	@echo "  make lint            - textlint の実行"
	@echo "  make container-build - コンテナイメージのビルド"
	@echo "  make container-pdf   - コンテナ内で PDF をビルド"
	@echo "  make clean           - ビルド成果物の削除"

# ローカル開発
install:
	pnpm install

build: install
	pnpm run build

preview: install
	pnpm run preview

lint: install
	pnpm run lint

# コンテナ (Podman)
CONTAINER_IMAGE := vivliostyle-book-builder
CONTAINER_ENGINE := podman

container-build:
	$(CONTAINER_ENGINE) build -t $(CONTAINER_IMAGE) -f Containerfile .

container-pdf: container-build
	mkdir -p output
	$(CONTAINER_ENGINE) run --rm \
		-v ./output:/workspace/output:Z \
		$(CONTAINER_IMAGE)

# クリーンアップ
clean:
	rm -rf output/
	rm -rf node_modules/
