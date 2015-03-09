# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Create folder which is used to store applications
mkdir -p ~/Development/Applications

# Clone the rupa/z application
git clone git@github.com:rupa/z.git ~/Development/Applications/z

# Install GMVault
pip install gmvault
