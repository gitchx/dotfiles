# pnpm
export PNPM_HOME="/Users/soma/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-autosuggestions end

# PostgreSQL
export PATH="/Library/PostgreSQL/18/bin:$PATH"
# PostgreSQL end

if [[ -r "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh" ]]; then
  source "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"
elif [[ -r "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]]; then
  source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi

