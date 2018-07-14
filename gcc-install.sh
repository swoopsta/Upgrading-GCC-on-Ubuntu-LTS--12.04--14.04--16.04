#!/usr/bin/env bash
#----------------------------------------------------------------------------
# Upgrading-GCC-on-Ubuntu-LTS--12.04--14.04--16.04
#----------------------------------------------------------------------------
# Author:      Adam Ayala
# License:     GPL v3.0
# OS:          Ubuntu 16.04
# Release:     1.0.0
# Website:     https://www.adamayala.com
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Install and update the 2 latest versions of gcc & g++ for compiling binaries
# on Ubuntu 16.04.
# Check the Toolchain builds at:
# - https://launchpad.net/~ubuntu-toolchain-r/+archive/ubuntu/test
#-----------------------------------------------------------------------------
clear
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt update
echo -ne "       Downloading and Installing            [..]\r"
sudo apt install gcc-7 g++-7 gcc-8 g++-8
sudo update-alternatives --remove-all gcc
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8
esac
