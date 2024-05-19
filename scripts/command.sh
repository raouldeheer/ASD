#!/bin/bash
downloadAndRun() {
    echo "Starting $1"
    wget -O - -q --show-progress https://gist.githubusercontent.com/raouldeheer/$2/raw | bash
    echo "Finished $1"
}

asdUpdate() {
    wget -O - -q --show-progress https://github.com/raouldeheer/ASD/releases/latest/download/install.sh | bash
}

VERSION="0.0.7"

declare -A commandCode
declare -A commandName

commandName[docker]="Docker setup"
commandCode[docker]="979e472a38375e9dc9b1383039ce3127"

commandName[ufw]="UFW setup"
commandCode[ufw]="ebd8cb22fdeb3b899c5599551821859a"

commandName[setup]="LXC setup"
commandCode[setup]="699991ad6ad3284cb6908aa07d148561"

commandName[pm2]="NVM/PM2 setup"
commandCode[pm2]="c8a07ec879286282eb5db11aced34897"

commandName[aptcache]="Apt cache proxy setup"
commandCode[aptcache]="0cbf1d954b8819538364f5a5ff6c890c"

commandName[snmp]="SNMP setup"
commandCode[snmp]="b10cf1ee50acc967f05c22d89324162c"

if (( $# == 0 ))
then
    echo "No input!"
    echo ""
    echo "ASD - Advanced Script Downloader"
    echo "Options: "
    echo "update: update system"
    echo "asd-update: update asd"
    for key in "${!commandName[@]}"; do
        echo "$key: ${commandName[$key]}"
    done
else
    for option in "$@"
    do
        case $option in
            update)
                downloadAndRun "LXC update" "9bae094b585c92c9e69ac7647b08825a"
                asdUpdate
            ;;

            asd-update)
                asdUpdate
            ;;

            version)
                echo "ASD version: $VERSION"
            ;;

            *)
                if [ ${commandName[$option]+found} ]
                then
                    downloadAndRun "${commandName[$option]}" "${commandCode[$option]}"
                else
                    echo "Unknown option: $option"
                fi
            ;;
        esac
    done
fi
