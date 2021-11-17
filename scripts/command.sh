#!/bin/bash
downloadAndRun() {
    echo "Starting $1"
    wget -O - -q --show-progress https://gist.githubusercontent.com/raouldeheer/$2/raw | bash
    echo "Finished $1"
}

for option in "$@"
do
    case $option in
        docker)
            downloadAndRun "docker" "979e472a38375e9dc9b1383039ce3127"
        ;;
        
        ufw)
            downloadAndRun "ufw" "ebd8cb22fdeb3b899c5599551821859a"
        ;;
        
        setup)
            downloadAndRun "setup" "699991ad6ad3284cb6908aa07d148561"
        ;;

        update)
            wget -O - -q --show-progress https://github.com/raouldeheer/ASD/releases/latest/download/install.sh | bash
        ;;
        
        *)
            echo "unknown option"
        ;;
    esac
done
