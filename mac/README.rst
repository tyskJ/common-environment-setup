.. image:: ./doc/001samune.png

=====================================================================
Mac Recommend Settings
=====================================================================

基本設定
=====================================================================
1. ソフトウェアアップデート
---------------------------------------------------------------------
.. code-block:: zsh

  sudo softwareupdate -i -a -R

.. note::

  * ``-l`` : アップデート可能ソフトウェア表示
  * ``-i`` : インストール実行
  * ``-a`` : 全てのソフトウェアをアップデート
  * ``-R`` : 再起動

2. 起動音抑制
---------------------------------------------------------------------
.. code-block:: zsh

  sudo nvram StartupMute=%01

.. note::

  * ``sudo nvram -c`` でリセットできます

3. Dock設定
---------------------------------------------------------------------
.. code-block:: zsh

  defaults write com.apple.dock tilesize -int 64              # Dockのアイコンサイズを1〜128の範囲で指定
  defaults write com.apple.dock mineffect -string scale       # ウィンドウをしまう時のアニメーションをシンプルに
  defaults write com.apple.dock launchanim -bool false        # 起動中のアプリのアニメーション無効化
  defaults write com.apple.dock autohide -bool true           # Dockの自動表示/非表示機能を有効化
  defaults write com.apple.dock autohide-delay -int 0         # Dock表示速度 最速化
  defaults write com.apple.dock autohide-time-modifier -int 0 # Dock表示アニメーション速度 最速化
  killall Dock                                                # Dockを再起動して設定を反映

4. Finder設定
---------------------------------------------------------------------
.. code-block:: zsh

  defaults write NSGlobalDomain AppleShowAllExtensions -bool true               # 拡張子まで表示する設定
  defaults write com.apple.Finder AppleShowAllFiles -bool true                  # 隠しファイルを表示する設定
  defaults write com.apple.finder ShowPathbar -bool true                        # Finderウィンドウ下部のパスバーを表示する設定
  defaults write com.apple.LaunchServices LSQuarantine -bool false              # 未確認ファイルを開く際の警告を無効化する設定
  defaults write com.apple.finder WarnOnEmptyTrash -bool false                  # ゴミ箱を空にする際の確認警告を無効化する設定
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE  # ネットワークドライブでの.DS_Store作成を無効化
  sudo launchctl bootout user/$(id -u)                                          # 設定を有効にするためにサインアウト

.. note::

  * 再起動 ( ``sudo shutdown -r now`` ) でも良い

5. マウス設定
---------------------------------------------------------------------
.. code-block:: zsh

  defaults write com.apple.mouse.doubleClickThreshold -float 0.5  # ダブルクリックの反応速度（間隔）を設定する
  defaults write com.apple.mouse.scaling -int 8                   # マウスカーソルの移動速度（加速度）を設定する
  defaults write com.apple.scrollwheel.scaling -int 4             # マウスホイールによるスクロール速度を設定する
  defaults write com.apple.springing.delay -float 0               # スプリングローディングの起動遅延を無効化して高速化する
  sudo launchctl bootout user/$(id -u)                            # 設定を有効にするためにサインアウト

.. note::

  * 再起動 ( ``sudo shutdown -r now`` ) でも良い

6. キーボード設定
---------------------------------------------------------------------
.. code-block:: zsh

  defaults write NSGlobalDomain KeyRepeat -int 3                    # キーリピートの速度（押し続けたときの反復間隔）を高速に設定する
  defaults write NSGlobalDomain InitialKeyRepeat -int 20            # キーリピート開始までの待機時間を短く設定する
  defaults write NSAutomaticSpellingCorrectionEnabled -bool false   # 入力時の自動スペル修正を無効化する
  defaults write WebAutomaticSpellingCorrectionEnabled -bool false  # Web入力エリアでの自動スペル修正を無効化する
  defaults write NSAutomaticCapitalizationEnabled -bool false       # 自動大文字変換（文頭などの大文字化）を無効化する
  defaults write NSAutomaticPeriodSubstitutionEnabled -bool false   # ダブルスペースでピリオド変換する機能を無効化する
  defaults write NSAutomaticDashSubstitutionEnabled -bool false     # 入力時のダッシュへの自動変換を無効化する
  defaults write NSAutomaticQuoteSubstitutionEnabled -bool false    # 入力時のクォート（引用符）の自動変換を無効化する
  defaults write -g ApplePressAndHoldEnabled -bool false            # キーの連続入力を可能にする
  sudo launchctl bootout user/$(id -u)                              # 設定を有効にするためにサインアウト

