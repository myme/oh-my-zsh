if [ "$(whoami)" = "root" ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function virtenv() {
    if [ -z "$debian_chroot" ] && [ -r "/etc/debian_chroot" ]; then
        local debian_chroot=$(cat /etc/debian_chroot)
        echo "($debian_chroot) "
    fi
    if [ -n "$VIRTUAL_ENV" ]; then
        local virtual_env="${VIRTUAL_ENV#${WORKON_HOME}/}"
        echo "($virtual_env) "
    fi
}

PROMPT='%{${fg[red]}%}$(virtenv)%{$reset_color%}%m %{${fg_bold[blue]}%}:: %{$reset_color%}%{${fg[green]}%}%3~ $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '

RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
