# Contributing to Gen3

### How to Contribute

#### Ask questions

If you have a question, check out #gen3_community on Slack.  Here you can ask both the maintainers at the Center for Translational Data Science, University of Chicago as well as the larger Gen3 community.  Request an invite [here](https://docs.google.com/forms/d/e/1FAIpQLSczyhhOXeCK9FdVtpQpelOHYnRj1EAq1rwwnm9q6cPAe5a7ug/viewform).

You can also post to the Gen3 Forum [here](https://forums.gen3.org/).

Finally, you can send an email request to the maintainers here (support@gen3.org).

You may also create an issue in a Gen3 repo (https://github.com/orgs/uc-cdis/repositories).  If you are not sure which repo is the correct location please utilize the Gen3 Community Repo (https://github.com/uc-cdis/gen3-community).

#### Create an Issue

If you have an idea for a new feature or a bugfix, it is best to communicate with the University of Chicago Center for Translational Data Science (CTDS) developers early. Slack is a great forum for getting early feedback on an idea. You may also create an issue in GitHub. Be sure to browse through existing GitHub issues and if one seems related, comment on it.

Once you are ready, create a GitHub issue in whichever repository is appropriate (https://github.com/orgs/uc-cdis/repositories).  If you are not sure which repo is the correct location please utilize the Gen3 Community Repo (https://github.com/uc-cdis/gen3-community).

##### Issue Lifecycle

When an issue is first created, it is flagged `waiting-for-triage` waiting for a team member to triage it. Once the issue has been reviewed, the team may ask for further information if needed, and based on the findings, the issue is either assigned for further review internally or is closed with a specific status.  When a fix is ready, the issue is closed and may still be open until the fix is released.

Internal to CTDS, JIRA issues are created to track issues.

#### Submit a Pull Request

1. Note that all code contributions are subject to our Apache 2.0 license attached to each of our repositories (https://www.apache.org/licenses/LICENSE-2.0).
2. Should you create an issue first? No, just use the description of the pull request to provide context and motivation, as you would for an issue.
4. Always check out the `main` or `master` branch and submit pull requests against it. Follow naming conventions described below. This must include creating or updating unit tests as needed.
5. Run all relevant tests against your modified code before you submit a pull request.
6. If there is a prior issue, reference the GitHub issue number in the description of the pull request.
7. Ensure your PR description is populated and following the [required template](https://github.com/uc-cdis/.github/blob/master/.github/pull_request_template.md)
    - Our Gen3 Release Notes are parsed from PR descriptions. Each bullet/line under the PR template headings get into our release notes as individual bullets, so the language should be succint and high-level
    - Context, motivation, overview, and all other info about the change should go _above_ the required headings (which won’t get parsed and pulled into the Gen3 Release Notes)
8. Once your PR is made, a CTDS staff member may reach out with additional questions and/or comment directly on your PR in GitHub.

If your PR is not approved, we’ll provide feedback about the rationale and possible steps to get it approved. Reasons for not approving PRs include: does not follow Gen3 coding conventions, inconsistent with Gen3 product vision, includes new features or packages that would be hard to maintain, or inconsistent with security requirements.

If accepted, your contribution may be heavily modified as needed prior to merging. You may also be asked to rework the submission.

If asked to make corrections, simply push the changes against the same branch, and your pull request will be updated. In other words, you should not create a new pull request when asked to make changes.

##### Naming Conventions

Branches are named as `type/scope`, and commit messages are written as
`type(scope): explanation`, where

* `scope` identifies the thing that was added or modified,
* `explanation` is a brief description of the changes in imperative present
  tense (such as "add function to \_", not "added function"),
* and `type` is defined as:

```
type = "chore" | "docs" | "feat" | "fix" | "refactor" | "style" | "test"
```

Some example branch names:

* `refactor/db-calls`
* `test/user`
* `docs/deployment`

Some example commit messages:

* `fix(scope): remove admin scope from client`
* `feat(project_members): list all members given project`
* `docs(generation): fix generation script and update docs`

### Run Tests on your own Gen3 Instance

In order to appropriately test your pull requests you must have a Gen3 deployment running.  You can find instructions for how to run Gen3 using our preferred method of helm charts [here](https://github.com/uc-cdis/gen3-helm/tree/doc/gen3Setup).


### Reference Docs

#### Gen3 Documentation

[Main documentation site for Gen3](https://gen3.org)
[Helm for Gen3](https://github.com/uc-cdis/gen3-helm)

#### Git and GitHub resources

Before starting a new contribution, you need to be familiar with [Git](https://git-scm.com/) and [GitHub](https://github.com/) concepts like: ***commit, branch, push, pull, remote, fork, repository***, etc. There are plenty of resources online to learn Git and GitHub, for example:

* [Git Guide](https://github.com/git-guides/)
* [GitHub Quick start](https://docs.github.com/en/get-started/quickstart)
* [GitHub on YouTube](https://www.youtube.com/github)
* [Git and GitHub learning resources](https://docs.github.com/en/get-started/quickstart/git-and-github-learning-resources)
* [Collaborating with Pull Requests](https://docs.github.com/en/github/collaborating-with-pull-requests)
* [GitHub Documentation, guides and help topics](https://docs.github.com/en/github)
* And many more...
