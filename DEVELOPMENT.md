<!--
SPDX-FileCopyrightText: 2025 The Open Source Project Template Authors

SPDX-License-Identifier: CC0-1.0
-->

# Development Guide

This guide outlines the process for submitting Pull Requests and ensuring code quality in our project.

## Quick Start

```bash
# 1. Install mise (tool version manager)
curl https://mise.run | sh
eval "$(mise activate bash)"

# 2. Install all project tools from .mise.toml
mise install

# 3. Install system packages
apt install reuse

# 4. Run quality checks
just verify
```

## Pull Request Checks

When you submit a Pull Request, our CI system runs several checks automatically. We strongly recommend running these checks locally before submitting your PR to avoid surprises and streamline the review process.

## Prerequisites

### Required Tools

#### Tool Manager: mise

**[mise](https://mise.jdx.dev/)** manages all project tools with consistent versions across local and CI environments.

```bash
# Install mise
curl https://mise.run | sh
eval "$(mise activate bash)"  # Add to your shell config

# Install all tools
mise install
```

#### Tools Automatically Installed by mise

The `.mise.toml` file defines exact versions for reproducible builds:

| Tool | Purpose | Backend | Documentation |
|------|---------|---------|---------------|
| **just** | Task runner | mise | [GitHub](https://github.com/casey/just) |
| **rumdl** | Markdown linting | ubi | [GitHub](https://github.com/rvben/rumdl) |
| **yamlfmt** | YAML formatting/linting | go | [GitHub](https://github.com/google/yamlfmt) |
| **actionlint** | GitHub Actions linting | go | [GitHub](https://github.com/rhysd/actionlint) |
| **gitleaks** | Secret scanning | go | [GitHub](https://github.com/gitleaks/gitleaks) |
| **conform** | Commit message validation | go | [GitHub](https://github.com/siderolabs/conform) |
| **publiccode-parser** | publiccode.yml validation | ubi | [GitHub](https://github.com/italia/publiccode-parser-go) |

#### System Package

**[reuse](https://reuse.software/)** - License compliance tool

```bash
apt install reuse  # Debian/Ubuntu
```

> **Why apt for reuse?** The reuse tool is a Python application with system dependencies best handled by your package manager.

## Available Commands

### Verification Commands

| Command | Description |
|---------|-------------|
| `just` | Show all available commands |
| `just verify` | Run all quality verifications |
| `just verify-deps` | Check if tools are installed |

### Linting Commands

| Command | Description |
|---------|-------------|
| `just lint` | Run all linters |
| `just lint-markdown` | Check markdown files with rumdl |
| `just lint-yaml` | Check YAML files with yamlfmt |
| `just lint-actions` | Check GitHub Actions with actionlint |
| `just lint-secrets` | Scan for secrets with gitleaks (branch commits only) |
| `just lint-publiccode` | Validate publiccode.yml |
| `just lint-license` | Check REUSE compliance |
| `just lint-commit` | Check commit messages with conform |

### Auto-fix Commands

| Command | Description |
|---------|-------------|
| `just lint-fix` | Fix all auto-fixable issues |
| `just lint-markdown-fix` | Auto-fix markdown issues |
| `just lint-yaml-fix` | Auto-format YAML files |

## Configuration Files

| File | Purpose |
|------|---------|
| `justfile` | Command runner definitions |
| `.mise.toml` | Tool versions (single source of truth) |
| `.rumdl.toml` | Markdown linting rules |
| `.conform.yaml` | Commit message validation rules |
| `publiccode.yml` | Public code metadata |
| `REUSE.toml` | License compliance configuration |

## Quality Check Details

### 1. Markdown Linting

**Tool:** rumdl (Rust-based, ~2MB)  
**Config:** `.rumdl.toml`  
**Command:** `just lint-markdown`

Checks for common markdown issues like broken links, formatting problems, and style violations.

### 2. YAML Linting

**Tool:** yamlfmt (Go-based, ~5MB)  
**Config:** Embedded in tool  
**Command:** `just lint-yaml`

Ensures consistent YAML formatting and validates syntax.

### 3. GitHub Actions Linting

**Tool:** actionlint (Go-based, ~4MB)  
**Command:** `just lint-actions`

Static analysis for GitHub Actions workflows, catching errors before CI runs.

### 4. Secret Scanning

**Tool:** gitleaks (Go-based, ~8MB)  
**Command:** `just lint-secrets`

Scans commits for accidentally committed secrets. On feature branches, only scans commits different from main.

### 5. License Compliance

**Tool:** reuse (Python-based)  
**Config:** `REUSE.toml`  
**Command:** `just lint-license`

Ensures all files have proper SPDX license headers.

### 6. Commit Message Validation

**Tool:** conform (Go-based, ~6MB)  
**Config:** `.conform.yaml`  
**Command:** `just lint-commit`

Validates commit messages follow [Conventional Commits](https://www.conventionalcommits.org) format.

### 7. Public Code Validation

**Tool:** publiccode-parser (Go-based, ~15MB)  
**Command:** `just lint-publiccode`

Validates the `publiccode.yml` metadata file.

## Interpreting Results

The output provides colored indicators:

- ✓ Green checkmarks for passed checks
- ✗ Red crosses for failed checks
- Yellow headers for each check section

### Example Workflow

```bash
# Before committing
just verify

# If markdown fails
just lint-markdown-fix
git add .
just verify

# If YAML fails
just lint-yaml-fix
git add .
just verify
```

## Handling CI Failures

If CI fails but local checks pass:

1. Ensure you have the latest tools:

   ```bash
   mise upgrade
   mise install
   ```

2. Check you're on the correct branch:

   ```bash
   git fetch origin
   git rebase origin/main
   ```

3. Run the full verification:

   ```bash
   just verify
   ```

## Troubleshooting

### Missing Tools

```bash
# Check what's missing
just verify-deps

# Install missing tools
mise install
apt install reuse  # if needed
```

### Permission Errors

```bash
# Ensure mise is activated
eval "$(mise activate bash)"

# Check PATH
echo $PATH | grep -q .local/share/mise || echo "mise not in PATH"
```

### Tool Version Mismatch

```bash
# Update to project versions
mise install --force
```

## Visual Examples

### CI Output

![Quality Check Output - CI Example](assets/quality_ci_output_example.png)

### Local Output

![Quality Check Output - Local Example](assets/quality_output_example.png)

## Additional Resources

- [mise Documentation](https://mise.jdx.dev/) - Tool version management
- [Just Documentation](https://just.systems/) - Command runner documentation
- [REUSE Specification](https://reuse.software/) - License compliance standards
- [Conventional Commits](https://www.conventionalcommits.org/) - Commit message conventions
- [OpenSSF Best Practices](https://github.com/ossf/wg-best-practices-os-developers) - Security guidelines
- [Standard for Public Code](https://standard.publiccode.net/) - Public code quality criteria
