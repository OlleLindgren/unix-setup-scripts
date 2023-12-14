# Path to your oh-my-zsh installation.
export ZSH="/Users/olle/.oh-my-zsh"

# Theme. More exist at https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"  # Completion
DISABLE_UPDATE_PROMPT="true"  # Auto-update without prompt
ENABLE_CORRECTION="true"  # Enable command auto-correction
COMPLETION_WAITING_DOTS="true"  # Red dots while waiting for completion
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Openblas stuff
export OPENBLAS=/opt/homebrew/opt/openblas/lib/
export LDFLAGS="-L/opt/homebrew/opt/openblas/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openblas/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openblas/lib/pkgconfig"

unsetopt beep  # I fucking hate terminal beeps

alias cdp="cd ~/Projects"

# srce function
# srce .venv -> source .venv/bin/activate
srce() {
    local venv_dir="$1"

    # Check if the virtual environment directory exists
    if [ ! -d "$venv_dir" ]; then
        echo "Virtual environment directory '$venv_dir' does not exist."
        return 1
    fi

    # Check if the activate script exists within the virtual environment directory
    local activate_script="$venv_dir/bin/activate"
    if [ ! -f "$activate_script" ]; then
        echo "Activate script '$activate_script' not found in '$venv_dir'."
        return 1
    fi

    # Source the activate script
    source "$activate_script"
}

# ################ Key bindings ################
# Ctrl left/right to go forwards/backwards (MacOS only)
# bindkey -e
# bindkey '[C' forward-word
# bindkey '[D' backward-word
