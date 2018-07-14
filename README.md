<p align="center">
<img src="https://www.adamayala.com/images/logo-100x100.png">
</p>

Ubuntu Server installs are faily minimal based on what you choose during install. On a VPS you don't have those options so most of the time it's not installed at all. If you're going to do any compiling you'll install it along with some other tools. The default as of this writing in 16.04 LTS is g++-5. I recently moved my webserver to a Google Cloud compute instance and wanted to compile a custom version of the Nginx webserver with certain modules built into the server itself. I needed to build 2 different versions (ARM7 & 64bit) for my server and my home lab. I also noticed that the latest version had siginificant performance optimazations for the Intel Skylake hardware that Google Compute instances use.

First you'll want to get the repos for the source.
```
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update
```
Then you'll want to get the newest version and I like to get the previous version just in case some source will not compile with the latest version. FYI-This will use about 260-270mb if you're concerned about disk usage.
```
sudo apt install gcc-7 g++-7 gcc-8 g++-8
```
Just to be safe, let's remove any links to a compiler if one was installed previously.
```
sudo update-alternatives --remove-all gcc
```
Which can show the error update-alternatives: error: no alternatives for gcc if no previous alternatives were configured. Let's configure the alternatives modifying it accordingly to the versions we've installed. Each alternative has a priority associated with it. When a link group is in automatic mode, the alternatives pointed to by members of the group will be those which have the highest priority.
```
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8
```
Once you have differing alternatives for gcc packages you can choose which to use with the following command.
```
sudo update-alternatives --config gcc
```
If you want to see which version you are currently using you can use the following command.
```
g++ -v
```
