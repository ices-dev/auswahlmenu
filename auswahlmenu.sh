#!/bin/bash

# Auswahlmenu in Bash
# Author  :  Holger Wessel
# Datum   :  28.08.2018

# Variablen
MLI="[menu1]  menu2   menu3 "                                    # Menudisplay LINKS
MMI=" menu1  [menu2]  menu3 "                                    # Menudisplay MITTE
MRE=" menu1   menu2  [menu3]"                                    # Menudisplay RECHTS

POS=1                                                            # Cursor Links=1; Mitte=2; Rechts=3 (DEFAULT=1)
EING="huhu"                                                      # Eingabe

# Code
echo "* AUSWAHLMENU in BASH *"
echo ""

tput sc                                                          # Cursor festhalten
tput civis                                                       # Cursor ausblenden

while [ 1 ]; do

    if [ $POS == 1 ]                                             # Menuauswahl ist LINKS
        then
            tput rc
            tput el
            printf "$MLI"
            read -r -sn3 EING
            if [[ $EING = '[D' ]]
                then
                    POS=3
            fi
            if [[ $EING = '[C' ]]
                then
                    POS=2
            fi
            if [[ $EING = '' ]]
                then
                    break
            fi
    fi

    if [ $POS == 2 ]                                             # Menuauswahl ist MITTE
        then
            tput rc
            tput el
            printf "$MMI"
            read -sn3 EING
            if [[ $EING == '[D' ]]
                then
                    POS=1
            fi
            if [[ $EING == '[C' ]]
                then
                    POS=3
            fi
            if [[ $EING == '' ]]
                then
                    break
            fi
    fi

    if [ $POS == 3 ]                                             # Menuauswahl ist RECHTS
        then
            tput rc
            tput el
            printf "$MRE"
            read -sn3 EING
            if [[ $EING == '[D' ]]
                then
                    POS=2
            fi
            if [[ $EING == '[C' ]]
                then
                    POS=1
            fi
            if [[ $EING == '' ]]
                then
                    break
            fi
    fi

done

echo ""
echo ""
echo "*    Auswahl ist: $POS   *"
tput cnorm                                                      # Cursor wieder einblenden

echo ""                                                         # Fin.
