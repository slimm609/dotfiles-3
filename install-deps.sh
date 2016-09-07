# Create folder which is used to store applications
mkdir -p ~/Development/Applications

# Clone the rupa/z application
git clone git@github.com:rupa/z.git ~/Development/Applications/z

# Add Hub's completion to zsh
mkdir -p ~/.zsh/completions

cp init/hub.zsh_completion ~/.zsh/completions/ \
      mv ~/.zsh/completions/hub.zsh_completion ~/.zsh/completions/_hub

# Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
  curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install trash, a safer alternative to 'rm'
npm install -g trash-cli

# Install prezto, my framework of choice for ZSH
./install-prezto.zsh
