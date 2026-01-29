#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${GREEN}=== RISC-V Environment Setup ===${RESET}"

# Check for cpp compiler
if command -v g++ >/dev/null 2>&1; then
  echo -e "${GREEN}[OK] G++ found.${RESET}"
elif command -v clang++ >/dev/null 2>&1; then
  echo -e "${GREEN}[OK] Clang++ found.${RESET}"
else
  echo -e "${RED}[ERR] No C++ compiler found (g++ or clang++). Please install one to continue.${RESET}"
  exit 1
fi

# Check for verilator
if command -v verilator >/dev/null 2>&1; then
  echo -e "${GREEN}[OK] Verilator found.${RESET}"
else
  echo -e "${RED}[ERR] Verilator not found. Attempting to install...${RESET}"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    if command -v brew >/dev/null 2>&1; then
      echo "Detected macOS. Running: brew install verilator"
      brew install verilator
    else
      echo -e "${RED}[FAIL] Homebrew not found. Install verilator manually${RESET}"
      exit 1
    fi
  elif [[ -f /etc/debian_version ]]; then
    echo -e "Detected Debian/Ubuntu. Running: sudo apt install verilator"
    sudo apt update && sudo apt install -y verilator
  elif [[ -f etc/fedora_version ]]; then
    echo "Detected Fedora. Running: sudo dnf install verilator"
    sudo dnf install -y verilator
  else
    echo -e "${RED}[FAIL] Unknown OS. Please install verilator manually.${RESET}"
    exit 1
  fi
fi

echo -e "${GREEN}=== Setup complete. You can run 'make' ===${RESET}"

