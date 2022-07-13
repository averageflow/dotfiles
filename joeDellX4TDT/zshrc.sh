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
export HELM_EXPERIMENTAL_OCI=1

#required for unit testing sn-update-processor and other for legacy ATP 1.0
#export GOOGLE_APPLICATION_CREDENTIALS="/home/joe/Development/Tokens/ingka-ofd-cop-dev-23cd89267563.json"

NEWLINE=$'\n'
export PROMPT="%F{214}%n@%m %F{172}%~% %{$reset_color%} ${NEWLINE}%F{214}λ%{$reset_color%} "
#export RPROMPT="$(git_custom_status)"

export PATH="$HOME/gems/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/lua-language-server/bin:$PATH"

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
alias matrix="cmatrix"

alias fw-db-sds-dev="cloud_sql_proxy -log_debug_stdout=true -instances=ingka-ofd-cop-dev:europe-west4:atp-sds-event-instance-dev=tcp:0.0.0.0:5433"
alias fw-db-sds-stage="cloud_sql_proxy -log_debug_stdout=true -instances=ingka-ofd-atp-stage:europe-west4:atp-sds-event-instance-stage=tcp:0.0.0.0:5433"
alias fw-db-sn-detector-prod="gcloud compute ssh redis-forwarder-euw1-prod --tunnel-through-iap -- -N -L 5434:10.95.128.11:5432"
alias fw-db-atp-prod="gcloud compute ssh redis-forwarder-euw1-prod --tunnel-through-iap -- -N -L 5433:10.95.128.2:5432"
alias fw-redis-master-data-prod="gcloud compute ssh redis-forwarder-euw1-prod --tunnel-through-iap -- -N -L 6380:10.3.100.180:6379"
alias gkedev="kubectl config use-context gke_ingka-managed-gke-dev_europe-west4_ccoe-europe-west4-dev-1"
alias gkestage="kubectl config use-context gke_ingka-managed-gke-stage_europe-west4_ccoe-europe-west4-stage-1"
alias gkeprod="kubectl config use-context gke_ingka-managed-gke-prod_europe-west4_ccoe-europe-west4-prod-1"


if [ -e /home/joe/.nix-profile/etc/profile.d/nix.sh ]; then . /home/joe/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval "$(direnv hook bash)"

[ -f "/home/joe/.ghcup/env" ] && source "/home/joe/.ghcup/env" # ghcup-env
