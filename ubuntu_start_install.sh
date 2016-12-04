# set up the chinese typing -> chewing
sudo apt-get -y install ibus-chewing
ibus restart

# install common applications
sudo apt-get -y install vim
sudo apt-get -y install git

# set up the from-top terminal
# need to manual set up the main window height, 
# font size,
# short cut key of openning terminal, going to previous and next tab.
sudo apt-get -y install guake
sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/

# update oh my zsh
# theme can change to "wedisagree" in ~/.zshrc
sudo apt-get -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# set up git
git config --global user.name "Ping-Lin"
git config --global user.email billy3962@hotmail.com
git config --global alias.br branch
git config --global alias.st status
git config --global alias.cm commit
git config --global alias.co checkout
git config --global color.ui auto

# set up tmux
sudo apt-get -y install tmux
echo alias tmux=\'tmux -2\' >> ~/.zshrc
ln tmux.conf ~/.tmux.conf

# update my vimrc
cd
mkdir workspace
cd workspace
git clone https://github.com/Ping-Lin/my_vimrc
cd my_vimrc
./install.sh
cd

# set up sublime
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get -y install sublime-text-installer