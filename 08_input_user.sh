#!/bin/bash
<<COMMENT
read -p "Please enter your name: " user_name
read -sp "Please enter your password: " user_password
echo "Hello, $user_name! Welcome to the Bash scripting world.and your password is $user_password"  
COMMENT

#!/bin/bash

# ==========================================
# 🚀 Interactive Bash Script with Utilities
# ==========================================

# Function: Check if input is empty
check_empty_input() {
  if [[ -z "$1" ]]; then
    echo "❌ Error: Input cannot be empty!"
    exit 1
  fi
}

# Function: Display a decorative line
divider() {
  echo "------------------------------------------"
}

# 🧩 Get user name
read -p "👤 Please enter your name: " user_name
check_empty_input "$user_name"

# 🔒 Get password (hidden input)
read -sp "🔑 Please enter your password: " user_password
echo ""  # new line for formatting
check_empty_input "$user_password"

# 💬 Greeting
divider
echo "👋 Hello, $user_name! Welcome to the Bash scripting world!"
divider

# 🕒 Show current system time
echo "🕒 Current date and time: $(date)"
divider

# 💻 System Info
echo "💻 System Information:"
echo "  - User: $USER"
echo "  - Hostname: $(hostname)"
echo "  - OS: $(uname -o)"
echo "  - Kernel: $(uname -r)"
divider

# 📁 Show current working directory
echo "📂 You are currently in: $(pwd)"
divider

# 🧮 Count files and directories
echo "📊 Directory Statistics:"
echo "  - Files: $(find . -maxdepth 1 -type f | wc -l)"
echo "  - Folders: $(find . -maxdepth 1 -type d | wc -l)"
divider

# 🔐 Ask if user wants to save credentials
read -p "💾 Do you want to save your credentials locally? (y/n): " save_choice

if [[ "$save_choice" == "y" || "$save_choice" == "Y" ]]; then
  cred_file="credentials_$(date +%Y%m%d_%H%M%S).txt"
  echo "Username: $user_name" > "$cred_file"
  echo "Password: $user_password" >> "$cred_file"
  chmod 600 "$cred_file"  # secure file permissions
  echo "✅ Credentials saved securely in: $cred_file"
else
  echo "⚠️ Credentials not saved."
fi
divider

# 🎯 Bonus: Simple menu
echo "📋 Choose an action:"
echo "1. Show disk usage"
echo "2. Show memory usage"
echo "3. Show running processes"
echo "4. Exit"

read -p "Enter your choice (1-4): " choice
divider

case $choice in
  1)
    echo "💽 Disk Usage:"
    df -h
    ;;
  2)
    echo "🧠 Memory Usage:"
    free -h
    ;;
  3)
    echo "⚙️ Running Processes:"
    ps aux --sort=-%mem | head -10
    ;;
  4)
    echo "👋 Goodbye, $user_name!"
    ;;
  *)
    echo "❌ Invalid choice! Please run the script again."
    ;;
esac

divider
echo "✅ Script execution completed successfully!"
