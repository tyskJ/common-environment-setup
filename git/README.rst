.. image:: ./doc/001samune.png

=====================================================================
Git インストール手順
=====================================================================

Windows
=====================================================================
1. インストーラダウンロード
---------------------------------------------------------------------
`git for windows <https://gitforwindows.org/>`_ からインストーラをダウンロード

2. インストーラ実行
---------------------------------------------------------------------
* インストーラを実行します。※基本デフォルトで問題ありません。
* 各設定が気になる方は参考資料に載せているブログ記事を参照してください。

Mac
=====================================================================
* Mac はデフォルトでインストールされているため割愛
* ``Homebrew`` 管理にしたい場合は、 `こちら <https://zenn.dev/inablog/articles/25f6ac101d0b45>`_ を参照

Must
=====================================================================
ユーザー設定
---------------------------------------------------------------------
.. code-block:: bash

  git config --global user.name 'username'              # コミットで使用するユーザー名を設定
  git config --global user.email 'username@example.com' # コミットで使用するメールアドレスを設定

.. note::

  * 設定状況は ``git config --global --list`` で確認できます

Option
=====================================================================
Recommend
---------------------------------------------------------------------
.. code-block:: bash

  git config --global core.editor 'code --wait' # コミットメッセージ編集時にVSCodeをエディタとして利用
  git config --global color.ui true             # Gitの出力に色付け
  git config --global init.defaultBranch main   # デフォルトブランチ名を「main」に設定
  git config --global fetch.prune true          # fetch時に存在しないリモートブランチを自動で削除する
  git config --global rebase.autostash true     # リベース実行前に自動でstashし、リベース後に復元する
  git config --global rebase.autosquash true    # リベース時にfixupやsquashの指定されたコミットを自動でsquashする
  git config --global pull.rebase true          # pull時にマージの代わりにリベースを実行して履歴をシンプルにする
  git config --global rerere.enabled true       # コンフリクト解消結果を記録し、再発した際に自動で適用する

Alias
---------------------------------------------------------------------
.. code-block:: bash

  git config --global alias.ch checkout                      # co - checkoutコマンドの短縮形
  git config --global alias.br branch                        # br - branchコマンドの短縮形
  git config --global alias.co commit                        # co - commitコマンドの短縮形
  git config --global alias.ci 'commit -m'                   # ci - メッセージ付きcommitを実行
  git config --global alias.ca 'commit --amend'              # ca - amendを実行
  git config --global alias.st status                        # st - 現在のステータスを表示
  git config --global alias.lg 'log --oneline --graph --all' # lg - 全ブランチのログを見やすいグラフ形式で表示

Commit Template
---------------------------------------------------------------------
.. code-block:: bash

  cp ./.commit_template ~/.commit_template
  git config --global commit.template ~/.commit_template

Credentials
=====================================================================
Key Chain ( Only MacOS )
---------------------------------------------------------------------
.. code-block:: zsh

  git config --list  # 設定確認（ ``credential.helper=osxkeychain`` が表示されていればオンになっている ）

.. code-block:: zsh

  git config --show-origin --get credential.helper  # 設定ファイル場所確認

→ 設定ファイル開き、 ``credential.helper=osxkeychain`` と記載のある行をコメントアウトし保存


参考資料
=====================================================================
リファレンス
---------------------------------------------------------------------
* `Git の設定 - Git <https://git-scm.com/book/ja/v2/Git-%E3%81%AE%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%9E%E3%82%A4%E3%82%BA-Git-%E3%81%AE%E8%A8%AD%E5%AE%9A>`_
* `git-config Documentation - Git <https://git-scm.com/docs/git-config.html>`_

ブログ
---------------------------------------------------------------------
* `Gitインストール手順＜Windows向け＞ <https://sukkiri.jp/technologies/devtools/git/git_win.html>`_
* `Git Bash をインストールする方法 <https://scrapbox.io/interaction-lab-git/Git_Bash_%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95>`_
* `新たなMacをGetした際のおすすめ設定 - DevelopersIO <https://dev.classmethod.jp/articles/mac-recommended-initial-settings/>`_
* `初心者必見！Gitのコミットメッセージのテンプレートの作成方法について - Qiita <https://qiita.com/shun198/items/72511bd95e13cf0be88c>`_
* `Gitのコミットメッセージをしっかり書こうという話【備忘録的共有】 - SIOS Tech.Lab <https://tech-lab.sios.jp/archives/34421>`_
* `GitHubのコミットメッセージに絵文字を入れて開発効率をあげる - Qiita <https://qiita.com/Jung0/items/0a9a7a97a2c17f92d3c5>`_
* `gitコマンドでMissing or invalid credentials. Error: connect ECONNREFUSED…が出たときの解決法 - Qiita <https://qiita.com/hachiware1024/items/ba91448a475c531dcdf7>`_
* `Macでgitのcredential.helper=osxkeychainにアアアアアッてなって削除した話 - Hatena Blog <https://ropupu-ropupu.hatenablog.com/entry/2018/02/06/204431>`_
