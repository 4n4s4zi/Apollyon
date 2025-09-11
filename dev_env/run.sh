#!/bin/sh
#set -xe
#***Script for creating a TempleOS VM in QEMU***

#Load config settings
. ./config.sh

#Display usage options
usage()
{
  echo "Usage: $0 [-m]"
  echo "-m (optional): mount image file defined in config or omit to boot a live instance."
}

#Download ISO if not already present
check_iso()
{
  if [ ! -f "$ISO_NAME" ]; then
    echo "$ISO_NAME not found. Exiting..."
    exit 1
  else
    echo "Using $ISO_NAME..."
  fi
}

#Create virtual image for install if not already present
check_img()
{
  if [ ! -f "$IMG_NAME" ]; then
      echo "$IMG_NAME not found. Exiting..."
      exit 1
  else
      echo "Using $IMG_NAME..."
  fi
}

#Parse command line args
if [ $# -gt 1 ]; then
  usage
  exit 1
elif [ $# -eq 1 ]; then
  arg="$1"
  #using case in case (haha) I add more options
  case $arg in
    -m)
      check_iso
      check_img
      echo "Launching VM with $IMG_NAME..."
      $QEMU_CMD $QEMU_FLAGS -hda $IMG_NAME
      ;;
    *)
      usage
      exit 1
      ;;
  esac
else
  check_iso
  echo "Launching live VM from ISO..."
  $QEMU_CMD $QEMU_FLAGS
fi
