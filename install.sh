#!/bin/bash

#######################################################################
### EDIT THESE PATHS FOR YOUR OWN SETUP                             ###
#######################################################################

# The left4dead2 directory of your server
L4D2_DIR="/home/steam/Steam/steamapps/common/Left 4 Dead 2 Dedicated Server/left4dead2/"

#######################################################################
### EDIT THESE IF YOU WANT TO INSTALL ONLY SOME OF THE ADDONS       ###
#######################################################################

main() {
    install "mmsource"
    install "sourcemod"
    install "stripper"

    install "tickrate-enabler"
    install "dhooks"
    install "l4dtoolz"
    install "builtinvotes"
    install "geoip"
    install "cannounce"
    install "confogl"
    install "scavogl"
    install "practiceogl"
    install "witchparty"
	install "skeet"
    install "rotoblin"
    install "eq"
    install "sky"
    install "promod"
    install "left4downtown2"
    install "sourcebans"
    install "various"
}

#######################################################################
### SHOULD NOT HAVE TO EDIT BELOW HERE                              ###
#######################################################################

install() {
    # Create a temporary directory
    dir=$(mktemp -d)

    # Extract the addon to the temp directory
    tar zxvf "${1}.tar.gz" -C "$dir"

    # Merge the temp directory into the server's left4dead2 folder
    rsync -av "$dir/" "${L4D2_DIR}"

    # Clean up the temp directory
    rm -rf "$dir"
}

main
