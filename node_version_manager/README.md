![](./docs/assets/samune.png)

# Node Version Manager インストール手順

> [!NOTE]
> - *Node.js* の複数バージョンをインストール・切り替えるツール (Windows は *nvm-windows* )
> - プロジェクトごとに必要な *Node.js* のバージョンを使い分けるために使用

> [!NOTE]
> - パッケージのインストールには *npm* ではなく [pnpm](../node_package_manager/README.md) を使用してください
>   - `minimumReleaseAge` で公開直後のパッケージを除外でき、サプライチェーン攻撃対策になるため
>   - *pnpm* のグローバルパッケージは *Node.js* のバージョンとは別の場所に保存されるため、 *Node.js* のバージョンアップ後もそのまま使えます ( *npm* でインストールしたものは *Node.js* のバージョンごとに保存され、引き継がれません)

## 目次

- [Windows](#windows)
- [Mac](#mac)
- [Linux](#linux)
- [nvm 自体のバージョンアップ](#nvm-自体のバージョンアップ)
- [参考資料](#参考資料)

## Windows

### 1. `nvm-windows` ( Windows版 `Node.js` バージョンマネージャー)インストール

- [GitHub](https://github.com/coreybutler/nvm-windows) から *nvm-setup.exe* をダウンロード
- デフォルト設定でインストール

### 2. `node.js` (LTS版) インストール

```bash
nvm install lts
```

### 3. LTS版の使用

```bash
nvm use lts
```

> [!NOTE]
> - `nvm list` でインストール済みのバージョンを確認できます
> - `nvm` でインストールした *Node.js* は、バージョンごとに以下のフォルダに格納されます
>   - *nvm-windows* v2 : 「 `~/AppData/Local/Author Software/nvm/installs/v{バージョン番号}/` 」 ( `nvm config` の `root` で変更可能)
>   - *nvm-windows* v1 : 「 `~/AppData/Roaming/nvm/v{バージョン番号}/` 」
> - *npm* でグローバルインストールしたパッケージも、そのバージョンのフォルダ内の `node_modules/` に格納されるため、別のバージョンには引き継がれません

## Mac

### 1. `nvm` インストール

```zsh
brew install nvm
```

### 2. `profile` 追加

```zsh
mkdir -p ~/.nvm
echo '' >> ~/.zshrc
echo '## nvm' >> ~/.zshrc
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"' >> ~/.zshrc                                       # nvm.sh があれば読み込む (\. は source と同じ)
echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"' >> ~/.zshrc # 補完スクリプトがあれば読み込む
```

### 3. `profile` 読み込み

```zsh
source ~/.zshrc
```

> [!NOTE]
> `nvm -v` でバージョンが表示されればOKです

### 4. `node.js` (LTS版) インストール

```zsh
nvm install --lts
nvm use --lts
```

> [!NOTE]
> - `node -v` でバージョンが表示されればOKです

## Linux

### 1. `nvm` インストール

```bash
NVM_V=v0.41.0
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_V}/install.sh | bash
```

> [!NOTE]
> - `NVM_V` は実行時の最新バージョンに合わせてください ( [Releases](https://github.com/nvm-sh/nvm/releases) で確認できます)

### 2. `profile` 追加

```bash
echo '' >> ~/.bashrc
echo '##nvm' >> ~/.bashrc
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc                   # nvm.sh があれば読み込む (\. は source と同じ)
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc # 補完スクリプトがあれば読み込む
```

### 3. `profile` 読み込み

```bash
source ~/.bashrc
```

> [!NOTE]
> `nvm -v` でバージョンが表示されればOKです

### 4. `node.js` (LTS版) インストール

```bash
nvm install --lts
nvm use --lts
```

> [!NOTE]
> - `node -v` でバージョンが表示されればOKです

## nvm 自体のバージョンアップ

| OS | 手順 |
| --- | --- |
| Windows ( *nvm-windows* v2 ) | `nvm upgrade` ( `nvm upgrade --check` で更新有無のみ確認) |
| Windows ( *nvm-windows* v1 ) | [GitHub](https://github.com/coreybutler/nvm-windows) から v2 のインストーラを実行 (v1.1.7 以降は設定とインストール済みの *Node.js* が v2 に移行されます) |
| Mac | `brew upgrade nvm` |
| Linux | `NVM_V` を最新版にして [Linux の手順 1](#1-nvm-インストール-1) を再実行 |

> [!NOTE]
> - Linux の *nvm* はインストールスクリプトが更新も兼ねており、再実行すると `~/.nvm` が新しいバージョンに更新されます

## 参考資料

### リファレンス

- [nvm-sh / nvm - GitHub](https://github.com/nvm-sh/nvm)
- [coreybutler / nvm-windows - GitHub](https://github.com/coreybutler/nvm-windows)
- [Core configuration - NVM for Windows](https://docs.nvm-windows.com/cfg/core)
- [nvm use - NVM for Windows](https://docs.nvm-windows.com/command/nvm/use)
- [Global module shims - NVM for Windows](https://docs.nvm-windows.com/command/global-module-shims)

### ブログ

- [nvm-windowsでnode.jsのバージョン管理をする【Windows】](https://qiita.com/nezumori/items/504b26d26f3e6e3009e3)
- [[Node.js] nvmインストール手順(MacOS) - Zenn](https://zenn.dev/nok_c7/articles/536ac2d35bf9e6)
