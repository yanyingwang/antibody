Antibody
=======

A plugin manager for zsh, inspired by [antigen](https://github.com/zsh-users/antigen#antigen-theme)


# Qucick Start
```shell
sudo aptitude install zsh  # for ubuntu
sudo chsh -s zsh
git clone https://github.com/yanyingwang/.zsh.git $HOME/.zsh && \
echo '$HOME/.zsh/zshrc' >> $HOME/.zshrc
```
Open a new terminal and wait for a second, everything will be setted.


# Directory structure

```shell
/home/user/zsh/
            |---zshrc
            |---bundle
                  |-----antibody
                  |         \------antibody.zsh
                  |
                  |-----oh-my-zsh
                  |       |--------plugins/*
                  |       |--------themes/*
                  |
                  |----github-zsh-users-zsh-syntax-highlighting
                  |----other plugins
```
Just like Vim plugin managers, Antibody puts itself and other plugins into "bundle" directory, config zshell through zshrc file.


# Details
## Auto clone Antibody for the first time

Puts code below to zshrc file to auto clone Antibody for the first time.
```shell
PWD=${0:a:h}

# auto pull in antibody
[[ ! -d bundle ]] && mkdir bundle
[[ ! -d bundle/antibody ]] && git clone https://github.com/yanyingwang/antibody.git bundle/antibody
```

## Get antibody working
Puts code below to zshrc file to get it working
```shell
source bundle/antibody/antibody.zsh
```

## Antibody CMD explain

### help
```shell
antibody help
```
After `source antibody.zsh`, you can type `antibody help` in your terminal to view antibody manual.

### github
```shell
antibody github username/repo
```
You can use Antibody with github repo plugin, just add code `antibody github usename/repo` to your zshrc, Antibody will clone repo if it doesn't exist.

Note: When using github repo plugins, be note that Antibody is only source three kinds of files: repo_name.zsh, whatever.plugin.zsh, whatever.theme.zsh.

For example, there is a zsh plugin waga, links is https://github.com/yanyingwang/waga, and we should wirte code `antibody github yanyingwang/waga` to `zshrc` to get 'waga' plugin working.

In this example, Antibody will source file `waga.zsh` in waga plugin. And if there is a 'test.plugin.zsh' or 'test.theme.zsh', Antibody will source it, too.


### oh-my-zsh
You can use oh-my-zsh's themes and plugins.

In the condition, Antibody will clone the whole oh-my-zsh repo to local bundle directory, but you can just use one plugin of it.

### oh-my-zsh theme
```shell
antibody oh-my-zsh theme robbyrussell
```

For example, I want to use 'robbyrussell' theme, just add code `antibody oh-my-zsh theme robbyrussel` to 'zshrc'.


### oh-my-zsh plugin
```shell
antibody oh-my-zsh git
antibody oh-my-zsh git rails
```
You can add mutiple plugin in one line, just add plugin at end of the code.



# Write your own plugin
You can write you own plugin and put it to your github, and ensure there is a 'repo_name.zsh' or 'whatever.plugin.zsh' or 'whatever.theme.zsh' at the root of your repo direcotry.

Then, just add `antibody github your_github_usename/your_plugin_repo_name` to 'zshrc'.







