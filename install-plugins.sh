#!/bin/bash

#######################################################################
### EDIT THESE PATHS FOR YOUR OWN SETUP                             ###
#######################################################################

# The left4dead2 directory of your server
L4D2_DIR="$HOME/Steam/steamapps/common/Left 4 Dead 2 Dedicated Server/left4dead2/"

#######################################################################
### EDIT THESE IF YOU WANT TO INSTALL ONLY SOME OF THE ADDONS       ###
#######################################################################

main()
{
    echo "================================================================================"
    echo "=== Installing plugins...                                                    ==="
    echo "================================================================================"

    # Install unmaintained configs first
    install "scavogl"
    install "practiceogl"
    install "witchparty"

    # Install sourcemod, metamod, stripper
    install "mmsource"
    install "sourcemod"
    install "stripper"

    # Install various extensions
    install "tickrate-enabler"
    install "dhooks"
    install "l4dtoolz"
    install "builtinvotes"
    install "geoip"
    install "cannounce"

    # Install configs
    install "confogl"
    install "rotoblin"
    install "sky"
    install "promod"
    install "eq"
    install "skeet"

    # Install various plugins
    install "sourcebans"
    install "smac"
    install "various"

    install_maps
}

#######################################################################
### SHOULD NOT HAVE TO EDIT BELOW HERE                              ###
#######################################################################

install()
{
    # Create a temporary directory
    dir=$(mktemp -d)

    # Extract the addon to the temp directory
    tar zxvf "${1}.tar.gz" -C "${dir}"

    # Merge the temp directory into the server's left4dead2 folder
    rsync -av "${dir}/" "${L4D2_DIR}"

    # Clean up the temp directory
    rm -rf "${dir}"
}

install_maps()
{
    # Save working directory
    dir=$(pwd)

    # Download maps
    mkdir "$HOME/maps"
    cd "$HOME/maps"
    wget -A zip -N -m -p -E -k -K -nd -np "http://151.80.110.71/maps/"

    # Extract and install maps
    unzip -u -n '*.zip' -d "${L4D2_DIR}/addons/"

    # Restore working directory
    cd "${dir}"
}

main
