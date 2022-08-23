# Dotfiles (Git Bare Repository)
Inspired by and adapted from this [post](https://www.atlassian.com/git/tutorials/dotfiles).

## Starting from scratch
```
git init --bare $HOME/.dsprn_config
alias config='/usr/bin/git --git-dir=$HOME/.dsprn_config/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.dsprn_config/ --work-tree=$HOME'" >> $HOME/.bashrc
echo ".dsprn_config" >> .gitignore
```

This configuration tracks customizations in a git repository by essentially doing the following:
* creates a folder named ~/.dsprn_config which is a **git bare repository** to track files
* uses the *config* alias in place of the regular git command when interacting with the repository
* uses the -local flag to hide the files which are not explicitly tracked
* adds the alias definition to .bashrc for convenience
* adds ~/.dsprn_config to .gitignore to avoid recursion issues

## Installing dotfiles on a new system (or migrating to this setup) 
If you already store customizations and dotfiles in a git repository, it's possible to migrate to this setup following these steps:
* make sure to ignore the folder where you'll clone the repository (avoiding recursion issues)
```
echo ".dsprn_config" >> .gitignore
```
* clone into a bare repository in a *dot* folder of your $HOME, like ~/.dsprn_config
```
git clone --bare <git-repo-url> $HOME/.dsprn_config
```
* define the *config* alias in the current terminal session
```
alias config='/usr/bin/git --git-dir=$HOME/.dsprn_config/ --work-tree=$HOME'
```
* write the content from the bare repository to your $HOME (this step could result in an **error** if some tracked files are already present as this command does not force an overwrite behaviour)
```
config checkout
```
* set showUntrackedFiles to no on this repository
```
config config --local status.showUntrackedFiles no
```

## Script
You can use the script at the following Github Gist to automate the process described above
```
cd ~
curl -O https://gist.githubusercontent.com/dsprn/e7406058f01c2553b686c6a6c2905e75/raw/86f0ded9ac221ed95f52ba83bec7f3dc507226ed/config_install.sh
chmod u+x ./config_install.sh
./config_install.sh
```

In case of error the script will make a backup copy of all the files which already existed in the `~/.config_bk` folder and then it will run the command a second time overwriting them.

If the repository has already been cloned before and you want to install the dotfiles again it's necessary for you to follow these steps
```
cd ~
rm -rf ./.dsprn_config/
./config_install.sh	# run a second time after having removed the old repo's folder
```
