# Bash Conditional Expressions - Complete Guide

A comprehensive reference for all conditional test features in bash scripting.

## Table of Contents
- [File Tests](#file-tests)
- [String Tests](#string-tests)
- [Integer Comparisons](#integer-comparisons)
- [Logical Operators](#logical-operators)
- [Pattern Matching](#pattern-matching)
- [Special Variables and Tests](#special-variables-and-tests)
- [Advanced Conditional Constructs](#advanced-conditional-constructs)
- [Conditional Expressions in Different Contexts](#conditional-expressions-in-different-contexts)

---

## File Tests

### File Existence and Type

**`-e file`** - Check if file exists
```bash
if [[ -e "myfile.txt" ]]; then
    echo "File exists"
fi
```

**`-a file`** - Check if file exists (deprecated, use -e)
```bash
if [[ -a "myfile.txt" ]]; then
    echo "File exists"
fi
```

**`-f file`** - Check if file is a regular file
```bash
if [[ -f "document.pdf" ]]; then
    echo "This is a regular file"
fi
```

**`-d directory`** - Check if directory exists
```bash
if [[ -d "/var/log" ]]; then
    echo "Directory exists"
fi
```

**`-L file`** - Check if file is a symbolic link
```bash
if [[ -L "mylink" ]]; then
    echo "This is a symbolic link"
fi
```

**`-h file`** - Check if file is a symbolic link (same as -L)
```bash
if [[ -h "shortcut" ]]; then
    echo "This is a symbolic link"
fi
```

**`-b file`** - Check if file is a block device
```bash
if [[ -b "/dev/sda1" ]]; then
    echo "This is a block device"
fi
```

**`-c file`** - Check if file is a character device
```bash
if [[ -c "/dev/tty" ]]; then
    echo "This is a character device"
fi
```

**`-p file`** - Check if file is a named pipe (FIFO)
```bash
if [[ -p "mypipe" ]]; then
    echo "This is a named pipe"
fi
```

**`-S file`** - Check if file is a socket
```bash
if [[ -S "/var/run/docker.sock" ]]; then
    echo "This is a socket"
fi
```

**`-t fd`** - Check if file descriptor is open and refers to a terminal
```bash
if [[ -t 0 ]]; then
    echo "stdin is a terminal"
fi

if [[ -t 1 ]]; then
    echo "stdout is a terminal"
fi
```

### File Permissions

**`-r file`** - Check if file is readable
```bash
if [[ -r "config.ini" ]]; then
    echo "File is readable"
fi
```

**`-w file`** - Check if file is writable
```bash
if [[ -w "logfile.txt" ]]; then
    echo "File is writable"
fi
```

**`-x file`** - Check if file is executable
```bash
if [[ -x "script.sh" ]]; then
    echo "File is executable"
fi
```

**`-u file`** - Check if file has setuid bit set
```bash
if [[ -u "/usr/bin/passwd" ]]; then
    echo "File has setuid bit"
fi
```

**`-g file`** - Check if file has setgid bit set
```bash
if [[ -g "shared_dir" ]]; then
    echo "File has setgid bit"
fi
```

**`-k file`** - Check if file has sticky bit set
```bash
if [[ -k "/tmp" ]]; then
    echo "Directory has sticky bit"
fi
```

### File Properties

**`-s file`** - Check if file exists and is not empty
```bash
if [[ -s "data.txt" ]]; then
    echo "File exists and has content"
fi
```

**`-O file`** - Check if you own the file
```bash
if [[ -O "myfile.txt" ]]; then
    echo "You own this file"
fi
```

**`-G file`** - Check if file's group matches your group
```bash
if [[ -G "shared.txt" ]]; then
    echo "File belongs to your group"
fi
```

**`-N file`** - Check if file was modified since last read
```bash
if [[ -N "config.conf" ]]; then
    echo "File was modified since last read"
fi
```

### File Comparisons

**`file1 -nt file2`** - Check if file1 is newer than file2
```bash
if [[ "new.txt" -nt "old.txt" ]]; then
    echo "new.txt is newer"
fi
```

**`file1 -ot file2`** - Check if file1 is older than file2
```bash
if [[ "backup.tar" -ot "current.tar" ]]; then
    echo "backup.tar is older"
fi
```

**`file1 -ef file2`** - Check if files refer to same device and inode
```bash
if [[ "file1.txt" -ef "file2.txt" ]]; then
    echo "These are the same file (hard links)"
fi
```

---

## String Tests

### String Length

**`-z string`** - Check if string is empty (zero length)
```bash
name=""
if [[ -z "$name" ]]; then
    echo "String is empty"
fi
```

**`-n string`** - Check if string is not empty
```bash
name="John"
if [[ -n "$name" ]]; then
    echo "String is not empty"
fi
```

**Check without operator**
```bash
# Non-empty string is true
if [[ "$name" ]]; then
    echo "String is not empty"
fi
```

### String Equality

**`string1 = string2`** - Check if strings are equal
```bash
if [[ "$USER" = "root" ]]; then
    echo "Running as root"
fi
```

**`string1 == string2`** - Check if strings are equal (same as =)
```bash
lang="bash"
if [[ "$lang" == "bash" ]]; then
    echo "Using bash"
fi
```

**`string1 != string2`** - Check if strings are not equal
```bash
if [[ "$status" != "error" ]]; then
    echo "No error"
fi
```

### Lexicographic Comparison

**`string1 < string2`** - Check if string1 sorts before string2
```bash
if [[ "apple" < "banana" ]]; then
    echo "apple comes before banana"
fi
```

**`string1 > string2`** - Check if string1 sorts after string2
```bash
if [[ "zebra" > "apple" ]]; then
    echo "zebra comes after apple"
fi
```

### Case-Insensitive Comparison

```bash
# Using shopt to enable case-insensitive matching
shopt -s nocasematch
if [[ "Hello" == "hello" ]]; then
    echo "Matches (case-insensitive)"
fi
shopt -u nocasematch
```

```bash
# Convert to lowercase for comparison
string="HELLO"
if [[ "${string,,}" == "hello" ]]; then
    echo "Matches after conversion"
fi
```

---

## Integer Comparisons

**`int1 -eq int2`** - Equal to
```bash
count=10
if [[ $count -eq 10 ]]; then
    echo "Count is 10"
fi
```

**`int1 -ne int2`** - Not equal to
```bash
age=25
if [[ $age -ne 30 ]]; then
    echo "Age is not 30"
fi
```

**`int1 -lt int2`** - Less than
```bash
score=75
if [[ $score -lt 100 ]]; then
    echo "Score is less than 100"
fi
```

**`int1 -le int2`** - Less than or equal to
```bash
limit=50
if [[ $limit -le 50 ]]; then
    echo "Within limit"
fi
```

**`int1 -gt int2`** - Greater than
```bash
temperature=30
if [[ $temperature -gt 25 ]]; then
    echo "It's hot!"
fi
```

**`int1 -ge int2`** - Greater than or equal to
```bash
marks=90
if [[ $marks -ge 90 ]]; then
    echo "Grade A"
fi
```

### Arithmetic Comparison (Alternative)
```bash
# Using (( )) for arithmetic - supports C-style operators
num=15
if (( num > 10 && num < 20 )); then
    echo "Number is between 10 and 20"
fi

# All C operators work
if (( num == 15 )); then echo "Equal"; fi
if (( num != 20 )); then echo "Not equal"; fi
if (( num >= 15 )); then echo "Greater or equal"; fi
if (( num <= 15 )); then echo "Less or equal"; fi

# Increment/decrement
if (( ++num > 15 )); then echo "After increment: $num"; fi
```

### Bitwise Operations
```bash
# In (( )) context
a=5  # binary: 101
b=3  # binary: 011

if (( (a & b) == 1 )); then
    echo "Bitwise AND: $((a & b))"
fi

if (( (a | b) == 7 )); then
    echo "Bitwise OR: $((a | b))"
fi

if (( (a ^ b) == 6 )); then
    echo "Bitwise XOR: $((a ^ b))"
fi
```

---

## Logical Operators

### NOT Operator

**`! expression`** - Logical NOT
```bash
if [[ ! -f "missing.txt" ]]; then
    echo "File does not exist"
fi
```

### AND Operator

**`expr1 -a expr2`** - Logical AND (in single brackets)
```bash
if [ -f "file.txt" -a -r "file.txt" ]; then
    echo "File exists and is readable"
fi
```

**`expr1 && expr2`** - Logical AND (in double brackets)
```bash
if [[ -f "file.txt" && -r "file.txt" ]]; then
    echo "File exists and is readable"
fi
```

### OR Operator

**`expr1 -o expr2`** - Logical OR (in single brackets)
```bash
if [ -f "config.yml" -o -f "config.yaml" ]; then
    echo "Config file found"
fi
```

**`expr1 || expr2`** - Logical OR (in double brackets)
```bash
if [[ -f "config.yml" || -f "config.yaml" ]]; then
    echo "Config file found"
fi
```

### Complex Conditions
```bash
# Multiple conditions
age=25
name="Alice"

if [[ $age -ge 18 && -n "$name" ]]; then
    echo "Valid adult with name"
fi

# Grouping with parentheses
if [[ ( $age -lt 13 || $age -gt 65 ) && "$status" == "active" ]]; then
    echo "Eligible for discount"
fi
```

### Short-Circuit Evaluation
```bash
# && stops if first condition fails
[[ -f "file.txt" ]] && cat "file.txt"

# || executes second command if first fails
[[ -f "file.txt" ]] || echo "File not found"

# Chaining
[[ -f "file.txt" ]] && echo "File exists" || echo "File missing"
```

---

## Pattern Matching

> **Note:** Pattern matching features only work with `[[ ]]` (double brackets)

### Wildcard Matching

**`string == pattern`** - Match with wildcards
```bash
filename="document.pdf"
if [[ "$filename" == *.pdf ]]; then
    echo "This is a PDF file"
fi
```

**`string != pattern`** - Does not match pattern
```bash
filename="image.jpg"
if [[ "$filename" != *.txt ]]; then
    echo "Not a text file"
fi
```

### Glob Patterns
```bash
# Match multiple characters
file="script.sh"
if [[ "$file" == *.sh ]]; then
    echo "Shell script"
fi

# Match single character
code="A1"
if [[ "$code" == [A-Z][0-9] ]]; then
    echo "Valid code format"
fi

# Match character ranges
if [[ "$code" == [A-Za-z]* ]]; then
    echo "Starts with letter"
fi

# Negate character class
if [[ "$code" == [!0-9]* ]]; then
    echo "Does not start with digit"
fi

# Extended glob (enable with: shopt -s extglob)
shopt -s extglob
extension="${file##*.}"

# Match zero or one
if [[ "$file" == ?(.)config ]]; then
    echo "Matches config or .config"
fi

# Match zero or more
if [[ "$file" == *(.)config ]]; then
    echo "Matches config, .config, ..config, etc."
fi

# Match one or more
if [[ "$file" == +(.)config ]]; then
    echo "Matches .config, ..config, but not config"
fi

# Match exactly one
if [[ "$extension" == @(jpg|png|gif) ]]; then
    echo "Image file"
fi

# Match anything except
if [[ "$extension" == !(txt|log) ]]; then
    echo "Not a text or log file"
fi
```

### Regular Expression Matching

**`string =~ regex`** - Match regular expression
```bash
email="user@example.com"
if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    echo "Valid email format"
fi
```

```bash
# IP address validation
ip="192.168.1.1"
if [[ "$ip" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    echo "Valid IP format"
fi
```

```bash
# Phone number validation
phone="123-456-7890"
if [[ "$phone" =~ ^[0-9]{3}-[0-9]{3}-[0-9]{4}$ ]]; then
    echo "Valid phone format"
fi
```

```bash
# Extract matched groups
text="Error: Code 404"
if [[ "$text" =~ Code[[:space:]]([0-9]+) ]]; then
    error_code="${BASH_REMATCH[1]}"
    echo "Error code: $error_code"
    echo "Full match: ${BASH_REMATCH[0]}"
fi
```

```bash
# Multiple capture groups
date="2025-10-22"
if [[ "$date" =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2})$ ]]; then
    year="${BASH_REMATCH[1]}"
    month="${BASH_REMATCH[2]}"
    day="${BASH_REMATCH[3]}"
    echo "Year: $year, Month: $month, Day: $day"
fi
```

### POSIX Character Classes
```bash
# [[:alnum:]]  - Alphanumeric characters
# [[:alpha:]]  - Alphabetic characters
# [[:digit:]]  - Digits
# [[:lower:]]  - Lowercase letters
# [[:upper:]]  - Uppercase letters
# [[:space:]]  - Whitespace characters
# [[:punct:]]  - Punctuation characters

if [[ "$input" =~ ^[[:alpha:]]+$ ]]; then
    echo "Contains only letters"
fi

if [[ "$input" =~ ^[[:alnum:]]+$ ]]; then
    echo "Alphanumeric only"
fi
```

---

## Special Variables and Tests

### Exit Status

**`$?`** - Last command exit status
```bash
ls /nonexistent 2>/dev/null
if [[ $? -ne 0 ]]; then
    echo "Command failed"
fi
```

### Testing Command Success
```bash
# Direct command testing
if grep "pattern" file.txt; then
    echo "Pattern found"
fi

# With output suppression
if grep -q "pattern" file.txt; then
    echo "Pattern found (quiet mode)"
fi

# Command substitution with test
if [[ $(whoami) == "root" ]]; then
    echo "Running as root"
fi
```

### Process ID

**`$$`** - Current shell PID
```bash
if [[ -f "/tmp/script.$$.lock" ]]; then
    echo "Lock file exists for this process"
fi
```

**`$!`** - PID of last background process
```bash
sleep 10 &
echo "Background process PID: $!"
```

### Shell Options

**`-o option`** - Check if shell option is set
```bash
if [[ -o noclobber ]]; then
    echo "noclobber is enabled"
fi

if [[ -o xtrace ]]; then
    echo "Debug mode is on"
fi
```

**`-v varname`** - Check if variable is set
```bash
if [[ -v PATH ]]; then
    echo "PATH is set"
fi

if [[ -v UNDEFINED_VAR ]]; then
    echo "Variable is set"
else
    echo "Variable is not set"
fi
```

**`-R varname`** - Check if variable is a nameref
```bash
declare -n ref=original
if [[ -R ref ]]; then
    echo "ref is a nameref"
fi
```

### Array Tests

```bash
# Check if variable is an array
arr=(1 2 3)
if [[ "$(declare -p arr 2>/dev/null)" =~ "declare -a" ]]; then
    echo "arr is an indexed array"
fi

# Check if array is empty
if [[ ${#arr[@]} -eq 0 ]]; then
    echo "Array is empty"
fi

# Check if array index exists
if [[ -v arr[2] ]]; then
    echo "Index 2 exists in array"
fi
```

### Associative Arrays
```bash
declare -A assoc
assoc[key]="value"

# Check if key exists
if [[ -v assoc[key] ]]; then
    echo "Key exists"
fi

# Check if it's an associative array
if [[ "$(declare -p assoc)" =~ "declare -A" ]]; then
    echo "assoc is an associative array"
fi
```

---

## Advanced Conditional Constructs

### Case Statement
```bash
case "$variable" in
    pattern1)
        echo "Matches pattern1"
        ;;
    pattern2|pattern3)
        echo "Matches pattern2 or pattern3"
        ;;
    *.txt)
        echo "Text file"
        ;;
    [0-9]*)
        echo "Starts with digit"
        ;;
    *)
        echo "Default case"
        ;;
esac
```

### Case with Regex (bash 4+)
```bash
shopt -s extglob
case "$filename" in
    @(*.jpg|*.png|*.gif))
        echo "Image file"
        ;;
    !(*.txt))
        echo "Not a text file"
        ;;
esac
```

### Select Statement
```bash
select option in "Option 1" "Option 2" "Quit"; do
    case "$option" in
        "Option 1")
            echo "You chose option 1"
            ;;
        "Option 2")
            echo "You chose option 2"
            ;;
        "Quit")
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done
```

### Conditional Expression in Parameter Expansion

```bash
# Default value if unset
echo "${VAR:-default_value}"

# Default value and assign if unset
echo "${VAR:=default_value}"

# Error if unset
echo "${VAR:?Error message}"

# Alternative value if set
echo "${VAR:+alternative_value}"

# Substring conditional
filename="document.txt"
# Remove shortest match from end
echo "${filename%.txt}"  # document

# Remove longest match from end
echo "${filename%.*}"    # document

# Remove shortest match from beginning
path="/home/user/file.txt"
echo "${path#*/}"        # home/user/file.txt

# Remove longest match from beginning
echo "${path##*/}"       # file.txt
```

### Ternary-like Operations
```bash
# Using (( )) for arithmetic
result=$(( condition ? value_if_true : value_if_false ))
result=$(( x > 10 ? 100 : 50 ))

# Using variable substitution
result=${condition:+true_value}
result=${condition:-false_value}

# Inline if-else
[[ condition ]] && true_command || false_command
```

### Test Command Alternatives
```bash
# test command (old style)
if test -f "file.txt"; then
    echo "File exists"
fi

# Single bracket (POSIX)
if [ -f "file.txt" ]; then
    echo "File exists"
fi

# Double bracket (bash extended)
if [[ -f "file.txt" ]]; then
    echo "File exists"
fi

# Arithmetic evaluation
if (( 10 > 5 )); then
    echo "10 is greater than 5"
fi
```

---

## Conditional Expressions in Different Contexts

### In While Loops
```bash
# Loop while condition is true
count=0
while [[ $count -lt 5 ]]; do
    echo "Count: $count"
    ((count++))
done

# Loop while reading file
while IFS= read -r line; do
    [[ "$line" =~ ^# ]] && continue  # Skip comments
    echo "$line"
done < file.txt

# Infinite loop with break condition
while true; do
    read -p "Enter command (q to quit): " cmd
    [[ "$cmd" == "q" ]] && break
    echo "You entered: $cmd"
done
```

### In Until Loops
```bash
# Loop until condition is true
count=0
until [[ $count -ge 5 ]]; do
    echo "Count: $count"
    ((count++))
done
```

### In For Loops
```bash
# C-style for loop with conditions
for ((i=0; i<10; i++)); do
    [[ $i -eq 5 ]] && continue
    [[ $i -eq 8 ]] && break
    echo $i
done
```

### In Command Lists
```bash
# Execute if previous succeeds
command1 && command2 && command3

# Execute if previous fails
command1 || command2 || command3

# Mixed
command1 && command2 || command3

# With grouping
{ command1 && command2; } || command3
```

### In Function Returns
```bash
check_file() {
    [[ -f "$1" ]] && return 0 || return 1
}

if check_file "myfile.txt"; then
    echo "File exists"
fi
```

### Subshell Conditions
```bash
# Execute in subshell
if ( cd /tmp && ls file.txt ); then
    echo "File exists in /tmp"
fi
# Current directory unchanged

# Command grouping
if { command1 && command2; }; then
    echo "Both commands succeeded"
fi
```

---

## Practical Examples

### File Backup Script
```bash
#!/bin/bash

source_file="data.txt"
backup_file="data.txt.bak"

if [[ ! -f "$source_file" ]]; then
    echo "Error: Source file does not exist"
    exit 1
fi

if [[ -f "$backup_file" && "$source_file" -ot "$backup_file" ]]; then
    echo "Backup is already up to date"
    exit 0
fi

cp "$source_file" "$backup_file" && echo "Backup created successfully"
```

### User Input Validation
```bash
#!/bin/bash

read -p "Enter your age: " age

if [[ ! "$age" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number"
    exit 1
fi

if (( age < 0 || age > 150 )); then
    echo "Error: Invalid age range"
    exit 1
fi

if (( age >= 18 )); then
    echo "You are an adult"
else
    echo "You are a minor"
fi
```

### Directory Management
```bash
#!/bin/bash

target_dir="/var/myapp"

if [[ ! -d "$target_dir" ]]; then
    echo "Creating directory..."
    mkdir -p "$target_dir" || exit 1
fi

if [[ -w "$target_dir" ]]; then
    echo "Directory is writable"
    cd "$target_dir" || exit 1
else
    echo "Error: No write permission"
    exit 1
fi
```

### Configuration File Check
```bash
#!/bin/bash

config_files=("config.yml" "config.yaml" ".config")

config_found=false
for config in "${config_files[@]}"; do
    if [[ -f "$config" && -r "$config" ]]; then
        echo "Using config file: $config"
        config_found=true
        break
    fi
done

[[ "$config_found" == false ]] && {
    echo "Error: No readable config file found"
    exit 1
}
```

### Process Management
```bash
#!/bin/bash

process_name="myapp"
pidfile="/var/run/${process_name}.pid"

# Check if already running
if [[ -f "$pidfile" ]]; then
    pid=$(cat "$pidfile")
    if [[ -d "/proc/$pid" ]]; then
        echo "Process already running (PID: $pid)"
        exit 1
    else
        echo "Removing stale PID file"
        rm -f "$pidfile"
    fi
fi

# Start process
echo $$ > "$pidfile"
```

### Log File Rotation
```bash
#!/bin/bash

logfile="app.log"
max_size=$((10 * 1024 * 1024))  # 10MB

if [[ -f "$logfile" ]]; then
    size=$(stat -f%z "$logfile" 2>/dev/null || stat -c%s "$logfile")
    
    if (( size > max_size )); then
        timestamp=$(date +%Y%m%d_%H%M%S)
        mv "$logfile" "${logfile}.${timestamp}"
        gzip "${logfile}.${timestamp}" &
        touch "$logfile"
        echo "Log rotated at $(date)"
    fi
fi
```

### Environment Validation
```bash
#!/bin/bash

required_commands=("git" "docker" "npm")
missing=()

for cmd in "${required_commands[@]}"; do
    if ! command -v "$cmd" &>/dev/null; then
        missing+=("$cmd")
    fi
done

if [[ ${#missing[@]} -gt 0 ]]; then
    echo "Error: Missing required commands: ${missing[*]}"
    exit 1
fi

echo "All required commands are available"
```

### Network Connectivity Check
```bash
#!/bin/bash

hosts=("8.8.8.8" "1.1.1.1" "google.com")

for host in "${hosts[@]}"; do
    if ping -c 1 -W 2 "$host" &>/dev/null; then
        echo "✓ Connected to $host"
        exit 0
    fi
done

echo "✗ No network connectivity"
exit 1
```

### Disk Space Monitor
```bash
#!/bin/bash

threshold=90
partitions=("/" "/home" "/var")

for partition in "${partitions[@]}"; do
    if [[ -d "$partition" ]]; then
        usage=$(df -h "$partition" | awk 'NR==2 {print $5}' | tr -d '%')
        
        if (( usage >= threshold )); then
            echo "WARNING: $partition is ${usage}% full"
        fi
    fi
done
```

---

## Best Practices

1. **Always use `[[ ]]` instead of `[ ]`** for better features and safer variable handling
2. **Quote your variables** to prevent word splitting: `[[ "$var" == "value" ]]`
3. **Use `-z` and `-n`** for string length checks instead of comparing to empty string
4. **Use arithmetic operators** `(( ))` for complex math comparisons
5. **Check exit status** of commands directly instead of using `$?` when possible
6. **Use pattern matching** instead of external commands like `grep` when checking strings
7. **Combine conditions** efficiently with `&&` and `||` for better readability
8. **Enable extended globs** when needed: `shopt -s extglob`
9. **Use `command -v`** instead of `which` for portability
10. **Handle errors gracefully** with proper exit codes and messages
11. **Use functions** for repeated conditional logic
12. **Comment complex conditions** to explain the logic

---

## Quick Reference Table

| Test | Description | Example |
|------|-------------|---------|
| `-e` | File exists | `[[ -e file ]]` |
| `-f` | Regular file | `[[ -f file ]]` |
| `-d` | Directory | `[[ -d dir ]]` |
| `-L` | Symbolic link | `[[ -L link ]]` |
| `-r` | Readable | `[[ -r file ]]` |
| `-w` | Writable | `[[ -w file ]]` |
| `-x` | Executable | `[[ -x file ]]` |
| `-s` | Not empty | `[[ -s file ]]` |
| `-t` | File descriptor is terminal | `[[ -t 0 ]]` |
| `-O` | You own file | `[[ -O file ]]` |
| `-G` | File's group matches yours | `[[ -G file ]]` |
| `-N` | Modified since last read | `[[ -N file ]]` |
| `-nt` | Newer than | `[[ f1 -nt f2 ]]` |
| `-ot` | Older than | `[[ f1 -ot f2 ]]` |
| `-ef` | Same file | `[[ f1 -ef f2 ]]` |
| `-z` | String empty | `[[ -z "$str" ]]` |
| `-n` | String not empty | `[[ -n "$str" ]]` |
| `==` | String equal | `[[ "$a" == "$b" ]]` |
| `!=` | String not equal | `[[ "$a" != "$b" ]]` |
| `<` | String before (sort) | `[[ "$a" < "$b" ]]` |
| `>` | String after (sort) | `[[ "$a" > "$b" ]]` |
| `-eq` | Number equal | `[[ $a -eq $b ]]` |
| `-ne` | Number not equal | `[[ $a -ne $b ]]` |
| `-lt` | Less than | `[[ $a -lt $b ]]` |
| `-le` | Less or equal | `[[ $a -le $b ]]` |
| `-gt` | Greater than | `[[ $a -gt $b ]]` |
| `-ge` | Greater or equal | `[[ $a -ge $b ]]` |
| `=~` | Regex match | `[[ "$str" =~ pattern ]]` |
| `-v` | Variable is set | `[[ -v VAR ]]` |
| `-R` | Variable is nameref | `[[ -R ref ]]` |
| `-o` | Shell option set | `[[ -o noclobber ]]` |
| `!` | Logical NOT | `[[ ! -f file ]]` |
| `&&` | Logical AND | `[[ cond1 && cond2 ]]` |
| `||` | Logical OR | `[[ cond1 || cond2 ]]` |

---

## Common Pitfalls and Solutions

### Whitespace in Variables
```bash
# WRONG - will fail if $file contains spaces
if [[ $file == *.txt ]]; then
    echo "Text file"
fi

# CORRECT - always quote variables
if [[ "$file" == *.txt ]]; then
    echo "Text file"
fi
```

### Empty String Comparison
```bash
# WRONG - fails if variable is unset
if [ $var = "" ]; then
    echo "Empty"
fi

# CORRECT - use -z or -n
if [[ -z "$var" ]]; then
    echo "Empty"
fi
```

### Integer vs String Comparison
```bash
# WRONG - compares as strings
if [[ "10" > "9" ]]; then
    echo "Greater"  # This is FALSE! "10" < "9" lexicographically
fi

# CORRECT - use numeric comparison
if [[ 10 -gt 9 ]]; then
    echo "Greater"  # TRUE
fi

# OR use arithmetic
if (( 10 > 9 )); then
    echo "Greater"  # TRUE
fi
```

### Testing Command Success
```bash
# WRONG - doesn't actually test command
result=$(command)
if [[ $result ]]; then
    echo "Success"  # Tests if output is non-empty, not if command succeeded
fi

# CORRECT - test the command directly
if command; then
    echo "Success"
fi

# OR capture exit status
command
if [[ $? -eq 0 ]]; then
    echo "Success"
fi
```

### Regex Variables
```bash
# WRONG - quotes prevent regex interpretation
regex="^[0-9]+$"
if [[ "$string" =~ "$regex" ]]; then  # Treated as literal string!
    echo "Match"
fi

# CORRECT - don't quote the regex
regex="^[0-9]+$"
if [[ "$string" =~ $regex ]]; then
    echo "Match"
fi

# OR use inline
if [[ "$string" =~ ^[0-9]+$ ]]; then
    echo "Match"
fi
```

### File Test Race Conditions
```bash
# WRONG - file might disappear between test and use
if [[ -f "$file" ]]; then
    cat "$file"  # File might not exist anymore
fi

# BETTER - handle errors
if [[ -f "$file" ]]; then
    cat "$file" 2>/dev/null || echo "File disappeared"
fi

# BEST - just try and handle failure
cat "$file" 2>/dev/null || echo "Cannot read file"
```

### Unset vs Empty Variables
```bash
# Test if variable is unset
if [[ ! -v VAR ]]; then
    echo "Variable is not set"
fi

# Test if variable is empty or unset
if [[ -z "${VAR}" ]]; then
    echo "Variable is empty or unset"
fi

# Test if variable is set (even if empty)
if [[ -v VAR ]]; then
    echo "Variable is set (may be empty)"
fi
```

---

## Performance Tips

### Avoid External Commands
```bash
# SLOW - spawns grep process
if echo "$string" | grep -q "pattern"; then
    echo "Match"
fi

# FAST - use built-in pattern matching
if [[ "$string" == *pattern* ]]; then
    echo "Match"
fi

# SLOW - spawns wc process
if [[ $(echo "$string" | wc -c) -gt 10 ]]; then
    echo "Long string"
fi

# FAST - use parameter expansion
if [[ ${#string} -gt 10 ]]; then
    echo "Long string"
fi
```

### Cache Expensive Tests
```bash
# SLOW - tests file multiple times
if [[ -f "$file" ]]; then
    if [[ -r "$file" ]]; then
        if [[ -w "$file" ]]; then
            cat "$file"
        fi
    fi
fi

# FASTER - combine tests
if [[ -f "$file" && -r "$file" && -w "$file" ]]; then
    cat "$file"
fi
```

### Use Built-in Arithmetic
```bash
# SLOW - spawns bc/expr
result=$(echo "$a + $b" | bc)

# FAST - use arithmetic expansion
result=$((a + b))

# SLOW - spawns processes
if [ $(expr $a + $b) -gt 10 ]; then
    echo "Sum greater than 10"
fi

# FAST - use (( ))
if (( a + b > 10 )); then
    echo "Sum greater than 10"
fi
```

---

## Debugging Conditionals

### Enable Debug Mode
```bash
#!/bin/bash
set -x  # Print each command before execution

if [[ -f "$file" ]]; then
    echo "File exists"
fi

set +x  # Disable debug mode
```

### Verbose Conditions
```bash
# Add echo statements
if [[ -f "$file" ]]; then
    echo "DEBUG: File $file exists"
else
    echo "DEBUG: File $file not found"
fi

# Use trap for debugging
trap 'echo "DEBUG: Line $LINENO"' DEBUG
```

### Test Conditions Interactively
```bash
# Test in terminal
$ file="test.txt"
$ [[ -f "$file" ]] && echo "exists" || echo "not found"

# Check exit status
$ [[ -f "$file" ]]
$ echo $?
0  # Success means condition is true
```

---

## Advanced Examples

### Multi-Level Validation
```bash
#!/bin/bash

validate_input() {
    local input="$1"
    
    # Check if empty
    if [[ -z "$input" ]]; then
        echo "Error: Input cannot be empty"
        return 1
    fi
    
    # Check length
    if [[ ${#input} -lt 3 ]]; then
        echo "Error: Input too short (minimum 3 characters)"
        return 1
    fi
    
    # Check format
    if [[ ! "$input" =~ ^[a-zA-Z0-9_]+$ ]]; then
        echo "Error: Only alphanumeric and underscore allowed"
        return 1
    fi
    
    return 0
}

read -p "Enter username: " username
if validate_input "$username"; then
    echo "Valid username: $username"
fi
```

### System Health Check
```bash
#!/bin/bash

check_system() {
    local errors=0
    
    # Check disk space
    for mount in / /home; do
        usage=$(df "$mount" | awk 'NR==2 {print $5}' | tr -d '%')
        if (( usage > 90 )); then
            echo "ERROR: $mount is ${usage}% full"
            ((errors++))
        fi
    done
    
    # Check load average
    load=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | tr -d ',')
    if (( $(echo "$load > 2.0" | bc -l) )); then
        echo "WARNING: High load average: $load"
        ((errors++))
    fi
    
    # Check memory
    if [[ -f /proc/meminfo ]]; then
        mem_free=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
        if (( mem_free < 1000000 )); then
            echo "WARNING: Low memory: $((mem_free/1024)) MB"
            ((errors++))
        fi
    fi
    
    return $errors
}

if check_system; then
    echo "System health: OK"
else
    echo "System health: Issues detected"
fi
```

### Smart Backup with Rotation
```bash
#!/bin/bash

backup_file() {
    local source="$1"
    local backup_dir="$2"
    local max_backups=5
    
    # Validate inputs
    if [[ ! -f "$source" ]]; then
        echo "Error: Source file doesn't exist"
        return 1
    fi
    
    if [[ ! -d "$backup_dir" ]]; then
        mkdir -p "$backup_dir" || return 1
    fi
    
    # Check if backup needed
    local latest_backup=$(ls -t "$backup_dir"/*.bak 2>/dev/null | head -1)
    if [[ -f "$latest_backup" ]]; then
        if cmp -s "$source" "$latest_backup"; then
            echo "No changes detected, backup skipped"
            return 0
        fi
    fi
    
    # Create backup
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local backup_file="$backup_dir/$(basename "$source").$timestamp.bak"
    
    if cp "$source" "$backup_file"; then
        echo "Backup created: $backup_file"
        
        # Rotate old backups
        local backup_count=$(ls "$backup_dir"/*.bak 2>/dev/null | wc -l)
        if (( backup_count > max_backups )); then
            local to_remove=$((backup_count - max_backups))
            ls -t "$backup_dir"/*.bak | tail -n "$to_remove" | xargs rm -f
            echo "Removed $to_remove old backup(s)"
        fi
        
        return 0
    else
        echo "Error: Backup failed"
        return 1
    fi
}

backup_file "important.txt" "./backups"
```

### Dependency Checker with Auto-Install
```bash
#!/bin/bash

check_and_install() {
    local package="$1"
    local install_cmd="$2"
    
    if command -v "$package" &>/dev/null; then
        echo "✓ $package is installed"
        return 0
    fi
    
    echo "✗ $package is not installed"
    
    if [[ -n "$install_cmd" ]]; then
        read -p "Install $package? (y/n): " answer
        if [[ "$answer" =~ ^[Yy]$ ]]; then
            eval "$install_cmd" && echo "✓ $package installed" || {
                echo "✗ Failed to install $package"
                return 1
            }
        fi
    fi
    
    return 1
}

dependencies=(
    "git:sudo apt-get install -y git"
    "docker:curl -fsSL https://get.docker.com | sh"
    "node:sudo apt-get install -y nodejs npm"
)

for dep in "${dependencies[@]}"; do
    IFS=: read -r package install_cmd <<< "$dep"
    check_and_install "$package" "$install_cmd" || exit 1
done

echo "All dependencies satisfied"
```

### Configuration Merger
```bash
#!/bin/bash

merge_configs() {
    local default_config="$1"
    local user_config="$2"
    local output_config="$3"
    
    # Validate files
    if [[ ! -f "$default_config" ]]; then
        echo "Error: Default config not found"
        return 1
    fi
    
    # Start with defaults
    cp "$default_config" "$output_config"
    
    # Merge user config if exists
    if [[ -f "$user_config" && -r "$user_config" ]]; then
        while IFS='=' read -r key value; do
            # Skip comments and empty lines
            [[ "$key" =~ ^#.*$ || -z "$key" ]] && continue
            
            # Update or add key
            if grep -q "^${key}=" "$output_config"; then
                sed -i "s|^${key}=.*|${key}=${value}|" "$output_config"
            else
                echo "${key}=${value}" >> "$output_config"
            fi
        done < "$user_config"
        
        echo "Configuration merged successfully"
    else
        echo "Using default configuration only"
    fi
    
    return 0
}

merge_configs "default.conf" "user.conf" "final.conf"
```

---

## Shell Compatibility Notes

### Bash-Specific Features
These features only work in Bash and won't work in POSIX sh:

- `[[ ]]` double brackets
- `=~` regex matching
- `(( ))` arithmetic evaluation
- Extended glob patterns (`extglob`)
- `BASH_REMATCH` array
- `-v` variable test
- `-R` nameref test

### POSIX-Compatible Alternatives
```bash
# Bash: [[ ]]
# POSIX: [ ]
if [ -f "$file" ]; then
    echo "File exists"
fi

# Bash: [[ $a == $b ]]
# POSIX: [ "$a" = "$b" ]
if [ "$a" = "$b" ]; then
    echo "Equal"
fi

# Bash: (( a > b ))
# POSIX: [ $a -gt $b ]
if [ "$a" -gt "$b" ]; then
    echo "Greater"
fi

# Bash: [[ $str =~ regex ]]
# POSIX: expr or grep
if echo "$str" | grep -q "pattern"; then
    echo "Match"
fi
```

---

## Resources and Further Reading

### Official Documentation
- Bash Manual: https://www.gnu.org/software/bash/manual/
- Bash Reference: `man bash`
- Test Command: `man test`

### Style Guides
- Google Shell Style Guide
- ShellCheck for linting: https://www.shellcheck.net/

### Testing Tools
- BATS (Bash Automated Testing System)
- shunit2
- ShellSpec

---

**Created:** 2025  
**Version:** 2.0  
**License:** MIT

---

## Appendix: Complete Operator Reference

### File Test Operators
| Operator | Description |
|----------|-------------|
| `-a file` | True if file exists (deprecated, use `-e`) |
| `-b file` | True if file is a block special file |
| `-c file` | True if file is a character special file |
| `-d file` | True if file is a directory |
| `-e file` | True if file exists |
| `-f file` | True if file exists and is a regular file |
| `-g file` | True if file has its setgid bit set |
| `-h file` | True if file is a symbolic link |
| `-k file` | True if file has its sticky bit set |
| `-p file` | True if file is a named pipe |
| `-r file` | True if file is readable |
| `-s file` | True if file exists and is not empty |
| `-t fd` | True if file descriptor fd is open and refers to a terminal |
| `-u file` | True if file has its setuid bit set |
| `-w file` | True if file is writable |
| `-x file` | True if file is executable |
| `-G file` | True if file is owned by the effective group id |
| `-L file` | True if file is a symbolic link |
| `-N file` | True if file was modified since it was last read |
| `-O file` | True if file is owned by the effective user id |
| `-S file` | True if file is a socket |

### String Test Operators
| Operator | Description |
|----------|-------------|
| `-z string` | True if length of string is zero |
| `-n string` | True if length of string is non-zero |
| `string1 = string2` | True if strings are equal |
| `string1 == string2` | True if strings are equal |
| `string1 != string2` | True if strings are not equal |
| `string1 < string2` | True if string1 sorts before string2 |
| `string1 > string2` | True if string1 sorts after string2 |

### Integer Comparison Operators
| Operator | Description |
|----------|-------------|
| `arg1 -eq arg2` | True if arg1 equals arg2 |
| `arg1 -ne arg2` | True if arg1 not equal to arg2 |
| `arg1 -lt arg2` | True if arg1 less than arg2 |
| `arg1 -le arg2` | True if arg1 less than or equal to arg2 |
| `arg1 -gt arg2` | True if arg1 greater than arg2 |
| `arg1 -ge arg2` | True if arg1 greater than or equal to arg2 |

### Logical Operators
| Operator | Description | Context |
|----------|-------------|---------|
| `!` | Logical NOT | Both `[ ]` and `[[ ]]` |
| `-a` | Logical AND | Only `[ ]` |
| `-o` | Logical OR | Only `[ ]` |
| `&&` | Logical AND | Only `[[ ]]` |
| `||` | Logical OR | Only `[[ ]]` |

### Arithmetic Operators (in `(( ))`)
| Operator | Description |
|----------|-------------|
| `+` | Addition |
| `-` | Subtraction |
| `*` | Multiplication |
| `/` | Division |
| `%` | Modulo |
| `**` | Exponentiation |
| `++` | Increment |
| `--` | Decrement |
| `==` | Equal to |
| `!=` | Not equal to |
| `<` | Less than |
| `<=` | Less than or equal |
| `>` | Greater than |
| `>=` | Greater than or equal |
| `&&` | Logical AND |
| `||` | Logical OR |
| `!` | Logical NOT |
| `&` | Bitwise AND |
| `|` | Bitwise OR |
| `^` | Bitwise XOR |
| `~` | Bitwise NOT |
| `<<` | Left shift |
| `>>` | Right shift |

---

**End of Guide**