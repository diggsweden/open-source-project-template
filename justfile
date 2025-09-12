# SPDX-FileCopyrightText: 2025 The Open Source Project Template Authors
#
# SPDX-License-Identifier: CC0-1.0

# Quality checks and automation
# Run 'just' to see available commands

# Terminal colors
red := '\033[0;31m'
green := '\033[0;32m'
yellow := '\033[0;33m'
nc := '\033[0m'

# Unicode symbols (works across platforms)
checkmark := '✓'
missing := '✗'

# Default recipe - show help
default:
    @printf 'Available commands:\n'
    @just --list --unsorted | grep -v "default"

# Run all quality verifications
verify: verify-deps lint lint-publiccode lint-license lint-commit
    @printf '\n{{yellow}}======== QUALITY CHECK SUMMARY ========{{nc}}\n\n' && \
    printf '{{green}}✓ All checks completed. See individual results above.{{nc}}\n'

# Check tool dependencies
verify-deps:
    @printf 'Checking required tools...\n' && \
    printf '=========================\n' && \
    missing_tools="" && \
    if command -v mise >/dev/null 2>&1; then \
        mise_ver=$(mise version 2>/dev/null | cut -d' ' -f1); \
        printf '{{green}}{{checkmark}}{{nc}} mise %s\n' "$mise_ver"; \
    else \
        printf '{{red}}{{missing}}{{nc}} mise\n'; \
        missing_tools="$missing_tools mise"; \
    fi && \
    if command -v just >/dev/null 2>&1; then \
        just_ver=$(just --version 2>/dev/null | cut -d' ' -f2); \
        printf '{{green}}{{checkmark}}{{nc}} just %s\n' "$just_ver"; \
    else \
        printf '{{red}}{{missing}}{{nc}} just\n'; \
        missing_tools="$missing_tools just"; \
    fi && \
    if command -v git >/dev/null 2>&1; then \
        git_ver=$(git --version 2>/dev/null | cut -d' ' -f3); \
        printf '{{green}}{{checkmark}}{{nc}} git %s\n' "$git_ver"; \
    else \
        printf '{{red}}{{missing}}{{nc}} git\n'; \
        missing_tools="$missing_tools git"; \
    fi && \
    if command -v reuse >/dev/null 2>&1; then \
        reuse_ver=$(reuse --version 2>/dev/null | head -1 | cut -d' ' -f3); \
        printf '{{green}}{{checkmark}}{{nc}} reuse %s\n' "$reuse_ver"; \
    else \
        printf '{{red}}{{missing}}{{nc}} reuse\n'; \
        missing_tools="$missing_tools reuse"; \
    fi && \
    if command -v rumdl >/dev/null 2>&1; then \
        rumdl_ver=$(rumdl --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1); \
        printf '{{green}}{{checkmark}}{{nc}} rumdl %s\n' "$rumdl_ver"; \
    else \
        printf '{{red}}{{missing}}{{nc}} rumdl\n'; \
        missing_tools="$missing_tools rumdl"; \
    fi && \
    if command -v yamlfmt >/dev/null 2>&1; then \
        yamlfmt_ver=$(yamlfmt -version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1); \
        printf '{{green}}{{checkmark}}{{nc}} yamlfmt %s\n' "$yamlfmt_ver"; \
    else \
        printf '{{red}}{{missing}}{{nc}} yamlfmt\n'; \
        missing_tools="$missing_tools yamlfmt"; \
    fi && \
    if command -v actionlint >/dev/null 2>&1; then \
        actionlint_ver=$(actionlint -version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1); \
        printf '{{green}}{{checkmark}}{{nc}} actionlint %s\n' "$actionlint_ver"; \
    else \
        printf '{{red}}{{missing}}{{nc}} actionlint\n'; \
        missing_tools="$missing_tools actionlint"; \
    fi && \
    if command -v gitleaks >/dev/null 2>&1; then \
        gitleaks_ver=$(gitleaks version 2>&1 | head -1); \
        if printf '%s\n' "$gitleaks_ver" | grep -q "build process"; then \
            mise_ver=$(grep gitleaks .mise.toml 2>/dev/null | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+' | head -1); \
            printf '{{green}}{{checkmark}}{{nc}} gitleaks %s\n' "${mise_ver:-installed}"; \
        else \
            printf '{{green}}{{checkmark}}{{nc}} gitleaks %s\n' "$gitleaks_ver"; \
        fi; \
    else \
        printf '{{red}}{{missing}}{{nc}} gitleaks\n'; \
        missing_tools="$missing_tools gitleaks"; \
    fi && \
    if command -v conform >/dev/null 2>&1; then \
        conform_ver=$(conform version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+-alpha\.[0-9]+' | head -1); \
        printf '{{green}}{{checkmark}}{{nc}} conform %s\n' "$conform_ver"; \
    else \
        printf '{{red}}{{missing}}{{nc}} conform\n'; \
        missing_tools="$missing_tools conform"; \
    fi && \
    if command -v publiccode-parser >/dev/null 2>&1; then \
        pubcode_ver=$(publiccode-parser --version 2>&1 | cut -d' ' -f1); \
        printf '{{green}}{{checkmark}}{{nc}} publiccode-parser %s\n' "$pubcode_ver"; \
    else \
        printf '{{red}}{{missing}}{{nc}} publiccode-parser\n'; \
        missing_tools="$missing_tools publiccode-parser"; \
    fi && \
    printf '\n' && \
    if [ -n "$missing_tools" ]; then \
        printf '{{red}}{{missing}} Missing tools detected!{{nc}}\n\n'; \
        printf '{{yellow}}To fix this:{{nc}}\n'; \
        printf '1. Install missing tools: {{green}}mise install{{nc}}\n'; \
        printf '2. Activate mise in your shell: {{green}}eval "$(mise activate bash)" or fish or zsh{{nc}}\n'; \
        printf '\nFor more details, see: DEVELOPMENT.md\n'; \
        exit 1; \
    else \
        printf '{{green}}{{checkmark}} All required tools installed!{{nc}}\n'; \
    fi

