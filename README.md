# osu!tunes
[![Release](https://github.com/cainy-a/osu-tunes/actions/workflows/release.yml/badge.svg?branch=master)](https://github.com/cainy-a/osu-tunes/actions/workflows/release.yml)

[![Packaging status](https://repology.org/badge/vertical-allrepos/osu-tunes.svg)](https://repology.org/project/osu-tunes/versions)

An audio player using osu! beatmaps, written in Nim.

This is my first Nim project :)

## Installing and running
Slide over to releases and grab a build :)

If you're on Arch, install with your favourite AUR helper, or if you don't have one:
```sh
mkdir temp
cd temp
wget https://aur.archlinux.org/cgit/aur.git/snapshot/osu-tunes-git.tar.gz
tar -xzf osu-tunes-git.tar.gz
cd osu-tunes-git
makepkg -si
cd ../..
rm -rf temp
```
## Building and running
### Getting nim
Install nim on your system and optionally update nimble.
For example, arch users can do:
```
sudo pacman -S nim nimble
```
or debian users can do:
```
sudo apt install nim
nimble install nimble
```
### Installing dependencies
```
nimble install csfml zip
```
### Building and running it
```
nim c -d:ssl OsuTunes.nim
./OsuTunes
```
### Building for windows from linux
#### Installing requirements
You will need GCC and zlib on mingw. For example, arch users can do:
```
sudo pacman -S mingw-w64-gcc
yay -S mingw-w64-zlib
```
or debian users can do
```
apt install mingw-w64
```
#### Build it
Assuming you have installed dependencies, do the following:
```
nim c -d:mingw -d:ssl OsuTunes.nim
```
