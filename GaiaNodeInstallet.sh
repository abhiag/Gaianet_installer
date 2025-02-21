#!/bin/bash

while true; do
    clear
    echo "==================================================="
    echo -e "\e[36m 🚀🚀 GAIANET NODE INSTALLER BY GACRYPTO 🚀🚀 \e[0m"
    echo "==================================================="
    echo "\nPress a number to perform an action:\n"
    echo "1) Install Gaianet For NVIDIA GPU (RTX 20/30/40/50 Series Support)"
    echo "2) Install Gaianet For VPS & Without NVIDIA GPU Computers"
    echo "3) Restart GaiaNet Node"
    echo "4) Stop GaiaNet Node"
    echo "5) Switch to GaiaChatBot Screen"
    echo "6) Return to GaiaNet Main Menu"
    echo "==================================================="
    echo -e "\e[33m📌 NOTE: If you have an 🎮 NVIDIA GPU, keep your computer running for at least 20-24 hours for Great results. 🚀🚀\e[0m"
    echo -e "\e[33m💰💰 Believe me - You'll farm higher Gaia Points! 💰💰\e[0m"
    echo "==================================================="
    echo -e "\e[32m ✅ Still You'll Earn Good Points Too If you are running only on VPS on Non-GPU Computers! 💰💰\e[0m"
    echo "================================================="
    echo -e "\e[31m ⚠️  WARNING: Uninstalling will completely remove GaiaNet Node from your system!\e[0m"
    echo -e "\e[31m    Proceed only if you are sure!\e[0m"
    echo "7) 🗑️ Uninstall GaiaNet Node (Risky Operation)"
    echo "==================================================="
    echo -e "\e[35m🌍 Follow GA Crypto for Updates & Support:\e[0m"
    echo -e "\e[35m🔹 Telegram: https://t.me/GaCryptOfficial\e[0m"
    echo -e "\e[35m🔹 Twitter/X: @GACryptoO\e[0m"
    echo "==================================================="
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
            echo "Switching to Gaiabot screen..."
            screen -d gaiabot
            screen -r gaiabot
            ;;
        6)
            echo "Returning to GaiaNet Main Menu..."
            rm -rf GaiaNodeInstallet.sh 
            curl -O https://raw.githubusercontent.com/abhiag/Gaianet_installer/main/GaiaNodeInstallet.sh && chmod +x GaiaNodeInstallet.sh && ./GaiaNodeInstallet.sh
            exit
            ;;
        7)
            echo "⚠️ WARNING: This will completely remove GaiaNet Node from your system!"
            echo "Are you sure you want to proceed? (yes/no)"
            read confirm
            if [[ "$confirm" == "yes" ]]; then
                echo "🗑️ Uninstalling GaiaNet Node..."
                curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/uninstall.sh' | bash
            else
                echo "Uninstallation aborted."
            fi
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac

    read -p "Press Enter to return to the main menu..."
done
