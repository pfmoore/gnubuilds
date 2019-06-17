# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/fedora-28"

  config.vm.provision "shell", inline: <<-SHELL
    dnf install -y mingw64-gcc mingw64-winpthreads-static make
  SHELL
end
