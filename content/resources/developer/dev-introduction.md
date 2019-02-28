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
title. Don't mention Jira numbers in the source code.

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

Some notes about how to write a decent PR description:

* Use list items to describe changes made in the PR under header-3 (e.g. `### Bug Fixes`)
  categories, the bullets will be collected by category when generating [release notes](https://github.com/uc-cdis/release-helper).
  Most projects provide PR template with predefined categories, try to use the matching
  ones and delete the unused ones.
* Any text before the first header-3 will **not** be included in the release notes, use
  this section for general comments, review hints or -
* remaining tasks with GitHub check list markdown syntax if the PR is a WIP, they'll be
  reflected in the PR list, very handy. Also prefix or tag the PR with `[WIP]` if so.
* Remove visible help tips from PR template if any.
* Add a link to GitHub-rendered page if the PR is for Markdown documentation.


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
  merging. For example, `git rebase -i HEAD~5` will allow you to select commits
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
[Pipenv][]. Set up a separate virtual environment for every package you work
on to avoid dependency conflicts, you may also want to install [pyenv][] and
[pyenv-virtualenv][] or [virtualenvwrapper][] according to personal taste.

### Repository Setup

To create a new repository, install [Cookiecutter][] and run:

```
cookiecutter gh:uc-cdis/template-repo
```

### Style

For Python code we use [black][] to automatically apply formatting. Install a
plugin for your editor of choice or run it on code before committing. For
details on python style see the [python style guide][python-style-guide].

### Dependencies

Python repositories must contain a `setup.py` file, and generally also contain a
`Pipfile` and `Pipfile.lock`. `Pipfile.lock` is a lock file, containing the exact
versions for all packages installed in a working build, generated by [Pipenv][].
`Pipfile` and `setup.py` depend on the type of the package.

In general there are two types of packages: **applications** and **libraries**.
Application is usually the one deployed and executed directly from source, without
being depended by others; while a library is always imported by applications or
other libraries.

For applications, **all** dependencies go into `Pipfile`, and dependencies for
development e.g. tests should be placed in the dev section. Depending on actual
use case, versions in `Pipfile` may or may not be pinned, because `Pipfile.lock`
eventually defines the idempotent environment.

For libraries, runtime dependencies go into `setup.py`, development dependencies
go into the dev section of `Pipfile`. In addition, `Pipfile` also includes the
runtime dependencies through an editable source-installation link like this:

```
package_name = {editable = true,path = "."}
```

Versions must not be pinned in `setup.py`, however you may specify ranges:

```
"requests>=2.19.1,<3.0.0"
```

or preferably depend on [compatible releases](https://www.python.org/dev/peps/pep-0440/#compatible-release):

```
"requests~=2.19"
```

With above rules, for both applications and libraries, you may start development
with the same command:

```
pipenv install --dev
```

And deploying applications should always be:

```
pipenv install --deploy
```

Dependencies on git repositories (such as another CDIS codebase) are not
recommended in general, because their support in Pipenv is suboptimal. In cases
this is necessary, add the URL using the `-e` flag and a *specific
version number, not a branch name* (though specifying a branch may be
temporarily necessary while developing a feature in two related repositories):

```
pipenv install -e git+https://github.com/uc-cdis/cirrus.git@0.1.5#egg=cirrus-0.1.5
```

If any dependencies are necessary only for tests or development, they are added
always to the dev section of `Pipfile`.

Pipenv is superior for its dependency resolution - it shall try to find proper
versions of all packages that matches all dependency requirements, and complain
when version conflicts are detected. In that case, you may need these commands
to identify a conflict:

```
pipenv lock
pipenv install --skip-lock
pipenv graph
```

See also:

* https://pipenv.readthedocs.io/en/latest/basics/
* https://pipenv.readthedocs.io/en/latest/advanced/#pipfile-vs-setuppy
* https://caremad.io/posts/2013/07/setup-vs-requirement/

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

### Introduction to React

For frontend development, we use a Javascript library called [React](https://reactjs.org).
React breaks down the frontend into components, or modular pieces that can be
reused across a site. The goal is to make each component generic by passing it
`props`, so that it can be used for different scenarios.

### Components

For example, say we were building a typical website. The homepage could be divided
into several components such as:

* The navigation bar
* The footer
* The header

And within these components, there would be more components:

* The navigation bar
  * Buttons
  * Dropdown menus
* The footer
  * Buttons
* The header
  * Buttons

This way, we have a modular frontend that makes developing and testing easier, and
also allows the reuse of these components in other areas.

In order to customize these generic components, they would be passed `props`.
These props are defined using the `prop-types` library, so that developers are
aware of possible and required properties for each component.

For example, if you had a component `Button`:

```
# /src/Button/index.jsx

import React from 'react';
import PropTypes from 'prop-types';
import './Button.css';

class Button extends React.Component {
  render() {
    return (
        <div class='button'>
          <a href={this.props.buttonLink}>
            Click Me!
          </a>
        </div>
    )
  }
};

Button.propTypes = {
  buttonLink: PropTypes.string.isRequired,
};

export default Button;
```

You could use the button in multiple places by passing the prop `buttonLink`:

```
# /src/Homepage/index.jsx

import React from 'react';
import Button from '../Button/.';

class Homepage extends React.Component {
  render() {
    return (
        <Button buttonLink='gen3.org' />
    )
  }
};

export default Homepage;
```

Components can also have optional and default properties. You can use default properties
as well as the ternary operator to display optional UI pieces. Continuing with the button example,
maybe in some situations the button needs to have an icon:

```
# /src/Button/index.jsx

import React from 'react';
import PropTypes from 'prop-types';
import './Button.css';

class Button extends React.Component {
  render() {
    return (
        <div class='button'>
          {
            this.props.buttonIcon ? <img href={this.props.buttonIcon} /> : null
          }
          <a href={this.props.buttonLink}>
            Click Me!
          </a>
        </div>
    )
  }
};

Button.propTypes = {
  buttonLink: PropTypes.string.isRequired,
  buttonIcon: PropTypes.string,
};

Button.defaultProps = {
  buttonIcon: null,
};

export default Button;
```

Looking back at the `Homepage` example, an icon would not be displayed here since
the `buttonIcon` property did not get passed to the `Button` component, and it was
set to a default of `null`. However in the below example, there would be an icon
displayed:

```
# /src/LoginPage/index.jsx

import React from 'react';
import Button from '../Button/.';

class LoginPage extends React.Component {
  render() {
    return (
        <Button buttonLink='gen3.org' buttonIcon='/img/icon.svg' />
    )
  }
};

export default LoginPage;
```

These default properties allow for us to make our components even more reusable,
and cover a wide variety of scenarios.

Components can also have `state`. Generally, we try to avoid using state if possible
because it can get messy when many component have their own state.

For an example with using state, say you wanted to develop a dropdown menu.
This menu would need to keep track of when it is open and when it is closed.

```
# /src/Dropdown/index.jsx

import React from 'react';
import './Dropdown.css';

class Dropdown extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isOpen: false,
    };
  }

  toggleDropdown = () => {
    this.setState({ isOpen: !this.state.isOpen });
  };

  render() {
    return (
      <div class='dropdown'>
        {
          this.state.isOpen ? (
            <div class='dropdown__menu'>
              The Dropdown Menu is open!
            </div>
          ) : null
        }
        <div class='dropdown__button' onClick={this.toggleDropdown}>
          Toggle Dropdown
        </div>
      </div>
    )
  }
}

export default Dropdown;
```

In this `Dropdown`, the `dropdown__menu` will only be displayed if the component's state
of `isOpen` is `true`. In the constructor we set it to `false` by default, and this
is togglable by clicking on the `dropdown__button` button.

### Redux

[Redux](https://redux.js.org/introduction/getting-started) is a way to keep track
of state across components, for an entire site. Each component containing its own
state can get complicated, so Redux uses the idea of a central `store` to keep
track of the larger state of components. In the above example, we used a
component's state to keep track of if a menu should be open or  not. An example
of using Redux to store state would be for things like what user is logged into
your web application. This is information that needs to be accessed in more than
one component, so instead of storing it in individual components it should be
contained in the Redux store.

### Folder Structure

When building a new component, the folder is named after the component and
generally contains 3 or 4 parts - the component implementation, the tests, the styles,
and a [Redux](https://redux.js.org/introduction/getting-started) component if necessary.

For example, if creating a component called "Header", the directory structure would be:

- Header
  - index.jsx
  - Header.test.jsx
  - Header.css
  - ReduxHeader.js

### Using the UI library

When tasked with adding frontend functionality or components to Gen3, the first
step is to decide if this new feature would be useful in other parts of Gen3.
If the answer is yes, then the ideal next step would be to add the feature as a
generic component to our [Gen3 UI Library](https://github.com/uc-cdis/gen3-ui-component),
and then import it. This way we can build a comprehensive UI library of components
that can be used across all of our development, creating a cohesive UI and also
making UI development easier in the future.

For example, if a developer were tasked with creating a dropdown menu for Windmill,
this is a component that would probably be useful in other ways in the future, so
it would be good to add it as a generic component to our UI library.

To update the UI library, follow the instructions in the [README](https://github.com/uc-cdis/gen3-ui-component).

In order to see what components are available in the UI library, first clone the
[repository](https://github.com/uc-cdis/gen3-ui-component).

To be able to view the library, you must have `npm` installed. To install this,
download [node](https://nodejs.org/en/download/). Once the installation is complete,
check that it was successful by running `node -v` and `npm -v` in the command line.

Once those dependencies are installed, `cd` into the `gen3-ui-component` directory,
and use `npm run storybook`. This will start the UI library at `localhost:9001`.
Navigate to that url to see all of our components.

If there is a component in the UI library you would like to use, you can import it.
For example:

```
import React from 'react';
import Button from '@gen3/ui-component/dist/components/Button';

class Component extends React.Component {
  render() {
    return (
      <Button link='gen3.org' />
    )
  }
}
```

There are also Gen3 fonts, colors, and other CSS styles available. If you would
like to use our CSS classes and color variables, import the Gen3 stylesheet at
the top of your `.css` file:

`@import '~@gen3/ui-component/dist/css/base.css';`

### Style

Follow the [JavaScript style guide][js-style-guide] for information about testing,
as well as the [CSS style guide][css-style-guide] for frontend development.

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
[css-style-guide]: ../style-guide#css-style-guide
[fair-use]: https://www.copyright.gov/fair-use/more-info.html
[go-dep]: https://github.com/golang/dep
[go-dep-docs]: https://golang.github.io/dep/docs/introduction.html
[go-style-guide]: ../style-guide#go-style-guide
[js-style-guide]: ../style-guide#javascript-style-guide
[k8s-dev]: https://github.com/uc-cdis/cdis-wiki/blob/master/dev/K8s-dev.md
[k8s-tutorials]: https://kubernetes.io/docs/tutorials/
[python-style-guide]: ../style-guide#python-style-guide
[virtualenv]: https://virtualenv.pypa.io/en/stable/
[Pipenv]: https://pipenv.readthedocs.io/en/latest/
[pyenv]: https://github.com/pyenv/pyenv
[pyenv-virtualenv]: https://github.com/pyenv/pyenv-virtualenv
[virtualenvwrapper]: https://virtualenvwrapper.readthedocs.io/en/latest/
[Cookiecutter]: https://github.com/audreyr/cookiecutter

{{% /markdownwrapper %}}
