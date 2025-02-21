#!/bin/bash

while true; do
    clear
    echo "==================================================="
    echo -e "\e[5;1;36m 🚀🚀 GAIANET NODE INSTALLER BY GACRYPTO 🚀🚀 \e[0m"
    echo "==================================================="

    echo -e "\e[1;33m📌 NOTE: If you have an 🎮 NVIDIA GPU, keep your computer running for at least 20-24 hours for Great results. 🚀🚀\e[0m"
    echo -e "\e[1;33m💰💰 Believe me - You'll farm higher Gaia Points! 💰💰\e[0m"
    echo "==================================================="
    echo -e "\e[1;32m✅ Still You'll Earn Good Points Too If you are running only on VPS on Non-GPU Computers! 💰💰\e[0m"
    echo "==================================================="

    echo -e "\n\e[1mPress a number to perform an action:\e[0m\n"
    echo -e "1) \e[1;36m 🎮 Install Gaianet For NVIDIA GPU (RTX 20/30/40/50 Series Support) \e[0m"
    echo -e "2) \e[1;36m 🖥️ Install Gaianet For VPS & Without NVIDIA GPU Computers \e[0m"
    echo -e "3) \e[1;33m 🔄 Restart GaiaNet Node \e[0m"
    echo -e "4) \e[1;33m ⏹️ Stop GaiaNet Node \e[0m"
    echo -e "5) \e[1;94m 💬 Chat with Non-GPU Domain (For VPS Users & NON-GPU Users) \e[0m"
    echo -e "6) \e[1;94m 🤖 Chat with GPU-Node Domain (Only for GPU NODE Users) \e[0m"
    echo -e "7) \e[1;95m 🔍 Switch to GaiaChatBot Screen \e[0m"
    echo -e "8) \e[1;95m 🔙 Return to GaiaNet Main Menu \e[0m"

    echo "==================================================="
    echo -e "\e[1;31m⚠️  DANGER ZONE:\e[0m"
    echo -e "9) \e[1;31m 🗑️ Uninstall GaiaNet Node (Risky Operation) \e[0m"
    echo "==================================================="

    echo -e "\e[1;31m❌ TERMINATE ALL ACTIVE SCREENS:\e[0m"
    echo -e "10) \e[1;31m 🚨 Terminate All Active Screens \e[0m"
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
        5|6)
            echo "Checking for active screen sessions..."
            mapfile -t active_screens < <(screen -list | grep -o '[0-9]*\.[^ ]*')

            if [[ ${#active_screens[@]} -gt 0 ]]; then
                echo "Active screens detected:"
                for i in "${!active_screens[@]}"; do
                    screen_id=$(echo "${active_screens[i]}" | cut -d. -f1)
                    screen_name=$(echo "${active_screens[i]}" | cut -d. -f2)
                    echo "$((i+1))) Screen ID: $screen_id - Name: $screen_name"
                done
                echo "Enter the number to switch to the corresponding screen or Press Enter to create a new one:"
                read screen_choice
                if [[ -z "$screen_choice" ]]; then
                    echo "No selection made. Creating a new session..."
                elif [[ "$screen_choice" =~ ^[0-9]+$ ]] && (( screen_choice > 0 && screen_choice <= ${#active_screens[@]} )); then
                    selected_screen=${active_screens[screen_choice-1]}
                    screen_id=$(echo "$selected_screen" | cut -d. -f1)
                    echo "Switching to screen ID $screen_id..."
                    screen -d -r "$screen_id"
                    continue
                else
                    echo "Invalid selection. Returning to menu."
                    continue
                fi
            else
                echo "No active screens found. Creating a new session..."
            fi

            # Detect GPU presence and start the appropriate chat
            if command -v nvcc &> /dev/null || command -v nvidia-smi &> /dev/null; then
                echo "✅ NVIDIA GPU detected. Running GPU-optimized chat..."
                rm -rf ~/gaiabotga1.sh
                screen -dmS gaiabot bash -c '
                curl -O https://raw.githubusercontent.com/abhiag/Gaia_Node/main/gaiabotga1.sh && chmod +x gaiabotga1.sh;
                if [ -f "gaiabotga1.sh" ]; then
                    ./gaiabotga1.sh
                else
                    echo "❌ Error: Failed to download gaiabotga1.sh."
                fi'
            else
                echo "⚠️ No GPU detected. Running non-GPU chat..."
                rm -rf ~/gaiabotga.sh
                screen -dmS gaiabot bash -c '
                curl -O https://raw.githubusercontent.com/abhiag/Gaia_Node/main/gaiabotga.sh && chmod +x gaiabotga.sh;
                if [ -f "gaiabotga.sh" ]; then
                    ./gaiabotga.sh
                else
                    echo "❌ Error: Failed to download gaiabotga.sh."
                fi'
            fi
            ;;
        7)
            echo "Switching to Gaiabot screen..."
            screen -d -r gaiabot
            ;;
        8)
            echo "Returning to GaiaNet Main Menu..."
            rm -rf GaiaNodeInstaller.sh
            curl -O https://raw.githubusercontent.com/abhiag/Gaianet_installer/main/GaiaNodeInstaller.sh && chmod +x GaiaNodeInstaller.sh && ./GaiaNodeInstaller.sh
            exit
            ;;
        9)
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
        10)
            echo -e "\e[31m🚨 WARNING: This will terminate all active screen sessions!\e[0m"
            read -p "Are you sure you want to proceed? (yes/no) " confirm
            if [[ "$confirm" == "yes" ]]; then
                echo "🔴 Terminating all active screen sessions..."
                screen -ls | awk '/[0-9]+\./ {print $1}' | xargs -r screen -X -S kill
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
