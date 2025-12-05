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

  # Dockのアイコンサイズを1〜128の範囲で指定
  defaults write com.apple.dock tilesize -int 64
  # ウィンドウをしまう時のアニメーションをシンプルに
  defaults write com.apple.dock mineffect -string scale
  # 起動中のアプリのアニメーション無効化
  defaults write com.apple.dock launchanim -bool false
  # Dockの自動表示/非表示機能を有効化
  defaults write com.apple.dock autohide -bool true
  # Dock表示速度 最速化
  defaults write com.apple.dock autohide-delay -int 0
  # Dock表示アニメーション速度 最速化
  defaults write com.apple.dock autohide-time-modifier -int 0
  # Dockを再起動して設定を反映
  killall Dock

4. Finder設定
---------------------------------------------------------------------
.. code-block:: zsh

  # 拡張子まで表示する設定
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  # 隠しファイルを表示する設定
  defaults write com.apple.Finder AppleShowAllFiles -bool true
  # Finderウィンドウ下部のパスバーを表示する設定
  defaults write com.apple.finder ShowPathbar -bool true
  # 未確認ファイルを開く際の警告を無効化する設定
  defaults write com.apple.LaunchServices LSQuarantine -bool false
  # ゴミ箱を空にする際の確認警告を無効化する設定
  defaults write com.apple.finder WarnOnEmptyTrash -bool false
  # ネットワークドライブでの.DS_Store作成を無効化
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
  # 設定を有効にするためにFinderを再起動
  killall Finder

5. マウス設定
---------------------------------------------------------------------
.. code-block:: zsh

  # ダブルクリックの反応速度（間隔）を設定する
  defaults write com.apple.mouse.doubleClickThreshold -float 0.5
  # マウスカーソルの移動速度（加速度）を設定する
  defaults write com.apple.mouse.scaling -int 8
  # マウスホイールによるスクロール速度を設定する
  defaults write com.apple.scrollwheel.scaling -int 4
  # スプリングローディングの起動遅延を無効化して高速化する
  defaults write com.apple.springing.delay -float 0

6. キーボード設定
---------------------------------------------------------------------
.. code-block:: zsh

  # キーリピートの速度（押し続けたときの反復間隔）を高速に設定する
  defaults write NSGlobalDomain KeyRepeat -int 3
  # キーリピート開始までの待機時間を短く設定する
  defaults write NSGlobalDomain InitialKeyRepeat -int 20
  # 入力時の自動スペル修正を無効化する
  defaults write NSAutomaticSpellingCorrectionEnabled -bool false
  # Web入力エリアでの自動スペル修正を無効化する
  defaults write WebAutomaticSpellingCorrectionEnabled -bool false
  # 自動大文字変換（文頭などの大文字化）を無効化する
  defaults write NSAutomaticCapitalizationEnabled -bool false
  # ダブルスペースでピリオド変換する機能を無効化する
  defaults write NSAutomaticPeriodSubstitutionEnabled -bool false
  # 入力時のダッシュへの自動変換を無効化する
  defaults write NSAutomaticDashSubstitutionEnabled -bool false
  # 入力時のクォート（引用符）の自動変換を無効化する
  defaults write NSAutomaticQuoteSubstitutionEnabled -bool false
  # キーの連続入力を可能にする
  defaults write -g ApplePressAndHoldEnabled -bool false

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

10. 再起動
---------------------------------------------------------------------
* 項番4,5,6の設定を反映させるために再起動を実行(ログアウトでもOK)

.. code-block:: zsh

  sudo shutdown -r now

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

アプリケーション
=====================================================================
1. シークレット管理 ( ``KeePassXC`` )
---------------------------------------------------------------------
.. code-block:: zsh

  brew install --cask keepassxc

.. note::

  * GUI インストールは `こちら <https://keepassxc.org/>`_


参考資料
=====================================================================
リファレンス
---------------------------------------------------------------------
* `Homebrew <https://brew.sh/ja/>`_

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
