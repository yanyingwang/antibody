#!/usr/bin/env zsh

#set -e
#set -x


help()
{
  echo ""
  echo $fg[green]"Help:"
  echo " |"
  echo " |-  antibody list"
  echo " |-  antibody github github-usename/repo-name"
  echo " |-  antibody oh-my-zsh plugin-name"
  echo " |-  antibody oh-my-zsh theme theme_name"
  echo ""
  echo ""
}

list()
{
  echo ""
  echo $fg[green]"Plugins:"
  echo " |"

  for d in $(ls $apphome/bundle/)
  do
    echo " |- ${d/#*bundle\/}"
  done

  echo ""
  echo ""
}


github()
{ 
  plugin_dir_bundle="$apphome/bundle/$plugin_dir"
  test -d $apphome/bundle/$plugin_dir || git clone git@github.com:yanyingwang/$plugin.git $plugin_dir_bundle

  files=(
  "$plugin_dir_bundle/${plugin#*\/}.zsh"
  "$plugin_dir_bundle/${plugin#*\/}.plugin.zsh"
  "$plugin_dir_bundle/${plugin#*\/}.theme.zsh"
  )

  for f in $files[@]
  do
    test -e $f && source $f && break
  done
}

oh-my-zsh()
{
  export ZSH=$apphome/bundle/oh-my-zsh
  source $ZSH/oh-my-zsh.sh

  plugin_dir_oh="$apphome/bundle/oh-my-zsh/Plugins"
  theme_dir_oh="$apphome/bundle/oh-my-zsh/themes"

  test -d $apphome/bundle/oh-my-zsh || git clone https://github.com/robbyrussell/oh-my-zsh.git $apphome/bundle/oh-my-zsh

  if [[ $plugin = "theme" ]]
  then
    source $theme_dir_oh/$theme.zsh-theme
    ZSH_THEME=$theme
    return
  fi

  if [[ $# > 3 ]]
  then
    for p in $@[3,$#]
    do
      source $apphome/bundle/oh-my-zsh/plugins/$p/*.plugin.zsh
    done
  else
    source $apphome/bundle/oh-my-zsh/plugins/$plugin/*.plugin.zsh
  fi
}


antibody()
{
  #PWD=${${0:a:h}%bundle*}
  action=$1
  plugin=$2
  theme=$3
  plugin_dir=${action}-${plugin/\//-}

  case $action in
    list)
      list
      ;;
    github)
      github
      ;;
    oh-my-zsh)
      oh-my-zsh
      ;;
    *)
      help
      ;;
  esac
}


