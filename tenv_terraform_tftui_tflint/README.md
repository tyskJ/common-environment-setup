![](./docs/assets/samune.png)

# tenv / Terraform / TFTUI / TFLint インストール手順

> [!NOTE]
> - *Terraform* は HashiCorp が提供する、コードでインフラを定義・構築する IaC ツール
> - *tenv* は *Terraform* / *OpenTofu* 等のバージョン管理ツールで、プロジェクトごとにバージョンを切り替えるために使用
> - *TFTUI* は *Terraform* の state をターミナル上で閲覧・操作する TUI ツール
> - *TFLint* は *Terraform* コードの誤りや非推奨の書き方を検出する Linter

> [!WARNING]
> - *tenv* は `terraform` コマンドを自身で提供するため、 *Terraform* を別の方法 (HashiCorp 公式のバイナリ / `winget` の `Hashicorp.Terraform` / HashiCorp の `dnf` リポジトリ等) でインストールしている場合や、 *tfenv* 等の別のバージョン管理ツールを使っている場合は、アンインストールしてから *tenv* を使用してください
> - 残っていると `terraform` が 2 つになり、 PATH の順番によっては `tenv tf use` で切り替えたバージョンが使われません
> - Mac の Homebrew は *tenv* と *tfenv* 等の同時インストールを拒否しますが、 Windows / Linux にはその仕組みがありません
> - `which -a terraform` (Windows の *PowerShell* では `Get-Command terraform -All` ) で `terraform` が 1 つだけになっていることを確認できます

## 目次

