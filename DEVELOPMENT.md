<!--
SPDX-FileCopyrightText: 2025 The Open Source Project Template Authors

SPDX-License-Identifier: CC0-1.0
-->

# Development Guide

This guide outlines the process for submitting Pull Requests and ensuring code quality in our project.

## Pull Request Checks

When you submit a Pull Request, our Continuous Integration (CI) system will run several checks automatically.
To avoid surprises and streamline the review process, we strongly recommend running these checks locally before submitting your PR.

## Running Code Quality Checks Locally

### Prerequisites

#### Step 1: Install Just (Required)

**[Just](https://github.com/casey/just)** is our command runner. Install it first:

```bash
# Choose one:
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/bin
brew install just                      # macOS/Linux via Homebrew
cargo install just                     # Via Rust
apt install just                       # Debian/Ubuntu (if available)
snap install just                      # Linux snap
```

Verify installation: `just --version`

#### Step 2: Install Required Tools

##### Option A: Using mise with .mise.toml (Recommended)

**[mise](https://mise.jdx.dev/)** - Polyglot tool version manager
```bash
# Install mise
curl https://mise.run | sh
eval "$(mise activate bash)"  # Activate in shell

# Install all tools from .mise.toml
mise install

# Tools are now available in your PATH
```

The `.mise.toml` file defines exact versions for reproducible builds across local and CI environments.

##### Tools Managed by mise

All tools are installed automatically via `mise install` from `.mise.toml`:

| Tool | Purpose | Backend | Link |
|------|---------|---------|------|
| **just** | Task runner | mise | [GitHub](https://github.com/casey/just) |
| **rumdl** | Markdown linting | ubi (pre-built binary) | [GitHub](https://github.com/rvben/rumdl) |
| **yamlfmt** | YAML formatting | go | [GitHub](https://github.com/google/yamlfmt) |
| **actionlint** | GitHub Actions lint | go | [GitHub](https://github.com/rhysd/actionlint) |
| **gitleaks** | Secret scanning | go | [GitHub](https://github.com/gitleaks/gitleaks) |
| **conform** | Commit linting | go | [GitHub](https://github.com/siderolabs/conform) |
| **publiccode-parser** | publiccode.yml validation | ubi (pre-built binary) | [GitHub](https://github.com/italia/publiccode-parser-go) |

##### System Package

**[reuse](https://reuse.software/)** - License compliance tool
```bash
# Note: reuse must be installed via system package manager
apt install reuse
```

> **Why apt for reuse?** The reuse tool is a Python application that integrates with system package managers and has dependencies best handled by apt rather than mise.

### Quick Start

```bash
# 1. Install mise and tools
curl https://mise.run | sh
mise install
eval "$(mise activate bash)"

# 2. Install system packages
apt install reuse

# 3. Run quality checks
just verify
```

### Quick Reference

| Command | Description |
|---------|-------------|
| **Verification** | |
| `just verify` | Run all quality verifications |
| `just verify-deps` | Check if tools are installed |
| **Linting** | |
| `just lint` | Run all linters |
| `just lint-markdown` | Check markdown files |
| `just lint-yaml` | Check YAML files |
| `just lint-actions` | Check GitHub Actions |
| `just lint-secrets` | Scan for secrets |
| `just lint-publiccode` | Validate publiccode.yml |
| `just lint-license` | Check REUSE compliance |
| `just lint-commit` | Check commit messages |
| **Auto-fix** | |
| `just lint-fix` | Fix all auto-fixable issues |
| `just lint-markdown-fix` | Fix markdown issues |
| `just lint-yaml-fix` | Format YAML files |

### Example Workflow

```bash
# See what's available
just

# Run all verifications before committing
just verify

# Run individual checks as needed
just lint            # Just linting
just license         # Just license compliance
```

## Configuration Files

Configuration files for quality tools:

- `justfile` - Command runner definitions
- `.mise.toml` - Tool versions (single source of truth for local & CI)
- `.conform.yaml` - Commit message validation rules
- `.markdownlint.json` - Markdown linting rules
- `publiccode.yml` - Public code metadata
- `REUSE.toml` - License compliance configuration
- `.mise.toml` - Tool version management

## Quality Check Details

Our quality assurance process includes the following checks:

### 1. Linting

We use lightweight, native binary linters (see [Prerequisites](#prerequisites) for installation):

- **Markdown**: [rumdl](https://github.com/rvben/rumdl) - Fast Rust-based markdown linter
- **YAML**: [yamlfmt](https://github.com/google/yamlfmt) - Google's YAML formatter/linter
- **GitHub Actions**: [actionlint](https://github.com/rhysd/actionlint) - Static checker for workflows
- **Secrets**: [gitleaks](https://github.com/gitleaks/gitleaks) - Detect and prevent secrets

**Commands:**
```bash
# just is installed automatically via mise
# See "Quick Start" section below
```

### 2. License Compliance

We use [REUSE](https://github.com/fsfe/reuse-tool) to ensure proper license compliance.
This tool checks that every file has valid copyright information in the SPDX-standard format.

**Command:**

```bash
just license     # Check REUSE compliance
```

### 3. Commit Structure

[Conform](https://github.com/siderolabs/conform) is used to check commit messages against our project's commit guidelines. For more details, refer to the `CONTRIBUTING.md` file.

**Command:**

```bash
just commit      # Validate commit messages
```

### 4. Public Code Validation

If your project has a `publiccode.yml` file, it will be validated for correctness.

**Command:**

```bash
just publiccode  # Validate publiccode.yml
```

## Interpreting Check Results

After running the quality checks, you'll receive a summary report indicating whether all checks passed or if any failed.

The output provides colored indicators:

- ✓✓ Green checkmarks for passed checks
- ✗ Red crosses for failed checks
- ✓✓ Yellow for skipped checks (e.g., no new commits)

### Handling Failed Checks

#### Local Check Failures

1. Review the terminal output for specific error messages.
2. Fix the identified issues in your code.
3. Stage your changes (`git add`).
4. Re-run the quality verifications: `just verify`
5. Repeat until all checks pass.

#### CI Pipeline Failures

1. Run the quality verifications locally to reproduce the CI errors:

   ```bash
   just verify   # Run all verifications
   ```

2. Fix the issues in your local environment.
3. Update your Pull Request with the fixes.
4. The CI tests should now pass in the updated PR.

## Examples

Visual examples of the quality check outputs:

### CI Output Example

![Quality Check Output - CI Example](assets/quality_ci_output_example.png)

### Local Output Example

![Quality Check Output - Local Example](assets/quality_output_example.png)

## Troubleshooting

### Missing Tools Error

If you see "Missing required tools" when running `just verify`:

1. Check which tools are missing
2. Install them using the instructions in [Prerequisites](#prerequisites)
3. Ensure they're in your PATH

### Quick Install All Tools

**Using mise (Recommended)**

```bash
# Install mise: https://mise.jdx.dev/
curl https://mise.run | sh

# Install all project tools from .mise.toml
mise install

# Activate mise in your shell
eval "$(mise activate bash)"  # or zsh, fish, etc.

# Install system packages
apt install reuse  # Debian/Ubuntu
```

The project uses mise with various backends (go, ubi) to manage tool versions consistently. All tool versions are defined in `.mise.toml`.

## Additional Resources

- [Just Documentation](https://github.com/casey/just)
- [REUSE Specification](https://reuse.software)
- [Conventional Commits](https://www.conventionalcommits.org)
