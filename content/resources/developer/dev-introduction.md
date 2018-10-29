---
title: "Gen3 - Dev Intro"
date: 2018-10-26T14:10:25-05:00
linktitle: /resources/developer
layout: withtoc
menuname: developerMenu
---

{{% markdownwrapper %}}
# Intro to Development on Gen3

This document outlines best practices and requirements to follow for developers
working on the Gen3 stack, including topics from general development guidelines,
to our standard git workflows, to repository structure, and more.

## General Development Philosophy

We summarize best development practices with three central tenets (in no
particular order!).

* Make your fellow developers happy.
* Make your fellow devops happy.
* Make your users happy.

There are many aspects that go into each of these. Some fall under multiple or
all categories:

* Unit test (untested code is broken code).
* Use the most efficient algorithms and datastructures in implementation.

### Making Devs Happy

* Name things clearly (not longer than necessary, but long enough to be clear
  and readable).
* Document things that might not be clear to someone else (or to you, 3 months
  from now).
    * For documentation aim to explain not *what* (things like what a function
      is supposed to output—which should hopefully be obvious from your code)
      but *why* and *how*: how is this function used elsewhere, why are any
      idiosyncracies necessary, how does it interface with the rest of the code?
* Modularize separate functionalities and aim to write reusable code.
* Follow the applicable style guide.
* Make code simple to extend and refactor.

### Making DevOps Happy

* Test deploying your code in your dev namespace, and make sure it's functional
  end-to-end before asking for review.
* Avoid making breaking changes unless absolutely necessary (to avoid headaches
  with configuring new deployments).

### Making Users Happy

Perhaps the most complicated of the three tenets, but ultimately the most
important. Users vary in intent and level of technical competence: some will
only ever use the simplest portal features, some will be versed in using GraphQL
for querying data, some will never touch the portal and work directly with API
calls.

* Strive to make user interfaces intuitive, whether in frontend design or API
  endpoints and general API design.
* For APIs in particular, if a user will use it, include documentation somewhere
  that explains how to use it. More generally: if *anyone* will use it—explain
  how to use it.

## GitHub Usage

It's helpful to add a global `.gitignore` file with typical entries, such as
`.DS_Store` on OS X, or `*.swp` files for vim users.

### Naming Conventions

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

### Pull Requests (PRs)

To link a PR on GitHub to Jira, add its identifier `PXD-{NUMBER}` in the PR
title.

**Before submitting a PR for review, try to make sure you've accomplished these things:**

* The PR:
    * contains a brief description of what it changes and/or adds,
    * passes status checks,
    * maintains or increases code coverage,
    * and follows the style guidelines for applicable languages.
* If the PR implements a bug fix, it includes regression tests.
* If the PR should synchronize with Jira, the PR title includes the story
  number.
* The PR addresses a specific issue, and not multiple issues at once.

**To merge the PR:**

* If the branch now has conflicts with the master branch, follow these steps to
  update it:

```
git checkout master
git pull origin master
git checkout $YOUR_BRANCH_NAME
git merge master
git commit
# The previous command should open an editor with the default merge commit
# message; simply save and exit
git push
```

* Merge using the default merge strategy (not squash or rebase). If you have
  many small or unnecessary commits, use `git rebase` to squash these before
  merging. For example, `git rebased -i HEAD~5` will allow you to select commits
  from the previous 5 commits to squash.

**After merging the PR:**

* Delete the branch from GitHub.
* If necessary, create a new release version (click the `Releases` tab in the
  main GitHub page).

## Kubernetes

We use Kubernetes (sometimes abbreviated as k8s) to orchestrate our deployments.
Individual services build into Docker images which run in the Kubernetes
cluster.

### Working With Kubernetes Dev Namespaces

For convenience, add the following to the `~/.ssh/config` file (substituting
your actual username for `YOUR_USERNAME` in the template):

```
Host cdistest.csoc
  ServerAliveInterval 120
  HostName 10.128.2.129
  User YOUR_USERNAME
  ForwardAgent yes
```

With this you should be able to run `ssh cdistest.csoc`. Ask devops to
add your public key if necessary.

A couple useful commands are:
```
# List the pods running in kubernetes
kubectl get pods

# Output information about the `gen3` command
gen3 help
```

