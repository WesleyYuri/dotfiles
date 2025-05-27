if [ -d ~/.asdf ]; then
    # Add shims directory to path
    export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

    # Set up shell completions
    mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
    asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"

    # append completions to fpath
    fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
    # initialise completions with ZSH's compinit
    autoload -Uz compinit && compinit

    # Java config
    if [ -d ~/.asdf/plugins/java ]; then
        . ~/.asdf/plugins/java/set-java-home.zsh
    fi
fi