#!/usr/bin/env zsh

set -e
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

  for d in $(ls bundle/)
  do
    echo " |- ${d/#*bundle\/}"
  done

  echo ""
  echo ""
}


github()
{
  plugin_dir_bundle="bundle/$plugin_dir"
  test -d bundle/$plugin_dir || git clone https://github.com/$plugin.git $plugin_dir_bundle
  test -d $plugin_dir_bundle && source $plugin_dir_bundle/*.plugin.zsh
}

oh-my-zsh()
{
  plugin_dir_oh="bundle/oh-my-zsh/Plugins"
  theme_dir_oh="bundle/oh-my-zsh/themes"

  test -d bundle/oh-my-zsh || git clone https://github.com/robbyrussell/oh-my-zsh.git bundle/oh-my-zsh

  if [[ $plugin = "theme" ]]
  then
    source theme_dir_oh/$theme.zsh-theme
  else
    source bundle/oh-my-zsh/plugins/$plugin/*.plugin.zsh
  fi
}


antibody()
{
  PWD=${${0:a:h}%bundle*}
  action=$1
  plugin=$2
  theme=$3
  plugin_dir=${action}-${plugin/\//-}

  case $action in
    help)
      help
      ;;
    list)
      list
      ;;
    github)
      github
      ;;
    oh-my-zsh)
      oh-my-zsh
      ;;
  esac
}


