#!/usr/bin/env bash
# Example test script
# Used for GitLab CI/CD test stage

set -euo pipefail

# Test counters
TESTS_PASSED=0
TESTS_FAILED=0

# Test function
test_assert() {
    local test_name="$1"
    local condition="$2"
    
    if eval "$condition"; then
        echo "✅ PASS: $test_name"
        ((TESTS_PASSED++))
        return 0
    else
        echo "❌ FAIL: $test_name"
        ((TESTS_FAILED++))
        return 1
    fi
}

# Run tests
run_tests() {
    echo "Starting test execution..."
    echo "================================"
    
    # Test 1: Check if example.sh script file exists
    test_assert "Check if example.sh exists" \
        "[ -f scripts/examples/example.sh ]"
    
    # Test 2: Check if script is executable
    test_assert "Check if example.sh is executable" \
        "[ -x scripts/examples/example.sh ]"
    
    # Test 3: Check if README.md exists
    test_assert "Check if README.md exists" \
        "[ -f README.md ]"
    
    # Test 4: Check if .gitlab-ci.yml exists
    test_assert "Check if .gitlab-ci.yml exists" \
        "[ -f .gitlab-ci.yml ]"
    
    # Test 5: Check if utils.sh exists
    test_assert "Check if utils.sh exists" \
        "[ -f scripts/common/utils.sh ]"
    
    echo "================================"
    echo "Test execution completed"
    echo "Passed: $TESTS_PASSED"
    echo "Failed: $TESTS_FAILED"
    
    if [ $TESTS_FAILED -eq 0 ]; then
        echo "All tests passed!"
        exit 0
    else
        echo "Some tests failed!"
        exit 1
    fi
}

# Run tests
run_tests

