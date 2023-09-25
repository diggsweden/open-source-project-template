<!--
SPDX-FileCopyrightText: 2023 Digg - Agency for Digital Government

SPDX-License-Identifier: CC0-1.0
-->

# Open Source Project Template

[![Standard commitment](https://github.com/publiccodenet/standard/blob/develop/assets/standard-for-public-code-commitment.svg)](https://github.com/diggsweden/open-source-project-template/blob/main/CONTRIBUTING.adoc#standard-for-public-code)
[![REUSE status](https://api.reuse.software/badge/github.com/diggsweden/open-source-project-template)](https://api.reuse.software/info/github.com/diggsweden/open-source-project-template)

This a template project containing 'Community Health Files' and relevant checklists.
It's intention is to be a practical starter when releasing a project as Open Source.
It was created in a general way to be usable for anyone, and proposes well know conventions and de-facto standards when possible.

You _are supposed_ to adjust the contents and suggestions to suit your project needs.

---

## Contents

### Template Files

An short summary of the files in the repository, and how you can use them.
You are supposed to use the '.template' marked versions of any files if one such exists.
These can be found in the 'templates'-directory. However, you should also consider other project files mentioned here:

- LICENSE - The LICENSE containing the projects "main" LICENSE. This which must be an [OSI approved license](https://en.wikipedia.org/wiki/Open_Source_Initiative). You are not supposed to use the one in this project - add your own.
- CODE_OF_CONDUCT - defines standards for how to engage in a community. Version: [Contributor Covenant 2.1](https://www.contributor-covenant.org).
- CONTRIBUTING - the guidelines for how people can contribute to your project.
- SECURITY - instructions for how to report a security vulnerabilitity in your project.
- README- a template for creating a good informative readme.
- Issue Templates - `bug, feature and pull request templates`. Issue and pull request templates to standardize the information contributors can see when they open issues and pull requests in your repository. Might be specific for GitHub/GitLab and so on.
  - `.github/` - contains GitHub specific versions of bug-, pr, feature-templates.
  - `.github/workflows` - contains GitHub workflows for this project. You will most likely write your own workflows for your project.
- CHANGELOG - Describes the project updates in a standard human readable way. Version: [Keep-a-changelog 1.1.0](https://keepachangelog.com/en/1.1.0/).
- CODEOWNERS - Describes the maintainers in a de-facto standard way: [GitHub link about CODEOWNERS](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)

### Docs

- docs/Open_Source_Checklist- a basic checklist of questions you should be able to answer.
- docs/public_code - assesement for how this project fulfills the standard for public code criteria.
- l10n/ - contains translations for many of the files.

## Usage instructions

1. Copy the files you need into your in-progress project - Start with SECURITY.template.md, README.template.md, CHANGELOG.template.md, CONTRIBUTING.template.adoc, CODE_OF_CONDUCT.md and possibly the .github/ISSUE_TEMPLATE and .github/pull_request_template.md.
2. Remove '.template' in the filenames you copied.
3. Add a LICENSE file (do not copy the one in this project), and if needed a [CHANGELOG.md](https://keepachangelog.com/en/1.1.0/).
4. Go through each of the files and adjust to your needs
   - Correct any [Template Variables](#template-files-variables) in the Template files.
5. Answer the questions on the [Open Source Checklist:](docs/Open_Source_Checklist.adoc)

> Keep the README fresh! It's the first thing people see and will make the initial impression.
> Understand the contents of the files you use from this project. Do they fit within your project, or are you looking for something else?

In the special case that you git cloned this project and are using it as a project base (instead of copying files from it), also make sure to:

> Remove the .git-folder and create a new one with 'git init'.
> Remove any workflows that are not applicable for your application.(see the folder `.github/workflows`)
> Remove any other project specifics like l10n (translations/.reuse and so on)

## Template Files Variables

Replace the following variables with if you are using these files.

- CONTRIBUTING.template.adoc - Replace `INSERT_DAYS`. (Standard for Public Code recommends two business days)
- CODE_OF_CONDUCT.adoc - Replace `INSERT_CONTACT_METHOD`.
- SECURITY.template.md - Replace `INSERT_CONTACT_METHOD` and `INSERT_CONTACT`.
- .github/pull_request_template.md - Replace `INSERT_CONTRIBUTING_LINK`.

## Contributing

If you have questions, concerns, bug reports, etc, please file an issue in this repository's Issue Tracker.
Also, please see [CONTRIBUTING](CONTRIBUTING.adoc).

## Roadmap

There are future plans for this template project.

### Before version 0.1.0 is released

Currently, the project is undergoing a feedback revision from Foundation for Public Code, and other initial improvements.
After that, 0.1.0 will be tagged.

### Future

- Mention project excellence additions (extras in the checklist?) - OpenSSF scorecard, Foundation for Public Codes metadata standard and so on.
- Handling GOVERNANCE.md recomendations? Clearify briefly what asom digg is and how decisions are taken etc.
- Handling DEVELOPMENT.md recommendations?
- Keep the Swedish translations up-to-date
- Handling where to recommend communication channels for users and developers
- Add corresponding template versions for GitLab of the GitHub-specific templates
- Add a few graphical items to lighten up the text in the README and so on
- Your suggestions

---

## Project background

The project originated at Digg, when Digg needed a practical companion to their [Open Source Guidelines (see references)](#credits-and-references) for releasing Open Source projects.
The intent was, in particular, to fill a practical role of Appendix B _Software documentation_ in the mentioned guidelines.

The initial material was created in Digg's internal Open Source Guild, (an informal group of different interests in the organisation) who reveiwed and proposed the base material.

Seeing it could be of wider usage, we aimed to make it as general we could.
There were already quite a few variants of these template projects out there, which we used for inspiration.

### Digg's Open Source Policy Summary

A (non official summary) of Digg's Open Source Policy:

_The guidelines for open-source software aim to complement Digg's (the Swedish Agency for Digital Government) policy for the procurement and development of software.
The target audience includes those involved in software development at Digg.
These guidelines apply when developing open-source software and when Digg, as a government agency, participates in open collaborations involving shared development.
These documents include, for example, advice on procurement and risk analysis related to open source code._

---

## License

This project is licensed under the Creative Commons Zero v1.0 Universal License - see the [LICENSE](LICENSE) file for details

Most assets released are under Creative Commons CC0-1.0 except for

CODE_OF_CONDUCT.md template:

Copyright: [Contributor Covenant](https://www.contributor-covenant.org/)
License: [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/)

---

## Maintainers

General Governance of the project is currently handled by the collaboration of:

asom (arbetsgruppen för samordning av mjukvara) and Digg's Open Source Guild

For information about the current individual or team maintainers, see [CODEOWNERS](CODEOWNERS).

## Credits and References

- [Keep A Changelog](https://keepachangelog.com/)
- [Contributor Covenant](https://www.contributor-covenant.org/)
- [IEEE Open Source Maintainers Manual](https://opensource.ieee.org/community/manual/)
- [Foundation for Public Code](https://publiccode.net/)
- [Digg's internal policy and guidance document regarding Open Source](https://www.digg.se/analys-och-uppfoljning/publikationer/publikationer/2022-09-27-anskaffning-utveckling-och-publicering-av-oppen-programvara-policy-och-riktlinjer)

## Public known users of this template

- [Jitsi Outlook Plugin](https://github.com/diggsweden/jitsi-outlook)
