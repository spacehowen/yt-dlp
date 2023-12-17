#!/bin/bash

green='\033[0;32m'
yellow='\033[1;33m'
cyan='\033[0;36m'
reset='\033[0m'

# Ruta de la carpeta de descargas
download_folder="/sdcard/Download/yt-dlp"

# Función para descargar video
download_video() {
    local url="$1"
    local quality="$2"

    echo -e "\n${yellow}Descargando en calidad $quality...${reset}"

    if [ "$quality" == "mp3" ]; then
        yt-dlp -x --audio-format mp3 --output "$download_folder/%(title)s.%(ext)s" "$url"
    elif [ "$quality" == "mp4" ]; then
        yt-dlp -f "best" --merge-output-format mp4 --output "$download_folder/%(title)s.%(ext)s" "$url"
    fi

    echo -e "${green}Descarga completada.${reset}"

    # Mueve el archivo descargado a la carpeta de descargas
    mv "$download_folder"/*.{mp3,mp4} "$download_folder"
    echo -e "\n${green}Archivo movido a $download_folder.${reset}"
}

# Menú principal
while true; do
    echo -e "\n${cyan}=== Menú de Descarga ===${reset}"
    echo -e "${yellow}SPACE HOWEN - Descargador YT${reset}"
    echo -e "1. ${green}Descargar solo audio (mp3)${reset}"
    echo -e "2. ${green}Descargar video (mp4)${reset}"
    echo -e "3. ${yellow}Salir yt-dlp${reset}"

    read -p "Seleccione una opción (1-3): " choice

    case $choice in
        1)
            read -p "Ingrese la URL del video de YouTube: " video_url
            download_video "$video_url" "mp3"
            ;;
        2)
            read -p "Ingrese la URL del video de YouTube: " video_url
            download_video "$video_url" "mp4"
            ;;
        3)
            echo -e "${yellow}Saliendo del script.${reset}"
            exit 0
            ;;
        *)
            echo -e "${yellow}Opción no válida. Por favor, seleccione una opción válida (1-3).${reset}"
            ;;
    esac
done
