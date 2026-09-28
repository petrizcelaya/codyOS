#!/bin/bash

COLOR='\033[0;32m'     # Verde tipo terminal
DESTACADO='\033[1;33m' # Amarillo para resaltar los datos
NC='\033[0m'

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