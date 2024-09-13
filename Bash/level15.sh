#!/bin/bash

# Function to check disk space
check_disk_space() {
    echo "Disk space usage:"
    df -h
}

# Function to show system uptime
show_uptime() {
    echo "System uptime:"
    uptime
}

# Function to backup the Arena directory and keep the last 3 backups
backup_arena() {
    backup_dir="Arena_Backups"
    arena_dir="Arena"
    
    # Create backup directory if it doesn't exist
    mkdir -p "$backup_dir"

    # Generate a timestamped backup
    timestamp=$(date +"%Y%m%d%H%M%S")
    backup_name="arena_backup_$timestamp.tar.gz"
    tar -czf "$backup_dir/$backup_name" -C "$arena_dir" .

    # Keep only the last 3 backups
    cd "$backup_dir" || exit
    backups_count=$(ls -1t arena_backup_*.tar.gz | wc -l)
    
    if [ "$backups_count" -gt 3 ]; then
        echo "Removing old backups..."
        ls -1t arena_backup_*.tar.gz | tail -n +4 | xargs rm -f
    fi
    
    echo "Backup completed: $backup_name"
    cd - >/dev/null
}

# Function to parse a configuration file and display key-value pairs
parse_config() {
    config_file="settings.conf"

    # Check if the config file exists
    if [ ! -f "$config_file" ]; then
        echo "Error: Configuration file 'settings.conf' not found!"
        return
    fi

    echo "Parsing configuration file:"
    while IFS='=' read -r key value; do
        if [ -n "$key" ] && [ -n "$value" ]; then
            echo "Key: $key, Value: $value"
        fi
    done < "$config_file"
}

# Function to display the menu
menu() {
    echo "============================"
    echo "    Advanced Task Menu"
    echo "============================"
    echo "1. Check Disk Space"
    echo "2. Show System Uptime"
    echo "3. Backup the Arena Directory"
    echo "4. Parse settings.conf"
    echo "5. Exit"
}

# Main loop to display the menu and handle user input
while true; do
    menu
    read -p "Select an option (1-5): " option
    echo "============================"
    
    case $option in
        1)
            check_disk_space
            ;;
        2)
            show_uptime
            ;;
        3)
            backup_arena
            ;;
        4)
            parse_config
            ;;
        5)
            echo "Exiting..."; break ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac
    echo ""  # Add a blank line for readability
done
