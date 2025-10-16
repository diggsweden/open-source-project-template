<!--
SPDX-FileCopyrightText: 2025 The Open Source Project Template Authors

SPDX-License-Identifier: CC0-1.0
-->

# Open Source Project Template

[![Version](https://img.shields.io/github/v/tag/diggsweden/open-source-project-template?style=for-the-badge&color=green&label=Version)](https://github.com/diggswedenn/open-source-project-template/tags])
[![REUSE](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.reuse.software%2Fstatus%2Fgithub.com%2Fdiggsweden%2Fopen-source-project-template&query=status&style=for-the-badge&label=REUSE)](https://api.reuse.software/info/github.com/diggsweden/open-source-project-template)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/diggsweden/open-source-project-template/badge?style=for-the-badge)](https://scorecard.dev/viewer/?uri=github.com/diggsweden/open-source-project-template)
![Standard for Public Code Commitment](https://img.shields.io/badge/Standard%20for%20Public%20Code%20Commitment-green?style=for-the-badge)

A template for starting open source projects with best practices built in. Copy this structure to your repository and customize it for your needs.

Based on well-established open source guidelines and practices. Suitable for any organization that wants a well-structured open source projectd.

## What's Included

**Documentation** - Common open source community health files (README, CONTRIBUTING, CODE_OF_CONDUCT, SECURITY, GOVERNANCE, CHANGELOG, CODEOWNERS)

**Compliance** - Tools for REUSE license setup, publiccode.yml for transparency, security scorecards, commit message standards

**Workflows** - Example GitHub Actions for quality checks and compliance (`.github/workflows/`)

**Templates** - Issue and PR templates for GitHub (`.github/ISSUE_TEMPLATE/`)

**Translations** - Swedish versions of key documents in `l10n/`

## Project Structure

**For THIS template project:**

- `CODE_OF_CONDUCT.md`, `CONTRIBUTING.md`, `SECURITY.md`, `GOVERNANCE.md` - Guidelines for contributing to this template
- `l10n/sv/` - Swedish translations of this project's documents
- `DEVELOPMENT.md` - How to develop and improve this template

**For YOUR new project (copy these):**

- `templates/` - All files to copy to your project (with INSERT_* placeholders)
- `templates/README.md` - Example README structure for your project
- `.github/ISSUE_TEMPLATE/` - GitHub issue templates to copy
- `.github/workflows/` - GitHub Actions workflows (customize for your needs)

## Using the Template

### Step-by-Step

| Step | Action | Details |
|------|--------|---------|
| 1 | Copy template files | Start with files from `templates/` - SECURITY, README, CONTRIBUTING, CODE_OF_CONDUCT |
| 2 | Add LICENSE | Must be [OSI-approved](https://en.wikipedia.org/wiki/Open_Source_Initiative) |
| 3 | Replace placeholders | Search for `INSERT_*` variables (see below) |
| 4 | Customize content | Adjust all files to match your project needs |
| 5 | Review checklist | Complete the [Open Source Checklist](docs/Open_Source_Checklist.md) |

### Template Files

**Core Documentation** (in `templates/`)

- **README.md** - Project description template
- **CONTRIBUTING.md** - Contribution guidelines (replace `INSERT_DAYS`)
- **CODE_OF_CONDUCT.md** - Community standards, [Contributor Covenant 2.1](https://www.contributor-covenant.org) (replace `INSERT_CONTACT_METHOD`)
- **SECURITY.md** - Security policy (replace `INSERT_CONTACT_METHOD`)
- **GOVERNANCE.md** - Decision making and roles
- **CHANGELOG.md** - Release history, [Keep-a-changelog 1.1.0](https://keepachangelog.com/en/1.1.0/)

**GitHub Integration** (in `.github/`)

- **CODEOWNERS** - Maintainers list ([GitHub docs](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners))
- **ISSUE_TEMPLATE/** - Bug report, feature request templates
- **pull_request_template.md** - PR template (replace `INSERT_CONTRIBUTING_LINK`)
- **workflows/** - CI/CD workflows (customize for your needs)

**Additional Resources**

- **docs/Open_Source_Checklist.md** - Essential questions to answer
- **docs/public_code/** - Standard for Public Code assessment
- **l10n/** - Swedish translations
- **publiccode.yml** - Machine-readable project metadata
- **REUSE.toml** - License compliance configuration

### Important Notes

**If you clone this repository** (instead of copying files):

- Remove the `.git` folder and create a fresh one (`git init`)
- Remove workflows not applicable to your project (`.github/workflows/`)
- Remove project-specific files like translations if not needed

---

## Contributing to This Template

To improve this template itself, see [CONTRIBUTING](CONTRIBUTING.md) and [DEVELOPMENT.md](DEVELOPMENT.md).

Questions or bug reports? Please file an issue in this repository's Issue Tracker.

## Roadmap

### Future Ideas

- Guidelines for recommending communication channels for users and developers
- GitLab equivalents of the GitHub-specific templates
- Graphics to make the README more visually appealing
- A simpler CODE OF CONDUCT without enforcement details
- Your suggestions

---

## Project Background

This project started at Digg when they needed a practical companion to their [Open Source Guidelines (see references)](#credits-and-references) for releasing open source projects.
It was specifically designed to fulfill the requirements of Appendix B _Software documentation_ in those guidelines.

The initial material was created by Digg's internal Open Source Guild (an informal group with diverse interests across the organization) who reviewed and proposed the base material.

Realizing it could benefit others, we made it as general as possible.
We drew inspiration from several existing template projects already out there.

### Digg's Open Source Policy Summary

An unofficial summary of Digg's Open Source Policy:

_The guidelines for open source software complement Digg's (the Swedish Agency for Digital Government) software procurement and development policy.
They're aimed at anyone involved in software development at Digg.
These guidelines apply when developing open source software and when Digg participates in open collaborations as a government agency.
The documents include advice on procurement and risk analysis related to open source code._

---

## License

This project is licensed under the Creative Commons Zero v1.0 Universal License - see the [LICENSE](LICENSE) file for details

Most assets are released under Creative Commons CC0-1.0 except for:

CODE_OF_CONDUCT.md template:

Copyright: [Contributor Covenant](https://www.contributor-covenant.org/)
License: [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/)

---

## Maintainers

For information about the current individual or team maintainers, see [CODEOWNERS](CODEOWNERS).

## Credits and References

- [Keep A Changelog](https://keepachangelog.com/en/1.1.0/) - Changelog format standard
- [Contributor Covenant](https://www.contributor-covenant.org/) - Code of conduct template
- [IEEE Open Source Maintainers Manual](https://opensource.ieee.org/community/manual/) - Best practices for maintainers
- [Foundation for Public Code](https://publiccode.net/) - Guidance for public organizations
- [Standard for Public Code](https://standard.publiccode.net/) - Quality criteria for public code
- [REUSE Software](https://reuse.software/) - License compliance specification
- [Conventional Commits](https://www.conventionalcommits.org/) - Commit message standard
- [OpenSSF Scorecard](https://scorecard.dev/) - Security best practices assessment
- [Digg's internal policy and guidance document regarding Open Source](https://www.digg.se/analys-och-uppfoljning/publikationer/publikationer/2022-09-27-anskaffning-utveckling-och-publicering-av-oppen-programvara-policy-och-riktlinjer) - Original policy framework
