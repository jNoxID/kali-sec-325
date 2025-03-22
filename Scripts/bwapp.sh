#!/bin/bash

# Ajout de la clé GPG Docker (corrige l'erreur de clé manquante)... (!!!)
sudo mkdir -p /usr/share/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo tee /usr/share/keyrings/docker-archive-keyring.gpg > /dev/null

# Ajout du dépôt Docker (corrige l'erreur de `cd`)... (!!!)
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bullseye stable" | sudo tee /etc/apt/sources.list.d/docker.list

# Mise à jour des paquets et installation de Docker... (!!!)
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Activation et démarrage de Docker... (!!!)
sudo systemctl enable docker
sudo systemctl start docker

# Vérification du statut de Docker... (!!!)
sudo systemctl status docker --no-pager

# Ajout de l'utilisateur actuel au groupe docker... (!!!)
sudo groupadd docker 2>/dev/null
sudo usermod -aG docker $USER

# Test Docker avec hello-world... (!!!)
docker run hello-world

# Lancement de bWAPP (application vulnérable)... (!!!)
docker run -d -p 8080:80 hackersploit/bwapp-docker

echo "[+] bWAPP est maintenant accessible via la commande => docker exec -it NOM_DU_CONTENEUR /bin/bash"
### Après un redémarrage de la machine, utilisez le commande suivante... (!!!)
### docker exec -it NOM_DU_CONTENEUR /bin/bash... (!!!)

# Message pour demander à l'utilisateur de redémarrer sa session... (!!!)
echo "[!] Redémarre ta session pour appliquer les permissions Docker, sinon tu devras utiliser sudo pour exécuter Docker."

exit