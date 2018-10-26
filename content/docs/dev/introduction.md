# Intro to Development on Gen3

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

## Working With Kubernetes Dev Namespaces

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

### Log level

The purpose of logging in code is mainly for security compliance, incident management, and debugging. Depend on the purpose of the logs, we can choose which log level to use and decide how to structure our logs so it’s useful for that purpose. I only have 4 log level listed, because I think that’s enough for all cases, and adding more levels will just confuse developers.

ERROR
Something is really wrong and it breaks the system, need to be addressed by an administrator now. eg: fail to talk to the database. 
If it’s an expected and handled failure, we should NOT log as ERROR because it will just create noise and wrong signal for diagnosing any problem.
log.exception in python has the same log level(ERROR) as log.error. We use log.exception when traceback is valuable to diagnose the problem. But if log.error with a message is enough to understand what’s going on, then don’t use log.exception because it’s overly verbose. An example to use log.exception is in flask api error handler, after it handles all expected errors, it also handle general Exception which catches all unhandled errors, in this case we need to use log.exception to have traceback to know what’s going on.


WARN
Something might be wrong, need to be addressed soon. This one is rarely used.

INFO
Any action that need to be logged as important state changes or for security compliance. Eg: created/deleted a user, started/finished database migration. Should avoid verbose logging here because it creates noises for prod and might also have performance impact.

DEBUG
Actions that are useful for debugging purpose. eg: attempt to connect to an external API. The debug statements should try best effort to reach a status that if a devops turns on DEBUG mode and do a user action to reproduce a bug, a developer should be able to know what’s going on by just looking at the log. This is sometimes hard to achieve because the value of each debug statement may change overtime when the software evolve. So we need to routinely review our current logging to remove noise and add more useful traces.


### Log message structure

The log message should be English sentence that’s understandable by a developer who didn’t write this line of code. It should provide context to the message instead of just a ‘fail to do XX’, where when a devops looks at it, this doesn’t mean anything. The log message should try to provide information about why it tried to do XX at which point, what caused the failure, and what’s the consequence of this.


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
