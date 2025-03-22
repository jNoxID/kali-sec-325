#!/bin/bash
sudo ifconfig eth0 down
sudo systemctl stop networking.service
sudo macchanger -r eth0
sudo systemctl start NetworkManager.service
sudo ifconfig eth0 up
exit
