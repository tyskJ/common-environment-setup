#################################  LANG  #################################
# シェルの標準言語環境を日本語UTF-8に設定
export LANG=ja_JP.UTF-8

#################################  COMPLETIONS  #################################
# 追加の zsh 補完スクリプトが存在する場合、fpath (zsh の関数や補完スクリプトを探す場所) に追加して利用可能にする
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
# 補完機能の初期化
autoload -Uz compinit
compinit -u
# 色設定を読み込み
autoload -Uz colors
colors

#################################  HISTORY  #################################
# 履歴ファイルの保存先
HISTFILE=~/.zsh_history
# メモリ上で保持する履歴の数
HISTSIZE=1000000
# ファイルに保存する履歴の数
SAVEHIST=1000000
# ctrl-p / ctrl-n で、その文字列で始まる履歴候補を検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end   # ↑ 的な動作（前を検索）
bindkey "^n" history-beginning-search-forward-end    # ↓ 的な動作（次を検索）

#################################  PROMPT  #################################
# [%n@%m] → ユーザー名@ホスト名（緑色）
# %~ → カレントディレクトリ
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~ %# "

#################################  OPTIONS  #################################
zstyle ':completion:*:default' menu select=2          # Tabで選択できるようにする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'   # 補完で大文字にもマッチ
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # ファイル補完候補に色を付ける
setopt auto_cd                                        # ディレクトリ名だけで cd を実行（例： `src` と打つだけで移動）
setopt auto_menu                                      # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_slash                               # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_pushd                                     # cd すると自動的に pushd（移動したディレクトリを“スタック（履歴）として記憶”） と同じ動作をしてディレクトリスタックに追加
setopt auto_param_keys                                # カッコを自動補完
setopt complete_in_word                               # 語の途中でもカーソル位置で補完
setopt correct                                        # スペルミス訂正
setopt extended_glob                                  # zsh 独自の強力なワイルドカード展開を使う        
setopt extended_history                               # コマンドのタイムスタンプをHISTFILEに記録する
setopt hist_ignore_all_dups                           # 完全重複コマンドは履歴に残さない
setopt hist_ignore_space                              # 先頭がスペースのコマンドは履歴に保存しない
setopt hist_reduce_blanks                             # 不要なスペースを取り除いて履歴に保存
setopt hist_save_no_dups                              # 保存時に重複があれば古い方を削除
setopt ignore_eof                                     # Ctrl+D を押しても zsh を終了しないようにする
setopt inc_append_history                             # コマンド実行直後に履歴ファイルへ書き込む
setopt interactive_comments                           # コマンドラインでも '#' 以降をコメントとして扱えるようにする  
setopt magic_equal_subst                              # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt mark_dirs                                      # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt no_beep                                        # ビープ音を無効化（ターミナルが鳴らなくなる）
setopt no_flow_control                                # Ctrl+S / Ctrl+Q などのフロー制御を無効化
setopt print_eight_bit                                # 日本語ファイル名を正しく表示するための設定（日本語ファイル名を表示可能にする）
setopt pushd_ignore_dups                              # ディレクトリスタックに重複を追加しない（重複したディレクトリを追加しない）
setopt share_history                                  # 履歴を他のシェルとリアルタイム共有

#################################  ALIAS  #################################
alias la='ls -a'          # 隠しファイルを含めて一覧表示
alias ll='ls -l'          # 詳細リスト表示
alias rm='rm -i'          # 削除時に確認する
alias cp='cp -i'          # 上書き時に確認する
alias mv='mv -i'          # 上書き時に確認する
alias mkdir='mkdir -p'    # 中間ディレクトリも作成
alias sudo='sudo '        # エイリアスが sudo に続くようにする（sudo ll など）
alias L='| less'          # パイプして less に流す
alias G='| grep'          # パイプして grep に流す
alias CP='| pbcopy'       # パイプの結果をクリップボードにコピー（mac向け）
alias ..='cd ../'         # 親ディレクトリへ移動
alias ...='cd ../../'     # 2階層上へ移動

#################################  APP  #################################

