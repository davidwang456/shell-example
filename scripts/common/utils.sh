#!/usr/bin/env bash
# Common utility function library
# Provides common Shell functions for other scripts to use

set -euo pipefail

# Color output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $*"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $*"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $*"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $*" >&2
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if file exists
file_exists() {
    [ -f "$1" ]
}

# Check if directory exists
dir_exists() {
    [ -d "$1" ]
}

# Safely execute command, exit on failure
safe_exec() {
    log_info "Executing command: $*"
    if "$@"; then
        log_success "Command executed successfully"
        return 0
    else
        log_error "Command execution failed: $*"
        exit 1
    fi
}

# Get script directory
get_script_dir() {
    local script_path="$1"
    dirname "$(readlink -f "$script_path")"
}

# Check if running as root user
check_root() {
    if [ "$EUID" -ne 0 ]; then
        log_error "This script requires root privileges to run"
        exit 1
    fi
}

# Backup file
backup_file() {
    local file="$1"
    if file_exists "$file"; then
        local backup="${file}.backup.$(date +%Y%m%d_%H%M%S)"
        log_info "Backing up file: $file -> $backup"
        cp "$file" "$backup"
        echo "$backup"
    else
        log_warning "File does not exist, skipping backup: $file"
        return 1
    fi
}

