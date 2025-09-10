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

- [Just](https://github.com/casey/just) command runner
- [Podman](https://podman.io/) (or Docker)

### Installation

```bash
# Install just (choose one method)
cargo install just                    # Via Rust/Cargo
brew install just                      # macOS/Linux via Homebrew
snap install --edge --classic just    # Linux via Snap
```

### Quick Reference

| Command | Description |
|---------|-------------|
| `just` | Show available commands |
| `just verify` | Run all quality verifications |
| `just lint` | Run MegaLinter |
| `just license` | Check REUSE compliance |
| `just publiccode` | Validate publiccode.yml |
| `just commit` | Check commit messages |

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

The development directory contains configuration files for quality tools:

- `development/mega-linter.yml` - Configuration for MegaLinter (linting rules)
- `.conform.yaml` - Commit message validation rules
- `publiccode.yml` - Public code metadata
- `REUSE.toml` - License compliance configuration
- `justfile` - Command runner definitions

## Quality Check Details

Our quality assurance process includes the following checks:

### 1. Linting

We use [megalinter](https://github.com/oxsecurity/megalinter) to perform various linting tasks:

- BASH script linting
- Markdown linting
- YAML linting
- GitHub Action linting
- Repository secret scanning (using GitLeaks and Credentials scan)

**Command:**

```bash
just lint        # Run MegaLinter
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

![Quality Check Output - Local Example](assets/quality_script_output_example.png)

## Additional Resources

- [Just Documentation](https://github.com/casey/just)
- [MegaLinter Documentation](https://megalinter.io)
- [REUSE Specification](https://reuse.software)
- [Conventional Commits](https://www.conventionalcommits.org)