You'll want to learn a lot more about basic Kubernetes commands in order to
interact with the services running in your namespace. The Kubernetes
documentation includes a number of [useful tutorials][k8s-tutorials].

Once the kubernetes cluster in your dev namespace is running, you should have a
functioning data portal at https://YOUR_USERNAME.planx-pla.net.

See the information at [this page][k8s-dev] for more details.

## Logging

### Log Level

Logging serves three main purposes: security compliance, incident management,
and debugging. Depending on the purpose of the logs, choose which log level to
use and decide how to structure logs to make them useful for that purpose.

#### ERROR

> *Something is  wrong and it breaks the system; this needs to be addressed by an administrator now.*

Examples:

* Failure to communicate with database.
* Failure to communicate with another service.

Expected and handled failures should NOT log as `ERROR` to avoid creating noise.
As much as possible reserve `ERROR`-level logs to assist in diagnosing major
problems.

Note that in Python, `log.exception` has this same log level as `log.error`. Use
`log.exception` when the traceback is valuable to diagnose the problem.

An example of correct usage of `log.exception` would be in a Flask API error
handler: after it handles all expected errors, it should also handle any general
`Exception`; in this case we need to use `log.exception` to have the traceback
available to see what’s going on.

#### WARN

> *Something might be wrong and likely needs to be addressed soon.*

Alternatively:

> *Execution encountered an exceptional case which can be handled but leads to
> undesirable behavior.*

#### INFO

> *Some action needs to be logged as an important state change or for security compliance.*

Examples:

* Created/deleted a user.
* Started/finished database migration.

Avoid overly verbose logging at the `INFO` level, to avoid creating unnecessary
noise in prod logs.

#### DEBUG

> *Statement useful for debugging purposes only.*

Examples:

* Attempting to connect to an external API.

`DEBUG` level logs should be sufficiently informative for a developer to have a
clear picture of what's going on when reproducing a bug, just looking at the
logs.

The value of debug statements may change over time as the software evolves; we
need to routinely review our current logging to remove noise and add more useful
traces.

### Log Message Structure

The log message should form an entire sentence understandable by a developer
who didn't write the relevant code, and provide additional context to the
message beyond (for example) "failed to do X".

In detail, using a generic error as an example, the log message should try to
provide information about why this action was attempted, what caused the
failure, how (if at all) it is handled, and what consequences this will have.

## Python

For getting set up for general Python development, install [virtualenv][] and
[virtualenvwrapper][]. Set up a separate virtual environment for every package
you work on to avoid dependency conflicts.

### Repository Setup

Use [this guide][sample-repository] as a reference for creating new
repositories/directories. Use the Apache License 2.0 in the `LICENSE` file (this
file can be found in most `uc-cdis` repositories) and the following `NOTICE`
(with the current year):
```
Copyright 2017 University of Chicago

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
```

### Style

For Python code we use [black][] to automatically apply formatting. Install a
plugin for your editor of choice or run it on code before committing. For
details on python style see the [python style guide][python-style-guide].

### Dependencies

Python repositories must contain a `setup.py` file, and generally also contain a
`requirements.txt` file. Currently we use the `requirements.txt` as a lock file,
containing the exact versions for all packages installed in a working build
(basically, the output of `pip freeze`):
```
requests==2.19.1
```
The `setup.py` file has ranges for the permitted dependency versions:
```
"requests>=2.19.1,<3.0.0"
```

Dependencies on git repositories (such as another CDIS codebase) include
the package name in `setup.py`:
```
# setup.py
cirrus
```
And include the URL in `requirements.txt`using the `-e` flag and a *specific
version number, not a branch name* (though specifying a branch may be
temporarily necessary while developing a feature in two related repositories):
```
# requirements.txt
-e git+https://github.com/uc-cdis/cirrus.git@0.1.5#egg=cirrus-0.1.5
```

If any dependencies are necessary only for tests or development, they are added
to a `dev-requirements.txt` file, and not the `requirements.txt` file.

### Performance Testing

