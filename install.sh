#!/bin/bash

green='\033[0;32m'
yellow='\033[1;33m'
reset='\033[0m'

echo -e "${yellow}Bienvenido al instalador de YT Downloader para Termux.${reset}"
echo -e "${yellow}Este script instalará yt-dlp, ffmpeg y las dependencias necesarias.${reset}"

sleep 2

echo -e "\n${yellow}Instalando python y pip...${reset}"
pkg install -y python

echo -e "\n${yellow}Instalando yt-dlp con pip...${reset}"
pip install --upgrade yt-dlp

echo -e "\n${yellow}Instalando ffmpeg...${reset}"
pkg install -y ffmpeg

echo -e "\n${yellow}Solicitando permisos de almacenamiento y escritura...${reset}"
termux-setup-storage

download_folder="/sdcard/Download/yt-dlp"
mkdir -p "$download_folder"

echo -e "\n${green}Instalación completada.${reset} Ahora puedes ejecutar el script principal para descargar videos."
