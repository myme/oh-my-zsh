if [ "$(whoami)" = "root" ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function chroot() {
    if [ -z "$debian_chroot" ] && [ -r "/etc/debian_chroot" ]; then
        debian_chroot=$(cat /etc/debian_chroot)
        echo "($debian_chroot) "
    fi
}

PROMPT='%{${fg[red]}%}$(chroot)%{$reset_color%}%m %{${fg_bold[blue]}%}:: %{$reset_color%}%{${fg[green]}%}%3~ $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '

RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
