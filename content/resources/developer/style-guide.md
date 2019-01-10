---
title: "Gen3 - Style Guide"
date: 2018-11-07T16:58:29-05:00
linktitle: /resources/developer
layout: withtoc
menuname: developerMenu
---

# Summary

* [Python Style Guide]
* [Markdown Style Guide]
* [Javascript Style Guide]
* [CSS Style Guide]
* [Go Style Guide]

# Python Style Guide
[Python Style Guide]: #python-style-guide

For python code we use [black][black], an automatic code formatter. In general
this should handle all the trivial points of code formatting. For developing
python code, install black and either run it on your code before committing or
set up a plugin in your editor to run it automatically (explained in the `black`
README).

## Best Practices

* Use implicit boolean-ness when possible. Sometimes comparing against `None`
  specifically is required, in which case use `if _ is None` or `if _ is not
  None`. Examples:

```python
# Good
if not my_list:
# Bad
if len(my_list) == 0:

# Good
if my_boolean:
# Bad
if my_boolean == True:
```

* Prefer list, dictionary, or generator comprehensions over loops where
  possible.
* Use `assert` only for tests; for unexpected function inputs use `ValueError`.
* Use underscore-prefixed names for "private" definitions.
* Use descriptive names and avoid single-letter variable names except for inside
  iterators/generators where the variable is obvious (for example a range of
  integers) and exceptions (where the variable should be named `e`).
* [Don't use mutable default arguments.][mutable-defaults]
* Use properties instead of getters/setters.

## Variable Naming

* `snake_case` style is the default style and applies to everything not
  specified by a different style, including: variables, functions (and methods),
  arguments, packages, and modules.
* `PascalCase` style applies to classes (including exceptions).
* `SCREAMING_SNAKE_CASE` style applies to global variables and constants.

## Logic

Handle exceptional cases first where possible, and leave the "normal" flow of
operation at the lowest level of indentation. For example:
```python
# Good
def check_string(string):
    if string == "unexpected":
        return "that was unexpected"
    return "your string is: {}".format(string)

# Bad
def check_string(string):
    if string != "unexpected":
        return "your string is: {}".format(string)
    else:
        return "that was unexpected"
```

## Documentation

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

# Markdown Style Guide
[Markdown Style Guide]: #markdown-style-guide

* Lines should wrap at 80 characters long.
* There should be a blank line before and after section headings:

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

# CSS Style Guide

[CSS Style Guide]: #css-style-guide

## General Structure

* Use class selectors (.class-name instead of #class-name)
* Separate class names with hypens instead of camel case (.class-name instead of .className)=
* The CSS file should be named {component}.css, and be in the same folder as the component. It is then imported into the component's .jsx file.

## Naming

We are moving toward using the BEM methodology in terms of CSS organizational conventions. This means we are dividing chunks of code within a component into blocks, are avoiding nesting components, and are using the naming convention of `{block}__{elements}--{modifer}`. {element} and {modifier} are optional depending on the situation - see the BEM guidelines for more examples.

## Example

Say we have a simple component called Component:

```
import './Component.css';

class Component extends React.Component {
  render() {
    return (
      <div>
        <h1>This is my component</h1>
        <button>Submit</button>
        <button>Cancel</button>
      </div>
    );
  }
}
```

Our block would be .component, and elements in that block would consist of the buttons and the title. So our CSS would look like this, based on the BEM naming conventions:

```
.component { }
.component__title { }
.component__button { }
```
And the code would look like this:
```
import './Component.css';

class Component extends React.Component {
  render() {
    return (
      <div className="component">
        <h1 className="component__title">This is my component</h1>
        <button className="component__button">Submit</button>
        <button className="component__button">Cancel</button>
      </div>
    );
  }
}
```

The buttons can also have modifiers - let's say we want two different colors depending on if the button is a submit button or a cancel button. Then our CSS and code would look something like this, respectively:

```
.component { }
.component__title { }
.component__button { }
.component__button--submit {
  color: blue;
}
.component__button--cancel {
  color: red;
}
```

```
import './Component.css';

class Component extends React.Component {
  render() {
    return (
      <div className="component">
        <h1 className="component__title">This is my component</h1>
        <button className="component__button component__button--submit">Submit</button>
        <button className="component__button component__button--cancel">Cancel</button>
      </div>
    );
  }
}
```

# Go Style Guide
[Go Style Guide]: #go-style-guide

Go provides extensive style information when talking about how to review Go
code. Additionally Go has a `gofmt` tool which should be used to auto format the
code for mechanical style.

* [Go Code Review][gocodereview]
* [Effective Go][effectivego]

## Highlights

* Use `PascalCase` for any exported definitions and `camelCase` for non-exported
  definitions.
* Don't use `panic()` for error handling; return `error` instead.
* Organize imports into logical groups with the standard libraries first.

## Code Organization

* Test files, such as `_test.go` reside alongside the respective .go file (not
  in a separate subdir).
* There should be only one package main and subsequent main.go file in your
  program.

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


[airbnb-cssjs]: https://github.com/airbnb/javascript/tree/master/css-in-javascript
[airbnb-js]: https://github.com/airbnb/javascript
[airbnb-react]: https://github.com/airbnb/javascript/tree/master/react
[airbnb-react]: https://github.com/airbnb/javascript/tree/master/react
[black]: https://github.com/ambv/black
[effectivego]: https://golang.org/doc/effective_go.html
[gocodereview]: https://github.com/golang/go/wiki/CodeReviewComments
[google-js]: https://google.github.io/styleguide/jsguide.html
[google-python-docstrings]: http://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html
[google-python]: https://google.github.io/styleguide/pyguide.html
[organizinggo]: https://talks.golang.org/2014/organizeio.slide#1
[mutable-defaults]: https://docs.python-guide.org/writing/gotchas/#mutable-default-arguments
[pep8]:  https://www.python.org/dev/peps/pep-0008/
[polished]: https://polished.js.org/
[pylint]: https://www.pylint.org/
[reStructuredText]: http://www.sphinx-doc.org/en/stable/rest.html
[styledcomponents]: https://www.styled-components.com/
