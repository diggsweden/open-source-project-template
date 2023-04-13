# Open Source Project Template

This a template project. It's intention is to act as a practical helper and base line for when you want to release a project as Open Source.

Instructions

1. Create a new project, or prepare your old one.
2. Copy these files into the new project
3. Update the README, using the [README.template.md](README.template.md) and replace this README with that content.
4. Most other [Template Files](#template-files-explanation) can be used with minor modifications (see 5).
5. Correct any [Template Variables](#template-files-variables) in the Template files.
6. Remove any workflows that are not applicable for your application.(see .github/workflows)
6. If working with an existing code base, answer the questions on the [Open Source Checklist:](Open_Source_Checklist.md)
7. Continuing writing great software and tell people about it.

> Keep the README fresh! It's the first thing people see and will make the initial impression.
> If you cloned this project, DON'T forget to remove the .git-folder and create a new one with 'git init'. **You don't want to save this projects existing git history in your own project.**
> Understand the contents of the files you use from this project. Do they fit within your project, or are you looking for something else?

## Template Files Explanation

An short summary of the files in the repo, and how you can use them.

- LICENSE - The LICENSE containing the projects "main" LICENSE, which must be an [OSI approved license](https://en.wikipedia.org/wiki/Open_Source_Initiative)
- CHANGELOG - Describes the project updates in a standard human readable way. Version: [Keep-a-changelog 1.0](https://keepachangelog.com/en/1.0.0/).
- CODE_OF_CONDUCT - defines standards for how to engage in a community. Version: [Contributor Covenant 2.1](https://www.contributor-covenant.org).
- CONTRIBUTING - communicates guildelines for how people should contribute to your project.
- Issue Templates - `bug, feature and pull request templates`. Issue and pull request templates customize and standardize the information contributors when they open issues and pull requests in your repository. Might be specific for GitHub/GitLab and so on.
  - .github/ - contains GitHub specific versions of bug-, pr, feature-templates.
  - .github/workflows - contains GitHub workflows for this project. You will most likely write your own workflows for your project.
- SECURITY - instructions for how to report a security vulnerabilities in your project.
- README.template - a template with help creating a good informative readme.
- l10n/ - contains Swedish translations for most of the files.

## Template Files Variables

Replace the following variables with the correct values.

- CODE_OF_CONDUCT.adoc - Replace INSERT_CONTACT_METHOD.
- SECURITY.md - Replace INSERT_CONTACT_METHOD and INSERT_CONTACT.
- .github/pull_request_template.md - Replace INSERT_CONTRIBUTING_LINK.

## Support

If you have questions, concerns, bug reports, etc, please file an issue in this repository's Issue Tracker.

## Contributing

General instructions on _how_ to contribute should be stated with a link to [CONTRIBUTING](CONTRIBUTING.adoc).

---

## License

This project is licensed under the Creative Commons Zero v1.0 Universal License - see the [LICENSE](LICENSE) file for details

Most assets released are under Creative Commons CC0-1.0 except for

CODE_OF_CONDUCT.md template:

Copyright: [Contributor Covenant](https://www.contributor-covenant.org/)  
License: [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/)

---

## Maintainers

öSam/Digg OSPO

## Credits and References

- [Keep A Changelog](https://keepachangelog.com/)
- [Contributor Covenant](https://www.contributor-covenant.org/)
- [IEEE Open Source Maintainers Manual](https://opensource.ieee.org/community/manual/)
