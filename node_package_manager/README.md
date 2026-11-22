![](./docs/assets/samune.png)

# Node Package Manager インストール手順

> [!NOTE]
> - *Node.js* のパッケージ(ライブラリ)を管理するツール
> - `npm` は `node` をインストールするとデフォルトでインストールされるため割愛
> - お好みのパッケージマネージャーを選択してください

## 目次

- [pnpm (Performant npm)](#pnpm-performant-npm)
  - [Windows (Git for Windows)](#windows-git-for-windows)
  - [Mac](#mac)
  - [Linux](#linux)
  - [npm / npx 抑止](#npm--npx-抑止)
  - [minimumReleaseAge 設定](#minimumreleaseage-設定)
  - [バージョンアップ](#バージョンアップ)
  - [メジャーバージョンアップ時の注意](#メジャーバージョンアップ時の注意)
- [参考資料](#参考資料)

## pnpm (Performant npm)

> [!NOTE]
> - `minimumReleaseAge` で公開直後のパッケージを除外でき、サプライチェーン攻撃対策になるため *npm* / *npx* の代わりに使用

> [!WARNING]
> - *Node.js* 24 以前には *Corepack* が同梱されていますが、 `corepack enable` は実行しないでください
> - 実行すると *Node.js* 側に `pnpm` コマンドが作成され、本手順でインストールした `pnpm` と重複し、 PATH の順番で使われる方が変わります
> - *Corepack* は *Node.js* 25 以降には同梱されていません

### Windows (Git for Windows)

#### 1. `pnpm` インストール

```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

> [!NOTE]
> - インストールスクリプトの中で `pnpm setup` が実行され、 `PNPM_HOME` ( `%LOCALAPPDATA%\pnpm` ) の作成と、コマンドの格納先 `%PNPM_HOME%\bin` の Windows ユーザー環境変数 `PATH` への追加まで行われます
> - Windows の環境変数は起動中の *Git Bash* には反映されないため、次の手順で `~/.bashrc` にも PATH を追加します (再起動後は環境変数から引き継がれます)

#### 2. PATHを通す

```bash
echo 'export PATH="$HOME/AppData/Local/pnpm/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

> [!NOTE]
> - `pnpm -v` でバージョンが表示されればOKです

### Mac

#### 1. `pnpm` インストール

```zsh
mise install pnpm
mise use --global pnpm@latest
```

> [!NOTE]
> - *mise* のセットアップは [こちら](../mise-en-place/README.md) を参照

> [!NOTE]
> - `pnpm -v` でバージョンが表示されればOKです

> [!TIP]
> - `brew` でもインストール可能 ( `brew install pnpm` )
> - *mise* と `brew` を併用すると `pnpm` が 2 つになり、 PATH の順番で使われる方が変わるため、どちらか一方にしてください
> - `brew` でインストールした場合、更新は `brew upgrade pnpm` で行います ( `pnpm self-update` は使えません)

#### 2. `pnpm` でインストールするバイナリを保存するフォルダのセットアップ

```zsh
pnpm setup
source ~/.zshrc                           # 追記された PATH の設定を反映
pnpm remove -g pnpm                       # pnpm setup がグローバルに追加した pnpm 本体を削除 (本体は mise で管理するため)
rm -f ~/Library/pnpm/bin/{pn,pnpx,pnx}    # 削除した pnpm 本体を呼び出すだけの別名コマンドも削除
```

> [!NOTE]
> - `PNPM_HOME` ( `~/Library/pnpm` ) と、 `pnpm install -g` でインストールしたコマンド (例: *AWS CDK* の `cdk` ) の保存先 `$PNPM_HOME/bin` を作成し、 `~/.zshrc` に `PNPM_HOME` と `$PNPM_HOME/bin` への PATH の設定を追記します
> - 実行しないと `pnpm install -g` が `ERR_PNPM_NO_GLOBAL_BIN_DIR` で失敗します
> - Windows / Linux はインストールスクリプトの中で自動実行されますが、 *mise* でインストールした場合は実行されないため手動で実行します
> - 追記された設定は `source ~/.zshrc` またはターミナルの再起動で反映されます
> - `pnpm setup` は、実行中の *pnpm* 本体 ( *mise* の `~/.local/share/mise/installs/pnpm/<バージョン>` ) をグローバルパッケージとしてコピーし、 `$PNPM_HOME/bin/pnpm` を作成します。 `$PNPM_HOME/bin` は PATH の先頭にあるため、そのままだと *mise* で *pnpm* をバージョンアップしても、コピーした古いバージョンが使われ続けます。そのため `pnpm remove -g pnpm` で削除しています
> - `which -a pnpm` の先頭が *mise* の *pnpm* になっていればOKです

> [!TIP]
> - `pnpm remove -g pnpm` を実行しない場合は、 *mise* で *pnpm* をバージョンアップするたびに `pnpm setup --force` を再実行し、 `$PNPM_HOME/bin/pnpm` を新しいバージョンに張り替えてください

### Linux

#### 1. `pnpm` インストール

```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

#### 2. PATHを反映

```bash
source ~/.bashrc
```

> [!NOTE]
> - インストールスクリプトの中で `pnpm setup` が実行され、 `~/.bashrc` に `PNPM_HOME` ( `~/.local/share/pnpm` ) と `$PNPM_HOME/bin` への PATH の設定が追記済みのため、読み込み直すだけで OK です
> - 追記内容は `grep -A5 '# pnpm' ~/.bashrc` で確認できます

> [!NOTE]
> - `pnpm -v` でバージョンが表示されればOKです

### `npm` / `npx` 抑止

- *pnpm* の `minimumReleaseAge` が効かない `npm` / `npx` を誤って実行しないよう、エイリアスで実行できなくします
- `npm` / `npx` を実行すると警告を表示し、 `&& false` で終了コードを失敗 (1) にして処理を止めます

#### Windows (Git for Windows) / Linux

```bash
echo '' >> ~/.bashrc
echo '## npm & npx stop' >> ~/.bashrc
echo "alias npm='echo \"WARNING: npm は実行しないでください\" && false'" >> ~/.bashrc
echo "alias npx='echo \"WARNING: npx は実行しないでください\" && false'" >> ~/.bashrc
source ~/.bashrc
```

#### Mac

```zsh
echo '' >> ~/.zshrc
echo '## npm & npx stop' >> ~/.zshrc
echo "alias npm='echo \"WARNING: npm は実行しないでください\" && false'" >> ~/.zshrc
echo "alias npx='echo \"WARNING: npx は実行しないでください\" && false'" >> ~/.zshrc
source ~/.zshrc
```

### `minimumReleaseAge` 設定

- 公開されてから何日経過したパッケージのみインストールを許容するかを設定する項目
- 値は分単位 (Ex. 1日 → 1440)
- `--location` パラメータには `global` (環境全体) or `project` (プロジェクト毎) で指定可能
- 全 OS 共通のコマンドです

```bash
pnpm config set --location=global minimumReleaseAge 10080 # 10080分 = 7日
```

> [!NOTE]
> - `pnpm config list --location=global` で結果を確認できる

### バージョンアップ

#### Windows (Git for Windows) / Linux

```bash
cd ~                # pnpm のバージョンを固定しているプロジェクトの外で実行する
pnpm self-update
pnpm -v
```

> [!NOTE]
> - `packageManager` などで *pnpm* のバージョンを固定しているプロジェクト内で実行すると、そのプロジェクトの固定バージョンも書き換わるため、プロジェクトの外で実行します

#### Mac

```zsh
mise upgrade pnpm
which -a pnpm       # 先頭が mise の pnpm になっていればOK
```

> [!WARNING]
> - `pnpm self-update` は実行しないでください
> - `pnpm self-update` は新しいバージョンを `PNPM_HOME` に追加するため、 [Mac の手順 2](#2-pnpm-でインストールするバイナリを保存するフォルダのセットアップ) で削除した `$PNPM_HOME/bin/pnpm` が再作成され、 *mise* の *pnpm* より優先されてしまいます

> [!NOTE]
> - メジャーバージョンが上がった場合は、次の [メジャーバージョンアップ時の注意](#メジャーバージョンアップ時の注意) も実施してください

### メジャーバージョンアップ時の注意

> [!NOTE]
> - *pnpm* 10 以前から 11 以降へ上げると、グローバルパッケージ ( `pnpm add -g` / `pnpm install -g` でインストールしたもの) の保存先とコマンドの格納先が変わります
>
> | | パッケージの保存先 | コマンドの格納先 (PATH に必要な場所) |
> | --- | --- | --- |
> | *pnpm* 10 以前 | `$PNPM_HOME/global/5/` | `$PNPM_HOME` |
> | *pnpm* 11 以降 | `$PNPM_HOME/global/v11/` | `$PNPM_HOME/bin` |
>
> - 保存先が変わるため、旧バージョンでインストールしたパッケージは `pnpm ls -g` に表示されず管理外になります (*pnpm* の仕様であり、異常ではありません)
> - また、旧バージョンの `pnpm setup` が書いた PATH の設定のままだと、 `pnpm add -g` が `ERR_PNPM_GLOBAL_BIN_DIR_NOT_IN_PATH` で失敗します
> - バージョンアップ後は、以下の手順で PATH の設定を更新し、グローバルパッケージを再インストールしてください
>
> ```bash
> ls "$PNPM_HOME/global/5/node_modules" # 旧バージョンでインストールしていたパッケージを確認
> pnpm setup --force                    # シェル設定の pnpm ブロックを $PNPM_HOME/bin 版に書き換え
> source ~/.zshrc                       # 反映 (Linux は ~/.bashrc 、ターミナル再起動でも可)
> pnpm remove -g pnpm                   # Mac (mise) のみ : pnpm setup が追加した pnpm 本体を削除 (理由は Mac の手順 2 を参照)
> rm -f "$PNPM_HOME"/bin/{pn,pnpx,pnx}  # Mac (mise) のみ : 上記の別名コマンドも削除
> pnpm add -g typescript aws-cdk        # 新バージョンで再インストール (例)
> pnpm ls -g                            # 管理下に戻ったことを確認
> which cdk tsc                         # $PNPM_HOME/bin/... になっていればOK
> ```
>
> - `--force` が必要なのは、旧バージョンが書いた設定を新バージョンの `pnpm setup` が自動では置き換えないためです (付けないとエラー `BAD_SHELL_SECTION` で止まります)
> - Windows は PATH をユーザー環境変数で管理しているため、 `pnpm setup --force` の後に *Git Bash* を再起動し、 `~/.bashrc` の PATH も `$HOME/AppData/Local/pnpm/bin` に変更してください
> - 問題なければ、旧バージョンのファイルを削除してください
>
> ```bash
> rm -rf "$PNPM_HOME/global/5"                  # 旧バージョンのパッケージ
> rm -f "$PNPM_HOME"/{cdk,tsc,tsserver}         # 旧バージョンが $PNPM_HOME 直下に作ったコマンド (再インストールしたものに合わせて変更)
> ```
>
> - `$PNPM_HOME` 直下の `pnpm` / `pnpx` などは、 `pnpm setup` が自動で削除します

## 参考資料

### リファレンス

- [インストール - pnpm](https://pnpm.io/ja/installation)
- [pnpm setup - pnpm](https://pnpm.io/ja/cli/setup)
- [pnpm self-update - pnpm](https://pnpm.io/cli/self-update)
- [@pnpm/global.commands (Isolated Global Packages) - GitHub](https://github.com/pnpm/pnpm/blob/main/pnpm11/global/commands/README.md)

### ブログ

- [【完全比較】npm vs pnpm vs Yarn vs Bun、最強のパッケージマネージャーはどれだ？ - Qiita](https://qiita.com/syukan3/items/0e3560bf0e2ae715f5d1)
- [【Node.js】npmからpnpmに乗り換える - Suzunatsu Web](https://www.suzunatsu.com/post/npm-to-pnpm-migration/)
- [pnpm とセキュアな依存管理 - blog.re-taro.dev](https://blog.re-taro.dev/p/01JJPCQXJEF4YTQTCZZPXBF69E)
- [npmとnpxでの最新パッケージ汚染予防策についてPATH操作とpnpmを併用してやってみた - DevelopersIO](https://dev.classmethod.jp/articles/20251128-preventing-package-contamination-using-path-manipulation-and-pnpm/)
- [npm から pnpm に移行する取り組み - Zenn](https://zenn.dev/korosuke613/scraps/936cce981d0209)
- [AWS CodeBuildを使ってビルドしているサイトのNodeパッケージマネージャーをnpmからpnpmに切り替えてみた - DevelopersIO](https://dev.classmethod.jp/articles/how-to-change-npm-to-pnpm-with-codebuild-configurations/)
- [pnpmのminimumReleaseAgeをグローバルとプロジェクトそれぞれに設定する方法 - Zenn](https://zenn.dev/takumin0423/articles/77b9b3b55bf1f9)
