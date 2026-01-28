#!/bin/bash

# Stop execution if any command fails
set -e

BASE_DIR="$(pwd)"
TARGET_DIR="$BASE_DIR/ActiveDirectoryToolset"
LIGOLO_DIR="$TARGET_DIR/Ligolo-ng"

# Color definitions
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[+] Preparing Installation Directory: $TARGET_DIR${NC}"
mkdir -p "$TARGET_DIR"
mkdir -p "$LIGOLO_DIR"

# --- GIT REPOS ---
echo -e "${GREEN}[+] Cloning Git Repositories...${NC}"

# Repository URLs
ADMODULE_REPO="https://github.com/samratashok/ADModule.git"
PASSTHECERT_REPO="https://github.com/AlmondOffSec/PassTheCert.git"
PETITPOTAM_REPO="https://github.com/topotam/PetitPotam.git"
POWERMAD_REPO="https://github.com/Kevin-Robertson/Powermad.git"
GHOSTPACK_REPO="https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git"
KRBRAYLX_REPO="https://github.com/dirkjanm/krbrelayx.git"
MIMIKATZ_REPO="https://github.com/ParrotSec/mimikatz.git"
POWERSPLOIT_REPO="https://github.com/PowerShellMafia/PowerSploit.git"
INTERNALMONOLOGUE_REPO="https://github.com/eladshamir/Internal-Monologue.git"
PSEXEC_REPO="https://github.com/EliteLoser/Invoke-PsExec.git"
SPOOLSAMPLE_REPO="https://github.com/leechristensen/SpoolSample.git"

# Cloning
git clone "$ADMODULE_REPO" "$TARGET_DIR/ADModule" 2>/dev/null || echo "ADModule already exists, skipping."
git clone "$PASSTHECERT_REPO" "$TARGET_DIR/PassTheCert" 2>/dev/null || echo "PassTheCert already exists, skipping."
git clone "$PETITPOTAM_REPO" "$TARGET_DIR/PetitPotam" 2>/dev/null || echo "PetitPotam already exists, skipping."
git clone "$POWERMAD_REPO" "$TARGET_DIR/Powermad" 2>/dev/null || echo "Powermad already exists, skipping."
git clone "$GHOSTPACK_REPO" "$TARGET_DIR/Ghostpack" 2>/dev/null || echo "Ghostpack already exists, skipping."
git clone "$KRBRAYLX_REPO" "$TARGET_DIR/Krbrelayx" 2>/dev/null || echo "Krbrelayx already exists, skipping."
git clone "$MIMIKATZ_REPO" "$TARGET_DIR/Mimikatz" 2>/dev/null || echo "Mimikatz already exists, skipping."
git clone "$POWERSPLOIT_REPO" "$TARGET_DIR/PowerSploit" 2>/dev/null || echo "PowerSploit already exists, skipping."
git clone "$INTERNALMONOLOGUE_REPO" "$TARGET_DIR/Internal-Monologue" 2>/dev/null || echo "Internal-Monologue already exists, skipping."
git clone "$PSEXEC_REPO" "$TARGET_DIR/PsExec" 2>/dev/null || echo "PsExec already exists, skipping."
git clone "$SPOOLSAMPLE_REPO" "$TARGET_DIR/SpoolSample" 2>/dev/null || echo "SpoolSample already exists, skipping."

# --- STANDALONE FILE DOWNLOADS ---
echo -e "${GREEN}[+] Downloading Standalone Tools (SharpHound, Kerbrute, etc.)...${NC}"

# SharpHound
# Using curl -L to follow redirects and -o to specify output
curl -L "https://github.com/SpecterOps/SharpHound/releases/download/v2.9.0/SharpHound_v2.9.0_windows_x86.zip" -o "$TARGET_DIR/SharpHound.zip"
unzip -o "$TARGET_DIR/SharpHound.zip" -d "$TARGET_DIR/SharpHound"
rm "$TARGET_DIR/SharpHound.zip"

# ADExplorer
curl -L "https://live.sysinternals.com/ADExplorer.exe" -o "$TARGET_DIR/ADExplorer.exe"

# Kerbrute (Windows & Linux)
curl -L "https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_windows_amd64.exe" -o "$TARGET_DIR/kerbrute_windows_amd64.exe"
curl -L "https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64" -o "$TARGET_DIR/kerbrute_linux_amd64"
chmod +x "$TARGET_DIR/kerbrute_linux_amd64"

# OpenSSL
curl -L "https://slproweb.com/download/Win64OpenSSL_Light-3_6_0.exe" -o "$TARGET_DIR/Win64OpenSSL_Light-3_6_0.exe"

# --- LIGOLO-NG SECTION ---
echo -e "${GREEN}[+] Downloading and Extracting Ligolo-ng...${NC}"

# 1. Ligolo Agent (Windows AMD64)
curl -L "https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.1/ligolo-ng_agent_0.8.1_windows_amd64.zip" -o "$LIGOLO_DIR/agent_win_amd64.zip"
unzip -o "$LIGOLO_DIR/agent_win_amd64.zip" -d "$LIGOLO_DIR"
rm "$LIGOLO_DIR/agent_win_amd64.zip"

# 2. Ligolo Agent (Linux AMD64)
curl -L "https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.1/ligolo-ng_agent_0.8.1_linux_amd64.tar.gz" -o "$LIGOLO_DIR/agent_linux_amd64.tar.gz"
tar -xzvf "$LIGOLO_DIR/agent_linux_amd64.tar.gz" -C "$LIGOLO_DIR"
rm "$LIGOLO_DIR/agent_linux_amd64.tar.gz"

# 3. Ligolo Proxy (Linux AMD64)
curl -L "https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.1/ligolo-ng_proxy_0.8.1_linux_amd64.tar.gz" -o "$LIGOLO_DIR/proxy_linux_amd64.tar.gz"
tar -xzvf "$LIGOLO_DIR/proxy_linux_amd64.tar.gz" -C "$LIGOLO_DIR"
rm "$LIGOLO_DIR/proxy_linux_amd64.tar.gz"

# 4. Ligolo Proxy (Windows ARM64)
curl -L "https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.1/ligolo-ng_proxy_0.8.1_windows_arm64.zip" -o "$LIGOLO_DIR/proxy_win_arm64.zip"
unzip -o "$LIGOLO_DIR/proxy_win_arm64.zip" -d "$LIGOLO_DIR"
rm "$LIGOLO_DIR/proxy_win_arm64.zip"

# Set execution permissions (For Linux binaries)
chmod +x "$LIGOLO_DIR/agent" 2>/dev/null || true
chmod +x "$LIGOLO_DIR/proxy" 2>/dev/null || true

echo -e "${GREEN}[+] All operations completed! Tools are located at: $TARGET_DIR${NC}"
