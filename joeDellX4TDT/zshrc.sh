export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"

plugins=(
	git
	zsh-autosuggestions
)


source $ZSH/oh-my-zsh.sh

# Cursor is een Blok:
#echo -e -n "\x1b[\x31 q" # Knipperen
#echo -e -n "\x1b[\x32 q" # Niet knipperen

# Cursor is een liggend streepje
#echo -e -n "\x1b[\x33 q" # Knipperen
#echo -e -n "\x1b[\x34 q" # Niet knipperen

# Cursor is een verticaal streepje
echo -e -n "\x1b[\x35 q" # Knipperen
#echo -e -n "\x1b[\x36 q" # Niet knipperen

export VISUAL="nvim"
export EDITOR="nvim"

export GEM_HOME="$HOME/gems"

#required for unit testing sn-update-processor and other for legacy ATP 1.0
#export GOOGLE_APPLICATION_CREDENTIALS="/home/joe/Development/Tokens/ingka-ofd-cop-dev-23cd89267563.json"

NEWLINE=$'\n'
export PROMPT="%{$fg[green]%}%n@%m %{$fg[cyan]%}%~% %{$reset_color%} ${NEWLINE}λ "
export RPROMPT="$(git_custom_status)"

export PATH="$HOME/gems/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias clone="git clone"
alias vi="nvim"
alias nano="nvim"
alias "sudo vi"="sudo nvim"
alias "sudo nano"="sudo nvim"
alias pull="git pull"
alias commit="git commit"
alias bigtable-emulator="gcloud beta emulators bigtable start"
alias pubsub-emulator="gcloud beta emulators pubsub start"
alias stress-cpu="dd if=/dev/urandom | gzip -9 >> /dev/null"
alias top="htop"
alias l="ls -lath"
alias ll="ls -lath"

alias fw-db-sn-detector-prod="gcloud compute ssh redis-forwarder-euw1-prod --tunnel-through-iap -- -N -L 5434:10.95.128.11:5432"
alias fw-db-atp-prod="gcloud compute ssh redis-forwarder-euw1-prod --tunnel-through-iap -- -N -L 5433:10.95.128.2:5432"
alias fw-redis-master-data-prod="gcloud compute ssh redis-forwarder-euw1-prod --tunnel-through-iap -- -N -L 6380:10.3.100.180:6379"

if [ -e /home/joe/.nix-profile/etc/profile.d/nix.sh ]; then . /home/joe/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval "$(direnv hook bash)"

[ -f "/home/joe/.ghcup/env" ] && source "/home/joe/.ghcup/env" # ghcup-env