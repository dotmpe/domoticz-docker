domoticz-docker
===============

Dockerfile for domoticz. 
Starts a container that can be 'seeded' with an available (backup) database, if there is one in the context directory.
Opens a volume for the backups directory, so you can easily retrieve any database backups.

Requirements
===
 * Docker: https://www.docker.io/gettingstarted/#h_installation

Getting your files
===
 * Docker file from github : git clone https://github.com/NanneHuiges/domoticz-docker.git
 * [optional] add your database to this directory. it is called domoticz.db

Building
===
 * cd domoticz-docker
 * sudo docker build -t MyDomoticz .

Running
===
The basic command is this: 

    sudo docker run --device=/dev/ttyUSB0 -v /SOMEPATH/domoticz-docker/backups:/root/domoticz/backups -p 8084:8080 -d MyDomoticz

Explantion

* `sudo docker run -d MyDomoticz` : the basic run command
* `--device=/dev/ttyUSB0` means we expose a device we need to the container.
 * the old way to do this was to use -priviliged (which is deprecated and will become --priviliged), but this is a better option
 * when using priviliged, use something like: sudo docker run `-privileged -v /dev/bus/usb:/dev/bus/usb` 
 * as you see you might need to play with the device name. ttyUSB0, /dev/bus/usb, /dev/bus/usb/00x/00y .. try using lsusb to find out your device
* `-v /SOMEPATH/domoticz-docker/backups:/root/domoticz/backups` mounts the 'backups' directory to the created volume. 
 * you have your backups in a save place: keep them with your dockerfile in a backup-device and you're all set to 'reinstall'
* `-p 8084:8080` means that we expose the 8080 port to local 8084
 * domoticz (and our docker install) run on port 8080, but if you have anything running on your machine, this could be an issue
 * if you want to access using 8080, just use `-p 8080:8080` 


Browsing
===
 * You can now access your install on http://server_ip:8084
