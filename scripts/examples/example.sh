#!/usr/bin/env bash
# Example script
# Demonstrates how to use common utility functions

set -euo pipefail

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Import common utility functions
# shellcheck source=../common/utils.sh
source "$SCRIPT_DIR/../common/utils.sh"

# Main function
main() {
    log_info "Starting example script execution"
    
    # Display script information
    log_info "Script directory: $SCRIPT_DIR"
    log_info "Project root: $PROJECT_ROOT"
    
    # Check if command exists
    if command_exists "git"; then
        log_success "Git is installed"
        git --version
    else
        log_warning "Git is not installed"
    fi
    
    # Check if file exists
    if file_exists "$PROJECT_ROOT/README.md"; then
        log_success "README.md file exists"
    else
        log_error "README.md file does not exist"
        exit 1
    fi
    
    # Execute example commands
    log_info "Current user: $(whoami)"
    log_info "Current directory: $(pwd)"
    log_info "System information: $(uname -a)"
    
    log_success "Example script execution completed"
}

# Run main function
main "$@"

