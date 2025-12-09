# Common Utility Scripts

This directory contains reusable Shell utility functions.

## utils.sh

Provides common Shell functions, including:

- **Logging functions**: `log_info`, `log_success`, `log_warning`, `log_error`
- **Check functions**: `command_exists`, `file_exists`, `dir_exists`
- **Utility functions**: `safe_exec`, `get_script_dir`, `check_root`, `backup_file`

### Usage

Import utility functions in your script:

```bash
source "$(dirname "$0")/common/utils.sh"
```

### Example

```bash
#!/usr/bin/env bash
source "$(dirname "$0")/common/utils.sh"

log_info "Starting task execution"
if command_exists "git"; then
    log_success "Git is installed"
else
    log_error "Git is not installed"
fi
```

