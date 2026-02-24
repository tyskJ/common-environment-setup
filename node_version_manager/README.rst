.. image:: ./doc/001samune.png

=====================================================================
Node Version Manager インストール手順
=====================================================================

Windows
=====================================================================
1. ``nvm-windows`` ( Windows版 ``Node.js`` バージョンマネージャー)インストール
---------------------------------------------------------------------
* `GitHub <https://github.com/coreybutler/nvm-windows>`_ から *nvm-setup.exe* をダウンロード
* デフォルト設定でインストール

2. ``node.js`` (LTS版) インストール
---------------------------------------------------------------------
.. code-block:: bash

  nvm install lts

3. LTS版の使用
---------------------------------------------------------------------
.. code-block:: bash

  nvm use 22.12.0

.. note::

  * バージョン ``nvm list`` でインストール済みの値を指定
  * ``nvm`` で管理している ``node.js`` のパッケージは「 ``~/AppData/Roaming/nvm/{nodeバージョン番号}/`` 」に格納されている

Mac
=====================================================================
1. ``nvm`` インストール
---------------------------------------------------------------------
.. code-block:: zsh

  brew install nvm

2. ``profile`` 追加
---------------------------------------------------------------------
.. code-block:: zsh

  echo '' >> ~/.zshrc
  echo '## nvm' >> ~/.zshrc
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
  echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"' >> ~/.zshrc
  echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"' >> ~/.zshrc

3. ``profile`` 読み込み
---------------------------------------------------------------------
.. code-block:: zsh

  source ~/.zshrc

.. note::

  ``nvm -v`` でバージョンが表示されればOKです

参考資料
=====================================================================
リファレンス
---------------------------------------------------------------------
* `nvm-sh / nvm - GitHub <https://github.com/nvm-sh/nvm>`_

ブログ
---------------------------------------------------------------------
* `nvm-windowsでnode.jsのバージョン管理をする【Windows】 <https://qiita.com/nezumori/items/504b26d26f3e6e3009e3>`_
* `[Node.js] nvmインストール手順(MacOS) - Zenn <https://zenn.dev/nok_c7/articles/536ac2d35bf9e6>`_


