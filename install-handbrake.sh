#!/bin/bash

#enable contrib repo
sudo apt install software-properties-common || exit $?
sudo apt-add-repository contrib || exit $?

#install libdvdcss2
sudo apt install libdvd-pkg || exit $?
sudo dpkg-reconfigure libdvd-pkg || exit $?

#install dependencies
sudo apt update || exit $?
sudo apt install autoconf automake build-essential cmake git libass-dev libbz2-dev libfontconfig-dev libfreetype6-dev libfribidi-dev libharfbuzz-dev libjansson-dev liblzma-dev libmp3lame-dev libnuma-dev libogg-dev libopus-dev libsamplerate0-dev libspeex-dev libtheora-dev libtool libtool-bin libturbojpeg0-dev libvorbis-dev libx264-dev libxml2-dev libvpx-dev m4 make meson nasm ninja-build patch python3 pkg-config tar zlib1g-dev || exit $?

#install dependencies for Intel Quick Sync Video
sudo apt install libva-dev libdrm-dev || exit $?

#gui dependencies
sudo apt install appstream desktop-file-utils gettext gstreamer1.0-libav gstreamer1.0-plugins-good libgstreamer-plugins-base1.0-dev libgtk-4-dev || exit $?

#clone the repo
git clone https://github.com/HandBrake/HandBrake.git || exit $?
cd HandBrake

#configure the compile
./configure --launch-jobs=$(nproc) --launch --enable-qsv || exit $?

# install handbrake
sudo make --directory=build install || exit $?
