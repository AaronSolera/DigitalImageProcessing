#!/bin/bash

# Installing qt5 and its dependencies
sudo apt install qtchooser
sudo apt-get install qt5-default
sudo apt-get install libqt5serialport5-dev
sudo apt install libpcap-dev libncurses5-dev libprocps-dev libxtst-dev libxcb-util0-dev qttools5-dev-tools libdtkwidget-dev libdtkwm-dev pkg-config

# Clonning guieditor repository
git clone https://gitlab.com/labinformatica/guieditor.git

# Installing guieditor
cd guieditor
mkdir build
cd build
qmake ../guiEditorPrj.pro -recursive -config release
make 
