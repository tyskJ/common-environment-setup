.. image:: ./doc/001samune.png

=====================================================================
Session Manager プラグイン インストール手順
=====================================================================

Windows
=====================================================================
1. パッケージダウンロード
---------------------------------------------------------------------
ブラウザで下記URLを入力

.. code-block::

  https://s3.amazonaws.com/session-manager-downloads/plugin/latest/windows/SessionManagerPluginSetup.exe

2. インストーラ実行
---------------------------------------------------------------------
ダウンロードしたインストーラを実行

3. インストール確認
---------------------------------------------------------------------
.. code-block:: bash

  session-manager-plugin

Mac ( ``with Apple silicon`` )
=====================================================================
1. パッケージダウンロード
---------------------------------------------------------------------
.. code-block:: zsh

  cd ~/Downloads
  curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac_arm64/session-manager-plugin.pkg" -o "session-manager-plugin.pkg"

2. インストール
---------------------------------------------------------------------
.. code-block:: zsh

  sudo installer -pkg session-manager-plugin.pkg -target /
  sudo mkdir /usr/local/bin
  sudo ln -s /usr/local/sessionmanagerplugin/bin/session-manager-plugin /usr/local/bin/session-manager-plugin

3. インストール確認
---------------------------------------------------------------------
.. code-block:: zsh

  session-manager-plugin
  

参考資料
=====================================================================
リファレンス
---------------------------------------------------------------------
* `AWS CLI 用の Session Manager プラグインをインストールする <https://docs.aws.amazon.com/ja_jp/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html>`_

