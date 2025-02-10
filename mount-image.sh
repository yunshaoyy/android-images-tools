#!/bin/bash
umount mount-folder
origin="$(readlink -f -- "$0")"
origin="$(dirname "$origin")"
if [ -f "$1" ];then
    srcFile="$1"
fi
if [ ! -f "$srcFile" ];then
	exit 1
fi
"$origin"/simg2img "$srcFile" image.img || cp "$srcFile" image.img
mkdir -p mount-folder
mount -o loop,rw image.img mount-folder