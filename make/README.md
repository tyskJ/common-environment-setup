![](./doc/001samune.png)

# Make コマンド インストール手順

## Windows

### 1. パッケージダウンロード

- [Make for Windows](https://gnuwin32.sourceforge.net/downlinks/make.php) からバイナリ(exeファイル)をダウンロード

### 2. インストーラ実行

ダウンロードしたインストーラを実行

> [!NOTE]
> - 基本デフォルトで問題ありません
> - インストール先はユーザーフォルダ配下にします

### 3. ディレクトリにPATHを通す

```bash
echo 'export PATH=$PATH:$HOME/GnuWin32/bin' >> ~/.bashrc
source ~/.bashrc
```

## 参考資料

### リファレンス

- [Make for Windows](https://gnuwin32.sourceforge.net/packages/make.htm)

### ブログ

- [Windows10環境でmakeコマンドを使用する方法【ハマリ回避】- Qiita](https://qiita.com/BARANCE_TW/items/c7ffdb311df84d47bddd)
- [ベストなWindowsへのMakeのインストール方法は？ - Qiita](https://qiita.com/Sego-don/items/ca5d96935f464f3ad46c)
