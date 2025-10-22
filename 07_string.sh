#!/bin/bash

# Initial string
my_string="Nand-Kishore-here"

# Function to display string info
show_string_info() {
  echo "======================================"
  echo "🔤 Current string: $my_string"
  echo "======================================"
  echo "📏 Length: ${#my_string}"
  echo "🪶 First 5 chars: ${my_string:0:5}"
  echo "✂️  From 7th char: ${my_string:6}"
  echo "🔁 Replace first '-': ${my_string/-/ }"
  echo "🔁 Replace all '-': ${my_string//-/ }"
  echo "🔁 Replace all 'replaced value': ${my_string//-/Nand }"
  echo "🔁 Replace all 'kishore to kumar': ${my_string/Kishore/Kumar}"


  echo "🔡 Lowercase: ${my_string,,}"
  echo "🔠 Uppercase: ${my_string^^}"
  echo "🧩 Title Case: ${my_string^}"
  echo "======================================"
}

# Function to update the string
update_string() {
  read -p "Enter new string: " new_value
  if [[ -n "$new_value" ]]; then
    my_string="$new_value"
    echo "✅ String updated successfully!"
  else
    echo "⚠️ No input provided. String not updated."
  fi
}

# Function to convert to uppercase
to_upper() {
  my_string="${my_string^^}"
  echo "🔠 Converted to UPPERCASE: $my_string"
}

# Function to convert to lowercase
to_lower() {
  my_string="${my_string,,}"
  echo "🔡 Converted to lowercase: $my_string"
}

# Function to capitalize first letter
to_title() {
  my_string="${my_string^}"
  echo "🧩 Converted to Title Case: $my_string"
}

# Main menu loop
while true; do
  echo
  echo "======================================"
  echo "1️⃣  Show string info"
  echo "2️⃣  Update string"
  echo "3️⃣  Convert to UPPERCASE"
  echo "4️⃣  Convert to lowercase"
  echo "5️⃣  Convert to Title Case (first letter uppercase)"
  echo "6️⃣  Exit"
  echo "======================================"
  read -p "Choose an option [1-6]: " choice
  echo

  case $choice in
    1) show_string_info ;;
    2) update_string ;;
    3) to_upper ;;
    4) to_lower ;;
    5) to_title ;;
    6) echo "👋 Exiting..."; break ;;
    *) echo "❌ Invalid option. Please choose again." ;;
  esac
done
