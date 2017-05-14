# dotfiles
A collection of config files that make my life on the commandline moderately
bearable.

## Usage
This follows the general idea described in [Nicola Paolucci’s
writeup](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
on the subject of storing dotfiles. To install on a new system, follow these
modified instructions:

1. Clone dotfiles into a bare repo:  
`git clone --bare git@github.com:agarzola/dotfiles.git $HOME/.dotfiles`
1. Define the dotfiles alias in the current shell scope:  
`alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME`
1. Checkout the contents from the bare repo:  
`dotfiles checkout`
1. Turn off untracked files:  
`dotfiles config --local status.showUntrackedFiles no`

Once all of the above is done, you can use `dotfiles` as you would `git` to
commit changes to the dotfiles repo and push them up to GitHub.
