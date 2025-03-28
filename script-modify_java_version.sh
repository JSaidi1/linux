#!/bin/bash

#----------------------------------------------------------------------------------------------------------
# Script Name: script-modify_java_version.sh
# Description: This script automates the process of [insert task here].
# Author: Jabrane SAIDI
# Date: 2025-03-25
# Dependencies: No dependencies
#----------------------------------------------------------------------------------------------------------
#set -x

## Function to check if a directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo -e "\n-Error: Directory '$1' does not exists."
        exit 1
    fi
}

## Function to check if a file exists
check_file() {
    if [ ! -f "$1" ]; then
        echo -e "\n-Error: File does not exist."
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

# Main function 
main() {
    
    # Prompt the user to set the path of java folder
    read -p "Enter the path of java directory: " PATH_JAVA_DIR

    # Check if the directory exists
    check_directory "$PATH_JAVA_DIR"

    # Check if the folder is a valid java version folder
    check_java_executable "$PATH_JAVA_DIR"

    # Prompt the user to set the path of the environment variables file (e.g. .bashrc file)
    #read -p $'\nEnter the path of environment variables file: ' PATH_VAR_ENV_FILE
    read -p $'\nChoose in which environment file you want to add java: ' PATH_VAR_ENV_FILE
    #
    # Check if the file exists
    check_file "$PATH_VAR_ENV_FILE"
    
}

# Call main function
main