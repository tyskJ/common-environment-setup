.. image:: ./doc/001samune.png

=====================================================================
mise インストール手順
=====================================================================

Windows (Git for Windows)
=====================================================================
1. *mise* インストール
---------------------------------------------------------------------
.. code-block:: bash

  winget install jdx.mise

.. note::

  * 一度 IDE(もしくはターミナル)を閉じてください
  * その後、 ``mise -v`` でバージョンが表示されればOKです

2. *shims* へのPATHを通す
---------------------------------------------------------------------
* インストールした各ツールへのPATHを管理する *shims* を認識するためにPATHを通す

.. code-block:: bash

  echo 'PATH=$PATH:$HOME/AppData/Local/mise/shims' >> ~/.bashrc
  source ~/.bashrc


参考資料
=====================================================================
リファレンス
---------------------------------------------------------------------
* `Getting Started - MISE-EN-PLACE <https://mise.jdx.dev/getting-started.html>`_
* `Registry - MISE-EN-PLACE <https://mise.jdx.dev/registry.html>`_

ブログ
---------------------------------------------------------------------
* `mise を Windows でセットアップする - Zenn <https://zenn.dev/tom_konda/articles/79a305c502558a>`_
* `Windowsにmiseを導入する - Qiita <https://qiita.com/wsigma21/items/63c19706c63b8b4731a7>`_
* `Windowsでmiseを使う - blog.PanicBlanket.com <https://blog.panicblanket.com/archives/6992>`_
* `mise を使用した開発ツールの管理についておさらいしてみた - DeveloperIO <https://dev.classmethod.jp/articles/setup-and-manage-dev-tools-with-mise/>`_
* `環境管理ツール｢mise｣について - Serverworks <https://blog.serverworks.co.jp/mise>`_
* `miseでwindows版PHP実行環境を構築 - Zenn <https://zenn.dev/dozo/articles/b23896d2945367>`_
