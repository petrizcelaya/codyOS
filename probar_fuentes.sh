#!/bin/bash

# Muestra el logo y el código con cada fuente para elegir cuál se ve mejor en el CRT.
# Copia el nombre de la que te guste a fuentes.conf
# Debe correrse en la consola de la Raspberry (no por SSH).

DIR="$(dirname "$0")"
FUENTES="Lat15-Terminus12x6 Lat15-Fixed13 Lat15-TerminusBold14 Lat15-TerminusBold16 Lat15-VGA16
         Lat15-TerminusBold20x10 Lat15-TerminusBold24x12 Lat15-TerminusBold28x14 Lat15-TerminusBold32x16"

# Si se pasa una fuente como argumento, solo se prueba esa
[ -n "$1" ] && FUENTES="$1"

for fuente in $FUENTES; do
    clear
    if ! setfont "$fuente" 2>/dev/null; then
        echo "No se pudo cargar $fuente (¿estás en la consola y no por SSH?)"
        sleep 2
        continue
    fi
    echo -e "\e[1;33m=== $fuente  ->  $(tput cols) columnas x $(tput lines) líneas ===\e[0m"
    head -n 12 "$DIR/logo.txt"
    head -n 15 "$DIR/codigo.txt"
    read -r -p "[Enter] siguiente fuente..."
done

setfont 2>/dev/null
clear
