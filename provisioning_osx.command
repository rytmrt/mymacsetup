#!/bin/bash
#  ____                 _     _             _                ___  ______  ___
# |  _ \ _ __ _____   _(_)___(_) ___  _ __ (_)_ __   __ _   / _ \/ ___\ \/ / |
# | |_) | '__/ _ \ \ / / / __| |/ _ \| '_ \| | '_ \ / _` | | | | \___ \\  /| |
# |  __/| | | (_) \ V /| \__ \ | (_) | | | | | | | | (_| | | |_| |___) /  \|_|
# |_|   |_|  \___/ \_/ |_|___/_|\___/|_| |_|_|_| |_|\__, |  \___/|____/_/\_(_)
#                                                   |___/
#--------------------------------------------------------------------------------
# OSX端末はとりあえず、これを実行する
# * 作成者（森田）仕様なため、必要に応じて変更して下さい
# * VIM入れすぎ？知りません！
#--------------------------------------------------------------------------------


# ネットワークドライブに[.DS_STORE]を作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# USBドライブに[.DS_STORE]を作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true


# Xcodeコマンドラインツールのインストール？
xcode-select --install

# Homebrewをインストール
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brewの内容を更新
brew update

# ツールに必要なリポジトリを追加
brew tap caskroom/cask
brew tap neovim/neovim
brew tap rogual/neovim-dot-app
brew tap sanemat/font
brew tap rytmrt/rytmrt

# CUI系ツールをインストール
brew install zsh
brew install git
brew install vim
brew install tig
brew install wget
brew install pwgen
brew install figlet
brew install caskroom/cask/brew-cask
brew install --HEAD neovim-dot-app
brew install --vim-powerline ricty
brew install sshfavo

# GUI系アプリをインストール
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew cask install alfred
brew cask install macvim
brew cask install google-japanese-ime
brew cask install firefox
brew cask install google-chrome
brew cask install appcleaner
brew cask install slack
brew cask install sourcetree
brew cask install imagealpha
brew cask install imageoptim
brew cask install bettertouchtool
brew cask install virtualbox
brew cask install vagrant
brew cask install dropbox
brew cask install 1password
brew cask install macwinzipper
brew cask install svnx
brew cask install transmit


# Ricty for Powerline
eval $(brew info ricty | grep '$ cp' | sed -e "s/.*\$ \(.*\)/\1/g")
fc-cache -vf


# Tools
mkdir ~/tools

# SourceTree Custom-Action
git clone https://github.com/yukku0423/git-export-tools.git ~/tools/git-export-tools


# my config settings
git clone https://github.com/rytmrt/myconfig ~/config
sh ~/config/setup.sh




#-------------------------------------------------------------------------------
# 手動で設定が必要な内容を表示
#-------------------------------------------------------------------------------
echo "==========================================================================="
echo " 手動で設定が必要な内容"
echo "==========================================================================="
echo ""
echo "# SourceTree"
echo "カスタムアクションに下記を設定"
echo "+--------------------------------------------------------------------+"
echo "  [メニューキャプション]"
echo "    差分エクスポート"
echo "  [実行するスクリプト]"
echo "    /Users/$(whoami)/tools/git-export-tools/git-export-diff.rb"
echo "  [パラメータ]"
echo "    -o /Users/$(whoami)/work/exports \$SHA"
echo "+--------------------------------------------------------------------+"
echo ""
echo ""
echo ""