# Run mise based linters
lint: lint-markdown lint-yaml lint-actions lint-secrets

# Lint markdown files with rumdl
lint-markdown:
    @printf '{{yellow}}\n************ MARKDOWN LINTING (RUMDL) ***********{{nc}}\n\n'
    @rumdl check . --exclude CHANGELOG.md && printf '{{green}}{{checkmark}} Markdown linting passed{{nc}}\n' || { printf '{{red}}{{missing}} Markdown linting failed - run '\''just lint-markdown-fix'\'' to fix{{nc}}\n'; exit 1; }
    @printf '\n'

# Lint YAML files with yamlfmt
lint-yaml:
    @printf '{{yellow}}\n************ YAML LINTING (YAMLFMT) ***********{{nc}}\n\n'
    @yamlfmt -lint . && printf '{{green}}{{checkmark}} YAML linting passed{{nc}}\n' || { printf '{{red}}{{missing}} YAML linting failed - run '\''just lint-yaml-fix'\'' to fix{{nc}}\n'; exit 1; }
    @printf '\n'

# Lint GitHub Actions with actionlint
lint-actions:
    @printf '{{yellow}}\n************ GITHUB ACTIONS LINTING (ACTIONLINT) ***********{{nc}}\n\n'
    @actionlint && printf '{{green}}{{checkmark}} GitHub Actions linting passed{{nc}}\n' || { printf '{{red}}{{missing}} GitHub Actions linting failed{{nc}}\n'; exit 1; }
    @printf '\n'

# Check for secrets with gitleaks - only scan commits different from main
lint-secrets:
    @printf '{{yellow}}\n************ SECRET SCANNING (GITLEAKS) ***********{{nc}}\n\n'
    @# Get the default branch (usually main or master)
    @default_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@' || printf 'main'); \
    current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); \
    if [ "$current_branch" = "$default_branch" ]; then \
        printf 'On default branch, scanning all commits...\n'; \
        gitleaks detect --no-banner; \
    else \
        printf 'Scanning commits different from %s...\n' "$default_branch"; \
        gitleaks detect --no-banner --log-opts="$default_branch..HEAD"; \
    fi && printf '{{green}}{{checkmark}} No secrets found{{nc}}\n' || { printf '{{red}}{{missing}} Secret scanning failed{{nc}}\n'; exit 1; }
    @printf '\n'

# Lint publiccode.yml
lint-publiccode:
    @printf '{{yellow}}\n************ PUBLICCODE.YML LINTING (PUBLICCODE-PARSER) ***********{{nc}}\n\n'
    @publiccode-parser -no-network /dev/stdin <publiccode.yml && printf '{{green}}{{checkmark}} publiccode.yml is valid{{nc}}\n' || { printf '{{red}}{{missing}} publiccode.yml validation failed{{nc}}\n'; exit 1; }
    @printf '\n'

# Check licenses with REUSE
lint-license:
    @printf '{{yellow}}\n************ LICENSE HEALTH (REUSE) ***********{{nc}}\n\n'
    @command -v reuse >/dev/null 2>&1 || { printf 'Error: reuse not installed.\n'; printf 'Install with: apt install reuse\n'; printf 'See DEVELOPMENT.md for details.\n'; exit 1; }
    @reuse lint || exit 1
    @printf '\n\n'

# Check commits with conform
lint-commit:
    @printf '{{yellow}}\n************ COMMIT HEALTH (CONFORM) ***********{{nc}}\n\n'
    @currentBranch=$(git branch --show-current); \
    default_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@'); \
    if [ -z "$default_branch" ]; then default_branch="main"; fi; \
    commit_count=$(git rev-list --count "${default_branch}.." 2>/dev/null || printf '0'); \
    if [ "$commit_count" = "0" ]; then \
        printf '{{green}} No commits found in current branch: {{yellow}}%s{{nc}}, compared to: {{yellow}}%s{{nc}}\n' "$currentBranch" "${default_branch}"; \
        printf '{{yellow}}NOTE: Skipping commit check - no new commits{{nc}}\n'; \
    else \
        conform enforce --base-branch="${default_branch}" || exit 1; \
    fi
    @printf '\n\n'

# Fix all auto-fixable issues
lint-fix: lint-markdown-fix lint-yaml-fix
    @printf '{{green}}{{checkmark}} All auto-fixable issues resolved{{nc}}\n'
    @printf 'Note: Some issues may require manual fixes\n'

# Fix markdown issues with rumdl
lint-markdown-fix:
    @printf '{{yellow}}\n************ FIXING MARKDOWN (RUMDL) ***********{{nc}}\n\n'
    @rumdl check --fix . && printf '{{green}}{{checkmark}} Markdown files fixed{{nc}}\n' || { printf '{{red}}{{missing}} Failed to fix markdown files{{nc}}\n'; exit 1; }
    @printf '\n'

# Fix YAML formatting with yamlfmt
lint-yaml-fix:
    @printf '{{yellow}}\n************ FIXING YAML (YAMLFMT) ***********{{nc}}\n\n'
    @yamlfmt . && printf '{{green}}{{checkmark}} YAML files formatted{{nc}}\n' || { printf '{{red}}{{missing}} Failed to format YAML files{{nc}}\n'; exit 1; }
    @printf '\n'


