#!/bin/bash
#
# Script para crear carpetas THM y HTB

# -------FUNCIONES-------------
check_error() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}
crea_plataforma () {
	echo "Se crea la plataforma"
	mkdir $HOME/$1
	check_error "Algo ha ido mal creando la plataforma"
	cd $HOME/$1
}
crea_maquina () {
	echo "Creando directorios máquina $2"
	if [ -d "$HOME/$1/$2" ];
	then
		echo "Esta máquina ya existe, elige otro nombre"
		exit 0
	else
		mkdir $HOME/$1/$2
		check_error "Algo ha ido mal creando la máquina"
	fi
}
copia_plantillas () {
	cp $(dirname "${BASH_SOURCE[0]}")/"NotasPlantilla.ctb" $HOME/$1/$2/"Notas_$2.ctb"
}
#---------Lógica -----------------------
case $1 in
  "THM") 
	echo -e "\e[33;1mTryHackMe\e[0m"
	if [ -d "$HOME/$1" ] ; 
	then
		crea_maquina "$1" "$2"
		copia_plantillas "$1" "$2"
	else
		crea_plataforma "$1"
		crea_maquina "$1" "$2"
		copia_plantillas "$1" "$2"
	fi
	
  ;;
  "HTB")
	echo -e "\e[33;1mHack The Box\e[0m"
	if [ -d "$HOME/$1" ] ; 
	then
		crea_maquina "$1" "$2"
		copia_plantillas "$1" "$2"
	else
		crea_plataforma "$1"
		crea_maquina "$1" "$2"
		copia_plantillas "$1" "$2"
	fi
  ;;
  *)
  	echo -e "\e[31mRevisa los argumentos\nDeben ser:\n  THM - TryHackMe\n  HTB - HackTheBox\e[0m"
  	exit 0
esac
echo -e "Directorio creado en \e[1m$HOME/$1/$2\e[0m"



