#!/bin/bash

while true; do
    clear
    echo "==================================================="
    echo -e "\e[36m 🚀🚀 GAIANET NODE INSTALLER BY GACRYPTO 🚀🚀 \e[0m"
    echo "==================================================="
    echo -e "\e[33m📌 NOTE: If you have an 🎮 NVIDIA GPU, keep your computer running for at least 20-24 hours for Great results. 🚀🚀\e[0m"
    echo -e "\e[33m💰💰 Believe me - You'll farm higher Gaia Points! 💰💰\e[0m"
    echo "==================================================="
    echo -e "\e[32m ✅ Still You'll Earn Good Points Too If you are running only on VPS on Non-GPU Computers! 💰💰\e[0m"
    echo "==================================================="
    echo -e "\nPress a number to perform an action:\n"
    echo -e "1) \e[32m Install Gaianet For NVIDIA GPU (RTX 20/30/40/50 Series Support) \e[0m"
    echo -e "2) \e[32m Install Gaianet For VPS & Without NVIDIA GPU Computers \e[0m"
    echo -e "3) \e[33m Restart GaiaNet Node \e[0m"
    echo -e "4) \e[33m Stop GaiaNet Node \e[0m"
    echo -e "5) \e[34m Chat with Non-GPU Domain (For VPS Users & NON-GPU Users) \e[0m"
    echo -e "6) \e[34m Chat with GPU-Node Domain (Only for GPU NODE Users) \e[0m"
    echo -e "7) \e[35m Switch to GaiaChatBot Screen \e[0m"
    echo -e "8) \e[35m Return to GaiaNet Main Menu \e[0m"
    echo "==================================================="
    echo -e "\e[31m⚠️  DANGER ZONE:\e[0m"
    echo -e "9) \e[31m 🗑️ Uninstall GaiaNet Node (Risky Operation) \e[0m"
    echo "==================================================="
    echo -e "\e[31m❌ TERMINATE ALL ACTIVE SCREENS:\e[0m"
    echo -e "10) \e[31m Terminate All Active Screens \e[0m"
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
            mapfile -t active_screens < <(screen -ls | grep -o '[0-9]*\.[^ ]*')
            if [[ ${#active_screens[@]} -gt 0 ]]; then
                echo "🔍 Active screens detected:"
                for i in "${!active_screens[@]}"; do
                    screen_id=$(echo "${active_screens[i]}" | cut -d. -f1)
                    screen_name=$(echo "${active_screens[i]}" | cut -d. -f2)
                    echo "$((i+1))) Screen ID: $screen_id - Name: $screen_name"
                done
                echo -e "\nEnter a number to switch to an existing screen, or just press Enter to create a new session:"
                read screen_choice
            else
                echo "🚀 No active screens found. Creating a new GaiaChatBot session..."
                screen_choice=""
            fi
            if [[ -z "$screen_choice" ]]; then
                screen -dmS gaiabot bash -c 'curl -O https://raw.githubusercontent.com/abhiag/Gaia_Node/main/gaiabotga.sh && chmod +x gaiabotga.sh && ./gaiabotga.sh'
                echo "✅ New GaiaChatBot session started. Switching automatically..."
                screen -x -r gaiabot
            elif [[ "$screen_choice" =~ ^[0-9]+$ ]] && (( screen_choice > 0 && screen_choice <= ${#active_screens[@]} )); then
                selected_screen=${active_screens[screen_choice-1]}
                screen_id=$(echo "$selected_screen" | cut -d. -f1)
                echo "🔄 Switching to screen ID $screen_id..."
                screen -x -r "$screen_id"
            else
                echo "❌ Invalid selection. Returning to menu."
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
            read -p "Are you sure you want to proceed? (yes/no) " confirm
            if [[ "$confirm" == "yes" ]]; then
                echo "🗑️ Uninstalling GaiaNet Node..."
                curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/uninstall.sh' | bash
            else
                echo "Uninstallation aborted."
            fi
            ;;
        10)
            echo "❌ Terminating all active screen sessions..."
            screen -ls | awk '/[0-9]+\./ {print $1}' | xargs -I {} screen -X -S {} quit
            echo "✅ All active screens terminated."
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
    read -p "Press Enter to return to the main menu..."
done
