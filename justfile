# SPDX-FileCopyrightText: 2025 The Open Source Project Template Authors
#
# SPDX-License-Identifier: CC0-1.0

# Quality checks and automation for Open Source Project Template
# Run 'just' to see available commands

devtools_repo := env("DEVBASE_JUSTKIT_REPO", "https://github.com/diggsweden/devbase-justkit")
devtools_dir := env("XDG_DATA_HOME", env("HOME") + "/.local/share") + "/devbase-justkit"
lint := devtools_dir + "/linters"
colors := devtools_dir + "/utils/colors.sh"

# Color variables
CYAN_BOLD := "\\033[1;36m"
GREEN := "\\033[1;32m"
BLUE := "\\033[1;34m"
NC := "\\033[0m"

# ==================================================================================== #
# DEFAULT - Show available recipes
# ==================================================================================== #

# Display available recipes
default:
    @printf "{{CYAN_BOLD}} Open Source Project Template{{NC}}\n\n"
    @printf "Quick start: {{GREEN}}just setup-devtools{{NC}} | {{BLUE}}just verify{{NC}}\n\n"
    @just --list --unsorted

# ==================================================================================== #
# SETUP - Development environment setup
# ==================================================================================== #

# ▪ Install devtools and tools
[group('setup')]
install: setup-devtools tools-install

# ▪ Setup devtools (clone or update)
[group('setup')]
setup-devtools:
    #!/usr/bin/env bash
    set -euo pipefail
    if [[ -d "{{devtools_dir}}" ]]; then
        "{{devtools_dir}}/scripts/setup.sh" "{{devtools_repo}}" "{{devtools_dir}}"
    else
        printf "Cloning devbase-justkit to %s...\n" "{{devtools_dir}}"
        mkdir -p "$(dirname "{{devtools_dir}}")"
        git clone --depth 1 "{{devtools_repo}}" "{{devtools_dir}}"
        git -C "{{devtools_dir}}" fetch --tags --quiet
        latest=$(git -C "{{devtools_dir}}" describe --tags --abbrev=0 origin/main 2>/dev/null || echo "")
        if [[ -n "$latest" ]]; then
            git -C "{{devtools_dir}}" fetch --depth 1 origin tag "$latest" --quiet
            git -C "{{devtools_dir}}" checkout "$latest" --quiet
        fi
        printf "Installed devbase-justkit %s\n" "${latest:-main}"
    fi

# Check required tools are installed
[group('setup')]
check-tools: _ensure-devtools
    @{{devtools_dir}}/scripts/check-tools.sh --check-devtools mise git just rumdl yamlfmt actionlint gitleaks shellcheck shfmt conform reuse

# Install tools via mise
[group('setup')]
tools-install: _ensure-devtools
    @mise install

# ==================================================================================== #
# VERIFY - Quality assurance
# ==================================================================================== #

# Run all checks (linters)
[group('verify')]
verify: _ensure-devtools check-tools
    @{{devtools_dir}}/scripts/verify.sh

# ==================================================================================== #
# LINT - Code quality checks
# ==================================================================================== #

# ▪ Run all linters with summary
[group('lint')]
lint-all: _ensure-devtools
    @{{devtools_dir}}/scripts/verify.sh

# Validate commit messages
[group('lint')]
lint-commits:
    @{{lint}}/commits.sh

# Scan for secrets
[group('lint')]
lint-secrets:
    @{{lint}}/secrets.sh

# Lint YAML files
[group('lint')]
lint-yaml:
    @{{lint}}/yaml.sh check

# Lint markdown files
[group('lint')]
lint-markdown:
    @{{lint}}/markdown.sh check

# Lint shell scripts
[group('lint')]
lint-shell:
    @{{lint}}/shell.sh

# Check shell formatting
[group('lint')]
lint-shell-fmt:
    @{{lint}}/shell-fmt.sh check

# Lint GitHub Actions
[group('lint')]
lint-actions:
    @{{lint}}/github-actions.sh

# Check license compliance
[group('lint')]
lint-license:
    @{{lint}}/license.sh

# Lint XML files (no-op for this project)
[group('lint')]
lint-xml:
    @{{lint}}/xml.sh

# Lint containers (no-op for this project)
[group('lint')]
lint-container:
    @{{lint}}/container.sh

# ==================================================================================== #
# LINT-FIX - Auto-fix code issues
# ==================================================================================== #

# ▪ Fix all auto-fixable issues
[group('lint-fix')]
lint-fix: _ensure-devtools lint-yaml-fix lint-markdown-fix lint-shell-fmt-fix
    #!/usr/bin/env bash
    source "{{colors}}"
    just_success "All auto-fixes completed"

# Fix YAML formatting
[group('lint-fix')]
lint-yaml-fix:
    @{{lint}}/yaml.sh fix

# Fix markdown formatting
[group('lint-fix')]
lint-markdown-fix:
    @{{lint}}/markdown.sh fix

# Fix shell formatting
[group('lint-fix')]
lint-shell-fmt-fix:
    @{{lint}}/shell-fmt.sh fix

# ==================================================================================== #
# INTERNAL
# ==================================================================================== #

[private]
_ensure-devtools:
    @just setup-devtools