Python includes the profiling tool [`cProfile`](https://docs.python.org/2/library/profile.html#module-cProfile).

A useful tool for visualizing profiling results is
[`snakeviz`](https://jiffyclub.github.io/snakeviz/) (install with `pip install
snakeviz`). Given the results from `cProfile`, for instance, in a file called
`profile`, running the command
```
snakeviz profile
```
will open the profiling results in an interactive viewer in a browser.

For a Flask app, there is a specific way to generate profiling results.
```python
from werkzeug.contrib.profiler import ProfilerMiddleware
app.wsgi_app = ProfilerMiddleware(app.wsgi_app, f, profile_dir='profile')
```
This will output profiling results in files such as
`profile/POST.path.001095ms.1505431939.prof` whenever the application handles a
request. Specifically with this example, this file would contain just the
results for sending a `POST` to the endpoint `path`, which took 1.095 seconds
(1095 ms) to handle.

## Go

### Style

Use `go fmt` to automatically apply formatting, and follow the [go style
guide][go-style-guide].

### Containerization

Go binaries can be containerized into Docker images with very small sizes (1s or
10s of megabytes) which build very quickly, using a particular structure in the
`Dockerfile`.

Take the `Dockerfile` from [arborist][] (at the time of writing) as an example:

```dockerfile
FROM golang:1.10 as build

RUN mkdir -p /go/src/github.com/uc-cdis/arborist
WORKDIR /go/src/github.com/uc-cdis/arborist
ADD . .
RUN go build -ldflags "-linkmode external -extldflags -static" -o bin/arborist

FROM scratch
COPY --from=build /go/src/github.com/uc-cdis/arborist/bin/arborist /arborist
ENTRYPOINT ["/arborist"]
```

Using `ENTRYPOINT`, command-line arguments can be passed from the docker command
to the executable.

### Dependencies

Currently there aren't any *ideal* solutions to handle dependencies for go
repositories. A good approach is to "vendor" the dependencies, checking out
copies of their repositories (at exactly the necessary version) in a `vendor/`
directory at the root of the repository. Go knows to use these for imports in
the package; for example `import "github.com/uc-cdis/go-authutils/authutils"`
will load the code from `vendor/github.com/uc-cdis/go-authutils` to use for this
import.

A good tool to use for managing dependencies and vendored code is [dep][go-dep],
which allows you to add dependencies to the `vendor/` directory and keep a
lockfile (`Gopkg.lock`) and a file with version constraints (`Gopkg.toml`); see
the [`dep` documentation][go-dep-docs] for more information.

## JavaScript

### Style

Follow the [JavaScript style guide][js-style-guide].

## Licensing and Attribution

We license our code under the [Apache License 2.0](apache). Every repository
should include a `LICENSE` file in the root directory with the contents of the
Apache license, as well as a `NOTICE` file containing the following:

```
Copyright {YEAR} University of Chicago

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
```

### License Compatibility & Note on Stack Overflow

At the time of writing, code provided in answers on Stack Overflow is
[licensed][SO-licensing] under [CC BY-SA 3.0][]. Currently there are [no other
licenses][CC-compatible] compatible with this license, including Apache 2.0, the
license we use for our code. While there are further considerations for [fair
use][fair-use] under US copyright law, in general you should not copy code from
SO, *with or without attribution*.

[CC BY-SA 3.0]: https://creativecommons.org/licenses/by-sa/3.0/
[CC-compatible]: https://creativecommons.org/share-your-work/licensing-considerations/compatible-licenses
[SO-licensing]: https://stackoverflow.com/help/licensing
[apache]: https://www.apache.org/licenses/LICENSE-2.0
[arborist]: https://github.com/uc-cdis/arborist
[black]: https://github.com/ambv/black
[fair-use]: https://www.copyright.gov/fair-use/more-info.html
[go-dep]: https://github.com/golang/dep
[go-dep-docs]: https://golang.github.io/dep/docs/introduction.html
[go-style-guide]: ../style-guide#go-style-guide
[js-style-guide]: ../style-guide#javascript-style-guide
[k8s-dev]: https://github.com/uc-cdis/cdis-wiki/blob/master/dev/K8s-dev.md
[k8s-tutorials]: https://kubernetes.io/docs/tutorials/
[python-style-guide]: ../style-guide#python-style-guide
[sample-repository]: https://www.kennethreitz.org/essays/repository-structure-and-python
[virtualenv]: https://virtualenv.pypa.io/en/stable/
[virtualenvwrapper]: https://virtualenvwrapper.readthedocs.io/en/latest/

{{% /markdownwrapper %}}
