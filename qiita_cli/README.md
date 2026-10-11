![](./doc/001samune.png)

# Qiita CLI インストール手順

> [!NOTE]
>
> - Qiita の記事をローカルの Markdown ファイルで執筆・プレビュー・投稿できる Qiita 公式の CLI
> - 使い慣れたエディタで記事を書き、Git でバージョン管理するために使用
> - 公式の想定どおり、グローバルではなく記事を管理するディレクトリ(プロジェクト)にローカルインストールします
>   - `package.json` にバージョンが固定されるため、別の PC でも `pnpm install` だけで同じ環境を再現できます
> - 事前に _Node.js_ ( [こちら](../node_version_manager/README.md) ) と _pnpm_ ( [こちら](../node_package_manager/README.md) ) をセットアップしてください
>   - _Node.js_ は **22.22.1 以上** が必要です ( `@qiita/qiita-cli` v1.10.0 時点)
> - 公式手順は _npm_ / _npx_ ですが、本手順では _pnpm_ を使用します
>   - _pnpm_ の `minimumReleaseAge` で公開直後のパッケージを除外でき、サプライチェーン攻撃対策になるため (詳細は [こちら](../node_package_manager/README.md) )
>   - 公式手順の `npm install ...` は `pnpm add ...` に、 `npx qiita ...` は `pnpm exec qiita ...` に読み替えています

> [!WARNING]
>
> - パッケージ名は `@qiita/qiita-cli` です
> - 名前が似た別のパッケージをインストールしないよう注意してください

## Windows (Git for Windows)

### 1. 記事を管理するディレクトリの作成

```bash
mkdir qiita && cd qiita
```

> [!NOTE]
>
> - ディレクトリ名は任意です

### 2. _Qiita CLI_ のインストール

```bash
pnpm add -D @qiita/qiita-cli
```

> [!NOTE]
>
> - `package.json` がない場合は自動で作成されます
> - `pnpm exec qiita version` でバージョンが表示されればOKです

> [!TIP]
>
> - 証明書エラー ( `UNABLE_TO_GET_ISSUER_CERT_LOCALLY` ) が出た場合は [こちら](../awscdk/README.md) の TIP を参照

## Mac

### 1. 記事を管理するディレクトリの作成

```zsh
mkdir qiita && cd qiita
```

> [!NOTE]
>
> - ディレクトリ名は任意です

### 2. _Qiita CLI_ のインストール

```zsh
pnpm add -D @qiita/qiita-cli
```

> [!NOTE]
>
> - `package.json` がない場合は自動で作成されます
> - `pnpm exec qiita version` でバージョンが表示されればOKです

## 初期作業

> [!NOTE]
>
> - Windows / Mac 共通です。記事を管理するディレクトリ直下で実施すること

### 1. 初期化

```bash
pnpm exec qiita init
```

> [!NOTE]
>
> - 以下のファイルが作成されます
>   - `.gitignore`
>   - `.github/workflows/publish.yml` ( GitHub Actions で記事を投稿するためのワークフロー)
>   - `qiita.config.json` ( プレビューの `host` / `port` 、限定共有記事を含めるか ( `includePrivate` ) を設定)

### 2. アクセストークンの発行

- Qiita にログインした状態で [トークン発行画面](https://qiita.com/settings/tokens/new) を開く
- スコープは `read_qiita` と `write_qiita` にチェックを入れて発行する

### 3. ログイン

```bash
pnpm exec qiita login
```

> [!NOTE]
>
> - 2 で発行したトークンを入力します
> - トークンは `$HOME/.config/qiita-cli/credentials.json` ( `XDG_CONFIG_HOME` が設定されている場合は `$XDG_CONFIG_HOME/qiita-cli/credentials.json` ) に保存されます
> - 記事ディレクトリの外に保存されるため Git には含まれませんが、別の PC では改めてログインが必要です

### 4. プレビュー

```bash
pnpm exec qiita preview
```

> [!NOTE]
>
> - ブラウザで `http://localhost:8888` を開き、プレビュー画面が表示されればOKです
> - 起動時に Qiita へ投稿済みの記事が `public/` ディレクトリにダウンロードされます

## 参考資料

### リファレンス

- [increments/qiita-cli - GitHub](https://github.com/increments/qiita-cli)
- [@qiita/qiita-cli - npm](https://www.npmjs.com/package/@qiita/qiita-cli)
