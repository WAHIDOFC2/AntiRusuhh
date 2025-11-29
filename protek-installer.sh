#!/bin/bash

# Warna
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"

LOGFILE="protek_install.log"

CREATOR="WahidOfficialId.t.me"
TANGGAL_DIBUAT="28 November 2025"
TANGGAL_RILIS="30 November 2025"

# Efek typing animasi
function type_text() {
    text="$1"
    delay="$2"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep "$delay"
    done
    echo ""
}

clear

echo -e "${CYAN}"
echo "=================================================="
echo "                 PROTEK PANEL INSTALLER"
echo "=================================================="
echo -e "${RESET}"

type_text "Creator : $CREATOR" 0.02
type_text "Tanggal dibuat : $TANGGAL_DIBUAT" 0.02
type_text "Tanggal rilis : $TANGGAL_RILIS" 0.02
echo ""
type_text "Installer otomatis dengan tampilan keren" 0.02
echo -e "Log file : ${YELLOW}$LOGFILE${RESET}"
echo ""
sleep 1

echo -e "${BLUE}[INFO]${RESET} Mengecek dependensi..."
sleep 0.6

if ! command -v curl &> /dev/null; then
    echo -e "${RED}[ERROR] curl tidak ditemukan. Menginstall curl...${RESET}"
    apt update -y && apt install curl -y
fi

echo -e "${GREEN}[OK]${RESET} curl siap digunakan"
echo ""
sleep 0.6

# Loader animasi
function loader() {
    local text=$1
    local pid=$2
    local spin="/ | \\ -"
    local i=0

    echo -ne "$text "

    while kill -0 $pid 2>/dev/null; do
        i=$(( (i+1) % 4 ))
        printf "\r$text ${spin:$i:1}"
        sleep 0.2
    done

    printf "\r$text selesai   \n"
}

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

TOTAL=${#SCRIPTS[@]}
COUNT=1

echo -e "${GREEN}[START]${RESET} Memulai instalasi $TOTAL script"
echo ""

sleep 1

for SCRIPT in "${SCRIPTS[@]}"; do
    clear

    echo -e "${CYAN}"
    echo "=============================================="
    echo " Menjalankan script $COUNT dari $TOTAL"
    echo " File : $SCRIPT"
    echo "=============================================="
    echo -e "${RESET}"
    sleep 0.5

    echo -e "${BLUE}[PROCESS]${RESET} Download dan eksekusi $SCRIPT"
    sleep 0.5

    (
        curl -fsSL "$REPO/$SCRIPT" | bash >> "$LOGFILE" 2>&1
    ) &
    loader "Menginstall $SCRIPT" $!
    EXIT_CODE=$?

    if [ $EXIT_CODE -ne 0 ]; then
        echo ""
        echo -e "${RED}[GAGAL]${RESET} Error saat menjalankan $SCRIPT"
        echo "Cek log : $LOGFILE"
        sleep 1.5
    else
        echo ""
        echo -e "${GREEN}[BERHASIL]${RESET} $SCRIPT selesai dijalankan"
        sleep 1
    fi

    COUNT=$((COUNT + 1))
done

clear

echo -e "${GREEN}"
echo "=================================================="
echo "       SEMUA PROSES INSTALASI SUDAH SELESAI"
echo "=================================================="
echo -e "${RESET}"

type_text "Creator : $CREATOR" 0.02
type_text "Tanggal dibuat : $TANGGAL_DIBUAT" 0.02
type_text "Tanggal rilis : $TANGGAL_RILIS" 0.02
echo ""
type_text "Log lengkap tersimpan di : $LOGFILE" 0.02

echo ""
type_text "Terima kasih telah menggunakan Protek Installer" 0.02
echo ""

sleep 1

type_text "Menutup installer..." 0.03
sleep 1

exit 0
