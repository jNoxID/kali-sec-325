#!/bin/bash
sudo apt remove --purge metasploit-framework -y
sudo apt autoremove -y
sudo rm -rf /opt/metasploit-framework
sudo apt update && sudo apt install metasploit-framework -y
sudo apt update && sudo apt install --only-upgrade metasploit-framework -y
### Next you have just execute "start-postgresql.sh" to launch DB... (!!!)
### Otherwise, you should to enter this command in Shell... (!!!)
sudo systemctl start postgresql
### Then, connect to MSFconsole... (!!)
#msfconsole
#db_status
#msfdb delete
#msfdb init
### Quit MSFconsole... (!!!)
#exit
### Reconnect to MSFconsole... (!!!)
#msfconsole
#reload_all
#exit
exit