![](./docs/assets/samune.png)

# GitHub CLI インストール手順

> [!NOTE]
> - GitHub をコマンドラインから操作する公式 CLI ( `gh` コマンド)
> - プルリクエストや Issue の作成・確認を、ブラウザを開かずに行うために使用

## 目次

- [Windows](#windows)
- [Mac](#mac)
- [バージョンアップ](#バージョンアップ)
- [参考資料](#参考資料)

## Windows

### 1. インストーラダウンロード

[GitHub CLI for Windows](https://cli.github.com/) からインストーラをダウンロード

### 2. インストーラ実行

- インストーラを実行します。※基本デフォルトで問題ありません。
- Terminal or IDE の再起動後、以下コマンドを実行してバージョンが表示されれば完了です

```bash
gh --version
```

## Mac

### 1. *gh* インストール

```bash
brew install gh
```

> [!NOTE]
> - `gh --version` でバージョンが表示されればOKです

## バージョンアップ

| OS | 手順 |
| --- | --- |
| Windows | [GitHub CLI](https://cli.github.com/) から最新版のインストーラをダウンロードし、 [Windows の手順 2](#2-インストーラ実行) と同様に実行 (上書きインストール) |
| Mac | `brew upgrade gh` |

> [!NOTE]
> - 新しいバージョンがある場合、 `gh` 実行時に更新を促すメッセージが表示されます

## 参考資料

### リファレンス

- [GitHub CLI commands](https://cli.github.com/manual/gh)

### ブログ

- [github CLIをWindows11にインストールする - Zenn](https://zenn.dev/torihazi/articles/882ab5c2b14850)
