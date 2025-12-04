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

  defaults write NSGlobalDomain AppleShowAllExtensions -bool true  # 拡張子まで表示する設定
  defaults write com.apple.Finder AppleShowAllFiles -bool true     # 隠しファイルを表示する設定
  defaults write com.apple.finder ShowPathbar -bool true           # Finderウィンドウ下部のパスバーを表示する設定
  defaults write com.apple.LaunchServices LSQuarantine -bool false # 未確認ファイルを開く際の警告を無効化する設定
  defaults write com.apple.finder WarnOnEmptyTrash -bool false     # ゴミ箱を空にする際の確認警告を無効化する設定

5. マウス設定
---------------------------------------------------------------------
.. code-block:: zsh

  defaults write com.apple.mouse.doubleClickThreshold -float 0.5 # ダブルクリックの反応速度（間隔）を設定する
  defaults write com.apple.mouse.scaling -int 8                  # マウスカーソルの移動速度（加速度）を設定する
  defaults write com.apple.scrollwheel.scaling -int 4            # マウスホイールによるスクロール速度を設定する
  defaults write com.apple.springing.delay -float 0              # スプリングローディングの起動遅延を無効化して高速化する

6. キーボード設定
---------------------------------------------------------------------
.. code-block:: zsh

  defaults write NSGlobalDomain KeyRepeat -int 3                      # キーリピートの速度（押し続けたときの反復間隔）を高速に設定する
  defaults write NSGlobalDomain InitialKeyRepeat -int 20              # キーリピート開始までの待機時間を短く設定する
  defaults write NSAutomaticSpellingCorrectionEnabled -bool false     # 入力時の自動スペル修正を無効化する
  defaults write WebAutomaticSpellingCorrectionEnabled -bool false    # Web入力エリアでの自動スペル修正を無効化する
  defaults write NSAutomaticCapitalizationEnabled -bool false         # 自動大文字変換（文頭などの大文字化）を無効化する
  defaults write NSAutomaticPeriodSubstitutionEnabled -bool false     # ダブルスペースでピリオド変換する機能を無効化する
  defaults write NSAutomaticDashSubstitutionEnabled -bool false       # 入力時のダッシュへの自動変換を無効化する
  defaults write NSAutomaticQuoteSubstitutionEnabled -bool false      # 入力時のクォート（引用符）の自動変換を無効化する

7. Screenshot設定
---------------------------------------------------------------------
.. code-block:: zsh

  defaults write com.apple.screencapture location ~/Downloads/       # 保存フォルダ変更
  defaults write com.apple.screencapture type png                    # デフォルトファイル形式変更
  defaults write com.apple.screencapture show-thumbnail -bool false  # スクリーンショット撮影時のサムネイル表示を無効化する設定
  defaults write com.apple.screencapture disable-shadow -bool true   # ウィンドウキャプチャ時の影（ドロップシャドウ）を無効化する設定

8. 電源設定
---------------------------------------------------------------------
.. code-block:: zsh

  sudo pmset -a powernap 0  # Power Napを無効化する
  sudo pmset -a womp 0      # Wake on Demandを無効化する
  sudo pmset -a disksleep 0 # ディスクスリープを無効化する

.. note::

  * ``sudo pmset -a restoredefaults`` でリセットできます


9. 再起動
---------------------------------------------------------------------
* 項番4,5,6の設定を反映させるために再起動を実行(ログアウトでもOK)

.. code-block:: zsh

  sudo shutdown -r now

開発環境設定
=====================================================================
1. パッケージ管理 ( ``Homebrew`` )
---------------------------------------------------------------------
.. code-block:: zsh

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.. code-block:: zsh

  echo >> ~/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

2. シェル設定 ( ``zsh`` )
---------------------------------------------------------------------
* `.zshrc <./.zshrc>`_


3. エディター/IDE ( ``VSCode`` )
---------------------------------------------------------------------
* `拡張機能一覧 <./vscode-extensions.txt>`_

.. code-block:: zsh

  brew install --cask visual-studio-code

.. code-block:: zsh

  cat vscode-extensions.txt | xargs -L 1 code --install-extension

.. note::

  * ``code --list-extensions > vscode-extensions.txt`` で他端末のVSCodeのインストール済み拡張機能をエクスポートできます


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