.. note::

  * 再起動 ( ``sudo shutdown -r now`` ) でも良い

7. Screenshot設定
---------------------------------------------------------------------
.. code-block:: zsh

  # 保存フォルダ変更
  defaults write com.apple.screencapture location ~/Downloads/
  # デフォルトファイル形式変更
  defaults write com.apple.screencapture type png
  # スクリーンショット撮影時のサムネイル表示を無効化する設定
  defaults write com.apple.screencapture show-thumbnail -bool false
  # ウィンドウキャプチャ時の影（ドロップシャドウ）を無効化する設定
  defaults write com.apple.screencapture disable-shadow -bool true

8. 電源設定
---------------------------------------------------------------------
.. code-block:: zsh

  # Power Napを無効化する
  sudo pmset -a powernap 0
  # Wake on Demandを無効化する
  sudo pmset -a womp 0
  # ディスクスリープを無効化する
  sudo pmset -a disksleep 0

.. note::

  * ``sudo pmset -a restoredefaults`` でリセットできます

9. 日本語入力設定
---------------------------------------------------------------------
* `こちら <https://www.radical-dreamer.com/pc/google_ime_on_mac/>`_ を参照


開発環境設定
=====================================================================
1. ComputeName / HostName 変更
---------------------------------------------------------------------
.. code-block:: zsh

  sudo scutil --set ComputerName yourname
  sudo scutil --set LocalHostName yourname

.. note::

  * ``scutil --get ComputerName`` / ``scutil --get LocalHostName`` で確認可能


2. パッケージ管理 ( ``Homebrew`` )
---------------------------------------------------------------------
.. code-block:: zsh

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

* 環境変数設定

.. code-block:: zsh

  echo >> ~/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

3. シェル設定 ( ``zsh`` )
---------------------------------------------------------------------
* `.zshrc <./.zshrc>`_


4. エディター/IDE ( ``VSCode`` )
---------------------------------------------------------------------
.. code-block:: zsh

  brew install --cask visual-studio-code

* `拡張機能一覧 <./vscode-extensions.txt>`_

.. code-block:: zsh

  cat vscode-extensions.txt | xargs -L 1 code --install-extension

.. note::

  * ``code --list-extensions > vscode-extensions.txt`` で他端末のVSCodeのインストール済み拡張機能をエクスポートできます

5. ``Git``
---------------------------------------------------------------------
* `こちら <../git>`_

6. バージョン管理 ( ``mise`` )
---------------------------------------------------------------------
* `こちら <../mise-en-place>`_

7. ターミナル ( ``iterm2`` )
---------------------------------------------------------------------
* ``iterm2`` インストール

.. code-block:: zsh
  
  brew install --cask iterm2

* ``Oh My Zsh`` インストール (オプション)

.. code-block:: zsh

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

.. note::

  * インストール時に ``.zshrc`` への上書きを自動で行わない
  * 手動で以下を ``.zshrc`` に追記する

.. code-block:: zsh

  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="robbyrussell"
  plugins=(git)
  source $ZSH/oh-my-zsh.sh

.. note::

  * ``source ~/.zshrc`` で設定を読み込ませる

8. コマンド候補検索ツール ( ``peco`` )
---------------------------------------------------------------------
.. code-block:: zsh

  brew install peco

.. note::

  * 手動で以下を ``.zshrc`` に追記する

.. code-block:: zsh

  # ctrl + r で過去に実行したコマンドを選択できるようにする。
  function peco-select-history() {
    BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
  }
  zle -N peco-select-history
  bindkey '^r' peco-select-history

9. エディタ ( ``zed`` )
---------------------------------------------------------------------
.. code-block:: zsh

  brew install --cask zed

アプリケーション
=====================================================================
1. シークレット管理 ( ``KeePassXC`` )
---------------------------------------------------------------------
.. code-block:: zsh

  brew install --cask keepassxc

.. note::

  * GUI インストールは `こちら <https://keepassxc.org/>`_

2. ランチャーツール ( ``Alfred`` )
---------------------------------------------------------------------
.. code-block:: zsh

  brew install --cask alfred

3. 画面分割 ( ``Rectangle`` )
---------------------------------------------------------------------
.. code-block:: zsh

  brew install --cask rectangle

