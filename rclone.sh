#!/bin/zsh
R_CONFIG = 'path to rclone config file'
STORAGE = 'storage_account_name:container_name'
MOUNT_PATH = 'path to the storage mount point directory' 
if test -d $MOUNT_PATH; then
	rclone mount --allow-other --allow-non-empty --config=$R_CONFIG --drive-use-trash $STORAGE $MOUNT_PATH
else;
	mkdir $MOUNT_PATH
	rclone mount --allow-other --allow-non-empty --config=$R_CONFIG --drive-use-trash $STORAGE $MOUNT_PATH
fi


