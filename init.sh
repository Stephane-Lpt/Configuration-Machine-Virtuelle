#!/bin/bash

echo $(date | sed s/CET//g) --- Nouvelle Installation ---
if [ $# -ne 2 ] 
then
	echo $(date | sed s/CET//g) Erreur : il faut exactement 2 arguments \(nom, groupe\)
	exit 1
fi

if [ adduser $1 ]
then
	echo ajout de l\'utilisateur $1 >> ~/Documents/install.log
else
	echo $(date | sed s/CET//g) Erreur : l\'utilisateur existe déjà
fi

if [ addgroup $2 ]
then
	echo ajout du groupe $2 >> ~/Documents/install.log
else
	echo $(date | sed s/CET//g) Erreur : le groupe existe déjà
fi

if [ $(apt list --installed | grep emacs | wc -l) -ge 2 ]
then
	echo $(date | sed s/CET//g) emacs est déjà installé
else 
	if [ $(apt-get install emacs) ]
	then
		echo $(date | sed s/CET//g) emacs a bien été installé
	else
		echo $(date | sed s/CET//g) erreur lors de l\'installation de emacs
	fi
fi

if [ $(apt list --installed | grep wireshark | wc -l) -ge 1 ]
then
	echo $(date | sed s/CET//g) wireshark est déjà installé
else 
	if [ $(apt-get install emacs) ]
	then
		echo $(date | sed s/CET//g) wireshark a bien été installé
	else
		echo $(date | sed s/CET//g) erreur lors de l\'installation de wireshark
	fi
fi

if [ $(apt list --installed | grep apache2 | wc -l) -ge 1 ]
then
	echo $(date | sed s/CET//g) apache2 est déjà installé
else 
	if [ $(apt-get install apache2) ]
	then
		echo $(date | sed s/CET//g) apache2 a bien été installé
	else
		echo $(date | sed s/CET//g) erreur lors de l\'installation de apache2
	fi
fi

if [ $(apt list --installed | grep openjdk-17-jdk  | wc -l) -ge 1 ]
then
	echo $(date | sed s/CET//g) java est déjà installé
else 
	if [ $(sudo apt-get install openjdk-17-jdk ) ]
	then
		echo $(date | sed s/CET//g) java a bien été installé
	else
		echo $(date | sed s/CET//g) erreur lors de l\'installation de java
	fi
fi

if [ $(snap list | grep intelliJ  | wc -l) -ge 1 ]
then
	echo $(date | sed s/CET//g) intelliJ est déjà installé
else 
	if [ $(sudo snap install intellij-idea-community --classic) ]
	then
		echo $(date | sed s/CET//g) intelliJ a bien été installé
	else
		echo $(date | sed s/CET//g) erreur lors de l\'installation de intelliJ
	fi
fi





