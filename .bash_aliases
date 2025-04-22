alias forti="sudo openfortivpn webvpn.comp.nus.edu.sg:443 -u e0958630"
alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"
alias updateapp="pyenv update && rustup update && npm update -g"
# update go, rg, lg, fzf, bat, fd, yazi
alias nvimdiff="nvim -d"
alias lg=lazygit
alias fd=fdfind
alias tm=tmux
alias lazyvim="NVIM_APPNAME=lazyvim nvim"
alias lazy="NVIM_APPNAME=lazyvim nvim"
alias astro="NVIM_APPNAME=astronvim nvim"
alias mountpdc="sshfs -o allow_other e0958630@soctf-pdc-009.d1.comp.nus.edu.sg:/nfs/home/e0958630/ ~/pdc"
alias mountdebug="sshfs -odebug,sshfs_debug,logleve=debug  e0958630@soctf-pdc-009.d1.comp.nus.edu.sg:/nfs/home/e0958630/ /home/ian/pdc"
alias sumatra="SumatraPDF.exe"
alias fzfp="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias nv="nvim"
alias ccf="codecrafters"
# alias tmux='systemd-run --scope --user tmux'
# alias bat="bat --pager=never"

# alias nvcc="/usr/local/cuda/bin/nvcc"
