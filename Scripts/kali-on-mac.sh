#!/bin/zsh

brew update
brew upgrade

# PART.1
brew install metasploit
brew install beef
brew install exploitdb
brew install commix

# SET (Social Engineering Toolkit)
if [[ ! -d "/usr/local/bin/setoolkit" ]]; then
  git clone https://github.com/trustedsec/social-engineer-toolkit /usr/local/bin/setoolkit
  cd /usr/local/bin/setoolkit
  python setup.py install
  cd -
fi

# Armitage
if [[ ! -d "/usr/local/bin/armitage" ]]; then
  curl -o /usr/local/bin/armitage.zip http://www.fastandeasyhacking.com/download/armitage150813.tgz
  tar -xvzf /usr/local/bin/armitage.zip -C /usr/local/bin/
  rm /usr/local/bin/armitage.zip
fi

# Analyse de Réseau
brew install nmap
brew install wireshark
brew install tcpdump
brew install ettercap
brew install kismet
brew install responder
brew install yersinia
brew install unicornscan

# Sécurité Web
brew install burp-suite
brew install owasp-zap
brew install sqlmap
brew install w3af
brew install nikto
brew install fimap
brew install joomscan
brew install wpscan

# Attaques sur les Mots de Passe
brew install john
brew install hydra
brew install hashcat
brew install medusa

# Outils de Réseaux Sans Fil
brew install aircrack-ng
brew install reaver
brew install fern-wifi-cracker

# Outils d'Exploration de Systèmes
brew install netcat
brew install ncat
brew install socat
brew install proxychains-ng
brew install dnsenum
brew install dnsrecon
brew install fierce

# Outils de Rétro-ingénierie
brew install ghidra
brew install radare2
brew install binwalk
brew install gdb
brew install apktool
brew install smali
brew install androguard
brew install drozer

# Outils de Mémoire et Criminalistique
brew install volatility
brew install foremost
brew install autopsy
brew install sleuthkit
brew install dcfldd

# Divers
brew install maltego
brew install recon-ng
brew install faraday
brew install empire
brew install powersploit
brew install cobaltstrike
brew install mimikatz
brew install searchsploit

# PART.2
brew install tshark
brew install openvas

# PART.3
softwareupdate --install-rosetta --agree-to-licens
brew install futhark
brew install openfast
brew install --cask opencat

# PART.4
brew install futhark
brew install openfast
brew install --cask opencat
brew install bee
brew install --cask bee
brew install cmix
brew install --cask komet
brew install recode
brew install --cask responsively
brew install unicorn
brew install --cask figma
brew install nyancat
brew install --cask neat
brew install dnsgen
brew install dnsrobocert
brew install --cask flirc
brew install proguard
brew install dropbear
brew install --cask dozer
brew install --cask temurin@11
brew install mpir
brew install powerline-go
brew install --cask powerphotos
brew install mimic

echo "Completed Install !"

exit
