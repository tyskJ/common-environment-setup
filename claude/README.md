![](./docs/assets/samune.png)

# Claude Code (CLI) & Claude Desktop インストール手順

> [!NOTE]
>
> - Anthropic が提供する AI アシスタント
> - _Claude Code_ はターミナルで動作するコーディングエージェント、 _Claude Desktop_ はデスクトップアプリ
> - コードの調査・修正やドキュメント作成を、AI と対話しながら進めるために使用

## 目次

- [Claude Code](#claude-code)
- [Claude Desktop](#claude-desktop)
- [参考資料](#参考資料)

## Claude Code

> [!NOTE]
>
> - Claude の利用には、CLIやDesktop版など様々なインターフェースが用意されています
> - プランによって利用できる機能が異なります
> - 最新のプランは [こちら](https://claude.com/ja/pricing) を参照

> [!WARNING]
>
> - Claude Code の利用には、`Pro プラン` 以上の登録が必要です
> - [こちら](https://claude.ai) から Claude にサインアップ後、登録をしてください

> [!WARNING]
>
> - 以前 _npm_ ( `npm install -g @anthropic-ai/claude-code` ) で Claude Code をインストールしていた場合は、アンインストールしてから本手順でインストールしてください
> - 残っていると `claude` が 2 つになり、 PATH の順番で使われる方が変わります
> - 本リポジトリの手順では `npm` をエイリアスで止めているため ( [こちら](../node_package_manager/README.md#npm--npx-抑止) ) 、 `command` を付けてエイリアスを回避して実行します
>
> ```bash
> command npm uninstall -g @anthropic-ai/claude-code
> ```
>
> - インストール後、 `which -a claude` で `claude` が 1 つだけになっていることを確認できます

### Windows

> [!NOTE]
>
> - Windows 環境では `Git for Windows` のインストールが推奨されています
> - そのため、 [こちら](../git/README.md) を参考にインストールしてください

#### 1. _Claude Code_ インストール

```powershell
irm https://claude.ai/install.ps1 | iex
```

#### 2. _Git Bash_ のパスを環境変数に設定

```powershell
[System.Environment]::SetEnvironmentVariable(
  "CLAUDE_CODE_GIT_BASH_PATH",
  "C:\Program Files\Git\bin\bash.exe",
  "User"
)
```

#### 3. ディレクトリにPATHを通す

```powershell
$addPath = "$HOME\.local\bin"
$userPath = [System.Environment]::GetEnvironmentVariable('Path', 'User')

if (($userPath -split ';') -notcontains $addPath) {
    [System.Environment]::SetEnvironmentVariable(
        'Path',
        "$userPath;$addPath",
        'User'
    )
}
```

> [!NOTE]
>
> - Powershell を再起動し、 `claude --version` でバージョンが表示されればOKです

### Mac

#### 1. _Claude Code_ インストール

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

#### 2. ディレクトリにPATHを通す

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc
```

> [!NOTE]
>
> - `claude --version` でバージョンが表示されればOKです

### Linux

> [!NOTE]
>
> - 公式ドキュメントのシステム要件に記載されている Linux は Ubuntu 20.04 以降 / Debian 10 以降 / Alpine Linux 3.19 以降です
> - RHEL / Fedora はシステム要件の一覧にはありませんが、公式の _dnf_ リポジトリが用意されています (後述の TIP を参照)
> - Amazon Linux は公式ドキュメントに記載がなく、サポート対象として明記されていません
> - WSL は WSL 2 のみサポートされています (WSL 1 は非サポート) 。 PowerShell ではなく WSL のターミナル内でインストール・起動します
> - ハードウェア要件は 4 GB 以上のメモリ、 x64 または ARM64 の CPU です

> [!WARNING]
>
> - Alpine Linux など _musl_ ベースのディストリビューションでは、 `bash` と `curl` が標準で入っていないため、先にインストールしてください
>
> ```bash
> apk add bash curl
> ```

#### 1. _Claude Code_ インストール

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

> [!NOTE]
>
> - `~/.local/bin/claude` にインストールされます
> - インストーラは PATH を変更しません。 PATH に `~/.local/bin` がない場合は、出力の `Setup notes:` に `Native installation exists but ~/.local/bin is not in your PATH.` と表示されます

#### 2. ディレクトリにPATHを通す

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
```

> [!NOTE]
>
> - ログインシェルが _zsh_ の場合は `~/.bashrc` を `~/.zshrc` に読み替えてください
> - `claude --version` でバージョンが表示されればOKです

> [!TIP]
>
> - Debian / Ubuntu は _apt_ 、 Fedora / RHEL は _dnf_ 、 Alpine は _apk_ のパッケージとしてもインストールできます
> - RHEL / Fedora の場合は以下のとおりです
>
> ```bash
> sudo tee /etc/yum.repos.d/claude-code.repo <<'EOF'
> [claude-code]
> name=Claude Code
> baseurl=https://downloads.claude.ai/claude-code/rpm/stable
> enabled=1
> gpgcheck=1
> gpgkey=https://downloads.claude.ai/keys/claude-code.asc
> EOF
> sudo dnf install claude-code
> ```
>
> - 初回インストール時に GPG 鍵のフィンガープリントの確認を求められます。 `31DD DE24 DDFA B679 F42D 7BD2 BAA9 29FF 1A7E CACE` と一致することを確認してから承認してください
> - パッケージマネージャでインストールした場合は自動更新されないため、 `sudo dnf upgrade claude-code` で更新します
> - インストーラ ( `install.sh` ) と併用すると `claude` が 2 つになり、 PATH の順番で使われる方が変わるため、どちらか一方にしてください
> - apt / apk の手順は [公式ドキュメント](https://code.claude.com/docs/ja/setup) を参照してください

## Claude Desktop

### Windows

#### 1. インストーラダウンロード

[Claude ダウンロードページ](https://claude.com/download) からインストーラをダウンロード

#### 2. インストーラ実行

- インストーラを実行します。※基本デフォルトで問題ありません。
- インストール完了後、`Claude` が起動できればOKです

### Mac

#### 1. _Claude Desktop_ インストール

```zsh
brew install --cask claude
```

> [!NOTE]
>
> - `Applications` フォルダから `Claude` が起動できればOKです

## 参考資料

### リファレンス

- [Claude Support](https://support.claude.com/ja/)
- [Claude Code Docs](https://code.claude.com/docs/ja/overview)
- [Claude Code セットアップ](https://code.claude.com/docs/ja/setup)
- [インストールのトラブルシューティング](https://code.claude.com/docs/ja/troubleshoot-install)
- [Claude ダウンロード](https://claude.com/download)

### ブログ

- [Claudeの違いがわからない人へ｜Claude / Cowork / Code 完全使い分けガイド【2026年版】- note](https://note.com/nobel/n/n6336ac1ca06d)
- [【保存版】Claude Codeはどこで使うのが正解？ CLI / Desktop / VSCode / Slack / Web の5環境＋Coworkを徹底比較してみた - Qiita](https://qiita.com/rf_p/items/27285d6a6ebc051ddffc)
- [Claude が新しくなった。モデル・工数・思考モードの選び方](https://ccwm.substack.com/p/claude-model-effort-adaptive-thinking-guide)
- [Claude Codeをバージョン指定でインストールする](https://www.chazine.com/archives/4679#google_vignette)
- [Claude CodeをWindowsにインストールする手順](https://note.com/hoshiya55/n/nc821faaafc62?hl=ja)