4. メニューバー整理 ( ``Ice`` )
---------------------------------------------------------------------
.. code-block:: zsh

  brew install --cask jordanbaird-ice

5. ブラウザ ( ``Google Chrome`` )
---------------------------------------------------------------------
.. code-block:: zsh

  brew install --cask google-chrome

6. コミュニケーションツール ( ``Slack`` )
---------------------------------------------------------------------
.. code-block:: zsh

  brew install --cask slack

7. ウィンドウ切り替えツール ( ``AltTab`` )
---------------------------------------------------------------------
.. code-block:: zsh

  brew install --cask alt-tab

8. アンインストール支援ツール ( ``AppCleaner`` )
---------------------------------------------------------------------
.. code-block:: zsh

  brew install --cask appcleaner

参考資料
=====================================================================
リファレンス
---------------------------------------------------------------------
* `Homebrew <https://brew.sh/ja/>`_
* `Homebrew Formulae <https://formulae.brew.sh/>`_

ブログ
---------------------------------------------------------------------
* `MacBookの使いやすさが劇的に変わるおすすめ設定【効率アップ】 - note <https://note.com/ohmyweek/n/ndfd038d0fe3d>`_
* `MacBookセットアップ個人的メモ【2025年版】 - Zenn <https://zenn.dev/karaage0703/articles/a1ee72f22882e9>`_
* `新たなMacをGetした際のおすすめ設定 - DevelopersIO <https://dev.classmethod.jp/articles/mac-recommended-initial-settings/>`_
* `pmset で Mac の電源制御 - Qiita <https://qiita.com/usagimaru/items/70cc39d5b1b0368fe028>`_
* `Mac mini スリープ時の発熱を防ぐ設定｜pmset コマンドの使い方 - djangostart.com <https://djangostart.com/616/>`_
* `pmsetでMacの省電力設定を最適化したい。 - k n note <https://nkmrkisk.com/archives/2338>`_
* `pmsetコマンドの基礎から応用まで世界一やさしく解説 - Ohenzi Blog <https://ohenziblog.com/pmset-method/>`_
* `MacBook Pro 2020のバッテリーについて - Appleコミュニティ <https://discussionsjapan.apple.com/thread/251498546?sortBy=rank>`_
* `Homebrew のアンインストール・クリーンアップ完全手順 - T-CREATOR <https://t-cr.jp/article/8hh1j127i5b7yge>`_
* `【完全ガイド】Homebrew Caskでインストールしたアプリを安全にアンインストールする方法【Mac対応】 - ちょげぶろぐ <https://www.choge-blog.com/programming/homebrew-cask-uninstall/#google_vignette>`_
* `homebrewでインストールしたパッケージ全部削除する - Qiita <https://qiita.com/anon5r/items/d262c80b718739caf076>`_
* `Macのターミナルをカスタマイズ (Iterm2、Oh My Zsh) - Zenn <https://zenn.dev/kamiko/articles/5692e06cbe5ef6>`_
* `MacでiTerm2をインストールする完全ガイド：標準ターミナルを卒業して開発効率を10倍にする方法 - ちょげぶろぐ <https://www.choge-blog.com/programming/mac-iterm2-install/>`_
* `macOS イケてるターミナル環境構築ガイド（iTerm2 + Zsh編）- Zenn <https://zenn.dev/aung_yu/articles/e45fd503addde2>`_
* `ようこそdotfilesの世界へ - Qiita <https://qiita.com/yutkat/items/c6c7584d9795799ee164>`_
* `年末の大掃除にdotfilesをつくろう - Zenn <https://zenn.dev/cloud_ace/articles/1d57617f83cd74>`_
* `Alfredを使いこなせてない君に！【Alfredの使い方完全版】- Qiita <https://qiita.com/jackchuka/items/ccd3f66f6dd00481b98b>`_
* `【Mac】Alfredの使い方｜初期設定から必須Workflowまで徹底解説 - エンベーダー <https://envader.plus/article/114>`_
* `【Mac】Windowsライクな画面分割アプリRectangleがいいぞ！ <https://computerlife.hateblo.jp/entry/rectangle>`_
* `Macのメニューバーに表示されるアイコンの表示・非表示を切り替えられるBartenderの代替ツール、『Ice』が良さげ - Sweet Escape <https://www.keisuke69.net/entry/2025/02/04/092143>`_
* `MacでもWindowsライクにウィンドウ切り替えができる「AltTab」が便利だった - note <https://note.com/murasaki5/n/nc860be25a0f7>`_