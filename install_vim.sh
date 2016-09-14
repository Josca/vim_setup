# Install vim.
sudo apt-get -y --force-yes install vim

# Download colors:
mkdir -p ~/.vim/colors && cd ~/.vim/colors
wget -O wombat256mod.vim 'http://www.vim.org/scripts/download_script.php?src_id=13400'

# Download pathogen package manager
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
# vimrc: execute pathogen#infect()

# Install vim-airline plugin
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
# vimrc: set laststatus=2

# Install ctrlp
git clone https://github.com/ctrlpvim/ctrlp.vim ~/.vim/bundle/ctrlp

# Install NERDTree - Side bar file manger.
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# Install Ack - current folder search tool.
sudo apt-get install -y --force-yes ack-grep
git clone https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim

# Install vim-multiple-cursors (sublime-text like)
git clone https://github.com/terryma/vim-multiple-cursors.git ~/.vim/bundle/vim-multiple-cursors

# Install vim-markdown
git clone https://github.com/plasticboy/vim-markdown ~/.vim/bundle/vim-markdown

