<!--
SPDX-FileCopyrightText: 2025 The Open Source Project Template Authors

SPDX-License-Identifier: CC0-1.0
-->

# The Open Source Checklist

## About

It is easy to overlook a few important tasks when releasing and enhancing an Open Source Project. This checklist is here to assist your project with suggestions for good health, development practices and security.

Use this checklist practically - as a discussion starter for the project and as a foundation for future improvements.

## Archiving and Deprecating a Project

- Should use the platform's "Archival" function. This way, it becomes read-only, including the issues board, and is flagged as inactive.
- Should state in the README that the project is no longer maintained.
- Should be archived if there are no maintainers.

## Documentation

- Must ensure that the project complies with the basic conventions of Community Health Files (CHANGELOG, CONTRIBUTING, CODE_OF_CONDUCT etc.).  
  Please refer to the [README.md - Template Files Explanation Section for a list and further information about relevant files](../README.md).

- Should include any relevant usage documentation and software architecture descriptions concerning the project.

## Legal and Licensing

- Must ensure that the project's license does not conflict with third-party licenses.
- License declarations must follow the [The REUSE licensing specification](https://reuse.software/). This implies that all material offered in an Open Source project also should have clear copyright information.

### Naming and Trademarks Check

- Should ensure that the project name does not conflict with an existing project or infringe on trademarks.
  - Conduct a general search engine check for the proposed project name.
  - Perform a [Trademark Search](https://www.prv.se/en/ip-professional/trademarks/trademark-databases/).

> **Note**: It might be perfectly acceptable to use a name reminiscent of an existing trademark - if the existing trademark is used for other services/areas and is not recognized as a well-known trademark.

## People & Maintenance

- Must ensure that any maintaining team has received some education or experience regarding working with Open Source. For example, read through guides at <https://opensource.guide>.
- Must ensure that any maintaining team has a plan for handling Merge/Pull-requests (code reviews, etc.).
- Must ensure that any maintaining team has a plan for handling community issues (responding to issues, reviewing and merging pull requests).
- Must ensure that any maintaining team has someone responsible for following up on security issues.
- Must make sure that every project README has a `Maintainer` header, whether it's a team, an individual, or a role.

- Should discuss if there is a need for a release plan. If so, ensure it is clear how it should be announced and promoted.
  - Additionally, the project SHOULD use a CODEOWNERS file. A CODEOWNERS file can provide more granularity in describing project maintenance, whereas the README's Maintainer heading might be more general.

## Project Quality

- Must verify that the project has undergone a code review.
- Should discuss and establish the project's testing goals and ambitions.
- Should make it easy to use the project - documentation, examples, pre-built releases, etc.

## Release and Versioning

- Should use semantic versioning and release tags.

## Security

This part of the checklist is based on the [Open Source Security Foundation (OpenSSF) guide for more secure open source development](https://github.com/ossf/wg-best-practices-os-developers/blob/main/docs/Concise-Guide-for-Developing-More-Secure-Software.md), version: 2023-06-14, [(and companion post)](https://openssf.org/blog/2024/04/15/open-source-security-openssf-and-openjs-foundations-issue-alert-for-social-engineering-takeovers-of-open-source-projects/).

### General

- Must use two-factor authentication (2FA) or multifactor authentication (MFA) to make it harder for account takeovers.
- Must limit merge and push rights to specific branches.
- Must have enabled branch protection.
- Must have a practice of signed commits.

- Should have a basic knowledge of committers and maintainers, and must do a periodic review of those.
- Should have automated testing and test coverage practices, including tests for negative cases, to detect bugs and secure the project.

### Contribution

- Should have a practice of code reviews.
- Should have good readability and scope requirements to ensure new PRs are not obfuscated, and use of opaque binaries is minimized.

### Dependencies and Vulnerabilities Detection

- Must use SCA-tools in the CI pipeline to detect vulnerabilities and license incompatibilities.
- Must use linter tools in the CI pipeline to detect vulnerabilities and bad development practices.
- Must use secret scanning tools to detect secrets (passwords, logs, tokens).
- Must use automated tooling to monitor dependency updates for critical vulnerabilities.
- Must have maintenance to quickly handle updating vulnerabilities.

- Should use SAST-tools in the CI pipeline to detect potential vulnerabilities and bad software practices.
- Should evaluate the health of every new direct project dependency that is added to the project.
- Should prefer using package managers (at the system, language, and container level) for automatic and consistent dependency updates.

### Publishing

- Must produce an SBOM (Software Bill of Materials) for the project so that end-users and systems can verify vulnerabilities and license incompatibilities.
- Must limit software publishing rights of artifacts.

- Should sign any project releases.
- Should make it easy for end-users to upgrade to new releases. Use semantic versioning, support stable APIs, and flag deprecation early.

### Policy

- Must have a security policy in place - it should contain information about where to report non-disclosure vulnerabilities and the process regarding the report.

Secure software practices and tooling from OpenSSF and OWASP:

### Tooling

- [OpenSSF guide to security tools](https://github.com/ossf/wg-security-tooling/blob/main/guide.md#readme).
- [OWASP Application Security Tools](https://owasp.org/www-community/Free_for_Open_Source_Application_Security_Tools)
- [OpenSSF Scorecards for repository security](https://github.com/ossf/scorecard)

### Guides

- [OpenSSF's Concise Guide for Evaluating Open Source Software](https://best.openssf.org/Concise-Guide-for-Evaluating-Open-Source-Software)
- [CNCF Security TAG Software Supply Chain Best Practices guide](https://github.com/cncf/tag-security/blob/main/supply-chain-security/supply-chain-security-paper/CNCF_SSCP_v1.pdf).
- [OWASP Cheatsheets](https://cheatsheetseries.owasp.org/index.html).
- [OWASP Software Developer Guide](https://owasp.org/www-project-developer-guide/release/).
- [Signing artifacts in the supply chain - OpenSSF sigstore project](https://www.sigstore.dev/).
- [OWASP Application Security Verification Standard - ASVS](https://owasp.org/www-project-application-security-verification-standard/).
- [Supply-chain Levels for Software Artifacts - (SLSA)](https://slsa.dev/).

## Workflows

- May discuss your GitHub workflow - a brief summary and suggestion can be found in [CONTRIBUTING - Pull Request Lifecycle](../CONTRIBUTING.md)

## Open Source Excellence

The following will help your Open Source Project to be collaborative, reusable, accessible, and up-to-date.

- [REUSE License specification](https://reuse.software/)
  - Ensures clear and standardized license compliance across the project.

- [Conventional Commits format](https://www.conventionalcommits.org/en/v1.1.0/)
  - Provides a clear and structured project history through standardized commit messages.

- [Keep-A-Changelog format](https://keepachangelog.com/en/1.1.0/)
  - Maintains a clear and user-friendly release history.

- [Contributor Covenant guidelines](https://www.contributor-covenant.org/)
  - Establishes a social contract for respectful and inclusive collaboration.

- [OpenSSF Scorecard](https://scorecard.dev/)
  - Helps assess and improve the security health of our project.

- [PublicCode.yml](https://yml.publiccode.tools/index.html)
  - Facilitates easy metadata indexing for better discoverability of our project.

- [Standard for Public Code](https://standard.publiccode.net/)
  - Ensures the project meets criteria for public code quality and sustainability.
