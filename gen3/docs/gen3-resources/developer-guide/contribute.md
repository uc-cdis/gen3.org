# Contributing to Gen3

## How to Contribute

### Ask questions

If you have a question, check out #gen3_community on Slack.  Here you can ask both the maintainers at the Center for Translational Data Science, University of Chicago as well as the larger Gen3 community.  Request an invite [here](https://docs.google.com/forms/d/e/1FAIpQLSczyhhOXeCK9FdVtpQpelOHYnRj1EAq1rwwnm9q6cPAe5a7ug/viewform).

You can also post to the Gen3 Forum [here](https://forums.gen3.org/).

Finally, you can send an email request to the maintainers here (support@gen3.org).

You may also [create an issue](#create-an-issue) in GitHub.

### Provide updates to documentation

#### Technical documentation

Gen3 documentation is constantly evolving.  If you see an error or omission we would greatly appreciate a pull request with an update.  Just as with submitting any [Gen3 code pull requests](#submit-a-pull-request), feel free to reach out in advance to discuss a proposed documentation update.

#### Tutorials

Beyond the basic documentation, having an end to end tutorial on a particular topic can extraordinarily helpful.  Please feel free to suggest such a tutorial.

### Participate in community events or on Slack

Gen3 has a [community forum](https://gen3.org/community/events/) every other month where CTDS or other Gen3 users/operators present on topics of mutual interest to the community.  We are always looking for contributions so please recommend topics or volunteer to present if a call is made to the community.  Your experiences are valuable for the rest of the community to learn from!

Your participation in the community Slack channel is also very much appreciated.  If you know the answer to a question or have something to contribute please speak up!


### Create an Issue

If you have an idea for a new feature or a bugfix, it is best to communicate with the University of Chicago Center for Translational Data Science (CTDS) developers early. Slack is a great forum for getting early feedback on an idea. You may also create an issue in GitHub. Be sure to browse through existing GitHub issues and if one seems related, comment on it.

Once you are ready, create a GitHub issue in whichever [Gen3 repository](https://github.com/orgs/uc-cdis/repositories) is appropriate .  If you are not sure which repo is the correct location please utilize the [Gen3 Community Repo](https://github.com/uc-cdis/gen3-community).


#### Issue Lifecycle

When an issue is first created, it is flagged `waiting-for-triage` waiting for a team member to triage it. Once the issue has been reviewed, the team may ask for further information if needed, and based on the findings, the issue is either assigned for further review internally or is closed with a specific status.  When a fix is ready, the issue is closed and may still be open until the fix is released.

Internal to CTDS, JIRA issues are created to track issues.

### Submit a Pull Request

You may submit updates to code or documentation by creating a pull request.

1. Note that all code contributions are subject to our Apache 2.0 license attached to each of our repositories (https://www.apache.org/licenses/LICENSE-2.0).
2. Background information

    * Should you create an issue first? No, just use the description of the pull request to provide context and motivation, as you would for an issue.
    * If your code update is at all complicated you will likely be asked to fill out a Community Feature Document to help the  Gen3 team review your PR.  You can find the template [here](https://docs.google.com/document/d/1P2dfqnSH-e7OX1Hw62sDL8zcR7gZp4d152TlDBlomDc/edit?tab=t.0#heading=h.5e0lej9k5tiv).  Please make a copy, and provide with your PR either as an attachment or provide a shareable link to a completed version.  Sharing as a Google doc may be helpful to allow for comments and discussion between you and the Gen3 team.

3. Always check out the `main` or `master` branch and submit pull requests against it.

    * Your pull request should include any new or modified tests, as needed. Consider both unit and integration tests. Please refer to the [documentation for Gen3 integration tests](https://github.com/uc-cdis/gen3-code-vigil/blob/master/gen3-integration-tests/README.md).
    * Follow naming conventions described below.

4. Run all relevant tests against your modified code before you submit a pull request.
5. If there is a prior issue, reference the GitHub issue number in the description of the pull request.
6. Ensure your PR description is populated and following the [required template](https://github.com/uc-cdis/.github/blob/master/.github/pull_request_template.md)

    * Our Gen3 Release Notes are parsed from PR descriptions. Each bullet/line under the PR template headings get into our release notes as individual bullets, so the language should be succinct and high-level
    * Context, motivation, overview, and all other info about the change should go _above_ the required headings (which won’t get parsed and pulled into the Gen3 Release Notes)

7. Once your PR is made, a CTDS staff member may reach out with additional questions and/or comment directly on your PR in GitHub.

If your PR is not approved, we’ll provide feedback about the rationale and possible steps to get it approved. Reasons for not approving PRs include: does not follow Gen3 coding conventions, inconsistent with Gen3 product vision, includes new features or packages that would be hard to maintain, or inconsistent with security requirements.

If accepted, your contribution may be heavily modified as needed prior to merging. You may also be asked to rework the submission.

If asked to make corrections, simply push the changes against the same branch, and your pull request will be updated. In other words, you should not create a new pull request when asked to make changes.

#### Naming Conventions

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

#### Run Tests on your own Gen3 Instance

In order to appropriately test your pull requests you must have a Gen3 deployment running.  You can find instructions for how to run Gen3 using our preferred method of helm charts [here](https://github.com/uc-cdis/gen3-helm/tree/doc/gen3Setup).


## Reference Docs


### Git and GitHub resources

Before starting a new contribution, you need to be familiar with [Git](https://git-scm.com/) and [GitHub](https://github.com/) concepts like: ***commit, branch, push, pull, remote, fork, repository***, etc. There are plenty of resources online to learn Git and GitHub, for example:

* [Git Guide](https://github.com/git-guides/)
* [GitHub Quick start](https://docs.github.com/en/get-started/quickstart)
* [GitHub on YouTube](https://www.youtube.com/github)
* [Git and GitHub learning resources](https://docs.github.com/en/get-started/quickstart/git-and-github-learning-resources)
* [Collaborating with Pull Requests](https://docs.github.com/en/github/collaborating-with-pull-requests)
* [GitHub Documentation, guides and help topics](https://docs.github.com/en/github)
* And many more...
