alias forti="sudo openfortivpn webvpn.comp.nus.edu.sg:443 -u e0958630"
alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"
alias updateapp="pyenv update && rustup update && pnpm update -g"
# update go, rg, lg, fzf, bat, fd, yazi

alias nvimdiff="nvim -d"
alias lg=lazygit
alias fd=fdfind
alias tm=tmux

alias nvba="nvim ~/.bash_aliases && source ~/.bashrc"
alias nvrc="nvim ~/.bashrc && source ~/.bashrc"
alias srcb="source ~/.bashrc"

alias nv="nvim"
alias nvimdiff="nvim -d"
alias lazyvim="NVIM_APPNAME=lazyvim nvim"
alias lazy="NVIM_APPNAME=lazyvim nvim"
alias astro="NVIM_APPNAME=astronvim nvim"

alias mountpdc="sshfs -o allow_other e0958630@soctf-pdc-009.d1.comp.nus.edu.sg:/nfs/home/e0958630/ ~/pdc"
alias mountdebug="sshfs -odebug,sshfs_debug,logleve=debug  e0958630@soctf-pdc-009.d1.comp.nus.edu.sg:/nfs/home/e0958630/ /home/ian/pdc"

alias sumatra="SumatraPDF.exe"
alias fzfp="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

alias ccf="codecrafters"
alias ccft="codecrafters test"
alias ccfs="codecrafters submit"
# alias tmux='systemd-run --scope --user tmux'
# alias bat="bat --pager=never"

# alias nvcc="/usr/local/cuda/bin/nvcc"

# Git aliases

function gc() {
  if [ $# -eq 0 ]; then
    echo "Usage: gc [-b] <branch-name>"
    echo "  -b    Create a new local branch (no tracking)"
    echo "Available local and remote branches:"
    git branch -a
    return 0
  fi

  local create_new=0

  if [ "$1" = "-b" ]; then
    create_new=1
    shift
  fi

  if [ $# -ne 1 ]; then
    echo "Usage: gc [-b] <branch-name>"
    return 1
  fi

  local branch="$1"

  if [ "$create_new" -eq 1 ]; then
    git switch -c "$branch"
  elif git show-ref --verify --quiet "refs/heads/$branch"; then
    git switch "$branch"
  else
    git switch -c "$branch" --track "origin/$branch"
  fi
}

alias gcb="git checkout -b"
alias gb="git branch"
alias gf="git fetch"
alias gp="git pull"
alias gP="git push"
alias gr="git reset --soft HEAD~1"
alias gco="git commit"
alias gcoa="git commit --amend --no-edit"
alias gs="git status -sb"
alias gl="git log --oneline --graph --color --all --decorate"
alias gpa="git format-patch HEAD^ --stdout > patchfile.patch"
