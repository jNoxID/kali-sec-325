#!/bin/bash

### DON'T RUN THIS FILE!... (!!!)

sudo apt update
sudo apt install language-pack-fr language-pack-gnome-fr
sudo apt install locales
sudo dpkg-reconfigure locales
# SELECTIONNER :
# fr_FR.UTF-8
# fr_FR.ISO-8859-1
# Choisis fr_FR.UTF-8 comme locale par défaut lorsque le système te le demande.
sudo nano /etc/default/locale
# Modifie le fichier pour qu'il ressemble à ceci :
# LANG=fr_FR.UTF-8
# LANGUAGE=fr_FR.UTF-8
# LC_ALL=fr_FR.UTF-8
sudo dpkg-reconfigure keyboard-configuration

sudo service keyboard-setup restart
sudo udevadm trigger --subsystem-match=input --action=change
sudo apt install task-french task-french-desktop task-french-kde-desktop
sudo reboot

exit
