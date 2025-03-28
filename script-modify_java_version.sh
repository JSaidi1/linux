#!/bin/bash

#----------------------------------------------------------------------------------------------------------
# Script Name: script-modify_java_version.sh
# Description: This script automates the process of [insert task here].
# Author: Jabrane SAIDI
# Date: 2025-03-25
# Dependencies: No dependencies
#----------------------------------------------------------------------------------------------------------
#set -x

## Define variables
PATH_OF_ENV_FILE=~/.bashrc
NAME_OF_ENV_FILE="the environment variables file"

## Function to check if a directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo -e "\n-Error: Directory '$1' does not exists."
        exit 1
    fi
}

## Function to check if a file exists ($1 name of env. file - $2 path to path)
check_file() {
    if [ ! -f "$2" ]; then
        echo -e "\n-Error: File ($1 '$2') does not exist."
        exit 1
    fi
}

## Check if a java folder contains a 'bin/java' executable:
check_java_executable() {
    if [ -f "$1/bin/java" ]; then
        # Run 'java -version' from the folder's bin directory to get the Java version:
        local version_output=$("$1/bin/java" -version 2>&1)
  
        if [[ "$version_output" == *"version"* ]]; then
            echo -e "\n-This folder contains a valid Java version:"
            echo "$version_output"
            # Processing continu...
        else
            echo -e "\n-Error: This folder does not seem to contain a valid Java installation."
            exit 1
        fi
    else
        echo -e "\n-Error: No Java executable found in this folder."
        exit 1
    fi
}

## Function to tell user that Java variable will be defined in the env. file (PATH_OF_ENV_FILE) and ask for confirmation
ask_user_to_validate_env_file(){
    while true; do
        read -p $'\n-Java variable will be defined in the environment file '$1'. Do you want to continue? (yes/no): ' user_response
        
        user_response="${user_response,,}"

        if [[ "$user_response" == "yes" ]]; then # Continu processing ...
            break
        elif [[ "$user_response" == "no" ]]; then
            echo -e "\n-Your choice is 'no'. Bye, see you!"
            echo "N.B: If you want to define an other environment file than '$1', you can define it in 'PATH_OF_ENV_FILE' variable."
            exit 0
        else
            echo "-Please answer with 'yes' or 'no'."
        fi

    done
}

# Main function 
main() {
    
    # Prompt the user to set the path of java folder
    read -p $'\n-Enter the path of java directory: ' PATH_OF_JAVA_DIR

    # Check if the directory exists
    check_directory "$PATH_OF_JAVA_DIR"

    # Check if the folder is a valid java version folder
    check_java_executable "$PATH_OF_JAVA_DIR"
    
    # Check if the env. file exists
    check_file "$NAME_OF_ENV_FILE" "$PATH_OF_ENV_FILE"
    
    # Tell user that Java variable will be defined in the env. file (PATH_OF_ENV_FILE) and ask for confirmation
    ask_user_to_validate_env_file "$PATH_OF_ENV_FILE"
}

# Call main function
main