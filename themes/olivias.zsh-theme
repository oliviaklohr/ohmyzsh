# Yay! High voltage and arrows!

prompt_setup_pygmalion(){
  ZSH_THEME_GIT_PROMPT_PREFIX=""
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{$fg_bold[red]%}"
  ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}%{$fg_bold[green]%}"

  base_prompt='%{$fg_bold[magenta]%}%n%{$reset_color%}%{$reset_color%}%{$fg_bold[white]%}: %{$reset_color%}%{$fg_bold[cyan]%}%0~%{$reset_color%} '
  post_prompt='%{$fg_bold[white]%}⇒%{$reset_color%}  '

  precmd_functions+=(prompt_pygmalion_precmd)
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "%{$fg_bold[white]%}| %{$reset_color%}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

prompt_pygmalion_precmd(){
  local gitinfo=$(git_prompt_info)

  PROMPT="$base_prompt$gitinfo$post_prompt"
}

prompt_setup_pygmalion


