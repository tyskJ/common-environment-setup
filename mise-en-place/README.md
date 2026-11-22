![](./docs/assets/samune.png)

# mise インストール手順

> [!NOTE]
> - 開発ツールのバージョンや環境変数をまとめて管理するツール
> - 複数のツールのバージョンを、環境全体やディレクトリごとに切り替えるために使用

## 目次

- [Windows (Git for Windows)](#windows-git-for-windows)
- [Mac](#mac)
- [Linux](#linux)
- [Config ( ~/.config/mise/config.toml )](#config--configmiseconfigtoml-)
- [ツールのバージョンアップ](#ツールのバージョンアップ)
- [参考資料](#参考資料)

## Windows (Git for Windows)

### 1. *mise* インストール

```bash
winget install jdx.mise
```

> [!NOTE]
> - 一度 IDE(もしくはターミナル)を閉じてください
> - その後、 `mise -v` でバージョンが表示されればOKです

### 2. Activate

- `mise x|exec` や `mise r|run` を毎度指定して *mise* コンテキスト(インストールしたツールや環境変数)をロードする方法があります
- ただし今回は **Shims** を使います

```bash
echo 'export PATH="$HOME/AppData/Local/mise/shims:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## Mac

### 1. *mise* インストール

```zsh
brew install mise
```

> [!NOTE]
> - `mise -v` でバージョンが表示されればOKです

### 2. Activate

- `mise x|exec` や `mise r|run` を毎度指定して *mise* コンテキスト(インストールしたツールや環境変数)をロードする方法があります
- ただし今回は `mise activate` を使い、シェル起動時に自動でロードします

```zsh
echo -e "## mise" >> ~/.zshrc
echo -e "# Activate" >> ~/.zshrc
echo -e 'eval "$(mise activate zsh)"' >> ~/.zshrc
source ~/.zshrc
```

## Linux

### 1. *mise* インストール

```bash
curl https://mise.run | sh
```

> [!NOTE]
> - `mise -v` でバージョンが表示されればOKです

### 2. Activate

- `mise x|exec` や `mise r|run` を毎度指定して *mise* コンテキスト(インストールしたツールや環境変数)をロードする方法があります
- ただし今回は `mise activate` を使い、シェル起動時に自動でロードします

```bash
echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
source ~/.bashrc
```

## Config ( `~/.config/mise/config.toml` )

- [config.toml](./config.toml)

## ツールのバージョンアップ

- `mise use --global <ツール>@latest` の `latest` は「インストール時点の最新版」であり、新しいバージョンが公開されても自動では更新されません
- 定期的に以下のコマンドで更新してください (全 OS 共通)

```bash
mise outdated   # 更新があるツールを確認
mise upgrade    # latest 指定のツールを最新版に更新
mise ls         # 更新後のバージョンを確認
```

> [!NOTE]
> - 更新後、旧バージョンは `mise ls` に「 `(pruned in 1d)` 」のように表示され、一定期間後に自動で削除されます
> - すぐに削除したい場合は `mise prune` を実行してください

> [!WARNING]
> - *pnpm* を更新した場合は、 `which -a pnpm` の先頭が *mise* の *pnpm* になっていることを確認してください
>   - `~/Library/pnpm/bin/pnpm` が先頭の場合、 `pnpm setup` が追加した古い *pnpm* が使われているため、 [pnpm の手順](../node_package_manager/README.md#mac) の `pnpm remove -g pnpm` を実行してください
> - *pnpm* のメジャーバージョンが上がった場合は、 [メジャーバージョンアップ時の注意](../node_package_manager/README.md#メジャーバージョンアップ時の注意) も参照してください

## 参考資料

### リファレンス

- [Getting Started - MISE-EN-PLACE](https://mise.jdx.dev/getting-started.html)
- [Registry - MISE-EN-PLACE](https://mise.jdx.dev/registry.html)
- [mise upgrade - MISE-EN-PLACE](https://mise.jdx.dev/cli/upgrade.html)
- [mise outdated - MISE-EN-PLACE](https://mise.jdx.dev/cli/outdated.html)
- [mise prune - MISE-EN-PLACE](https://mise.jdx.dev/cli/prune.html)

### ブログ

- [mise を Windows でセットアップする - Zenn](https://zenn.dev/tom_konda/articles/79a305c502558a)
- [Windowsにmiseを導入する - Qiita](https://qiita.com/wsigma21/items/63c19706c63b8b4731a7)
- [Windowsでmiseを使う - blog.PanicBlanket.com](https://blog.panicblanket.com/archives/6992)
- [mise を使用した開発ツールの管理についておさらいしてみた - DeveloperIO](https://dev.classmethod.jp/articles/setup-and-manage-dev-tools-with-mise/)
- [環境管理ツール｢mise｣について - Serverworks](https://blog.serverworks.co.jp/mise)
- [miseでwindows版PHP実行環境を構築 - Zenn](https://zenn.dev/dozo/articles/b23896d2945367)
- [mise を使用した開発ツールの管理についておさらいしてみた - DevelopersIO](https://dev.classmethod.jp/articles/setup-and-manage-dev-tools-with-mise/)
