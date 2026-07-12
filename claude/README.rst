.. image:: ./doc/001samune.png

=====================================================================
Claude Code (CLI) & Claude Desktop インストール手順
=====================================================================

.. note::
  * Claude の利用には、CLIやDesktop版など様々なインターフェースが用意されています
  * プランによって利用できる機能が異なります
  * 最新のプランは `こちら <https://claude.com/ja/pricing>`_ を参照

Claude Code
=====================================================================

.. warning::
  * Claude Code の利用には、``Pro プラン`` 以上の登録が必要です
  * `こちら <https://claude.ai>`_ から Claude にサインアップ後、登録をしてください

Mac
---------------------------------------------------------------------
.. code-block:: bash

  curl -fsSL https://claude.ai/install.sh | bash

.. code-block:: bash

  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc

.. note::
  * ``claude --version`` でバージョンが表示されればOKです


参考資料
=====================================================================
リファレンス
---------------------------------------------------------------------
* `Claude Support <https://support.claude.com/ja/>`_
* `Claude Code Docs <https://code.claude.com/docs/ja/overview>`_

ブログ
---------------------------------------------------------------------
* `Claudeの違いがわからない人へ｜Claude / Cowork / Code 完全使い分けガイド【2026年版】- note <https://note.com/nobel/n/n6336ac1ca06d>`_
* `【保存版】Claude Codeはどこで使うのが正解？ CLI / Desktop / VSCode / Slack / Web の5環境＋Coworkを徹底比較してみた - Qiita <https://qiita.com/rf_p/items/27285d6a6ebc051ddffc>`_
* `Claude が新しくなった。モデル・工数・思考モードの選び方 <https://ccwm.substack.com/p/claude-model-effort-adaptive-thinking-guide>`_
* `Claude Codeをバージョン指定でインストールする <https://www.chazine.com/archives/4679#google_vignette>`_
