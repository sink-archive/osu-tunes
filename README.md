# osu!tunes
[![Release](https://github.com/cainy-a/osu-tunes/actions/workflows/release.yml/badge.svg?branch=master)](https://github.com/cainy-a/osu-tunes/actions/workflows/release.yml)

An audio player using osu! beatmaps, written in Nim.

This is my first Nim project :)

## Installing and running
Slide over to releases and grab a build :)  
(assuming I have them set up)
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
