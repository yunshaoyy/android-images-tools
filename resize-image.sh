#!/bin/bash
umount mount-folder
e2fsck -y -f image.img
resize2fs image.img 2000M
e2fsck -E unshare_blocks -y -f image.img