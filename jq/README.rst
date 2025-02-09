.. image:: ./doc/001samune.png

=====================================================================
jq(JSONコマンドライン処理ツール) インストール手順
=====================================================================

Windows
=====================================================================
1. *jq* リソースバイナリダウンロード
---------------------------------------------------------------------
* `GitHub <https://github.com/jqlang/jq/releases>`_ から64bit版バイナリ( *jq-windows-amd64.exe* )をダウンロード

.. code-block:: bash

  curl -o ~/Downloads/#1 -OL https://github.com/jqlang/jq/releases/download/jq-1.7.1/{jq-windows-amd64.exe}

2. バイナリデータを任意のフォルダに解凍
---------------------------------------------------------------------
.. code-block:: bash

  mkdir ~/jq
  mv ~/Downloads/jq-windows-amd64.exe ~/jq

3. ディレクトリにPATHを通す
---------------------------------------------------------------------
.. code-block:: bash

  echo 'export PATH=$PATH:$HOME/jq' >> ~/.bashrc
  echo 'alias jq='jq-windows-amd64.exe'' >> ~/.bashrc
  source ~/.bashrc