- [Windows (Git for Windows)](#windows-git-for-windows)
- [Mac](#mac)
- [Linux](#linux)
- [Terraform 共通設定](#terraform-共通設定)
- [Terraform TUI](#terraform-tui)
- [TFLint](#tflint)
- [バージョンアップ](#バージョンアップ)
- [参考資料](#参考資料)

## Windows (Git for Windows)

### 1. *tenv* (Terraformバージョンマネージャー)リリースバイナリダウンロード

- [GitHub](https://github.com/tofuutils/tenv/releases) から64bit版バイナリ( *tenv_v4.16.9_Windows_x86_64.zip* )をダウンロード

```bash
TENV_V=v4.16.9
curl -o ~/Downloads/#1 -OL https://github.com/tofuutils/tenv/releases/download/${TENV_V}/{tenv_${TENV_V}_Windows_x86_64.zip}  # {} で囲んだファイル名を #1 に入れ、~/Downloads に同じファイル名で保存
```

> [!NOTE]
> - `TENV_V` は実行時の最新バージョンに合わせてください

### 2. バイナリデータを任意のフォルダに解凍

```bash
mkdir -p ~/tofuutils/tenv/
unzip -d ~/tofuutils/tenv/ ~/Downloads/tenv_${TENV_V}_Windows_x86_64.zip
rm ~/Downloads/tenv_${TENV_V}_Windows_x86_64.zip
```

### 3. ディレクトリにPATHを通す

```bash
echo 'export PATH=$PATH:$HOME/tofuutils/tenv/' >> ~/.bashrc
source ~/.bashrc
```

### 4. *Terraform* 最新版インストール

```bash
tenv tf install latest # ~/.tenv/Terraform/バージョン番号/に保存される
```

### 5. 使用するバージョンの指定

```bash
tenv tf list # インストールしたバージョンを確認
tenv tf use latest
```

> [!NOTE]
> - バージョンはインストールした値に修正してください
> - *terraform -v* でバージョンが表示されればOKです

## Mac

### 1. *tenv* (Terraformバージョンマネージャー) インストール

```zsh
brew install tenv
```

### 2. *Terraform* 最新版インストール

```zsh
tenv tf install latest # ~/.tenv/Terraform/バージョン番号/に保存される
```

### 3. 使用するバージョンの指定

```bash
tenv tf list # インストールしたバージョンを確認
tenv tf use latest
```

> [!NOTE]
> - バージョンはインストールした値に修正してください
> - *terraform -v* でバージョンが表示されればOKです

## Linux

### 1. *cosign(v.2.0+)* インストール

> [!NOTE]
> - 最新バージョンの取得に *jq* を使用するため、未インストールの場合は事前に `sudo dnf install -y jq` を実行してください

```bash
cd
# GitHub API で最新リリースのタグ名 (例: v2.5.0) を取得し、先頭の v を除いてバージョン番号だけにする
LATEST_VERSION=$(curl https://api.github.com/repos/sigstore/cosign/releases/latest | jq -r .tag_name | tr -d "v")
curl -O -L "https://github.com/sigstore/cosign/releases/latest/download/cosign-${LATEST_VERSION}-1.x86_64.rpm"
sudo rpm -ivh cosign-${LATEST_VERSION}-1.x86_64.rpm && rm -rf cosign-${LATEST_VERSION}-1.x86_64.rpm
```

### 2. リポジトリ登録

```bash
# tenv の dnf リポジトリを登録するスクリプトを取得して実行 (-1: TLS 1.0 以上で通信 / -s: 進捗非表示 / -L: リダイレクト追従 / -f: HTTP エラー時は失敗扱い)
curl -1sLf 'https://dl.cloudsmith.io/public/tofuutils/tenv/cfg/setup/bash.rpm.sh' | sudo bash
```

### 3. *tenv* インストール

```bash
sudo dnf install tenv -y
```

### 4. *Terraform* 最新版インストール

```bash
tenv tf install latest # ~/.tenv/Terraform/バージョン番号/に保存される
```

### 5. 使用するバージョンの指定

```bash
tenv tf list # インストールしたバージョンを確認
tenv tf use latest
```

> [!NOTE]
> - バージョンはインストールした値に修正してください
> - *terraform -v* でバージョンが表示されればOKです

## Terraform 共通設定

### gitignore

- [gitignore.io](https://www.toptal.com/developers/gitignore) にて *terraform* と入力し *.gitignore* を作成
- terraformコードを格納するフォルダに保存

## Terraform TUI

### Windows

#### 1. *tftui* インストール

- [GitHub](https://github.com/idoavrah/terraform-tui/tree/main) のパッケージを *uv* でインストール

```bash
uv tool install tftui
```

> [!NOTE]
> - *uv* のセットアップは [こちら](../uv_python3/README.md) を参照
> - `uv tool list` に *tftui* が表示されればOKです

> [!TIP]
> - *pyenv* ( [こちら](../pyenv_python3/README.md) ) や *PIM* ( [こちら](../pim/README.md) ) で *Python* をインストールしている場合は、 *pip* でもインストール可能です
> - *uv* と *pip* を併用すると `tftui` が 2 つになり、 PATH の順番で使われる方が変わるため、どちらか一方にしてください
>
> ```bash
> pip install tftui
> ```

### Mac

#### 1. *tftui* インストール

```zsh
brew install idoavrah/homebrew/tftui
```

### Linux

#### 1. *tftui* インストール

- [GitHub](https://github.com/idoavrah/terraform-tui/tree/main) のパッケージを *uv* でインストール

```bash
uv tool install tftui
```

> [!NOTE]
> - *uv* のセットアップは [こちら](../uv_python3/README.md) を参照
> - `uv tool list` に *tftui* が表示されればOKです

> [!TIP]
> - *pyenv* ( [こちら](../pyenv_python3/README.md) ) で *Python* をインストールしている場合は、 *pip* でもインストール可能です
> - *uv* と *pip* を併用すると `tftui` が 2 つになり、 PATH の順番で使われる方が変わるため、どちらか一方にしてください
>
> ```bash
> pip install tftui
> ```

## TFLint

### Windows

#### 1. *tflint* インストール

```bash
winget install -e --id TerraformLinters.tflint
```

> [!NOTE]
> - インストール後、 *Git Bash* を再起動してください
> - `tflint --version` でバージョンが表示されればOKです

### Mac

#### 1. *tflint* インストール

```zsh
brew install --cask terraform-linters/tap/tflint
```

> [!NOTE]
> - `tflint --version` でバージョンが表示されればOKです

### Linux

#### 1. *tflint* リリースバイナリダウンロード

```bash
cd
curl -sSLO https://github.com/terraform-linters/tflint/releases/latest/download/tflint_linux_amd64.zip
curl -sSLO https://github.com/terraform-linters/tflint/releases/latest/download/checksums.txt
```

> [!NOTE]
> - ARM 環境の場合は *tflint_linux_arm64.zip* に読み替えてください

#### 2. チェックサム検証

```bash
sha256sum --ignore-missing -c checksums.txt # tflint_linux_amd64.zip: OK と表示されればOK
```

> [!TIP]
> - *GitHub CLI* ( [こちら](../github_cli/README.md) ) をインストールしている場合は、 `checksums.txt` 自体の正当性も検証可能です
>
> ```bash
> gh attestation verify checksums.txt -R terraform-linters/tflint
> ```

#### 3. *tflint* インストール

```bash
unzip tflint_linux_amd64.zip
sudo install -c -v tflint /usr/local/bin/
rm -f tflint tflint_linux_amd64.zip checksums.txt
```

> [!NOTE]
> - *unzip* が未インストールの場合は事前に `sudo dnf install -y unzip` を実行してください
> - `tflint --version` でバージョンが表示されればOKです

### TFLint 共通設定

#### 1. 設定ファイル作成

- terraformコードを格納するフォルダに *.tflint.hcl* を作成 (以下は AWS 用ルールセットを有効化する例)

```hcl
plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "aws" {
  enabled = true
  version = "0.50.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}
```

> [!NOTE]
> - *version* は [tflint-ruleset-aws](https://github.com/terraform-linters/tflint-ruleset-aws/releases) の最新版に修正してください

#### 2. プラグインインストール・実行

```bash
tflint --init # .tflint.hcl に定義したプラグインをインストール
tflint --recursive # サブディレクトリも含めて検査
```

## バージョンアップ

### *tenv*

| OS | 手順 |
| --- | --- |
| Windows (Git for Windows) | `TENV_V` を最新版にして [Windows の手順 1・2](#1-tenv-terraformバージョンマネージャーリリースバイナリダウンロード) を再実行 (既存ファイルは上書き) |
| Mac | `brew upgrade tenv` |
| Linux | `sudo dnf upgrade -y tenv` |

### *Terraform*

- *tenv* で最新版を追加インストールし、使用するバージョンを切り替えます (全 OS 共通)

```bash
tenv tf install latest
tenv tf use latest
tenv tf list # 旧バージョンも残るため、不要なら tenv tf uninstall <バージョン> で削除
```

### *Terraform TUI*

| OS | 手順 |
| --- | --- |
| Windows (Git for Windows) / Linux | `uv tool upgrade tftui` |
| Mac | `brew upgrade tftui` |

### *TFLint*

| OS | 手順 |
| --- | --- |
| Windows (Git for Windows) | `winget upgrade -e --id TerraformLinters.tflint` |
| Mac | `brew upgrade --cask tflint` |
| Linux | [Linux の手順 1〜3](#1-tflint-リリースバイナリダウンロード) を再実行 (最新版をダウンロードし、チェックサム検証後に上書き) |

> [!NOTE]
> - *TFLint* のプラグイン ( `tflint-ruleset-aws` 等) は `.tflint.hcl` の `version` で固定しているため、更新する場合は `version` を書き換えて `tflint --init` を再実行してください

## 参考資料

### リファレンス

- [tofuutils/tenv - GitHub](https://github.com/tofuutils/tenv)
- [idoavrah/terraform-tui - GitHub](https://github.com/idoavrah/terraform-tui/tree/main)
- [terraform-linters/tflint - GitHub](https://github.com/terraform-linters/tflint)
- [terraform-linters/tflint-ruleset-aws - GitHub](https://github.com/terraform-linters/tflint-ruleset-aws)
- [gitignore.io](https://www.toptal.com/developers/gitignore)

### ブログ

- [新しいTerraformのバージョンマネージャー tenv を試してみた](https://dev.classmethod.jp/articles/try-tenv-terraform-version-manager/)
- [kazmax - Linuxで自宅サーバー](https://kazmax.zpp.jp/linux_beginner/yum_repository_enable_disable.html)
