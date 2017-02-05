# Create folder which is used to store applications
mkdir -p ~/Development/Applications

# Clone the rupa/z application
git clone git@github.com:rupa/z.git ~/Development/Applications/z

# Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install trash, a safer alternative to 'rm'
npm install -g trash-cli

# Install NPM tools for a sane JS env.
# https://dev.to/corgibytes/setting-up-a-minimal-yet-useful-javascript-dev-environment
npm i -g ava chokidar-cli standard

# Install ZSH config framework
./install-zim.zsh

# Install update_xcode_plugins (removes the xcode signing so that Alcatraz can be used for Xcode 8)
gem install update_xcode_plugins

# Install homesick (to manage my dotfiles)
gem install homesick
