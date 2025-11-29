#!/bin/bash

clear
echo "==========================================="
echo "     Protect Panel Auto Installer"
echo "==========================================="
echo ""
echo "Installer ini akan menjalankan 9 script"
echo "Sumber script:"
echo "https://github.com/WAHIDOFC2/AntiRusuhh"
echo ""
sleep 2

REPO="https://raw.githubusercontent.com/WAHIDOFC2/AntiRusuhh/main"

SCRIPTS=(
 "mbut.sh"
 "mbut2.sh"
 "mbut3.sh"
 "mbut4.sh"
 "mbut5.sh"
 "mbut6.sh"
 "mbut7.sh"
 "mbut8.sh"
 "mbut9.sh"
)

echo "Memulai instalasi..."
echo ""

COUNT=1

for SCRIPT in "${SCRIPTS[@]}"; do
    echo "==========================================="
    echo " Menjalankan script $COUNT dari 9"
    echo " File: $SCRIPT"
    echo "==========================================="
    echo ""

    curl -fsSL "$REPO/$SCRIPT" | bash

    if [ $? -ne 0 ]; then
        echo ""
        echo "Gagal menjalankan $SCRIPT"
        echo "Melanjutkan ke script berikutnya"
        echo ""
    else
        echo ""
        echo "Berhasil menjalankan $SCRIPT"
        echo ""
    fi

    COUNT=$((COUNT + 1))
    sleep 1
done

echo "==========================================="
echo " Semua script Protect Panel selesai"
echo "==========================================="
