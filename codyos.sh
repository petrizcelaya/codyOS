#!/bin/bash

# Trabajar siempre desde la carpeta del script (para que funcione al arrancar automático)
cd "$(dirname "$0")" || exit 1

# Cargar colores desde colores.conf (si no existe, usa los de siempre)
[ -f colores.conf ] && source <(tr -d '\r' < colores.conf)
COLOR="${COLOR_CODIGO:-\033[0;32m}"   # Color del código
DESTACADO="${COLOR_HITO:-\033[1;33m}" # Color de los hitos
NC="${COLOR_RESET:-\033[0m}"          # Sin color

# Cargar tamaños de letra desde fuentes.conf (si no existe, no cambia la letra)
[ -f fuentes.conf ] && source <(tr -d '\r' < fuentes.conf)

LINEAS_CODIGO=35 # Líneas de código que corren antes de cada hito

# Cambia la letra de la consola (si no se puede, p. ej. por SSH, sigue sin cambiarla)
cambiar_fuente() {
    [ -n "$1" ] && setfont "$1" 2>/dev/null
}

# Al salir con Ctrl+C regresa la letra y el color normales
trap 'echo -e "${NC}"; setfont 2>/dev/null; clear; exit' INT TERM

# Muestra un logo con su color (si no tiene color propio usa el del código)
mostrar_logo() {
    echo -e "${2:-$COLOR}"
    pv -qL 800 < "$1"
    sleep 2
}

# Muestra el siguiente pedazo de codigo.txt; al llegar al final vuelve a empezar
inicio=1
mostrar_codigo() {
    echo -e "${COLOR}"
    sed -n "${inicio},$((inicio + LINEAS_CODIGO - 1))p" codigo.txt | pv -qL 300
    inicio=$((inicio + LINEAS_CODIGO))
    [ "$inicio" -gt "$(wc -l < codigo.txt)" ] && inicio=1
}

# Función para mostrar los datos importantes con pausa
mostrar_hito() {
    # Cambiamos a amarillo, ponemos unas barras para que se vea pro, y escribimos el mensaje
    echo -e "\n${DESTACADO}================================================================${NC}"
    echo -e "${DESTACADO}>>> [CodyOS] $1 <<<${NC}" | pv -qL 100
    echo -e "${DESTACADO}================================================================${NC}\n"
    sleep 4 # Se pausa 4 segundos para que la gente en el evento alcance a leerlo
}

# Limpiar pantalla al iniciar
clear

while true; do
    # 1. Logos con letra chica para que quepan
    cambiar_fuente "$FUENTE_LOGOS"
    mostrar_logo logoold.txt "$COLOR_LOGO_OLD"
    mostrar_logo logo.txt "$COLOR_LOGO_CODYOS"
    mostrar_logo logoMS.txt "$COLOR_LOGO_MS"

    # Letra grande para el código y los hitos (se limpia para que no se deformen los logos)
    clear
    cambiar_fuente "$FUENTE_CODIGO"

    # 2. Hitos de hitos.txt (se lee en cada vuelta, así los cambios salen sin reiniciar)
    mapfile -t HITOS < <(tr -d '\r' < hitos.txt | grep -v -e '^[[:space:]]*$' -e '^[[:space:]]*#')
    for hito in "${HITOS[@]}"; do
        mostrar_codigo
        mostrar_hito "$hito"
    done

    # Mensaje de reinicio y pausa antes de volver a empezar el loop
    echo -e "\n${DESTACADO}[+] REINICIANDO SECUENCIA...${NC}\n" | pv -qL 100
    sleep 3
    clear
done
