#!/bin/bash

# Display the menu
menu() {
    echo "========================"
    echo "   System Task Menu"
    echo "========================"
    echo "1. Disk Space"
    echo "2. System Uptime"
    echo "3. List Users"
    echo "4. Exit"
    echo "========================"
}

# Check disk space
check_disk_space() {
    echo "Disk space usage:"
    df -h
}

# Show system uptime
show_uptime() {
    echo "System uptime:"
    uptime
}

# List logged-in users
list_users() {
    echo "Logged-in users:"
    who
}

# Main loop to display menu and handle user input
while true; do
    menu
    read -p "Select an option (1-4): " option
    case $option in
        1) check_disk_space ;;
        2) show_uptime ;;
        3) list_users ;;
        4) echo "Exiting..."; break ;;
        *) echo "Invalid option, please try again." ;;
    esac
    echo ""  # Add a blank line for readability
done
