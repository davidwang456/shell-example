# Shell Example Project

This is a generic Shell script project template with GitLab CI/CD configuration.

## Project Structure

```
.
├── README.md              # Project documentation
├── .gitlab-ci.yml         # GitLab CI/CD configuration file
├── .gitignore             # Git ignore file
├── scripts/               # Shell scripts directory
│   ├── common/           # Common utility scripts
│   └── examples/         # Example scripts
└── tests/                 # Test scripts directory
```

## Features

- ✅ GitLab CI/CD automation workflow
- ✅ Shell script syntax checking
- ✅ Code quality checking (ShellCheck)
- ✅ Automated testing
- ✅ Multi-environment support (development, staging, production)

## Usage

### Local Development

1. Clone the project:
```bash
git clone <repository-url>
cd shell-example
```

2. Run scripts:
```bash
chmod +x scripts/examples/example.sh
./scripts/examples/example.sh
```

### GitLab CI/CD

The project is configured with GitLab CI/CD, which will automatically execute when code is pushed to GitLab:

- **Syntax Check**: Use ShellCheck to check script syntax
- **Code Quality**: Use ShellCheck for code quality checking
- **Testing**: Run test scripts
- **Deployment**: Automatically deploy to corresponding environment based on branch

## CI/CD Workflow

### Stages

1. **validate** - Validation stage
   - shellcheck: Syntax and code quality checking

2. **test** - Testing stage
   - test: Run test scripts

3. **deploy** - Deployment stage
   - deploy-dev: Deploy to development environment (develop branch)
   - deploy-staging: Deploy to staging environment (staging branch)
   - deploy-prod: Deploy to production environment (main/master branch)

### Branch Strategy

- `main` / `master`: Production environment
- `staging`: Staging environment
- `develop`: Development environment
- `feature/*`: Feature branches

## Development Guidelines

1. All scripts should include a shebang line: `#!/bin/bash` or `#!/usr/bin/env bash`
2. Use ShellCheck for code checking
3. Add appropriate error handling
4. Add script comments and documentation

## Dependencies

- ShellCheck: Shell script static analysis tool
- GitLab Runner: GitLab CI/CD executor

## License

MIT License

