# spamassassin_custom
Filtros 

En Proxmox

sudo wget https://raw.githubusercontent.com/marceloabelda/spamassassin_custom/main/MARCELOABELDA.cf -O /usr/share/spamassassin-extra/MARCELOABELDA.cf

echo "include /usr/share/spamassassin-extra/MARCELOABELDA.cf" | sudo tee -a  /etc/mail/spamassassin/local.cf

sudo systemctl restart pmg-smtp-filter

echo -e "test:test\n\nEURO MILLION" |spamassassin -t





