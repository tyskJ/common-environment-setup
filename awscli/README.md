![](./doc/001samune.png)

# AWS Command Line Interface インストール手順

> [!NOTE]
> - AWS の各サービスをコマンドラインから操作する公式 CLI
> - マネジメントコンソールを使わずに、AWS リソースの操作・確認やスクリプトによる自動化を行うために使用

## Windows

### 1. パッケージサイレントインストール

Powrshellにて以下コマンドを実行

```powershell
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi /qn
```

### 2. インストール確認

```powershell
aws --version
```

## 参考資料

### リファレンス

- [AWS CLI の最新バージョンのインストールまたは更新](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html)
