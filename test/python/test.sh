#!/bin/bash

# This test can be run with the following command:
# devcontainer features test \
#   --features python        \
#   --remote-user vscode     \
#   --skip-scenarios         \
#   --base-image ghcr.io/aar65537/dev-containers/base:edge-bookworm \
#   dev-features
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib
# check <LABEL> <cmd> [args...]
check "verify uv is installed" bash -c "uv --version"
check "verify basedpyright is installed" bash -c "basedpyright --version"
check "verify ruff is installed" bash -c "ruff --version"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults