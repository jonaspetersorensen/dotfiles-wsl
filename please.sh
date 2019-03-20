#!/bin/bash

# PURPOSE
# Start point of wsl housekeeping.

# DEPENDENCIES
. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/scripts/ui.sh"
. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/scripts/install.sh"
. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/scripts/update.sh"

# Stop execution for any error - ...or not, updating ppa packages always return some error due to bad lists, abandoned packages and what have you.
#set -e

function please::print_help()
{
    ui::print::separator_horizontal
    ui::print::help_text "Usage:" " " " "
    ui::print::help_text "please" "[command]" "" ""
    ui::print::help_text " " "install" "" ""
    ui::print::help_text " " "update" "" ""
    ui::print::help_text " " "vpn" "Enable dns when using vpn in windows"
    ui::print::help_text " " "--help -h" "Show help."
    ui::print::separator_horizontal
}



## MAIN

if [ $# -eq 0 ]; then
    	# "No arguments supplied"
    	please::print_help
	exit 0
fi

case "$1" in

	'--help')
        please::print_help
        ;;

  	'-h')
        please::print_help
        ;;

    'install')
        ui::print::job_start "Starting install of... well, everything"
        install::run
        ui::print::job_end "Install done!"
        ;;

     'update')
        ui::print::job_start "Starting update of everything"
        update::run
        ui::print::job_end "Update done!"
        ;;

     'vpn')
        ui::print::job_start "Enabling vpn for windows"
        cd ./vpn
        source enable-win10-vpn.sh
        cd ..
        ui::print::job_end "Done!"
        ;;
    *)
		please::print_help
		;;
esac
