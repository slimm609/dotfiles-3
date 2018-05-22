# Create folder which is used to store applications
mkdir -p ~/Development/Applications

# Clone the rupa/z application
git clone git@github.com:rupa/z.git ~/Development/Applications/z

# Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install Homestead, the best PHP Vagrant box
git clone git@github.com:laravel/homestead.git ~/Development/Applications/Homestead
