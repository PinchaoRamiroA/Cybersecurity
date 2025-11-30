#!/bin/bash

echo "[+] Escaneo rápido iniciado..."
TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Uso: ./scan_basic.sh <IP>"
    exit 1
fi

nmap -sV -T4 $TARGET -oN scan_basic_$TARGET.txt

echo "[+] Escaneo completado. Archivo guardado como scan_basic_$TARGET.txt"
