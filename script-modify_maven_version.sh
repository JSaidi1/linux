
#!/bin/bash

#-----------------------------
# Date: 22-03-2025
# Realized by: Jabrane SAIDI
# Bash version: 5.2.21
#-----------------------------

#-----------------------------
# Environment Preparation:
# For the script to work, you must:
# -Have the maven folders with their real names that reflect the real maven version
# -These directories must be in the same folder. For example, in the .../maven folder:
#       .../maven/maven-3.9.9 
#       .../maven/maven-3.8.8
#       ...
#-----------------------------

#set -x

maven_versions_dir="/opt/maven/" # /!\: must always be absolute and have / at the end
start_string_to_extract_maven_version=$maven_versions_dir
end_string_to_extract_maven_version="/bin/mvn" # /!\: must always Not have / at the end
choice_word_to_exit="Exit"
current_maven_version=$(mvn -v | head -n 1 | awk '{print $3}') # before modifying it
maven_home_file="/etc/environment"
declare -A choice_nbr_of_maven_version_array # choice_nbr_of_maven_version_array[choice_nbr_of_maven_version]

#== verify if maven_versions_dir exists and it's not empty ==#
if [ -d "$maven_versions_dir" ] && [ "$(ls -A $maven_versions_dir)" ]; then
    #echo "Directory exists and is not empty."
    
    ## List all maven versions 
    output=($(sudo update-alternatives --display mvn | grep priority))
    
    #== Display the menu for the user:
    echo -e "Please select a version of maven to activate by entering the corresponding number:\n"

    choice_nbr_of_maven_version=1

    # Print all elements of the array
    for item in "${output[@]}"
    do
        if [[ "$item" == *"bin/mvn"* ]]; then
             
            maven_version=$(echo "$item" | grep -oP "(?<=${start_string_to_extract_maven_version})(.*?)(?=${end_string_to_extract_maven_version})")
            #maven_versions_array[$maven_version]="$item"           

            if [[ "$maven_version" == *"$current_maven_version"* ]]; then
                #echo "String '$current_maven_version' is present in '$maven_version'"
                echo "$choice_nbr_of_maven_version: $maven_version (* current version)"
            else
                #echo "String '$current_maven_version' is not present in '$maven_version'"
                echo "$choice_nbr_of_maven_version: $maven_version"
            fi
            
            choice_nbr_of_maven_version_array[$choice_nbr_of_maven_version]=$maven_version
            
            choice_nbr_of_maven_version=$((choice_nbr_of_maven_version + 1))           

 	    fi
    done   
    
    ##== Add Exit to the list as last choice: 
    echo "$choice_nbr_of_maven_version: $choice_word_to_exit"

    ##== Add x: Exit to choice_nbr_of_maven_version_array:
    choice_nbr_of_maven_version_array[$choice_nbr_of_maven_version]=$choice_word_to_exit

    ##==test choice_nbr_of_maven_version_array:
    ## Loop through the associative array and print key-value pairs
    #echo "============ Test array:"
    #for key in "${!choice_nbr_of_maven_version_array[@]}"; do
    #    echo "$key: ${choice_nbr_of_maven_version_array[$key]}"
    #done

    while true; do
        ##== Prompt for user input:
        echo -e "\n"
        read -p "Enter your choice number from the list: " user_choice

        ##== Process the user's choice:
        ## Check if the choice exists as key in choice_nbr_of_maven_version_array:
        if [[ -v choice_nbr_of_maven_version_array["$user_choice"] ]]; then
            #echo "$choice is a key in the array."
            echo "You chose '$user_choice: ${choice_nbr_of_maven_version_array[$user_choice]}'"

            ##== Case of Exit choice:
            if [[ "${choice_nbr_of_maven_version_array[$user_choice]}" == "$choice_word_to_exit" ]]; then
                echo "Bye!"
                break;
            ##== Case of maven version already installed:
            elif [[ "${choice_nbr_of_maven_version_array[$user_choice]}" == *"$current_maven_version"* ]]; then
                echo -e "\n- Already installed (it is the current maven version)!"
                break;
            else
                #echo "Continu processing..."
                ##== Switch the system to the new maven version:
                sudo update-alternatives --set mvn "$maven_versions_dir${choice_nbr_of_maven_version_array[$user_choice]}/bin/mvn"

                ##== Check the new version of maven:
                new_maven_version=`mvn -v | head -n 1 | awk '{print $3}'`

                ##== Msg to user to confirm that maven version was changed:
                echo -e "\n- Old maven version($current_maven_version) => New maven version($new_maven_version)\n"

                ##== Set $maven_HOME on the file maven_home_file:
                    ## Backup /etc/environment file
                    sudo cp $maven_home_file "$maven_home_file.bak"
                    
                    ## Delete lines which containes maven_HOME:
                sudo sed -i '/MAVEN_HOME/d' $maven_home_file
                    
                    ## Add on the end of the file $maven_HOME:
                echo "MAVEN_HOME=\"$maven_versions_dir${choice_nbr_of_maven_version_array[$user_choice]}\"" | sudo tee -a $maven_home_file > /dev/null
                    
                    ## Update $maven_home_file:
                echo -e "- The line 'MAVEN_HOME=$maven_versions_dir${choice_nbr_of_maven_version_array[$user_choice]}' was added to the end of the file '$maven_home_file'.\n"
                    
                    ## Ask user to restart session to apply environment variable modification:
                read -p "- To apply environment variable changes (MAVEN_HOME), the machine must restart. Do you want to restart it? (y/n): " user_answer
                    
                if [[ "$user_answer" == "y" || "$user_answer" == "Y" ]]; then
                    ## Restart system:
                    systemctl reboot -i
                else
                    echo -e "\n/!\ Warning: MAVEN_HOME variable can't take its new value until you restart the machine!"
                fi

                break;
            fi

            
        else
            echo "'$user_choice' is not a number in the list. Please try again: "
        fi

    done #while

    
else
    echo "Error: directory '$maven_versions_dir' does not exist or is empty. Please set the right path to the variable 'maven_versions_dir'."
fi
