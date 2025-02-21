#!/bin/bash

while true; do
    clear
    echo "==================================================="
    echo -e "\e[5;1;36m 🚀🚀 GAIANET NODE INSTALLER BY GACRYPTO 🚀🚀 \e[0m"
    echo "==================================================="

    echo -e "\e[1;33m📌 NOTE: If you have an 🎮 NVIDIA GPU, keep your computer running for at least 20-24 hours for great results. 🚀🚀\e[0m"
    echo -e "\e[1;33m💰💰 Believe me - You'll farm higher Gaia Points! 💰💰\e[0m"
    echo "==================================================="
    echo -e "\e[1;32m✅ You'll still earn good points if running on VPS or non-GPU computers! 💰💰\e[0m"
    echo "==================================================="

    echo -e "\n\e[1mPress a number to perform an action:\e[0m\n"
    echo -e "1) \e[1;36m 🎮 Install Gaianet For NVIDIA GPU (RTX 20/30/40/50 Series Support) \e[0m"
    echo -e "2) \e[1;36m 🖥️ Install Gaianet For VPS & Without NVIDIA GPU Computers \e[0m"
    echo -e "3) \e[1;33m 🔄 Restart GaiaNet Node \e[0m"
    echo -e "4) \e[1;33m ⏹️ Stop GaiaNet Node \e[0m"
    echo -e "5) \e[1;94m 🤖 Chat with Gaia Domain Automatically \e[0m"
    echo -e "6) \e[1;95m 🔍 Switch to GaiaChatBot Screen \e[0m"
    echo -e "7) \e[1;95m 🔙 Return to GaiaNet Main Menu \e[0m"

    echo "==================================================="
    echo -e "\e[1;31m⚠️  DANGER ZONE:\e[0m"
    echo -e "8) \e[1;31m 🗑️ Uninstall GaiaNet Node (Risky Operation) \e[0m"
    echo "==================================================="

    echo -e "\e[1;31m❌ TERMINATE ALL ACTIVE SCREENS:\e[0m"
    echo -e "9) \e[1;31m 🚨 Terminate All Active Screens \e[0m"
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
    echo "Detecting system configuration..."
    if command -v nvcc &> /dev/null || command -v nvidia-smi &> /dev/null; then
        echo "✅ NVIDIA GPU detected. Running GPU-optimized Domain Chat..."
        script_name="gaiabotga1.sh"
    else
        echo "⚠️ No GPU detected. ✅ Running Non-GPU Domain Chat..."
        script_name="gaiabotga.sh"
    fi

    rm -rf ~/$script_name

    # Check for existing GaiaBot screens
    existing_screens=$(screen -ls | grep gaiabot | awk '{print $1}')

    if [ -n "$existing_screens" ]; then
        echo "✅ Found existing GaiaBot screen sessions:"
        select screen_choice in $existing_screens "Start New Session" "Exit"; do
            if [[ "$screen_choice" == "Start New Session" ]]; then
                echo "🚀 Starting a new GaiaBot session..."
                break
            elif [[ "$screen_choice" == "Exit" ]]; then
                echo "❌ Exiting..."
                exit
            elif [[ -n "$screen_choice" ]]; then
                echo "🔄 Switching to selected screen: $screen_choice"
                screen -r "$screen_choice"
                exit
            else
                echo "⚠️ Invalid choice. Please try again."
            fi
        done
    fi

    # If no existing screen was selected, start a new one
    screen -dmS gaiabot bash -c '
    curl -O https://raw.githubusercontent.com/abhiag/Gaia_Node/main/'"$script_name"' && chmod +x '"$script_name"';
    if [ -f "'"$script_name"'" ]; then
        ./'"$script_name"'
        exec bash  # Keeps the session open
    else
        echo "❌ Error: Failed to download '"$script_name"'."
        sleep 10  # Pause before exit
    fi'

    sleep 2
    screen -r gaiabot
    ;;
        6)
            echo "Switching to Gaiabot screen..."
            screen -d -r gaiabot
            ;;
        7)
            echo "Returning to GaiaNet Main Menu..."
            rm -rf GaiaNodeInstaller.sh
            curl -O https://raw.githubusercontent.com/abhiag/Gaianet_installer/main/GaiaNodeInstaller.sh
            chmod +x GaiaNodeInstaller.sh
            ./GaiaNodeInstaller.sh
            exit
            ;;
        8)
            echo -e "\e[31m⚠️ WARNING: This will completely remove GaiaNet Node from your system!\e[0m"
            read -p "Are you sure you want to proceed? (yes/no) " confirm
            if [[ "$confirm" == "yes" ]]; then
                echo "🗑️ Uninstalling GaiaNet Node..."
                curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/uninstall.sh' | bash
                echo -e "\e[32m✅ GaiaNet Node has been successfully removed.\e[0m"
            else
                echo "❌ Uninstallation aborted."
            fi
            ;;
        9)
            echo -e "\e[31m🚨 WARNING: This will terminate all active screen sessions!\e[0m"
            read -p "Are you sure you want to proceed? (yes/no) " confirm
            if [[ "$confirm" == "yes" ]]; then
                echo "🔴 Terminating all active screen sessions..."
                screen -ls | grep gaiabot | awk '{print $1}' | xargs -r -I {} sh -c 'screen -S {} -X quit && screen -wipe {}'
                echo -e "\e[32m✅ All screen sessions have been terminated.\e[0m"
            else
                echo "❌ Operation canceled."
            fi
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac

    read -p "Press Enter to return to the main menu..."
done
