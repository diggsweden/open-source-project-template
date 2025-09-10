# SPDX-FileCopyrightText: 2025 The Open Source Project Template Authors
#
# SPDX-License-Identifier: CC0-1.0

# Code Quality Check
# Uses mega-linter, reuse-tool and conform to check various linting, licenses, and commit compliance.

set shell := ["bash", "-uc"]

# Colors
red := "\\e[31m"
green := "\\e[32m"
yellow := "\\e[0;33m"
nc := "\\e[0m"

# Terminal chars
checkmark := "✓"
missing := "✗"

default:
    @just --list --unsorted | grep -v "default"

# Run all quality verifications
verify: lint publiccode license commit _summary

# Run megalinter
lint: _check-deps
    @printf '%b\n************ LINTER HEALTH (MEGALINTER) ***********%b\n\n' "{{yellow}}" "{{nc}}"
    @podman run --rm --volume "$(pwd)":/repo \
        -e MEGALINTER_CONFIG='development/mega-linter.yml' \
        -e DEFAULT_WORKSPACE='/repo' \
        -e LOG_LEVEL=INFO \
        ghcr.io/oxsecurity/megalinter-java:v8.8.0 \
    && echo "LINT_PASS" > /tmp/just_lint_status \
    || echo "LINT_FAIL" > /tmp/just_lint_status
    @printf '\n\n'

# Lint publiccode.yml
publiccode: _check-deps
    @printf '%b\n************ LINTER publiccode.yml (publiccode.yml) ***********%b\n\n' "{{yellow}}" "{{nc}}"
    @podman run --rm -i italia/publiccode-parser-go -no-network /dev/stdin <publiccode.yml \
    && echo "PUBLICCODE_PASS" > /tmp/just_publiccode_status \
    || echo "PUBLICCODE_FAIL" > /tmp/just_publiccode_status
    @printf '\n\n'

# Check licenses with REUSE
license: _check-deps
    @printf '%b\n************ LICENSE HEALTH (REUSE) ***********%b\n\n' "{{yellow}}" "{{nc}}"
    @podman run --rm --volume "$(pwd)":/data docker.io/fsfe/reuse:5.0.2-debian lint \
    && echo "LICENSE_PASS" > /tmp/just_license_status \
    || echo "LICENSE_FAIL" > /tmp/just_license_status
    @printf '\n\n'

# Check commits with conform
commit: _check-deps
    @printf '%b\n************ COMMIT HEALTH (CONFORM) ***********%b\n\n' "{{yellow}}" "{{nc}}"
    @currentBranch=$(git branch --show-current); \
    if [[ "$(git rev-list --count main..)" == 0 ]]; then \
        printf "%s" "{{green}} No commits found in current branch: {{yellow}}$currentBranch{{nc}}, compared to: {{yellow}}main{{nc}} {{nc}}"; \
        echo "COMMIT_SKIP" > /tmp/just_commit_status; \
    else \
        podman run --rm -i --volume "$(pwd)":/repo -w /repo \
            ghcr.io/siderolabs/conform:v0.1.0-alpha.30-2-gfadbbb4 \
            enforce --base-branch=main \
        && echo "COMMIT_PASS" > /tmp/just_commit_status \
        || echo "COMMIT_FAIL" > /tmp/just_commit_status; \
    fi
    @printf '\n\n'

# Check dependencies (internal)
_check-deps:
    @command -v podman >/dev/null 2>&1 || { \
        printf '%b Error:%b podman is not available in path/installed.\n' "{{red}}" "{{nc}}" >&2; \
        printf 'See https://podman.io/ for more info about the command.\n' >&2; \
        exit 1; \
    }

# Print summary (internal)
_summary:
    @printf '%b********* CODE QUALITY RUN SUMMARY ******%b\n\n' "{{yellow}}" "{{nc}}"
    @if [ -f /tmp/just_lint_status ] && grep -q "FAIL" /tmp/just_lint_status; then \
        printf '{{missing}} {{red}}Lint check failed, see logs (std out and/or ./megalinter-reports) and fix problems.{{nc}}\n'; \
    elif [ -f /tmp/just_lint_status ] && grep -q "PASS" /tmp/just_lint_status; then \
        printf '{{green}}{{checkmark}}{{checkmark}} Lint check passed{{nc}}\n'; \
    fi
    @if [ -f /tmp/just_publiccode_status ] && grep -q "FAIL" /tmp/just_publiccode_status; then \
        printf '{{missing}} {{red}}Lint of publiccode check failed, see logs and fix problems.{{nc}}\n'; \
    elif [ -f /tmp/just_publiccode_status ] && grep -q "PASS" /tmp/just_publiccode_status; then \
        printf '{{green}}{{checkmark}}{{checkmark}} Lint check for publiccode.yml passed{{nc}}\n'; \
    fi
    @if [ -f /tmp/just_license_status ] && grep -q "FAIL" /tmp/just_license_status; then \
        printf '{{missing}} {{red}}License check failed, see logs and fix problems.{{nc}}\n'; \
    elif [ -f /tmp/just_license_status ] && grep -q "PASS" /tmp/just_license_status; then \
        printf '{{green}}{{checkmark}}{{checkmark}} License check passed{{nc}}\n'; \
    fi
    @if [ -f /tmp/just_commit_status ] && grep -q "FAIL" /tmp/just_commit_status; then \
        printf '{{missing}} {{red}}Commit check failed, see logs (std out) and fix problems.{{nc}}\n'; \
    elif [ -f /tmp/just_commit_status ] && grep -q "SKIP" /tmp/just_commit_status; then \
        printf '{{yellow}}{{checkmark}}{{checkmark}} Commit check skipped, no new commits found in current branch{{nc}}\n'; \
    elif [ -f /tmp/just_commit_status ] && grep -q "PASS" /tmp/just_commit_status; then \
        printf '{{green}}{{checkmark}}{{checkmark}} Commit check passed{{nc}}\n'; \
    fi
    @printf "\n"