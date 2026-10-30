#!/bin/bash

# Definir colores
COLOR='\033[0;32m'     # Verde clásico
DESTACADO='\033[1;33m' # Amarillo para que los datos destaquen
NC='\033[0m'           # Sin color

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
    echo -e "${COLOR}"
    cat logoold.txt | pv -qL 800
    sleep 2
    # 1. Imprime el logo ASCII en verde
    echo -e "${COLOR}"
    cat logo.txt | pv -qL 800
    sleep 2

     echo -e "${COLOR}"
    cat logoMS.txt | pv -qL 800
    sleep 2

    # 2. Muestra las primeras 30 líneas del código real
    echo -e "${COLOR}"
    head -n 30 codigo.txt | pv -qL 300
    
    # 3. Primer Hito
    mostrar_hito "19/09/2011: Aniversario de CódigoFacilito"

    # 4. Muestra de la línea 31 a la 70 del código real (usando sed)
    echo -e "${COLOR}"
    sed -n '31,70p' codigo.txt | pv -qL 300

    # 5. Segundo Hito
    mostrar_hito "25/09/2011: Cumpleaños de Cody"

    # 6. Muestra de la línea 71 a la 110 del código real
    echo -e "${COLOR}"
    sed -n '71,110p' codigo.txt | pv -qL 300

    # 7. Tercer Hito
    mostrar_hito "Cofundadores : Alex Soria y Uriel Hernández"

    # 8. Muestra de la línea 111 a la 160 para terminar el ciclo
    echo -e "${COLOR}"
    sed -n '111,160p' codigo.txt | pv -qL 300

        # 6. Muestra de la línea 71 a la 110 del código real
    echo -e "${COLOR}"
    sed -n '71,110p' codigo.txt | pv -qL 300

    # 7. Tercer Hito
    mostrar_hito "2016 - se integran al equipo Eduardo, Luis y Marines"


    # Mensaje de reinicio y pausa antes de volver a empezar el loop
    echo -e "\n${DESTACADO}[+] REINICIANDO SECUENCIA...${NC}\n" | pv -qL 100
    sleep 3
    clear
done
