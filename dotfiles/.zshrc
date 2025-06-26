# zmodload zsh/zprof

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PNPM_HOME:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PNPM_HOME="$HOME/Library/pnpm"
export XDG_CONFIG_HOME="$HOME/.config"
export MANPATH="/usr/local/man:$MANPATH"
export NVM_NODEJS_ORG_MIRROR=https://npmmirror.com/mirrors/node/
export YARN_DISTURL=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export PYTHON_BUILD_MIRROR_URL="https://pypi.tuna.tsinghua.edu.cn"
export CHROMIUM_EXECUTABLE_PATH=/opt/homebrew/bin/chromium
path=(
  $path
  $HOME/bin:/usr/local/bin
  $PYENV_ROOT/bin
  $HOME/.jenv/bin
  $NVM_BIN
  $HOME/Library/pnpm
)

# init pyenv
eval "$(pyenv init --path)"

plugins=(
  wd
  git
  zsh-autosuggestions
  autojump
  command-not-found
)

#zstyle ':omz:plugins:nvm' autoload yes

ZSH_THEME=pmcgee

source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="%m/%d %H:%M"

# network
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7890

## edit-command-line
export EDITOR=nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -v

# alias
alias df='duf'
alias ls='lsd'
alias ll="lsd -la"
alias vim='nvim'
alias lg="lazygit"
alias config_zsh="vim ~/.zshrc"
alias config_proxy_conf="vim ~/.config/clash/n3.leensasf.us.yaml"
alias bcopy='git branch --show-current | xargs echo -n | clipcopy && echo "copied"'

function load_idf() {
  eval "source ~/.espressif/python_env/idf5.3_py3.9_env/bin/activate"
  eval ". $HOME/esp/esp-idf/export.sh"
}

export IDF_PATH="$HOME/esp/esp-idf"

# Lazyload pyenv
# _pyenv_loaded=false
# function _load_pyenv() {
#   if [ "$_pyenv_loaded" = false ]; then
#     eval "$($HOMEBREW_PREFIX/bin/pyenv init --path)"
#     _pyenv_loaded=true
#   fi
# }
# pyenv() {
#   _load_pyenv
#   command pyenv "$@"
# }

# Lazyload jenv
# _jenv_loaded=false
# function _load_jenv() {
#   if [ "$_jenv_loaded" = false ]; then
#     eval "$($HOMEBREW_PREFIX/bin/jenv init -)"
#     _jenv_loaded=true
#   fi
# }
# jenv() {
#   _load_jenv
#   command jenv "$@"
# }

# zprof

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# 禁用 Jansi 库
export JANSI_MODE=strip
# 如果是 Maven 相关问题，还可以添加
export MAVEN_OPTS="$MAVEN_OPTS -Djansi.passthrough=true -Djansi.strip=true"

