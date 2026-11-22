![](./docs/assets/samune.png)

# jq インストール手順

> [!NOTE]
> - JSON をコマンドラインで整形・抽出・加工するツール
> - AWS CLI などが出力する JSON から、必要な値を取り出すために使用

## 目次

- [Windows (Git for Windows)](#windows-git-for-windows)
- [バージョンアップ](#バージョンアップ)
- [参考資料](#参考資料)

## Windows (Git for Windows)

### 1. *jq* リソースバイナリダウンロード

- [GitHub](https://github.com/jqlang/jq/releases) から最新の64bit版バイナリ( *jq-windows-amd64.exe* )をダウンロード

```bash
curl -o ~/Downloads/#1 -OL https://github.com/jqlang/jq/releases/latest/download/{jq-windows-amd64.exe}  # {} で囲んだファイル名を #1 に入れ、~/Downloads に同じファイル名で保存
```

### 2. バイナリを任意のフォルダに配置

```bash
mkdir -p ~/jq
mv ~/Downloads/jq-windows-amd64.exe ~/jq/jq.exe
```

### 3. ディレクトリにPATHを通す

```bash
echo 'export PATH=$PATH:$HOME/jq' >> ~/.bashrc
source ~/.bashrc
```

> [!NOTE]
> - `jq --version` でバージョンが表示されればOKです

## バージョンアップ

- [Windows の手順 1・2](#1-jq-リソースバイナリダウンロード) を再実行すると、最新版で `~/jq/jq.exe` が上書きされます

> [!NOTE]
> - ダウンロード URL が最新版 ( `releases/latest` ) を指しているため、そのまま再実行すれば最新版になります

## 参考資料

### リファレンス

- [jqlang/jq - GitHub](https://github.com/jqlang/jq)
- [jq Manual](https://jqlang.org/manual/)
