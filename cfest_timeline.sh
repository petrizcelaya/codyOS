#!/bin/bash

# Cargar colores desde colores.conf (si no existe, usa los de siempre)
CONF="$(dirname "$0")/colores.conf"
[ -f "$CONF" ] && source <(tr -d '\r' < "$CONF")
COLOR="${COLOR_CODIGO:-\033[0;32m}"   # Color del código
DESTACADO="${COLOR_HITO:-\033[1;33m}" # Color de los hitos
NC="${COLOR_RESET:-\033[0m}"

# Función para simular la escritura de código rápido
escribir_codigo() {
    echo -e "${COLOR}$1${NC}" | pv -qL 400
}

# Función para mostrar datos importantes y pausar
mostrar_hito() {
    echo -e "\n${DESTACADO}>>> [SISTEMA] $1 <<<${NC}\n" | pv -qL 100
    sleep 4 # Segundos que el texto se congela en pantalla
}

clear
while true; do
    escribir_codigo "Iniciando secuencia de arranque...\nCargando kernel CFest_v15...\nVerificando integridad de memoria..."
    
    mostrar_hito "2010: Se publica el primer video en CódigoFacilito"
    
    escribir_codigo "Montando directorios principales...\nExtrayendo archivos de configuración...\nConectando a base de datos de cursos..."
    
    mostrar_hito "11 de Noviembre: Inicializando protocolo 'Cumpleaños de Cody'"
    
    escribir_codigo "Resolviendo dependencias...\nCompilando módulos de frontend...\nValidando tokens de seguridad..."
    
    mostrar_hito "Integrantes en línea: Uriel, Eduardo, Fernanda, Luis..."
    
    escribir_codigo "Desplegando entorno de producción...\nConexión establecida.\nReiniciando ciclo..."
    
    sleep 2
    clear
done