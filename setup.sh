# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install homebrew-bundle
brew tap Homebrew/bundle
# update & upgrade
brew update
brew upgrade
# bundle using Brewfile
brew install caskroom/cask/brew-cask
brew bundle
# cleanup
brew cleanup

# set up oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
# create hard-link to oh-my-zsh-powerline-theme from oh-my-zsh/themes
git clone git@github.com:jeremyFreeAgent/oh-my-zsh-powerline-theme.git ~/.oh-my-zsh-powerline-theme
ln -f ~/.oh-my-zsh-powerline-theme/powerline.zsh-theme ~/.oh-my-zsh/themes/powerline.zsh-theme
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
#git clone https://github.com/milkbikis/powerline-shell ~/.powerline-shell
#cd ~/.powerline-shell/;./install.sh

if [ -f ~/.zshrc ]; then
  rm ~/.zshrc
fi
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zlogin ~/.zlogin
#ln -s ~/dotfiles/.gemrc ~/.gemrc
#ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
#ln -s ~/dotfiles/.editorconfig ~/.editorconfig

