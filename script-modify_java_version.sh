
#!/bin/bash

#-----------------------------
# Date: 22-03-2025
# Realized by: Jabrane SAIDI
# Bash version: 5.2.21
#-----------------------------

#-----------------------------
# Environment Preparation:
# For the script to work, you must:
# -Have the jdk/jre folders with their real names that reflect the real Java version
# -These directories must be in the same folder. For example, in the .../java folder:
#       .../java/jdk1.8.0_441 
#       .../java/jdk-17.0.14
#       ...
#-----------------------------

#set -x

java_versions_dir="/opt/java/" # /!\: must always be absolute and have / at the end
start_string_to_extract_java_version=$java_versions_dir
end_string_to_extract_java_version="/bin/java" # /!\: must always Not have / at the end
choice_word_to_exit="Exit"
current_java_version=`java -version 2>&1 | grep 'version' | cut -d '"' -f 2` # before modifying it
java_home_file="/etc/environment"
declare -A choice_nbr_of_java_version_array # choice_nbr_of_java_version_array[choice_nbr_of_java_version]

#== verify if java_versions_dir exists and it's not empty ==#
if [ -d "$java_versions_dir" ] && [ "$(ls -A $java_versions_dir)" ]; then
    #echo "Directory exists and is not empty."

    ## List all java versions 
    output=($(sudo update-alternatives --display java | grep priority))

    #== Display the menu for the user:
    echo -e "Please select a version of java (java/jdk/ire) to activate by entering the corresponding number:\n"

    choice_nbr_of_java_version=1

    # Print all elements of the array
    for item in "${output[@]}"
    do
        if [[ "$item" == *"bin/java"* ]]; then
             
            java_version=$(echo "$item" | grep -oP "(?<=${start_string_to_extract_java_version})(.*?)(?=${end_string_to_extract_java_version})")
            #java_versions_array[$java_version]="$item"           

            if [[ "$java_version" == *"$current_java_version"* ]]; then
                #echo "String '$current_java_version' is present in '$java_version'"
                echo "$choice_nbr_of_java_version: $java_version (* current version)"
            else
                #echo "String '$current_java_version' is not present in '$java_version'"
                echo "$choice_nbr_of_java_version: $java_version"
            fi

            choice_nbr_of_java_version_array[$choice_nbr_of_java_version]=$java_version
            
            choice_nbr_of_java_version=$((choice_nbr_of_java_version + 1))           

 	    fi
    done   

    ##== Add Exit to the list as last choice: 
    echo "$choice_nbr_of_java_version: $choice_word_to_exit"

    ##== Add x: Exit to choice_nbr_of_java_version_array:
    choice_nbr_of_java_version_array[$choice_nbr_of_java_version]=$choice_word_to_exit

    ##==test choice_nbr_of_java_version_array:
    ## Loop through the associative array and print key-value pairs
    #echo "============ Test array:"
    #for key in "${!choice_nbr_of_java_version_array[@]}"; do
    #    echo "$key: ${choice_nbr_of_java_version_array[$key]}"
    #done

    while true; do
        ##== Prompt for user input:
        echo -e "\n"
        read -p "Enter your choice number from the list: " user_choice

        ##== Process the user's choice:
        ## Check if the choice exists as key in choice_nbr_of_java_version_array:
        if [[ -v choice_nbr_of_java_version_array["$user_choice"] ]]; then
            #echo "$choice is a key in the array."
            echo "You chose '$user_choice: ${choice_nbr_of_java_version_array[$user_choice]}'"

            ##== Case of Exit choice:
            if [[ "${choice_nbr_of_java_version_array[$user_choice]}" == "$choice_word_to_exit" ]]; then
                echo "Bye!"
                break;
            ##== Case of java version already installed:
            elif [[ "${choice_nbr_of_java_version_array[$user_choice]}" == *"$current_java_version"* ]]; then
                echo -e "\n- Already installed (it is the current java version)!"
                break;
            else
                #echo "Continu processing..."
                ##== Switch the system to the new java version:
                sudo update-alternatives --set java "$java_versions_dir${choice_nbr_of_java_version_array[$user_choice]}/bin/java"

                ##== Check the new version of java:
                new_java_version=`java -version 2>&1 | grep 'version' | cut -d '"' -f 2`

                ##== Msg to user to confirm that java version was changed:
                echo -e "\n- Old java version($current_java_version) => New java version($new_java_version)\n"

                ##== Set $JAVA_HOME on the file java_home_file:
                    ## Backup /etc/environment file
                    sudo cp $java_home_file "$java_home_file.bak"
                    
                    ## Delete lines which containes JAVA_HOME:
                sudo sed -i '/JAVA_HOME/d' $java_home_file
                    
                    ## Add on the end of the file $JAVA_HOME:
                echo "JAVA_HOME=\"$java_versions_dir${choice_nbr_of_java_version_array[$user_choice]}\"" | sudo tee -a $java_home_file > /dev/null
                    
                    ## Update $java_home_file:
                echo -e "- The line 'JAVA_HOME=$java_versions_dir${choice_nbr_of_java_version_array[$user_choice]}' was added to the end of the file '$java_home_file'.\n"
                    
                    ## Ask user to restart session to apply environment variable modification:
                read -p "- To apply environment variable changes (JAVA_HOME), the machine must restart. Do you want to restart it? (y/n): " user_answer
                    
                if [[ "$user_answer" == "y" || "$user_answer" == "Y" ]]; then
                    #reboot
                    systemctl reboot -i
                else
                    echo -e "\n/!\ Warning: JAVA_HOME variable can't take its new value until you restart the machine!"
                fi

                break;
            fi

            
        else
            echo "'$user_choice' is not a number in the list. Please try again: "
        fi

    done #while

    
else
    echo "Error: directory '$java_versions_dir' does not exist or is empty. Please set the right path to the variable 'java_versions_dir'."
fi
