![](./doc/001samune.png)

# pyenv インストール手順

> [!NOTE]
> - *Python* の複数バージョンをインストール・切り替えるバージョン管理ツール (Windows は *pyenv-win* )
> - プロジェクトごとに *Python* のバージョンを使い分けるために使用
> - パッケージ管理まで含めて統一する場合は [uv / Python3](../uv_python3/README.md) を参照

## Windows (Git for Windows)

### 1. *pyenv* (Pythonバージョン管理ツール)インストール

- Windowsは *pyenv-win* をインストールする
- [GitHub](https://github.com/pyenv-win/pyenv-win/blob/master/README.md#installation) からcloneする

```bash
git clone https://github.com/pyenv-win/pyenv-win.git "$HOME/.pyenv"
```

### 2. ディレクトリにPATHを通す

```bash
echo 'export PATH="$HOME/.pyenv/pyenv-win/shims:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.pyenv/pyenv-win/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

> [!NOTE]
> - `pyenv --version` で *pyenv* のバージョン確認が可能
> - バージョン確認時にWindows環境変数への登録を促す文言が表示され気になる方はPowershell で登録してください

### 3. *python3.13* インストール

```bash
pyenv install 3.13.0
```

> [!NOTE]
> - `pyenv install --list` でインストール可能バージョン一覧を取得できます
> - `pyenv versions` でインストール済み *python* バージョン確認が可能

### 4. *Global* 設定

```bash
pyenv global 3.13.0
```

> [!NOTE]
> - `python -V` でバージョンが表示されればOKです

## Linux

### 1. *Amazon Linux 2023* のみ実施

```bash
sudo dnf update -y
sudo dnf groupinstall -y "Development Tools"
sudo dnf install -y bzip2-devel ncurses-devel libffi-devel readline-devel openssl-devel zlib-devel
```

### 2. *pyenv* (Pythonバージョン管理ツール)インストール

```bash
curl -fsSL https://pyenv.run | bash
```

### 3. ディレクトリにPATHを通す

```bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
source ~/.bashrc
```

### 4. *python3.13* インストール

```bash
pyenv install 3.13.0
```

> [!NOTE]
> - `pyenv install --list` でインストール可能バージョン一覧を取得できます
> - `pyenv versions` でインストール済み *python* バージョン確認が可能

### 5. *Global* 設定

```bash
pyenv global 3.13.0
```

> [!NOTE]
> - `python -V` でバージョンが表示されればOKです

## Pythonエラー解消

### Windows UTF-8問題

#### Python3の文字エンコーディング設定を *UTF-8* に変更

> [!NOTE]
> - Git Bash (Git for Windows) を前提としたコマンドです

```bash
echo 'export PYTHONUTF8=1' >> ~/.bashrc
source ~/.bashrc
```

> [!NOTE]
> - Windows 上の *Python3* は、ファイル読み書き時の既定の文字コードに *cp932(Shift_JIS)* を使用します
> - そのため、 *Python* 製のツールやスクリプト全般で以下のような問題が発生し得ます
>   - 日本語を含む UTF-8 のファイル (YAML / JSON / Markdown 等) 読み込み時の `UnicodeDecodeError: 'cp932' codec can't decode ...`
>   - パイプやリダイレクト ( `> out.txt` / `| jq` 等) で出力した際の文字化け
>   - `pip install` 時のパッケージビルドエラー
> - 例えば *AWS CLI* では、 `aws cloudformation package` 実行時の yaml ファイル出力でエラーが発生します
> - 環境変数 `PYTHONUTF8=1` で *UTF-8 モード* を有効化し、 *Python3* の既定の文字コードを *UTF-8* にします
> - *Python3.15* 以降は *UTF-8 モード* が既定で有効になる予定です ( *PEP 686* )

## 参考資料

### リファレンス

- [pyenv - GitHub](https://github.com/pyenv/pyenv)
- [PEP 686 – Make UTF-8 mode default](https://peps.python.org/pep-0686/)

### ブログ

- [PythonでUTF-8エンコーディングを正しく扱う方法](https://www.python.digibeatrix.com/archives/990)
