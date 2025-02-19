#!/bin/bash

clear
echo "==================================================="
echo " 🚀🚀 GAIANET NODE INSTALLER BY GACRYPTO 🚀🚀    "
echo "==================================================="
echo "\nPress a number to perform an action:\n"
echo "1) Install with NVIDIA GPU (RTX 20/30/40/50 Series Support)"
echo "2) Install without GPU (For systems without an NVIDIA GPU)"
echo "3) Restart GaiaNet Node"
echo "4) Stop GaiaNet Node"
echo "5) Uninstall GaiaNet Node"
echo "==================================================="
echo "🚀🚀 NOTE: If you have an NVIDIA GPU, keep your computer running for at least 20-24 hours for optimal results. 🚀🚀"
echo "💰💰 Believe me - You'll farm higher Gaia Points! 💰💰"
echo "=================================================\n"
read -p "Enter your choice: " choice



case $choice in
    1)
        echo "Installing GaiaNet with NVIDIA GPU support..."
        rm -rf Gaia_gpu_nongpu.sh
        curl -O https://raw.githubusercontent.com/abhiag/Gaia_Node/main/Gaia_gpu_nongpu.sh
        chmod +x Gaia_gpu_nongpu.sh
        ./Gaia_gpu_nongpu.sh
        ;;
    2)
        echo "Installing GaiaNet without GPU support..."
        rm -rf Gaia_gpu_nongpu.sh
        curl -O https://raw.githubusercontent.com/abhiag/Gaia_Node/main/Gaia_gpu_nongpu.sh
        chmod +x Gaia_gpu_nongpu.sh
        ./Gaia_gpu_nongpu.sh
        ;;
    3)
        echo "Restarting GaiaNet Node..."
        gaianet stop
        gaianet init
        gaianet start
        gaianet info
        ;;
    4)
        echo "Stopping GaiaNet Node..."
        gaianet stop
        ;;
    5)
        echo "Uninstalling GaiaNet Node..."
        curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/uninstall.sh' | bash
        ;;
    *)
        echo "Invalid choice. Please run the script again and select a valid option."
        ;;
esac
