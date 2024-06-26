# Use launchctl to mount remote azure storage with rclone on macos
## In a currently logged in user context

You will need *[rclone](https://rclone.org)* and *[macfuse](https://osxfuse.github.io/)*. Whilst macfuse can be installed via *[Homebrew](https://brew.sh)*, rclone must be installed directly. 

You can do so by issuing the command: 

`sudo -v ; curl https://rclone.org/install.sh | sudo bash`

This solution depends on 3 files which will need to be modified by you to match your setup: 

1. **com.azure.blob.plist** - please copy this file to your **~/Library/LaunchAgents** folder. Feel free to rename file but if you do so please modify the **Label** tag inside to match the chosen filename(without the .plist at the end). The file must have a .plist extension. You will need to edit the **Label** and **Program** keys to match your filename and rclone.sh file location.
2. **rclone.conf** - please copy it to some folder in a user home directory. **~/.config** is a good candidate. Please modfify this file to match your setup. Specificaly the text between **[]**, **account** and **key** sections. 
3. **rclone.sh** - please copy it to some folder in a user home directory. Please modify **R_CONFIG**, **STORAGE** and **MOUNT_PATH** variables to match your setup. 

Once the files are in place you please run:

`launchctl load -w ~/Library/LaunchAgents/com.azure.blob.plist`

you can issue a command: 

`mount`

It should confirm the mount status. If all is well you can start the service by issuing:

`launchctl start -w ~/Library/LaunchAgents/com.azure.blob.plist`
 

If you need to troubleshoot the launchctl, you can use **Console** in **Now Mode** and search for **com.azure.blob** in **launchd.log**
To unload an agent property list from launchctl issue: 

`launchctl stop -w ~/Library/LaunchAgents/com.azure.blob.plist`
`launchctl unload -w ~/Library/LaunchAgents/com.azure.blob.plist`


You can also use that command to unmount the directory if required. 

