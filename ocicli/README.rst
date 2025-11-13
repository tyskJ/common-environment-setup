.. image:: ./doc/001samune.png

=====================================================================
OCI CLI インストール手順
=====================================================================

Windows
=====================================================================
1. *Windows Long Path Support* 有効化
---------------------------------------------------------------------
* Windows環境に *OCI CLI* をインストールする際に以下のエラーが発生することがあります
* そのため事前に対処しておきます

.. code-block:: bash

  ERROR: Could not install packages due to an OSError: [Errno 2] No such file or directory: 'C:\\Users\\hogehoge\\.pyenv\\pyenv-win\\versions\\3.12.0\\Lib\\site-packages\\oci_cli\\help_text_producer\\data_files\\text\\cmdref\\database-management\\managed-database\\enable-autonomous-database-management-feature-autonomous-database-diagnostics-and-management-feature-details.txt'
  HINT: This error might have occurred since this system does not have Windows Long Path support enabled. You can find information on how to enable this at https://pip.pypa.io/warnings/enable-long-paths

* *PowerShell* を管理者権限で起動し、以下のコマンドを実行して *Windows Long Path Support* を有効化します

.. code-block:: powershell

  New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force


2. *OCI CLI* インストール
---------------------------------------------------------------------
* *PowerShell* を管理者権限で起動し、以下のコマンドを実行してインストールスクリプトをダウンロード & 実行します

.. code-block:: powershell

  cd $env:USERPROFILE\Downloads
  Set-ExecutionPolicy RemoteSigned
  Invoke-WebRequest https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.ps1 -OutFile install.ps1
  .\install.ps1 -AcceptAllDefaults

.. note::

  * *-AcceptAllDefaults* はオプションで、インストール時の設定が全てデフォルトで良ければつけたままで実行してください
  * バイナリの配置先を変更したい場合や、オプションパッケージを入れたい場合は、 *-AcceptAllDefaults* は付けずに実行してください
  * インストーラーを実行する際、 *Python* がローカルにない場合は、依存関係として自動でインストールされます


3. ディレクトリにPATHを通す
---------------------------------------------------------------------
.. code-block:: bash

  echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc

.. note::

  * *oci -v* でバージョンが表示されれば OK です

=====================================================================
初回のみ実施
=====================================================================

.. warning::

  * 本来なら、後述する *.oci* フォルダ及び *config* ファイルは事前に作成する必要はありません
  * ``oci setup config`` を実行すればホームディレクトリ直下に作成されます
  * そのため、下記作業は任意ですのでご了承ください
  * ただし、その場合だと ``--profile`` オプションを指定しても ``[DEFAULT]`` として登録されてしまい、意図しない操作になる可能性が高くなります
  * 事前に *config* ファイルを作成し、空の ``[DEFAULT]`` を作成することで誤操作を低減させます


*.oci* フォルダ作成
=====================================================================
.. code-block:: bash

  mkdir -p $HOME/.oci

*config* ファイル作成
=====================================================================
.. code-block:: bash

  cat <<EOF > $HOME/.oci/config
  [DEFAULT]
  EOF


参考資料
=====================================================================
リファレンス
---------------------------------------------------------------------
* `コマンドライン・インタフェース(CLI) - Oracle Cloud Infrastructureドキュメント <https://docs.oracle.com/ja-jp/iaas/Content/API/Concepts/cliconcepts.htm>`_
* `oci-cli - GitHub <https://github.com/oracle/oci-cli>`_
* `Oracle Cloud Infrastructure CLI Command Reference <https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.70.1/oci_cli_docs/>`_
* `クイックスタート - Oracle Cloud Infrastructureドキュメント <https://docs.oracle.com/ja-jp/iaas/Content/API/SDKDocs/cliinstall.htm>`_
* `手動およびオフライン・インストール - Oracle Cloud Infrastructureドキュメント <https://docs.oracle.com/ja-jp/iaas/Content/API/SDKDocs/climanualinst.htm>`_
* `Registry setting to enable long paths - Windows App Development <https://learn.microsoft.com/en-us/windows/win32/fileio/maximum-file-path-limitation?tabs=powershell#registry-setting-to-enable-long-paths>`_
