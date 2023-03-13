#!/bin/bash

# Definimos la URL del archivo a descargar y la ubicación local
URL="https://ejemplo.com/archivo.txt"
LOCAL="/ruta/a/mi/archivo.txt"

# Descargamos el archivo desde la URL
TEMP=$(mktemp)
curl -s "$URL" -o "$TEMP"

# Comparamos el contenido del archivo descargado con el local
if ! cmp -s "$LOCAL" "$TEMP"; then
  # Si son distintos, reemplazamos el archivo local con el descargado
  mv "$TEMP" "$LOCAL"
  
  # Reiniciamos el servicio (suponiendo que se llama "servicio")
  systemctl restart servicio
  
  echo "Archivo actualizado y servicio reiniciado"
else
  # Si son iguales, eliminamos el archivo temporal
  rm "$TEMP"
  
  echo "Archivo ya actualizado, no se hizo nada"
fi
