#!/bin/sh
set -e
#***Installs dependencies for running TempleOS emulator***

#Load config settings
. ./config.sh

#Install QEMU
sudo apt install qemu-system-x86

#Download ISO if not already present
if [ ! -f "$ISO_NAME" ]; then
  echo "$ISO_NAME not found locally. Downloading from $ISO_URL..."
  wget "$ISO_URL" -O "$ISO_NAME"
else
  echo "Local ISO found. Using existing $ISO_NAME..."
fi

#Create empty virtual image for install if not already present
if [ ! -f "$IMG_NAME" ]; then
  echo "No existing virtual image found. Creating $IMG_NAME..."
  qemu-img create -f qcow2 $IMG_NAME $IMG_SIZE
else
  echo "Local virtual image found. Using existing $IMG_NAME..."
fi
