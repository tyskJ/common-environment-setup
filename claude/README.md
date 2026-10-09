![](./doc/001samune.png)

# Claude Code (CLI) & Claude Desktop インストール手順

> [!NOTE]
>
> - Anthropic が提供する AI アシスタント
> - _Claude Code_ はターミナルで動作するコーディングエージェント、 _Claude Desktop_ はデスクトップアプリ
> - コードの調査・修正やドキュメント作成を、AI と対話しながら進めるために使用

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

### Windows

> [!NOTE]
>
> - Windows 環境では `Git for Windows` のインストールが推奨されています
> - そのため、 [こちら](../git/README.md) を参考にインストールしてください

#### 1. *Claude Code* インストール

```powershell
irm https://claude.ai/install.ps1 | iex
```

#### 2. *Git Bash* のパスを環境変数に設定

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

#### 1. *Claude Code* インストール

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

## Claude Desktop

### Windows

#### 1. インストーラダウンロード

[Claude ダウンロードページ](https://claude.com/download) からインストーラをダウンロード

#### 2. インストーラ実行

- インストーラを実行します。※基本デフォルトで問題ありません。
- インストール完了後、`Claude` が起動できればOKです

### Mac

#### 1. *Claude Desktop* インストール

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
- [Claude ダウンロード](https://claude.com/download)

### ブログ

- [Claudeの違いがわからない人へ｜Claude / Cowork / Code 完全使い分けガイド【2026年版】- note](https://note.com/nobel/n/n6336ac1ca06d)
- [【保存版】Claude Codeはどこで使うのが正解？ CLI / Desktop / VSCode / Slack / Web の5環境＋Coworkを徹底比較してみた - Qiita](https://qiita.com/rf_p/items/27285d6a6ebc051ddffc)
- [Claude が新しくなった。モデル・工数・思考モードの選び方](https://ccwm.substack.com/p/claude-model-effort-adaptive-thinking-guide)
- [Claude Codeをバージョン指定でインストールする](https://www.chazine.com/archives/4679#google_vignette)
- [Claude CodeをWindowsにインストールする手順](https://note.com/hoshiya55/n/nc821faaafc62?hl=ja)
