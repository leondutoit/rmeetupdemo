# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  # The following lines enable you to open rstudio in a window on the host
  # if you run Linux. On mac you need xquartz. On windows: cygwin/X. 
  config.ssh.forward_x11 = true
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
    
  # http://fgrehm.viewdocs.io/vagrant-cachier
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

$script = <<BOOTSTRAP
sudo apt-get update
sudo apt-get -y install git gcc 
sudo apt-get -y install libxml2-dev libcurl4-openssl-dev
sudo add-apt-repository ppa:marutter/rrutter
sudo apt-get update
sudo apt-get -y install r-base r-base-dev
sudo apt-get -y install libgstreamer0.10 libjpeg62
wget -nv http://download1.rstudio.org/rstudio-0.98.1062-amd64.deb
sudo dpkg -i *.deb
rm *.deb
ln -s /vagrant/ /home/vagrant/rmeetupdemo
sudo R --vanilla < rmeetupdemo/dependencies.r
R -e "devtools::install('rmeetupdemo')"
R -e "library(dplyr); library(rmeetupdemo); library(ggvis); d <- create_immigration_df()"
BOOTSTRAP

  config.vm.provision :shell, :inline => $script
end

