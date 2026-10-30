#!/bin/bash

# Muestra una línea de código de ejemplo con cada color para elegir cuál se ve mejor en el CRT.
# Copia el código del que te guste a colores.conf

MUESTRA='printf("[+] Interface eth0 configured. Broadcast: 0x%08X\n", broadcast);'
NC='\e[0m'

clear

# Si se pasa un color como argumento, muestra un bloque de código real con él
if [ -n "$1" ]; then
    echo -e "$1"
    head -n 30 "$(dirname "$0")/codigo.txt"
    echo -e "${NC}"
    exit 0
fi

echo "=== COLORES BÁSICOS (funcionan en cualquier terminal) ==="
for estilo in 0 1; do
    for c in 31 32 33 34 35 36 37; do
        codigo="\\e[${estilo};${c}m"
        echo -e "${codigo}${codigo}  ${MUESTRA}${NC}"
    done
done

echo
echo "=== 256 COLORES (verdes, cianes y ámbar) ==="
for c in 46 47 48 49 50 51 82 83 84 85 86 87 118 119 120 121 122 123 154 190 214 220 226 231; do
    codigo="\\e[38;5;${c}m"
    echo -e "${codigo}${codigo}  ${MUESTRA}${NC}"
done

echo
echo "Para probar uno específico:  ./probar_colores.sh '\e[38;5;46m'"
