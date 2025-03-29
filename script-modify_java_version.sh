#!/bin/bash

#-----------------------------------------------------------------------------------------------------------
# Script Name: script-modify_java_version.sh
# Description: This script automates the process of installing a Java version based on a version folder.
# Author: Jabrane SAIDI
# Date: 2025-03-25
# Dependencies: No dependencies
#-----------------------------------------------------------------------------------------------------------
#set -x

## Define variables
PATH_OF_ENV_FILE=~/.bashrc
NAME_OF_ENV_FILE="the environment variables file"

## Function to check current Java version (S)
check_current_java_version() {
    if command -v java &>/dev/null; then
        local java_version=$(java -version 2>&1 | head -n 1)
        echo -e "\nJava is already installed: $java_version."
    else
        echo -e "\nCurrently, Java is not installed."
    fi
}

## Function to check if a file exists (G)
check_file() {
    if [ ! -f "$2" ]; then
        echo -e "\nError: File ($1 '$2') does not exist."
        exit 1
    fi
}

## Function to tell user that Java variable will be defined in the env. file (PATH_OF_ENV_FILE) and ask for confirmation (S)
ask_user_to_validate_env_file(){
    while true; do
        read -p $'\nNew Java version variables will be defined in the environment file '$1'. Do you want to continue? (y/n): ' user_response
        
        user_response="${user_response,,}"

        if [[ "$user_response" == "y" ]]; then # Continu processing ...
            break
        elif [[ "$user_response" == "n" ]]; then
            echo -e "\nYour choice is 'no'. See you, bye!"
            echo "N.B: If you want to define an other environment file than '$1', you can define it in 'PATH_OF_ENV_FILE' variable."
            exit 0
        else
            echo "Please answer with 'yes' or 'no'."
        fi

    done
}

## Function to check user response (G)
check_user_response() {
    local exit_string="exit"
    if [[ "${1,,}" == "${exit_string,,}" ]]; then
        echo -e "\nYou have chosen to exit. See you, bye!"
        exit 0
    fi
}

## Function to check if a directory exists (G)
check_directory() {
    if [ ! -d "$1" ]; then
        echo -e "\nError: Directory '$1' does not exists."
        exit 1
    fi
}

## Function to Check if a Java folder contains a 'bin/java' executable (S)
check_java_executable() {
    if [ -f "$1/bin/java" ]; then
        # Run 'java -version' from the folder's bin directory to get the Java version:
        local version_output=$("$1/bin/java" -version 2>&1)
  
        if [[ "$version_output" == *"version"* ]]; then
            echo -e "\nThe folder of the new Java version '$1' contains a valid Java version:"
            echo "$version_output"
            # Processing continu...
        else
            echo -e "\nError: This folder does not seem to contain a valid Java installation."
            exit 1
        fi
    else
        echo -e "\nError: No Java executable found in this folder ($1)."
        exit 1
    fi
}

# Function to prepare env. file (S)
prepare_env_file() {
    # Backup the env. file
    cp $1 "$1.bak"
    # Delete spaces before and after the = sign on lines that contain "JAVA_HOME" string
    sed -i '/JAVA_HOME/ s/ *= */=/g' $1
    # Delete comments which contains "Add JAVA_HOME variable"
    sed -i '/^#.*Add JAVA_HOME variable/d' $1
    # Delete lines which contains "JAVA_HOME="
    sed -i '/JAVA_HOME=/d' $1
    # Delete lines which contains "PATH=$JAVA_HOME/bin"
    sed -i '/PATH=\$JAVA_HOME\/bin/d' $1
}

# Function to write the new Java config. in env. file (S)
write_new_java_config() {
    # Add comment "# Add JAVA_HOME variable (<currentdate>)":
    echo "# Add JAVA_HOME variable (date=$(date "+%d-%m-%Y")):" | tee -a $1 > /dev/null
    # Add export JAVA_HOME=...:
    echo "export JAVA_HOME=$2" | tee -a $1 > /dev/null
    # Tell the user that the line export JAVA_HOME=... was added to the file:
    echo -e "\nThe line 'export JAVA_HOME=$2' was added to the end of the file '$1'.\n"
    # Add export PATH=...:
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" | tee -a $1 > /dev/null
    # Tell the user that the line export PATH=... was added to the file:
    echo -e "The line 'export PATH=\$JAVA_HOME/bin:\$PATH' was added to the end of the file '$1'.\n"    
}

# Function to ask user to reboot to apply changes on env. variables file (S)
ask_user_to_reboot_to_apply_changes() {
    read -p "To be sure that the new Java version was successfully installed, the machine must restart. Do you want to restart it? (y/n): " user_answer
    if [[ "$user_answer" == "y" || "$user_answer" == "Y" ]]; then
        systemctl reboot -i
    else
        echo -e "\n/!\ Warning: in some cases, the new Java version will not be installed until you restart your machine!"
        exit 0
    fi
}

# Main function 
main() {

    # Check Java version already installed (if exists)
    check_current_java_version

    # Check if the env. file exists
    check_file "$NAME_OF_ENV_FILE" "$PATH_OF_ENV_FILE"

    # Tell the user that Java variable will be defined in the env. file (PATH_OF_ENV_FILE) and ask for confirmation
    ask_user_to_validate_env_file "$PATH_OF_ENV_FILE"

    # Prompt the user to set the path of java folder
    read -p $'\nEnter the path of the new Java directory to install the new Java version (or set exit to terminate the script): ' PATH_OF_JAVA_DIR
    check_user_response "$PATH_OF_JAVA_DIR"

    # Check if the directory exists
    check_directory "$PATH_OF_JAVA_DIR"

    # Check if the folder is a valid java version folder
    check_java_executable "$PATH_OF_JAVA_DIR"
    
    # Prepare env. file (and delete old java config version to write the config of the new one in the next step)
    prepare_env_file "$PATH_OF_ENV_FILE"

    # Write new Java config. on the end of env. file
    write_new_java_config "$PATH_OF_ENV_FILE" "$PATH_OF_JAVA_DIR"

    # Ask the user to reboot session to apply environment variable modification
    ask_user_to_reboot_to_apply_changes            
}

# Call main function
main