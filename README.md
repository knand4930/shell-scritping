# Complete Bash Features Reference Guide

A comprehensive reference for Bash scripting, covering basic to advanced features.

## Table of Contents

- [Shebang & Comments](#shebang--comments)
- [Variables](#variables)
- [Parameter Expansion](#parameter-expansion)
- [Arrays](#arrays)
- [Conditional Statements](#conditional-statements)
- [Loops](#loops)
- [Functions](#functions)
- [Arithmetic Operations](#arithmetic-operations)
- [Input/Output](#inputoutput)
- [Redirection & Pipes](#redirection--pipes)
- [Command Substitution](#command-substitution)
- [Control Operators](#control-operators)
- [Job Control](#job-control)
- [Shell Options & Settings](#shell-options--settings)
- [Traps & Signals](#traps--signals)
- [Glob Patterns & Pattern Matching](#glob-patterns--pattern-matching)
- [Subshells & Command Groups](#subshells--command-groups)
- [Debugging & Error Handling](#debugging--error-handling)
- [Built-in Commands](#built-in-commands)
- [Advanced Features](#advanced-features)

---

## Shebang & Comments

### Basic Shebang
```bash
#!/bin/bash          # Specifies interpreter
#!/usr/bin/env bash  # Portable shebang (recommended)
```

### Comments
```bash
# Single-line comment

: '
Multi-line comment
using : and quotes
'
```

---

## Variables

### Declaration & Assignment
```bash
name="John"                    # String (no spaces around =)
age=25                         # Integer
readonly PI=3.14159           # Read-only constant
declare -r CONSTANT="value"   # Another constant declaration
```

### Variable Types with `declare`
```bash
declare -i num=10             # Integer
declare -a array              # Indexed array
declare -A assoc_array        # Associative array
declare -x export_var="val"   # Export variable
declare -r readonly_var="val" # Read-only
declare -l lowercase="HELLO"  # Convert to lowercase
declare -u uppercase="hello"  # Convert to uppercase
```

### Variable Expansion
```bash
echo $name                    # Basic expansion
echo ${name}                  # Explicit expansion
echo "${name}"                # Quoted (preserves spaces)
```

### Special Variables
| Variable | Description |
|----------|-------------|
| `$0` | Script name |
| `$1, $2, ...` | Positional arguments |
| `$#` | Number of arguments |
| `$@` | All arguments (as separate words) |
| `$*` | All arguments (as single word) |
| `$?` | Exit status of last command |
| `$$` | Current process ID |
| `$!` | PID of last background process |
| `$_` | Last argument of previous command |
| `$-` | Current shell options |

### Environment Variables
```bash
$HOME          # Home directory
$PATH          # Executable search path
$USER          # Current username
$SHELL         # Current shell
$PWD           # Present working directory
$OLDPWD        # Previous working directory
$RANDOM        # Random number 0-32767
$LINENO        # Current line number
$HOSTNAME      # System hostname
$UID           # User ID
$EUID          # Effective user ID
```

---

## Parameter Expansion

### String Operations
```bash
${var:-default}      # Use default if var is unset
${var:=default}      # Assign default if var is unset
${var:?error}        # Display error if var is unset
${var:+alternate}    # Use alternate if var is set
${var:offset}        # Substring from offset
${var:offset:length} # Substring with length
${#var}              # Length of string
```

### Pattern Matching
```bash
${var#pattern}       # Remove shortest match from beginning
${var##pattern}      # Remove longest match from beginning
${var%pattern}       # Remove shortest match from end
${var%%pattern}      # Remove longest match from end
${var/pattern/repl}  # Replace first match
${var//pattern/repl} # Replace all matches
```

### Case Modification
```bash
${var^}              # Uppercase first character
${var^^}             # Uppercase all characters
${var,}              # Lowercase first character
${var,,}             # Lowercase all characters
```

---

## Arrays

### Indexed Arrays
```bash
# Declaration and initialization
fruits=("apple" "banana" "cherry")
fruits[3]="date"

# Access
echo ${fruits[0]}           # First element
echo ${fruits[@]}           # All elements
echo ${fruits[*]}           # All elements (single word)
echo ${#fruits[@]}          # Array length
echo ${!fruits[@]}          # Array indices

# Manipulation
unset fruits[1]             # Remove element
fruits+=("elderberry")      # Append element
slice=("${fruits[@]:1:2}")  # Slice array
copy=("${fruits[@]}")       # Copy array
```

### Associative Arrays
```bash
declare -A colors

colors[red]="#FF0000"
colors[green]="#00FF00"
colors[blue]="#0000FF"

echo ${colors[red]}         # Access by key
echo ${!colors[@]}          # All keys
echo ${colors[@]}           # All values
```

---

## Conditional Statements

### if-elif-else
```bash
if [ $age -gt 18 ]; then
    echo "Adult"
elif [ $age -eq 18 ]; then
    echo "Just turned adult"
else
    echo "Minor"
fi
```

### Test Operators

#### Numeric Comparisons
```bash
[ $a -eq $b ]  # Equal
[ $a -ne $b ]  # Not equal
[ $a -lt $b ]  # Less than
[ $a -le $b ]  # Less than or equal
[ $a -gt $b ]  # Greater than
[ $a -ge $b ]  # Greater than or equal
```

#### String Comparisons
```bash
[ "$a" = "$b" ]   # Equal
[ "$a" != "$b" ]  # Not equal
[ -z "$a" ]       # String is empty
[ -n "$a" ]       # String is not empty
```

#### File Tests
```bash
[ -e file ]   # File exists
[ -f file ]   # Regular file exists
[ -d dir ]    # Directory exists
[ -L link ]   # Symbolic link exists
[ -r file ]   # File is readable
[ -w file ]   # File is writable
[ -x file ]   # File is executable
[ -s file ]   # File is not empty
[ f1 -nt f2 ] # f1 is newer than f2
[ f1 -ot f2 ] # f1 is older than f2
```

### Double Bracket Test `[[ ]]`
```bash
[[ $a == $b ]]        # Pattern matching
[[ $a =~ regex ]]     # Regex matching
[[ $a && $b ]]        # Logical AND
[[ $a || $b ]]        # Logical OR
[[ ! $a ]]            # Logical NOT
```

### Case Statement
```bash
case $var in
    pattern1)
        echo "Match 1"
        ;;
    pattern2|pattern3)
        echo "Match 2 or 3"
        ;;
    *)
        echo "Default"
        ;;
esac
```

---

## Loops

### For Loops
```bash
# C-style
for ((i=0; i<10; i++)); do
    echo $i
done

# List iteration
for item in apple banana cherry; do
    echo $item
done

# Array iteration
for fruit in "${fruits[@]}"; do
    echo $fruit
done

# Range
for i in {1..10}; do
    echo $i
done

# Range with step
for i in {0..100..10}; do
    echo $i
done
```

### While Loop
```bash
count=0
while [ $count -lt 5 ]; do
    echo $count
    ((count++))
done
```

### Until Loop
```bash
count=0
until [ $count -ge 5 ]; do
    echo $count
    ((count++))
done
```

### Loop Control
```bash
for i in {1..10}; do
    [ $i -eq 5 ] && break      # Exit loop
    [ $i -eq 3 ] && continue   # Skip iteration
    echo $i
done
```

### Select Loop (Menu)
```bash
select option in "Option 1" "Option 2" "Quit"; do
    case $option in
        "Option 1") echo "Selected 1";;
        "Option 2") echo "Selected 2";;
        "Quit") break;;
    esac
done
```

---

## Functions

### Declaration
```bash
# Method 1
function greet() {
    echo "Hello, $1!"
}

# Method 2
greet2() {
    echo "Hello, $1!"
}
```

### Return Values
```bash
# Echo result
add() {
    local result=$(($1 + $2))
    echo $result
}

# Return status
check_file() {
    [ -f "$1" ] && return 0 || return 1
}
```

### Function Parameters
```bash
func() {
    echo "Function: $FUNCNAME"
    echo "First param: $1"
    echo "All params: $@"
    echo "Param count: $#"
    local local_var="local"
}
```

### Recursive Function
```bash
factorial() {
    if [ $1 -le 1 ]; then
        echo 1
    else
        local prev=$(factorial $(($1 - 1)))
        echo $(($1 * prev))
    fi
}
```

---

## Arithmetic Operations

### Arithmetic Expansion
```bash
result=$((5 + 3))      # Addition
result=$((10 - 4))     # Subtraction
result=$((6 * 7))      # Multiplication
result=$((20 / 4))     # Division
result=$((23 % 5))     # Modulo
result=$((2 ** 3))     # Exponentiation
```

### Compound Arithmetic
```bash
((count++))            # Increment
((count--))            # Decrement
((count += 5))         # Add and assign
((count -= 3))         # Subtract and assign
((count *= 2))         # Multiply and assign
((count /= 4))         # Divide and assign
((count %= 3))         # Modulo and assign
```

### Floating Point with `bc`
```bash
result=$(echo "scale=2; 10/3" | bc)
```

---

## Input/Output

### Reading Input
```bash
read var                          # Read single variable
read -p "Enter name: " name       # Prompt
read -s password                  # Silent (passwords)
read -n 1 char                    # Single character
read -t 5 input                   # Timeout (5 seconds)
read -a array                     # Read into array
read -r line                      # Raw (no backslash escape)
```

### IFS (Internal Field Separator)
```bash
IFS=',' read -ra fields <<< "a,b,c"
```

### Output Commands
```bash
echo "text"                       # Print with newline
echo -n "text"                    # Print without newline
echo -e "line1\nline2"           # Enable escape sequences
printf "%s\n" "formatted"         # Formatted output
printf "%d %f %s\n" 10 3.14 "text"
```

### Here Documents
```bash
cat << EOF
Multiple lines
of text
EOF

# Here string
cat <<< "single line"
```

---

## Redirection & Pipes

### Standard Redirection
```bash
cmd > file              # Redirect stdout (overwrite)
cmd >> file             # Redirect stdout (append)
cmd 2> file             # Redirect stderr
cmd &> file             # Redirect both stdout/stderr
cmd > file 2>&1         # Redirect stderr to stdout
cmd < file              # Redirect stdin from file
```

### Pipes
```bash
cmd1 | cmd2             # Pipe stdout
cmd1 |& cmd2            # Pipe stdout and stderr
cmd1 | tee file         # Write to stdout and file
```

### Process Substitution
```bash
diff <(cmd1) <(cmd2)    # Compare outputs
cmd > >(process)        # Output process substitution
```

---

## Command Substitution

```bash
# Backticks (deprecated)
result=`command`

# Dollar-parentheses (preferred)
result=$(command)
files=$(ls -1)
```

---

## Control Operators

```bash
cmd1 ; cmd2             # Run cmd1, then cmd2
cmd1 && cmd2            # Run cmd2 only if cmd1 succeeds
cmd1 || cmd2            # Run cmd2 only if cmd1 fails
cmd1 & cmd2             # Run cmd1 in background
cmd1 | cmd2             # Pipe
```

---

## Job Control

```bash
command &               # Run in background
jobs                    # List jobs
fg %1                   # Bring job 1 to foreground
bg %1                   # Resume job 1 in background
kill %1                 # Kill job 1
disown %1               # Remove from job table
wait                    # Wait for all background jobs
wait $PID               # Wait for specific process
```

---

## Shell Options & Settings

### Set Options
```bash
set -e                  # Exit on error
set -u                  # Exit on undefined variable
set -x                  # Print commands before execution
set -o pipefail         # Pipeline fails if any command fails
set -n                  # Syntax check (no execution)
set -v                  # Print shell input lines
```

### Shopt (Shell Options)
```bash
shopt -s nocaseglob     # Case-insensitive globbing
shopt -s dotglob        # Include hidden files
shopt -s nullglob       # Non-matching globs → null
shopt -s extglob        # Extended pattern matching
shopt -s globstar       # ** recursive directories
```

---

## Traps & Signals

### Trap Signals
```bash
trap 'echo "Interrupted"' INT      # Catch Ctrl+C
trap 'cleanup' EXIT                # Run on exit
trap 'error_handler' ERR           # Run on error
trap - INT                         # Remove trap
```

### Common Signals
| Signal | Number | Description |
|--------|--------|-------------|
| SIGINT | 2 | Interrupt (Ctrl+C) |
| SIGTERM | 15 | Termination |
| SIGKILL | 9 | Force kill (cannot trap) |
| SIGHUP | 1 | Hangup |
| SIGQUIT | 3 | Quit (Ctrl+\\) |

---

## Glob Patterns & Pattern Matching

### Basic Globs
```bash
*                       # Match any string
?                       # Match single character
[abc]                   # Match character in set
[a-z]                   # Match character in range
[!abc]                  # Match character not in set
```

### Extended Globs (with `shopt -s extglob`)
```bash
?(pattern)              # Zero or one occurrence
*(pattern)              # Zero or more occurrences
+(pattern)              # One or more occurrences
@(pattern)              # Exactly one occurrence
!(pattern)              # Anything except pattern
```

### Brace Expansion
```bash
{a,b,c}                 # Expands to: a b c
{1..10}                 # Expands to: 1 2 3 ... 10
{a..z}                  # Expands to: a b c ... z
{01..10}                # Zero-padded
```

---

## Subshells & Command Groups

```bash
# Subshell (runs in new shell)
(cd /tmp; ls)           # Directory change only in subshell

# Command Group (runs in current shell)
{ cd /tmp; ls; }        # Changes directory in current shell
```

---

## Debugging & Error Handling

### Error Handling
```bash
set -e                  # Exit on error
set -E                  # ERR trap inherited
set -o errtrace         # ERR trap on substitutions

# Error handler
error_exit() {
    echo "Error: $1" >&2
    exit 1
}
```

### Debug Mode
```bash
bash -x script.sh       # Run with debug output
set -x                  # Enable debug mode
set +x                  # Disable debug mode
```

---

## Built-in Commands

### Common Built-ins
```bash
cd                      # Change directory
pwd                     # Print working directory
echo                    # Print text
printf                  # Formatted print
read                    # Read input
test / [                # Evaluate condition
source / .              # Execute in current shell
alias                   # Create alias
unalias                 # Remove alias
export                  # Export to environment
unset                   # Unset variable
declare                 # Declare with attributes
local                   # Local variable in function
readonly                # Make read-only
shift                   # Shift positional parameters
exit                    # Exit shell
return                  # Return from function
break                   # Exit loop
continue                # Skip iteration
eval                    # Evaluate string as command
exec                    # Replace shell with command
getopts                 # Parse options
type                    # Display command type
command                 # Run bypassing functions
builtin                 # Run built-in bypassing functions
help                    # Display help for built-ins
```

---

## Advanced Features

### Advanced Variable Manipulation

#### Indirect References
```bash
var_name="my_variable"
my_variable="Hello World"
echo "${!var_name}"     # Prints: Hello World
```

#### Namerefs (Bash 4.3+)
```bash
declare -n ref=original_var
original_var="test"
echo "$ref"             # Prints: test
ref="modified"          # Changes original_var
```

#### Parameter Transformation (Bash 4.4+)
```bash
var="hello world"
echo "${var@Q}"         # Shell-quoted format
echo "${var@E}"         # Expand escape sequences
echo "${var@U}"         # Uppercase
echo "${var@L}"         # Lowercase
```

### Advanced Array Operations

#### Array Slicing
```bash
arr=(0 1 2 3 4 5 6 7 8 9)
echo "${arr[@]:2:5}"    # Elements 2-6
echo "${arr[@]:(-3)}"   # Last 3 elements
```

#### Array as Stack
```bash
stack=()
stack+=("element")      # Push
last="${stack[-1]}"     # Peek
unset 'stack[-1]'       # Pop
```

#### Multi-dimensional Arrays (Simulated)
```bash
declare -A matrix
for i in {0..2}; do
    for j in {0..2}; do
        matrix[$i,$j]=$((i * 3 + j))
    done
done
echo "${matrix[1,2]}"   # Access element
```

### Advanced Pattern Matching

#### Regex with BASH_REMATCH
```bash
regex='^([a-z]+)([0-9]+)$'
string="abc123"
if [[ $string =~ $regex ]]; then
    echo "Full match: ${BASH_REMATCH[0]}"
    echo "Letters: ${BASH_REMATCH[1]}"
    echo "Numbers: ${BASH_REMATCH[2]}"
fi
```

### Advanced Functions

#### Function with Memoization
```bash
declare -A fib_cache
fibonacci() {
    local n=$1
    [[ $n -le 1 ]] && echo $n && return
    [[ ${fib_cache[$n]} ]] && echo "${fib_cache[$n]}" && return
    
    local a=$(fibonacci $((n-1)))
    local b=$(fibonacci $((n-2)))
    local result=$((a + b))
    
    fib_cache[$n]=$result
    echo "$result"
}
```

#### Higher-Order Functions
```bash
map() {
    local func=$1
    shift
    for item in "$@"; do
        $func "$item"
    done
}

filter() {
    local predicate=$1
    shift
    for item in "$@"; do
        $predicate "$item" && echo "$item"
    done
}
```

### Advanced I/O

#### Custom File Descriptors
```bash
exec 3<> /tmp/buffer    # Open fd 3 for read/write
echo "data" >&3         # Write to fd 3
read line <&3           # Read from fd 3
exec 3>&-               # Close fd 3
```

#### Reading File Line by Line
```bash
while IFS= read -r line; do
    echo "$line"
done < file.txt
```

#### Named Pipes (FIFOs)
```bash
mkfifo /tmp/mypipe
cat /tmp/mypipe &       # Reader in background
echo "data" > /tmp/mypipe
rm /tmp/mypipe
```

### Coprocesses (Bash 4.0+)
```bash
coproc DB {
    while read cmd; do
        case $cmd in
            GET*) echo "Value";;
            SET*) echo "OK";;
        esac
    done
}

echo "GET key" >&${DB[1]}
read response <&${DB[0]}
```

### Advanced Error Handling

#### Error Trap with Stack Trace
```bash
error_handler() {
    local line=$1
    local exit_code=$2
    echo "Error on line $line (exit: $exit_code)" >&2
    for ((i=1; i<${#FUNCNAME[@]}; i++)); do
        echo "  ${FUNCNAME[$i]} at ${BASH_SOURCE[$i]}:${BASH_LINENO[$i-1]}" >&2
    done
    exit $exit_code
}
trap 'error_handler ${LINENO} $?' ERR
```

#### Cleanup Function
```bash
cleanup() {
    local exit_code=$?
    echo "Cleaning up..."
    rm -f /tmp/temp_*
    exit $exit_code
}
trap cleanup EXIT
```

### String Manipulation

#### Reverse String
```bash
reverse_string() {
    local str=$1
    local reversed=""
    for ((i=${#str}-1; i>=0; i--)); do
        reversed+="${str:$i:1}"
    done
    echo "$reversed"
}
```

#### Trim Whitespace
```bash
trim() {
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}"
    var="${var%"${var##*[![:space:]]}"}"
    echo "$var"
}
```

### Bitwise Operations
```bash
a=5  # 0101
b=3  # 0011

echo $((a & b))    # AND: 1
echo $((a | b))    # OR:  7
echo $((a ^ b))    # XOR: 6
echo $((~a))       # NOT
echo $((a << 2))   # Left shift: 20
echo $((a >> 1))   # Right shift: 2
```

### Networking with /dev/tcp

#### TCP Client
```bash
exec 3<>/dev/tcp/example.com/80
echo -e "GET / HTTP/1.1\r\nHost: example.com\r\n\r\n" >&3
cat <&3
exec 3>&-
```

#### Check Connectivity
```bash
timeout 2 bash -c "cat < /dev/null > /dev/tcp/8.8.8.8/53" 2>/dev/null
```

### Date & Time Operations
```bash
# Date arithmetic
future=$(date -d "+30 days" '+%Y-%m-%d')
past=$(date -d "2023-01-01 +1 year" '+%Y-%m-%d')

# Unix timestamp
timestamp=$(date +%s)
from_ts=$(date -d "@$timestamp" '+%Y-%m-%d %H:%M:%S')

# Time difference
start=$(date +%s)
# operations...
end=$(date +%s)
duration=$((end - start))
```

### Advanced Algorithms

#### Quicksort
```bash
quicksort() {
    local arr=("$@")
    local len=${#arr[@]}
    [[ $len -le 1 ]] && echo "${arr[@]}" && return
    
    local pivot="${arr[0]}"
    local left=() right=()
    
    for ((i=1; i<len; i++)); do
        if [[ ${arr[$i]} -lt $pivot ]]; then
            left+=("${arr[$i]}")
        else
            right+=("${arr[$i]}")
        fi
    done
    
    echo "$(quicksort "${left[@]}") $pivot $(quicksort "${right[@]}")"
}
```

#### Binary Search
```bash
binary_search() {
    local arr=("$@")
    local target="${arr[-1]}"
    unset 'arr[-1]'
    
    local left=0
    local right=$((${#arr[@]} - 1))
    
    while [[ $left -le $right ]]; do
        local mid=$(((left + right) / 2))
        
        if [[ ${arr[$mid]} -eq $target ]]; then
            echo $mid
            return 0
        elif [[ ${arr[$mid]} -lt $target ]]; then
            left=$((mid + 1))
        else
            right=$((mid - 1))
        fi
    done
    
    return 1
}
```

### Testing Framework
```bash
assert_equals() {
    local expected=$1
    local actual=$2
    local message=${3:-""}
    
    if [[ "$expected" == "$actual" ]]; then
        echo "✓ PASS: $message"
        return 0
    else
        echo "✗ FAIL: $message"
        echo "  Expected: $expected"
        echo "  Actual:   $actual"
        return 1
    fi
}
```

### Performance Optimization Tips

1. **Use built-ins over external commands**
   - `[[ ]]` instead of `[ ]`
   - `(( ))` for arithmetic
   - `${var//pattern/replace}` instead of `sed`

2. **Avoid unnecessary forks**
   - Use parameter expansion for string manipulation
   - Use process substitution: `while read; done < <(command)`

3. **Cache expensive operations**
   ```bash
   declare -A cache
   expensive_operation() {
       local key=$1
       [[ -n ${cache[$key]} ]] && echo "${cache[$key]}" && return
       local result=$(complex_calculation "$key")
       cache[$key]=$result
       echo "$result"
   }
   ```

---

## Best Practices

### Strict Mode
```bash
#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
```

### Script Template
```bash
#!/usr/bin/env bash

set -euo pipefail

# Constants
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"

# Cleanup function
cleanup() {
    local exit_code=$?
    # Cleanup code here
    exit $exit_code
}
trap cleanup EXIT

# Main function
main() {
    # Your code here
    echo "Hello, World!"
}

# Run main if script is executed (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
```

### Error Handling Template
```bash
error_exit() {
    echo "Error: $1" >&2
    exit 1
}

require_command() {
    command -v "$1" &>/dev/null || error_exit "Required command '$1' not found"
}
```

---

### Data Structures

#### Stack Implementation
```bash
declare -a stack
stack_push() { stack+=("$1"); }
stack_pop() { 
    local val="${stack[-1]}"
    unset 'stack[-1]'
    echo "$val"
}
stack_peek() { echo "${stack[-1]}"; }
stack_size() { echo "${#stack[@]}"; }
```

#### Queue Implementation
```bash
declare -a queue
queue_enqueue() { queue+=("$1"); }
queue_dequeue() {
    local val="${queue[0]}"
    queue=("${queue[@]:1}")
    echo "$val"
}
queue_peek() { echo "${queue[0]}"; }
```

#### Hash Table
```bash
declare -A hashtable

hash_function() {
    local key=$1
    local size=${2:-100}
    local hash=0
    for ((i=0; i<${#key}; i++)); do
        local char="${key:$i:1}"
        hash=$(( (hash * 31 + $(printf '%d' "'$char")) % size ))
    done
    echo $hash
}

ht_put() {
    local key=$1 value=$2
    local bucket=$(hash_function "$key")
    hashtable[$bucket,$key]=$value
}

ht_get() {
    local key=$1
    local bucket=$(hash_function "$key")
    echo "${hashtable[$bucket,$key]}"
}
```

### Security & Cryptography

#### Generate Random Password
```bash
generate_password() {
    local length=${1:-16}
    tr -dc 'A-Za-z0-9!@#$%^&*' < /dev/urandom | head -c "$length"
    echo
}
```

#### Hash Functions
```bash
# SHA256
hash_sha256() {
    echo -n "$1" | sha256sum | cut -d' ' -f1
}

# MD5
hash_md5() {
    echo -n "$1" | md5sum | cut -d' ' -f1
}
```

#### Base64 Encoding/Decoding
```bash
base64_encode() { echo -n "$1" | base64; }
base64_decode() { echo -n "$1" | base64 -d; }
```

#### ROT13 Cipher
```bash
rot13() {
    echo "$1" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}
```

#### Input Sanitization
```bash
sanitize_input() {
    local input=$1
    echo "$input" | tr -cd '[:alnum:][:space:]._-'
}

escape_sql() {
    local input=$1
    echo "$input" | sed "s/'/''/g"
}
```

### File Operations

#### Read File into Variable
```bash
content=$(<file.txt)              # Entire file
mapfile -t lines < file.txt       # Into array
readarray -t lines < file.txt     # Alternative
```

#### File Locking
```bash
# Using flock
lock_file="/var/lock/script.lock"
exec 200>"$lock_file"
flock -n 200 || { echo "Already running"; exit 1; }

# Directory-based locking (atomic)
lock_dir="/var/lock/script.dir"
if mkdir "$lock_dir" 2>/dev/null; then
    trap 'rmdir "$lock_dir"' EXIT
else
    echo "Already running"
    exit 1
fi
```

#### Temporary Files
```bash
# Create temp file
temp_file=$(mktemp)
trap "rm -f $temp_file" EXIT

# Create temp directory
temp_dir=$(mktemp -d)
trap "rm -rf $temp_dir" EXIT
```

### Process Management

#### Daemonize Process
```bash
daemonize() {
    # Fork and exit parent
    if [[ $ -ne 1 ]]; then
        "$0" "$@" &
        exit 0
    fi
    
    # Continue as daemon
    exec > /var/log/daemon.log 2>&1
    cd /
    umask 0
    
    while true; do
        # Daemon work
        sleep 60
    done
}
```

#### Process Monitoring
```bash
monitor_process() {
    local pid=$1
    while kill -0 $pid 2>/dev/null; do
        echo "Process $pid is running..."
        sleep 1
    done
    echo "Process $pid terminated"
}
```

#### Parallel Processing with Job Limit
```bash
MAX_JOBS=4
for item in "${items[@]}"; do
    while [ $(jobs -r | wc -l) -ge $MAX_JOBS ]; do
        sleep 0.1
    done
    process_item "$item" &
done
wait
```

### Configuration Management

#### INI File Parser
```bash
declare -A config
parse_ini() {
    local file=$1
    local section=""
    
    while IFS='=' read -r key value; do
        key=$(echo "$key" | tr -d '[:space:]')
        value=$(echo "$value" | tr -d '[:space:]')
        
        if [[ $key =~ ^\[(.+)\]$ ]]; then
            section="${BASH_REMATCH[1]}"
        elif [[ -n $key && ! $key =~ ^# ]]; then
            config["${section}.${key}"]=$value
        fi
    done < "$file"
}
```

#### JSON Parser (Simple)
```bash
json_get() {
    local json=$1
    local key=$2
    echo "$json" | grep -o "\"$key\"[[:space:]]*:[[:space:]]*\"[^\"]*\"" | cut -d'"' -f4
}
```

#### Environment Variable Loading
```bash
load_env() {
    local env_file=${1:-.env}
    [[ -f $env_file ]] || return 1
    
    while IFS='=' read -r key value; do
        [[ $key =~ ^#.*$ || -z $key ]] && continue
        value=$(echo "$value" | sed -e 's/^"//' -e 's/"$//')
        export "$key=$value"
    done < "$env_file"
}
```

### Argument Parsing

#### Long Options with getopt
```bash
parse_args() {
    local TEMP=$(getopt -o 'hv:o:' \
        --long 'help,verbose:,output:,enable-feature' \
        -n "$0" -- "$@")
    
    [[ $? -ne 0 ]] && return 1
    eval set -- "$TEMP"
    
    while true; do
        case "$1" in
            '-h'|'--help') show_help; exit 0 ;;
            '-v'|'--verbose') VERBOSE=$2; shift 2 ;;
            '-o'|'--output') OUTPUT=$2; shift 2 ;;
            '--enable-feature') FEATURE=1; shift ;;
            '--') shift; break ;;
            *) echo "Internal error!"; exit 1 ;;
        esac
    done
    
    POSITIONAL_ARGS=("$@")
}
```

#### Manual Long Option Parsing
```bash
parse_long_opts() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --option=*) OPTION="${1#*=}"; shift ;;
            --option) OPTION=$2; shift 2 ;;
            --flag) FLAG=1; shift ;;
            --) shift; break ;;
            -*) echo "Unknown: $1" >&2; return 1 ;;
            *) POSITIONAL+=("$1"); shift ;;
        esac
    done
    POSITIONAL+=("$@")
}
```

### Logging

#### Logging Framework
```bash
declare -A LOG_LEVELS=([DEBUG]=0 [INFO]=1 [WARN]=2 [ERROR]=3)
LOG_LEVEL=${LOG_LEVEL:-INFO}

log() {
    local level=$1
    shift
    local message="$*"
    
    [[ ${LOG_LEVELS[$level]} -ge ${LOG_LEVELS[$LOG_LEVEL]} ]] || return 0
    
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [$level] $message" >&2
}

# Usage:
# log DEBUG "Debug message"
# log INFO "Info message"
# log WARN "Warning message"
# log ERROR "Error message"
```

### Metaprogramming

#### Dynamic Function Generation
```bash
create_function() {
    local func_name=$1
    local func_body=$2
    eval "$func_name() { $func_body; }"
}

# Usage:
create_function "greet" 'echo "Hello, $1"'
```

#### Generate Getter/Setter
```bash
generate_getter_setter() {
    local var_name=$1
    
    eval "
    get_${var_name}() {
        echo \"\${${var_name}}\"
    }
    
    set_${var_name}() {
        ${var_name}=\"\$1\"
    }
    "
}
```

#### Function Decorator (Timing)
```bash
time_decorator() {
    local func=$1
    local original="${func}_original"
    
    eval "$(declare -f "$func" | sed "1s/$func/$original/")"
    
    eval "
    $func() {
        local start=\$SECONDS
        $original \"\$@\"
        local duration=\$((SECONDS - start))
        echo \"[Time: \${duration}s]\" >&2
    }
    "
}
```

#### Lazy Evaluation
```bash
lazy_eval() {
    local var_name=$1
    local expression=$2
    
    eval "
    $var_name() {
        if [[ -z \${${var_name}_value+x} ]]; then
            ${var_name}_value=\$($expression)
        fi
        echo \"\${${var_name}_value}\"
    }
    "
}
```

### Compatibility & Portability

#### Bash Version Check
```bash
require_bash_version() {
    local required=$1
    local current="${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]}"
    
    if awk "BEGIN {exit !($current >= $required)}"; then
        return 0
    else
        echo "Error: Requires Bash $required+ (current: $current)" >&2
        exit 1
    fi
}
```

#### OS Detection
```bash
detect_os() {
    case "$(uname -s)" in
        Linux*)   echo "Linux";;
        Darwin*)  echo "Mac";;
        CYGWIN*)  echo "Cygwin";;
        MINGW*)   echo "MinGw";;
        *)        echo "Unknown";;
    esac
}
```

#### Command Availability Check
```bash
require_command() {
    local cmd=$1
    if ! command -v "$cmd" &>/dev/null; then
        echo "Error: Required command '$cmd' not found" >&2
        exit 1
    fi
}
```

### Terminal Control

#### Colors and Formatting
```bash
# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Text formatting
BOLD='\033[1m'
DIM='\033[2m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
REVERSE='\033[7m'
HIDDEN='\033[8m'

# Usage:
echo -e "${RED}Error:${NC} Something went wrong"
echo -e "${GREEN}${BOLD}Success!${NC}"
```

#### Progress Bar
```bash
progress_bar() {
    local current=$1
    local total=$2
    local width=50
    
    local percent=$((current * 100 / total))
    local completed=$((width * current / total))
    
    printf "\r["
    printf "%${completed}s" | tr ' ' '='
    printf "%$((width - completed))s" | tr ' ' ' '
    printf "] %d%%" $percent
    
    [[ $current -eq $total ]] && echo
}

# Usage:
for i in {1..100}; do
    progress_bar $i 100
    sleep 0.1
done
```

#### Spinner Animation
```bash
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    
    while kill -0 $pid 2>/dev/null; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Usage:
long_running_command &
spinner $!
```

#### Clear Screen Functions
```bash
clear_line() { printf "\r\033[K"; }
move_up() { printf "\033[${1:-1}A"; }
move_down() { printf "\033[${1:-1}B"; }
save_cursor() { printf "\033[s"; }
restore_cursor() { printf "\033[u"; }
hide_cursor() { printf "\033[?25l"; }
show_cursor() { printf "\033[?25h"; }
```

### Menu Systems

#### Simple Menu
```bash
menu() {
    local title=$1
    shift
    local options=("$@")
    
    echo "$title"
    for i in "${!options[@]}"; do
        echo "$((i+1)). ${options[$i]}"
    done
    
    read -p "Select option: " choice
    echo $((choice - 1))
}

# Usage:
options=("Option 1" "Option 2" "Option 3" "Quit")
selection=$(menu "Main Menu" "${options[@]}")
```

#### Interactive Menu with Arrow Keys
```bash
interactive_menu() {
    local options=("$@")
    local selected=0
    local key
    
    hide_cursor
    trap show_cursor EXIT
    
    while true; do
        clear
        echo "Use ↑/↓ to navigate, Enter to select:"
        echo
        
        for i in "${!options[@]}"; do
            if [ $i -eq $selected ]; then
                echo -e "${REVERSE}  ${options[$i]}  ${NC}"
            else
                echo "  ${options[$i]}"
            fi
        done
        
        read -rsn1 key
        case "$key" in
            \x1b')
                read -rsn2 key
                case "$key" in
                    '[A') ((selected > 0)) && ((selected--)) ;;
                    '[B') ((selected < ${#options[@]} - 1)) && ((selected++)) ;;
                esac
                ;;
            '') break ;;
        esac
    done
    
    show_cursor
    echo "${options[$selected]}"
}
```

### Debugging Tools

#### Debug Mode with Conditional Output
```bash
DEBUG=${DEBUG:-0}

debug() {
    [[ $DEBUG -eq 1 ]] && echo "[DEBUG] $*" >&2
}

# Enable with: DEBUG=1 ./script.sh
```

#### Assert Function
```bash
assert() {
    if ! eval "$1"; then
        echo "Assertion failed: $1" >&2
        echo "  File: ${BASH_SOURCE[1]}" >&2
        echo "  Line: ${BASH_LINENO[0]}" >&2
        exit 1
    fi
}

# Usage:
assert "[[ -f /etc/passwd ]]"
assert "[[ $count -gt 0 ]]"
```

#### Performance Profiling
```bash
profile() {
    local start=$SECONDS
    "$@"
    local duration=$((SECONDS - start))
    echo "Execution time: ${duration}s" >&2
}

# Usage:
profile expensive_function arg1 arg2
```

### Email and Notifications

#### Send Email
```bash
send_email() {
    local to=$1
    local subject=$2
    local body=$3
    
    echo "$body" | mail -s "$subject" "$to"
}
```

#### Desktop Notification
```bash
notify() {
    local title=$1
    local message=$2
    
    if command -v notify-send &>/dev/null; then
        notify-send "$title" "$message"
    elif command -v osascript &>/dev/null; then
        # macOS
        osascript -e "display notification \"$message\" with title \"$title\""
    fi
}
```

### System Information

#### Get System Info
```bash
get_system_info() {
    echo "OS: $(uname -s)"
    echo "Kernel: $(uname -r)"
    echo "Architecture: $(uname -m)"
    echo "Hostname: $(hostname)"
    echo "CPU: $(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs)"
    echo "Memory: $(free -h | awk '/^Mem:/ {print $2}')"
    echo "Disk: $(df -h / | awk 'NR==2 {print $2}')"
}
```

#### Check Disk Space
```bash
check_disk_space() {
    local threshold=${1:-90}
    local usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
    
    if [ $usage -gt $threshold ]; then
        echo "WARNING: Disk usage at ${usage}%" >&2
        return 1
    fi
    return 0
}
```

---

## Resources

- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/)
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/)
- [ShellCheck](https://www.shellcheck.net/) - Shell script static analysis tool
- [Bash Hackers Wiki](https://wiki.bash-hackers.org/)
- [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)

---

## License

This reference guide is provided as-is for educational purposes.

---

**Note**: Always test scripts thoroughly before using in production. Consider using `shellcheck` for static analysis of your bash scripts.