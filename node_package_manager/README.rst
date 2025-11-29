.. image:: ./doc/001samune.png

=====================================================================
Node Package Manager インストール手順
=====================================================================

.. note::
  * *npm* は *node* をインストールするとデフォルトでインストールされるため割愛
  * お好みのパッケージマネージャーを選択してください

Windows
=====================================================================
pnpm (Performat npm)
---------------------------------------------------------------------
1. *pnpm* インストール
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code-block:: bash
  curl -fsSL https://get.pnpm.io/install.sh | sh -

2. PATHを通す
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code-block:: bash
  echo 'export PATH="$HOME/AppData/Local/pnpm:$PATH"' >> ~/.bashrc
  source ~/.bashrc

.. note::
  * ``pnpm -v`` でバージョンが表示されればOKです

3. ``npm`` / ``npx`` 抑止
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code-block:: bash
  echo "alias npm='echo \"WARNING: npm は実行しないでください\" && false'" >> ~/.bashrc
  echo "alias npx='echo \"WARNING: npx は実行しないでください\" && false'" >> ~/.bashrc
  source ~/.bashrc

4. *minimumReleaseAge* 設定
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* 公開されてから何日経過したパッケージのみインストールを許容するかを設定する項目
* 値は分単位 (Ex. 1日 → 1440)
* ``--location`` パラメータには ``global`` (環境全体) or ``project`` (プロジェクト毎) で指定可能

.. code-block:: bash
  pnpm config set --location=global minimumReleaseAge 10080

.. note::
  * ``pnpm config list --location=global`` で結果を確認できる


参考資料
=====================================================================
リファレンス
---------------------------------------------------------------------
* `インストール - pnpm <https://pnpm.io/ja/installation>`_

ブログ
---------------------------------------------------------------------
* `【完全比較】npm vs pnpm vs Yarn vs Bun、最強のパッケージマネージャーはどれだ？ - Qiita <https://qiita.com/syukan3/items/0e3560bf0e2ae715f5d1>`_
* `【Node.js】npmからpnpmに乗り換える - Suzunatsu Web <https://www.suzunatsu.com/post/npm-to-pnpm-migration/>`_
* `pnpm とセキュアな依存管理 - blog.re-taro.dev <https://blog.re-taro.dev/p/01JJPCQXJEF4YTQTCZZPXBF69E>`_
* `npmとnpxでの最新パッケージ汚染予防策についてPATH操作とpnpmを併用してやってみた - DevelopersIO <https://dev.classmethod.jp/articles/20251128-preventing-package-contamination-using-path-manipulation-and-pnpm/>`_
* `npm から pnpm に移行する取り組み - Zenn <https://zenn.dev/korosuke613/scraps/936cce981d0209>`_
* `AWS CodeBuildを使ってビルドしているサイトのNodeパッケージマネージャーをnpmからpnpmに切り替えてみた - DevelopersIO <https://dev.classmethod.jp/articles/how-to-change-npm-to-pnpm-with-codebuild-configurations/>`_
* `pnpmのminimumReleaseAgeをグローバルとプロジェクトそれぞれに設定する方法 - Zenn <https://zenn.dev/takumin0423/articles/77b9b3b55bf1f9>`_
