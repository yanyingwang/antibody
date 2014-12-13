#!/usr/bin/env zsh

set -e


help()
{
  echo ""
  echo $fg[green]"Help:"
  echo " |"
  echo " |-  antibody list"
  echo " |-  antibody use github yanyingwang/waga"
  echo " |-  antibody use oh-my-zsh"
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
  test -d bundle/$plugin_dir || git clone https://github.com/$p2.git bundle/$plugin_dir
  source bundle/$plugin_dir/*.plugin.zsh
}

oh-my-zsh()
{
  test -d bundle/oh-my-zsh || git clone https://github.com/robbyrussell/oh-my-zsh.git bundle/oh-my-zsh
  source bundle/oh-my-zsh/plugins/$plugin/*.plugin.zsh
}

use()
{
  plugin_dir=${endpoint}-${plugin/\//-}

  if [[ $endpoint = 'github' ]]
  then
    github
  elif [[ $endpoint = 'oh-my-zsh' ]]
  then
    oh-my-zsh
  fi
}


antibody()
{
  PWD=${${0:a:h}%bundle*}
  action=$1
  endpoint=$2
  plugin=$3

  case $action in
    help)
      help
      ;;
    list)
      list
      ;;
    use)
      use
      ;;
  esac
}




