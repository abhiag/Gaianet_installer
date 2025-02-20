#!/bin/bash

while true; do
    clear
    echo "==================================================="
    echo " 🚀🚀 GAIANET NODE INSTALLER BY GACRYPTO 🚀🚀    "
    echo "==================================================="
    echo "\nPress a number to perform an action:\n"
    echo "1) Install with NVIDIA GPU (RTX 20/30/40/50 Series Support)"
    echo "2) Install without GPU (For systems without an NVIDIA GPU)"
    echo "3) Restart GaiaNet Node"
    echo "4) Stop GaiaNet Node"
    echo "5) Chat with Domain (For VPS Users & NON-GPU Users)"
    echo "6) Chat with Domain (Only for GPU NODE Users)"
    echo "7) Switch to Gaiabot Screen"
    echo "8) Return to GaiaNet Main Menu"
    echo "==================================================="
    echo "📌 NOTE: If you have an 🎮 NVIDIA GPU, keep your computer running for at least 20-24 hours for Great results. 🚀🚀"
    echo "💰💰 Believe me - You'll farm higher Gaia Points! 💰💰"
    echo "==================================================="
    echo " ✅ Still You'll Earn Good Points Too If you are running only on VPS on Non-GPU Computers! 💰💰"
    echo "================================================="
    echo " ⚠️  WARNING: Uninstalling will completely remove GaiaNet Node from your system!"
    echo "    Proceed only if you are sure!"
    echo "9) 🗑️ Uninstall GaiaNet Node (Risky Operation)"
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
            if screen -list | grep -q "gaiabot"; then
                read -p "Gaiabot screen session already running. Do you want to switch to it? (yes/no): " switch_choice
                if [[ "$switch_choice" == "yes" ]]; then
                    screen -d -r gaiabot
                fi
            else
                echo "Starting ChatBot for Non-GPU Users in a new screen session..."
                screen -dmS gaiabot bash -c 'rm -rf gaiabotga1.sh gaiabotga.sh; curl -O https://raw.githubusercontent.com/abhiag/Gaia_Node/main/gaiabotga.sh && chmod +x gaiabotga.sh && ./gaiabotga.sh'
                echo "ChatBot started in 'gaiabot' screen session. Use option 7 to switch."
            fi
            ;;
        6)
            if screen -list | grep -q "gaiabot"; then
                read -p "Gaiabot screen session already running. Do you want to switch to it? (yes/no): " switch_choice
                if [[ "$switch_choice" == "yes" ]]; then
                    screen -d -r gaiabot
                fi
            else
                echo "Starting ChatBot for GPU NODE Users in a new screen session..."
                screen -dmS gaiabot bash -c 'rm -rf gaiabotga1.sh gaiabotga.sh; curl -O https://raw.githubusercontent.com/abhiag/Gaia_Node/main/gaiabotga1.sh && chmod +x gaiabotga1.sh && ./gaiabotga1.sh'
                echo "ChatBot started in 'gaiabot' screen session. Use option 7 to switch."
            fi
            ;;
        7)
            echo "Switching to Gaiabot screen..."
            screen -d -r gaiabot
            ;;
        8)
            echo "Returning to GaiaNet Main Menu..."
            rm -rf GaiaNodeInstallet.sh 
            curl -O https://raw.githubusercontent.com/abhiag/Gaianet_installer/main/GaiaNodeInstallet.sh && chmod +x GaiaNodeInstallet.sh && ./GaiaNodeInstallet.sh
            exit
            ;;
        9)
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
