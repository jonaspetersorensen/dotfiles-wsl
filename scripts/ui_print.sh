#!/bin/bash


# DESCRIPTION
# Library for all print functions aka pretty text in terminal.

function ui::print::indent()
{
  printf "%b" "   "
}

function ui::print::separator_horizontal()
{
  printf "%b\n" "${UI_COLORS['White']}----------------------------------------------------------------------------------------------${UI_COLORS['Color_Off']}"
}

function ui::print::help_text()
{
  local column_1 # Input 1
  local column_2 # Input 2
  local column_3 # Input 3
  local column_4 # Input 4

  column_1="${1}"  
  column_2="${2}" 
  column_3="${3}" 
  column_4="${4}"

  printf '\t%-1b\t%-15b\t%-15b\t%-15b\n' \
  "$column_1" "$column_2" "$column_3" "$column_4"
  # expand 3,25,30,45 will unfortunately not work with alpine coreutils expand.
}

function ui::print::bar()
{
  # Read empty space into variable for use as content spacing
  local spacing_vertical="\n"
  local input="$1"
  printf "${spacing_vertical}"
  printf "%b\n" "${UI_COLORS['White']}----------------------------------------------------------------------------------------------${UI_COLORS['Color_Off']}"
  printf "%b\n" "    ${input}"
  printf "%b\n" "${UI_COLORS['White']}----------------------------------------------------------------------------------------------${UI_COLORS['Color_Off']}"
  printf "${spacing_vertical}"
}

function ui::print::highlight()
{
  local input="$1" 
  printf "%b" "${UI_COLORS['White']}${input}${UI_COLORS['Color_Off']}"
}

function ui::print::abort()
{
  local input="Task could not be completed. Quitting."
  if [[ ! -z "$1" ]]; then
    input="$1"
  fi
  ui::print::bar "${UI_COLORS['Red']}${input}${UI_COLORS['Color_Off']}"
}

function ui::print::header_1()
{
  local input="$1"  
  ui::print::bar "${UI_COLORS['Cyan']}${input}${UI_COLORS['Color_Off']}"
}

function ui::print::section_start()
{
  local input="$1"  
  ui::print::bar "${UI_COLORS['Cyan']}${input}${UI_COLORS['Color_Off']}"
}

function ui::print::section_end()
{
  local input="$1"
  ui::print::bar "${UI_COLORS['Cyan']}${input}${UI_COLORS['Color_Off']}"
}

function ui::print::job_start()
{
  local input="$1"
  ui::print::bar "${UI_COLORS['Yellow']}${input}${UI_COLORS['Color_Off']}"
}

function ui::print::job_end()
{
  local input="$1"
  ui::print::bar "${UI_COLORS['Yellow']}✔ ${input}${UI_COLORS['Color_Off']}"
}

function ui::print::configs()
{
    # Print pretty config
    ui::print::section_start "Start: azure config"
    echo $AZ_CONFIG | jq -r '. | to_entries[] | "\(.key): \(.value)"'
    ui::print::section_end "End: azure config"

    ui::print::section_start "Start: cluster config"
    echo $CLUSTER_CONFIG | jq -r '. | to_entries[] | "\(.key): \(.value)"'
    ui::print::section_end "End: cluster config"
}