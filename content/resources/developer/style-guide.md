---
title: "Style Guide"
date: 2018-09-12T23:39:28-05:00
draft: true
---
{{% markdownwrapper %}}
# Summary

This RFC proposes a style guide for Python, JavaScript, Go code as well as
Markdown written by the PlanX team.

# Motivation

As noted by Guido van Rossum, "code is read much more often than it is written".
Thus, consistency and readability are valuable qualities in code, and a style
guide helps to achieve and enforce both.

* [Python Style Guide]
* [Markdown Style Guide]
* [Javascript Style Guide]
* [Go Style Guide]

# Python Style Guide
[Python Style Guide]: #python-style-guide

The python style conventions here are largely based on the style recommended by
the [PEP 8][pep8] standard. The [Google Python style guide][google-python] was
referenced for the list of topics.

## General Rules

- Indent with 4 spaces.
- All lines should be at most 79 characters long.
- Separate top-level definitions (and modules, and constants, etc.) with 2 blank
  lines; separate method definitions and "code paragraphs" (logical sections of
  code within a function or method) with 1 blank line.
- Use descriptive names and avoid single-letter variable names except for
  iterators/generators where the variable is obvious (for example a range of
  integers) and exceptions (where the variable should be named `e`).
- Use double quotes for docstrings and single quotes for string constants
  (except where the string contains single quotes and can be escaped by using
  double quotes).
- Run a linter such as [pylint][pylint] over code while writing or before
  committing, and certainly before merging in new code.
- Never use semicolons.
- Consistency is important.

## Imports

Per PEP 8, imports should be structured as follows, with the blank lines
included:

{{< highlight python "linenos=table" >}}
# standard library imports
# third-party imports
# local imports
{{< /highlight >}}

The imports within each section should ideally be alphabetized. For example:

{{< highlight python "linenos=table" >}}
from datetime import datetime, timedelta

import flask
from flask_sqlalchemy_session import current_session

from .auth import login_required, get_current_user
from .errors import Unauthorized
{{< /highlight >}}

This style makes it obvious where each import is from and easy to look for a
specific library in the list of imports.

Different libraries should be on separate lines: do

{{< highlight python "linenos=table" >}}
import math
import random
{{< /highlight >}}

not

{{< highlight python "linenos=table" >}}
import math, random
{{< /highlight >}}

## Documentation

All docstrings should be delimited by double quotes. We use the Sphinx
documentation generator, which uses reStructuredText. The Sphinx documentation
has a [good reference for reStructuredText][reStructuredText].

Docstring summaries and comments should be written in the imperative mood (and
preferably in complete sentences); for instance, write:
```
Redirect the user to the login page.
```
Rather than:
```
This function redirects the user to the login page.
```

Docstrings for trivial helper functions/methods should be one line with no
spaces around the quotation marks:
```python
def is_even(n):
    """Return a boolean indicating whether the input is even."""
    return n % 2 == 0
```
Docstrings for functions that are not trivial should be one or two lines of
concise summary on a new line after the opening quotes, followed by a blank
line, followed by further details, including sections for arguments, return
value, etc. in the [Google Python docstring style][google-python-docstrings].
(See the reference at that link for more detailed examples/specification.)
```python
def foo(bar):
    """
    Foo this bar.

    To convert the bar to a foo, it must first be converted to a baz using
    `baz_from_bar`, and then to a foo brom the baz using `foo_a_baz`.

    Args:
        bar (BarClass): a bar

    Return:
        FooClass: the foo the bar is converted to
    """
    baz = baz_from_bar(bar)
    result_foo = foo_a_baz(baz)
    return result_foo
```

## Spacing

Individual binary operators should have a space on either side:
```python
x = y + z
```
but if there are multiple binary operators with differing precedence, then, for
just the operators with the highest precedence, the spaces should be removed:
```python
x = 2.5*y + z/8.0
a = (math.pi*b + c/b) / (c - b)
```

## Breaking Long Lines

Line-breaking with `\` should be avoided; implicit line joining using
parentheses is preferred. For chaining methods and function calls, use the
following style:
```python
var = (
    obj
    .method1()
    .method2()
    .method3()
)
```
For function definitions with long arguments, use the following style:
```python
def func_with_some_very_long_arguments(
        some_very_long_argument_1, some_very_long_argument_2,
        some_very_long_argument_3):
    # Function body
