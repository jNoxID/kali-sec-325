#!/bin/bash

# Vérifie si le script est lancé en tant que root
if [ "$EUID" -ne 0 ]; then
    echo "Veuillez exécuter ce script en tant que root (sudo)."
    exit 1
fi

# Demander l'adresse e-mail
read -p "Entrez votre adresse mail : " email

# Vérification simple du format email
if ! [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    echo "Adresse e-mail invalide. Abandon."
    exit 1
fi

echo "[+] Mise à jour du système..."
apt update && apt upgrade -y

echo "[+] Installation et configuration de UFW..."
apt install -y ufw
ufw default deny incoming
ufw default allow outgoing
ufw allow 48/tcp
ufw enable
ufw status verbose

echo "[+] Durcissement de la configuration SSH..."
SSH_CONF="/etc/ssh/sshd_config"

sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' "$SSH_CONF"
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' "$SSH_CONF"
sed -i 's/^#\?Port.*/Port 48/' "$SSH_CONF"

systemctl restart ssh
echo "[+] Port SSH modifié sur 48 et redémarrage du service SSH."

echo "[+] Installation de Fail2Ban..."
apt install -y fail2ban
systemctl enable fail2ban
systemctl start fail2ban

echo "[+] Installation de Postfix (nécessaire pour l'envoi de mail)..."
DEBIAN_FRONTEND=noninteractive apt install -y postfix

echo "[+] Installation de Logwatch..."
apt install -y logwatch

# Ajout d’un cron pour logwatch
echo "0 6 * * * root /usr/sbin/logwatch --output mail --mailto $email --detail high" > /etc/cron.d/logwatch
chmod 644 /etc/cron.d/logwatch

# Exécution initiale de logwatch
/usr/sbin/logwatch --output mail --mailto "$email" --detail high

echo "[+] Installation de chkrootkit et rkhunter..."
apt install -y chkrootkit rkhunter

echo "[+] Exécution de chkrootkit..."
chkrootkit

echo "[+] Mise à jour et scan avec rkhunter..."
rkhunter --update
rkhunter --propupd -y
rkhunter --check --sk

echo ""
echo "✅ Script terminé avec succès."
echo "⚠️ Vérifiez bien que votre nouveau port SSH (48) est accessible avant de fermer votre session."

exit