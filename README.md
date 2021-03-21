# osu!tunes
[![Release](https://github.com/cainy-a/osu-tunes/actions/workflows/release.yml/badge.svg?branch=master)](https://github.com/cainy-a/osu-tunes/actions/workflows/release.yml)

An audio player using osu! beatmaps, written in Nim.

This is my first Nim project :)

## Installing and running
Slide over to releases and grab a build :)  
(assuming I have them set up)
## Building and running
### Getting nim
Install nim and nimble on your system.
For example, arch users can do:
```
sudo pacman -S nim nimble
```
### Installing dependencies
```
nimble install csfml zip
```
### Building it
```
nim c -d:ssl OsuTunes.nim
```
### Running it
```
./OsuTunes
```