```
Note that for the function definition the arguments are indented by 8 spaces
beyond the function `def`, to separate them from the indented block of the
function body. The same style applies to other lines followed by an indented
block; for example:
```python
with func_with_some_very_long_arguments(
        some_very_long_argument_1, some_very_long_argument_2,
        some_very_long_argument_3):
    # Code block
```
Alternatively, for lists and function calls, the variables/arguments can be
listed one per line with a comma after the last one:
```python
list_with_long_elements = [
    long_list_element_1,
    long_list_element_2,
    long_list_element_3,
]
```

### Long String Constants

Break up long string constants in the following style.
```python
long_string = (
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse"
    " posuere est leo, eget rhoncus libero venenatis vitae. Nulla lobortis"
    " ligula eget pretium ultricies."
)
```

## Whitespace and Blank Lines

All "sections" of code should be separated by 2 blank lines (where a "section"
is a function or class definition, import block, group of constants, etc.).
Blank lines should be used sparingly in functions and blocks of code to
delineate logical sections, like "paragraphs" of code.

In a class, there should be one blank line between each method definition,
including before the `__init__`.
```python
class Foo(object):
    """
    A class that represents a Foo.

    Do not use if you are trying to represent a Bar.
    """

    def __init__(self, qux):
        self.qux = qux

    def __str__(self):
        return 'Foo'
```

There should be no trailing whitespace at the end of any lines.

## Logic

### LBYL and EAFP

Most conditionals can be expressed either in the "look before you leap" (LBYL)
style or the "easier to ask forgiveness than permission" (EAFP) style:
```python
# LBYL style
for bar in baz:
    if bar not in foo:
        continue
    print(foo[bar])

# EAFP style
for bar in baz:
    try:
        print(foo[bar])
    except KeyError:
        continue
```
Prefer the style that leads to more readable code. The LBYL style is likely to
be preferable in cases where the code in the non-exceptional case is longer,
since it will be less nested. The EAFP style is likely to be preferable in
cases where the `try` (or analogous code block) is short.

### Empty Returns

Empty return statements are not essential; however, do write an empty return
statement when it is necessary to make obvious that the return type is None or
to clarify the control flow of a function.

## Variable Naming

- `lowercase_with_underscores` style applies to:
    - Packages
    - Modules
    - Functions
    - Non-global variables
    - Methods
    - Arguments
- `CapitalWordsNoUnderscores` style applies to:
    - Classes
    - Exceptions
- `ALL_CAPS_WITH_UNDERSCORES` style applies to:
    - Global variables

## Directory Structure

Use [this example][sample-repository] as a reference for creating new
repositories/directories. Use the Apache License 2.0 in the `LICENSE` file
(this file can be found in most `uc-cdis` repositories) and the following
`NOTICE` (with the current year):
```
Copyright 2017 University of Chicago

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
```

# Markdown Style Guide
[Markdown Style Guide]: #markdown-style-guide

- Lines should wrap at 80 characters long.
- There should be a blank line before and after section headings:

```markdown
# Foo

Some foo.

## Bar

Some bar.
```

# Javascript Style Guide
[Javascript Style Guide]: #javascript-style-guide

Airbnb and Google both have extensive javascript style guides online that are mostly consistent with each other.

* [Airbnb JS Style Guide][airbnb-js]
* [Airbnb React Style Guide][airbnb-react]
* [Airbnb css in js][airbnb-cssjs]
* [Google JS Style Guide][google-js]

## Highlights

* Pascalcase for components and classes
* Camelcase for instances, variables, and functions
* Braces for blocks - K&R style
* Spaces - not tabs - 2 space indents
* Name files with JSX with .jsx suffix
* Decouple components and redux/relay bindings to allow component re-use when possible

## CSS in Javascript

We use [styledcomponents][styledcomponents] to manage CSS in javascript with helpers from
[polished][polished].  A generic component Foo.jsx should export a component with
a standard set of CSS rules attached to it, and a user of Foo can extend
those rules via a MyFoo component.  Styledcomponents also allows an application to apply 
an application-wide theme.

## Unit tests

We use [jestjs](https://facebook.github.io/jest/).  We can setup a basic sanity-check test of a dumb React component (to guard against basic regressions) with the [enzymejs](https://github.com/airbnb/enzyme) helpers.  For example:

```
import React from 'react';
import { ProjectTable } from "./ProjectTable.jsx";
import { shallow } from 'enzyme';


