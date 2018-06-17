#!/bin/bash

function ui::colors::set_global_var()
{
    # Reset
    UI_COLORS["Color_Off"]='\033[0m'       # Text Reset

    # Regular Colors
    UI_COLORS["Black"]='\033[0;30m'        # Black
    UI_COLORS["Red"]='\033[0;31m'          # Red
    UI_COLORS["Green"]='\033[0;32m'        # Green
    UI_COLORS["Yellow"]='\033[0;33m'       # Yellow
    UI_COLORS["Blue"]='\033[0;34m'         # Blue
    UI_COLORS["Purple"]='\033[0;35m'       # Purple
    UI_COLORS["Cyan"]='\033[0;36m'         # Cyan
    UI_COLORS["White"]='\033[0;37m'        # White

    # Bold
    UI_COLORS["BBlack"]='\033[1;30m'       # Black
    UI_COLORS["BRed"]='\033[1;31m'         # Red
    UI_COLORS["BGreen"]='\033[1;32m'       # Green
    UI_COLORS["BYellow"]='\033[1;33m'      # Yellow
    UI_COLORS["BBlue"]='\033[1;34m'        # Blue
    UI_COLORS["BPurple"]='\033[1;35m'      # Purple
    UI_COLORS["BCyan"]='\033[1;36m'        # Cyan
    UI_COLORS["BWhite"]='\033[1;37m'       # White

    # Underline
    UI_COLORS["UBlack"]='\033[4;30m'       # Black
    UI_COLORS["URed"]='\033[4;31m'         # Red
    UI_COLORS["UGreen"]='\033[4;32m'       # Green
    UI_COLORS["UYellow"]='\033[4;33m'      # Yellow
    UI_COLORS["UBlue"]='\033[4;34m'        # Blue
    UI_COLORS["UPurple"]='\033[4;35m'      # Purple
    UI_COLORS["UCyan"]='\033[4;36m'        # Cyan
    UI_COLORS["UWhite"]='\033[4;37m'       # White

    # Background
    UI_COLORS["On_Black"]='\033[40m'       # Black
    UI_COLORS["On_Red"]='\033[41m'         # Red
    UI_COLORS["On_Green"]='\033[42m'       # Green
    UI_COLORS["On_Yellow"]='\033[43m'      # Yellow
    UI_COLORS["On_Blue"]='\033[44m'        # Blue
    UI_COLORS["On_Purple"]='\033[45m'      # Purple
    UI_COLORS["On_Cyan"]='\033[46m'        # Cyan
    UI_COLORS["On_White"]='\033[47m'       # White

    # High Intensity
    UI_COLORS["IBlack"]='\033[0;90m'       # Black
    UI_COLORS["IRed"]='\033[0;91m'         # Red
    UI_COLORS["IGreen"]='\033[0;92m'       # Green
    UI_COLORS["IYellow"]='\033[0;93m'      # Yellow
    UI_COLORS["IBlue"]='\033[0;94m'        # Blue
    UI_COLORS["IPurple"]='\033[0;95m'      # Purple
    UI_COLORS["ICyan"]='\033[0;96m'        # Cyan
    UI_COLORS["IWhite"]='\033[0;97m'       # White

    # Bold High Intensity
    UI_COLORS["BIBlack"]='\033[1;90m'      # Black
    UI_COLORS["BIRed"]='\033[1;91m'        # Red
    UI_COLORS["BIGreen"]='\033[1;92m'      # Green
    UI_COLORS["BIYellow"]='\033[1;93m'     # Yellow
    UI_COLORS["BIBlue"]='\033[1;94m'       # Blue
    UI_COLORS["BIPurple"]='\033[1;95m'     # Purple
    UI_COLORS["BICyan"]='\033[1;96m'       # Cyan
    UI_COLORS["BIWhite"]='\033[1;97m'      # White

    # High Intensity backgrounds
    UI_COLORS["On_IBlack"]='\033[0;100m'   # Black
    UI_COLORS["On_IRed"]='\033[0;101m'     # Red
    UI_COLORS["On_IGreen"]='\033[0;102m'   # Green
    UI_COLORS["On_IYellow"]='\033[0;103m'  # Yellow
    UI_COLORS["On_IBlue"]='\033[0;104m'    # Blue
    UI_COLORS["On_IPurple"]='\033[0;105m'  # Purple
    UI_COLORS["On_ICyan"]='\033[0;106m'    # Cyan
    UI_COLORS["On_IWhite"]='\033[0;107m'   # White
}


## MAIN

# Declare and set variable if it does not exist.
# Using "declare" inside functions does not work as expected...
if [ -z ${UI_COLORS} ]; then
    declare -A UI_COLORS
    ui::colors::set_global_var
fi