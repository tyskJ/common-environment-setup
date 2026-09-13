![](./doc/001samune.png)

# Node Package Manager インストール手順

> [!NOTE]
> - `npm` は `node` をインストールするとデフォルトでインストールされるため割愛
> - お好みのパッケージマネージャーを選択してください

## Windows

### pnpm (Performat npm)

#### 1. `pnpm` インストール

```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

#### 2. PATHを通す

```bash
echo 'export PATH="$HOME/AppData/Local/pnpm:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

> [!NOTE]
> - `pnpm -v` でバージョンが表示されればOKです

#### 3. `pnpm` でインストールするバイナリを保存するフォルダのセットアップ

```bash
pnpm setup
```

#### 4. `npm` / `npx` 抑止

```bash
echo "alias npm='echo \"WARNING: npm は実行しないでください\" && false'" >> ~/.bashrc
echo "alias npx='echo \"WARNING: npx は実行しないでください\" && false'" >> ~/.bashrc
source ~/.bashrc
```

#### 5. `minimumReleaseAge` 設定

- 公開されてから何日経過したパッケージのみインストールを許容するかを設定する項目
- 値は分単位 (Ex. 1日 → 1440)
- `--location` パラメータには `global` (環境全体) or `project` (プロジェクト毎) で指定可能

```bash
pnpm config set --location=global minimumReleaseAge 10080
```

> [!NOTE]
> - `pnpm config list --location=global` で結果を確認できる

## Mac

### pnpm (Performat npm)

#### 1. `pnpm` インストール

```zsh
mise install pnpm
mise use --global pnpm@latest
```

> [!NOTE]
> - `pnpm -v` でバージョンが表示されればOKです

> [!NOTE]
> - `brew` でもインストール可能

#### 2. `pnpm` でインストールするバイナリを保存するフォルダのセットアップ

```zsh
pnpm setup
```

#### 3. `npm` / `npx` 抑止

```zsh
echo "" >> ~/.zshrc
echo "## npm & npx stop" >> ~/.zshrc
echo "alias npm='echo \"WARNING: npm は実行しないでください\" && false'" >> ~/.zshrc
echo "alias npx='echo \"WARNING: npx は実行しないでください\" && false'" >> ~/.zshrc
source ~/.zshrc
```

#### 4. `minimumReleaseAge` 設定

- 公開されてから何日経過したパッケージのみインストールを許容するかを設定する項目
- 値は分単位 (Ex. 1日 → 1440)
- `--location` パラメータには `global` (環境全体) or `project` (プロジェクト毎) で指定可能

```zsh
pnpm config set --location=global minimumReleaseAge 10080
```

> [!NOTE]
> - `pnpm config list --location=global` で結果を確認できる

## Linux

### pnpm (Performat npm)

#### 1. `pnpm` インストール

```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

#### 2. PATHを通す

```bash
echo '' >> ~/.bashrc
echo '##pnpm' >> ~/.bashrc
echo 'export PNPM_HOME="~/.local/share/pnpm"' >> ~/.bashrc
echo 'case ":$PATH:" in' >> ~/.bashrc
echo '  *":$PNPM_HOME:"*) ;;' >> ~/.bashrc
echo '  *) export PATH="$PNPM_HOME:$PATH" ;;' >> ~/.bashrc
echo 'esac' >> ~/.bashrc
source ~/.bashrc
```

> [!NOTE]
> - `pnpm -v` でバージョンが表示されればOKです

#### 3. `npm` / `npx` 抑止

```bash
echo "alias npm='echo \"WARNING: npm は実行しないでください\" && false'" >> ~/.bashrc
echo "alias npx='echo \"WARNING: npx は実行しないでください\" && false'" >> ~/.bashrc
source ~/.bashrc
```

#### 4. `minimumReleaseAge` 設定

- 公開されてから何日経過したパッケージのみインストールを許容するかを設定する項目
- 値は分単位 (Ex. 1日 → 1440)
- `--location` パラメータには `global` (環境全体) or `project` (プロジェクト毎) で指定可能

```bash
pnpm config set --location=global minimumReleaseAge 10080
```

> [!NOTE]
> - `pnpm config list --location=global` で結果を確認できる

## 参考資料

### リファレンス

- [インストール - pnpm](https://pnpm.io/ja/installation)

### ブログ

- [【完全比較】npm vs pnpm vs Yarn vs Bun、最強のパッケージマネージャーはどれだ？ - Qiita](https://qiita.com/syukan3/items/0e3560bf0e2ae715f5d1)
- [【Node.js】npmからpnpmに乗り換える - Suzunatsu Web](https://www.suzunatsu.com/post/npm-to-pnpm-migration/)
- [pnpm とセキュアな依存管理 - blog.re-taro.dev](https://blog.re-taro.dev/p/01JJPCQXJEF4YTQTCZZPXBF69E)
- [npmとnpxでの最新パッケージ汚染予防策についてPATH操作とpnpmを併用してやってみた - DevelopersIO](https://dev.classmethod.jp/articles/20251128-preventing-package-contamination-using-path-manipulation-and-pnpm/)
- [npm から pnpm に移行する取り組み - Zenn](https://zenn.dev/korosuke613/scraps/936cce981d0209)
- [AWS CodeBuildを使ってビルドしているサイトのNodeパッケージマネージャーをnpmからpnpmに切り替えてみた - DevelopersIO](https://dev.classmethod.jp/articles/how-to-change-npm-to-pnpm-with-codebuild-configurations/)
- [pnpmのminimumReleaseAgeをグローバルとプロジェクトそれぞれに設定する方法 - Zenn](https://zenn.dev/takumin0423/articles/77b9b3b55bf1f9)