test('Project table renders', () => {
  const projectList = [{
    name: "frickjack",
    experimentCount: 5,
    caseCount: 20,
    aliquotCount: 30
  }];

  const table = shallow( <ProjectTable projectList={projectList}/> );
  expect(table.find("tbody tr").length ).toBe( 1 );
  console.log( "ProjectTable looks like this: " + table.html() );
});
```

Try to structure your code so that utilities can be more thoroughly tested - ex:

```
import { asyncSetInterval } from './utils';


test('Test asyncSetInterval', (done) => {
  let callCount = 0;

  // callback takes 100ms to run
  const callback = function () {
    return new Promise(function (resolve, reject) {
      setTimeout(function () {
        callCount++;
        console.log("callCount is: " + callCount);
        resolve("ok");
      }, 150);
    });
  }

  const id = asyncSetInterval(callback, 50);
  expect(id).toBeDefined();
  console.log("Got interval id: " + id);

  // after 250ms the callback should have executed twice
  const tid = setTimeout(() => {
    console.log("After delay call count is: " + callCount);
    clearInterval(id);
    expect(callCount).toBe(2);
    done();
  }, 400);

  //console.log( "Got tid: " + tid );

  // run callback every 20ms
  // console.log( "Launching asyncSetInterval" );
});
```

## Code Organization

Try to follow these rules of thumb when possible.

Put generic (of general use), dumb (properties driven) components under src/components with a jest test case - ex:
* components/Spinner.jsx
* components/Spinner.test.jsx

Create a directory for higher level components (like a page) that assemble multiple customized child components or involve user interactions and backend orchestration - ex:
* QueryPage/ReduxFilters.jsx
* QueryPage/RelayResultTable.jsx
* QueryPage/ReduxResultsPager.jsx
* QueryPage/QueryPage.jsx

# Go Style Guide
[Go Style Guide]: #go-style-guide

Go provides extensive style information when talking about how to review Go code. Additionally Go has a `gofmt` tool which should be used to auto format the code for mechanical style.

* [Go Code Review][gocodereview]
* [Effective Go][effectivego]

## Highlights

* Pascalcase for public functions, public export variables
* Camelcase for private variables, and private functions
* Braces for blocks - K&R style
* Spaces - not tabs - 2 space indents
* Don't use panic() for error handling, return error() instead
* Organize imports into logical groups with the standard libraries first

## Code Organization

* Test files, such as _test.go reside alongside the respective .go file (not in a separate subdir)
* There should be only one package main and subsequent main.go file in your program

```
$GOPATH/
    src/
        github.com/user/repo/
            mypkg/
                mysrc1.go
                mysrc2.go
            cmd/mycmd/
                main.go
    bin/
        mycmd
```

* [Organizing Go][organizinggo]

# Drawbacks

The principal drawback to a style guide is the very likely event that not
everyone will be pleased by all the stylistic decisions.

# Alternatives

The alternative is to not have a style guide.

[pep8]: https://www.python.org/dev/peps/pep-0008/
[google-python]: https://google.github.io/styleguide/pyguide.html
[pylint]: https://www.pylint.org/
[reStructuredText]: http://www.sphinx-doc.org/en/stable/rest.html
[sample-repository]: http://python-guide-pt-br.readthedocs.io/en/latest/writing/structure/#sample-repository
[google-python-docstrings]: http://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html
[airbnb-js]:https://github.com/airbnb/javascript
[airbnb-react]:https://github.com/airbnb/javascript/tree/master/react
[airbnb-cssjs]:https://github.com/airbnb/javascript/tree/master/css-in-javascript
[google-js]:https://google.github.io/styleguide/jsguide.html
[airbnb-react]:https://github.com/airbnb/javascript/tree/master/react
[styledcomponents]:https://www.styled-components.com/
[polished]:https://polished.js.org/
[gocodereview]:https://github.com/golang/go/wiki/CodeReviewComments
[effectivego]:https://golang.org/doc/effective_go.html
[organizinggo]:https://talks.golang.org/2014/organizeio.slide#1

{{% /markdownwrapper %}}