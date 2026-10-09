![](./doc/001samune.png)

# jq インストール手順

> [!NOTE]
> - JSON をコマンドラインで整形・抽出・加工するツール
> - AWS CLI などが出力する JSON から、必要な値を取り出すために使用

## Windows (Git for Windows)

### 1. *jq* リソースバイナリダウンロード

- [GitHub](https://github.com/jqlang/jq/releases) から64bit版バイナリ( *jq-windows-amd64.exe* )をダウンロード

```bash
curl -o ~/Downloads/#1 -OL https://github.com/jqlang/jq/releases/download/jq-1.7.1/{jq-windows-amd64.exe}
```

> [!NOTE]
> - バージョンは実行時の最新に合わせてください

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

## 参考資料

### リファレンス

- [jqlang/jq - GitHub](https://github.com/jqlang/jq)
- [jq Manual](https://jqlang.org/manual/)
