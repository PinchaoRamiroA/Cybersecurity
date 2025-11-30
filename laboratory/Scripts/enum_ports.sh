#!/bin/bash

echo "[+] Enumeración detallada de puertos..."
TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Uso: ./enum_ports.sh <IP>"
    exit 1
fi

nmap -A -p- -T4 $TARGET -oN enum_ports_$TARGET.txt

echo "[+] Enumeración completada. Archivo: enum_ports_$TARGET.txt"
