---
categories: intermediate
guide: 2020-08-26-simple-guide
lang: en
layout: post
tags:
- modules
- tools
- versioning
terms: 1
title: A simple guide
toc: true
---

This guide looks to cover the basic building blocks of a
[`preguide`](https://github.com/play-with-go/preguide)-generated guide, like those found as part of the
[play-with-go.dev](https://github.com/play-with-go/play-with-go) project. Each heading covers a different aspect of the
guide authoring process.

TODO: make this a guide that demonstrates how to create a guide.

## Terminology and Overall structure

Explain:

* how guides are the result of combinding the markdown prose with a CUE specification of the "steps" in that guide, i.e.
  the commands the user will run
* the directory structure currently used by play-with-go, and how this feeds into the Jekyll frontend
* the concept of the input guide CUE package and the generated output (that can be augmented with guide author
  declarations)
* ...

We use the following terminology:

* the user - the end user who is reading and following the guide in a browser, executing the various steps via the PWD
  console
* guide author - the person who created the guide
* `preguide` - is the authoring tool used by the guide author when writing a guide. `preguide` ensures that the steps in
  a guide can be run and are reproducible
* remote session - is used to refer to the container that is driving the container that is visualised via the frontend
  terminal
* define the terms input and output. Possibly distinguish between the markdown and script input, and markdown and
  command result output. A diagram?

## Presteps

Presteps are declared by a guide author to run as each guide instance is launched. For example, for this guide we have a
prestep that creates a unique user account and repository in the source control system that supports the
`play-with-go.dev/userguides/...` modules. This therefore allows us to create a local `git` repository that uses the
that remote repository:

```.term1
$ mkdir /home/gopher/repo1
$ cd /home/gopher/repo1
$ git init
Initialized empty Git repository in /home/gopher/repo1/.git/
$ git remote add origin https://play-with-go.dev/userguides/{% raw %}{{.REPO1}}{% endraw %}.git
```
{:data-command-src="bWtkaXIgL2hvbWUvZ29waGVyL3JlcG8xCmNkIC9ob21lL2dvcGhlci9yZXBvMQpnaXQgaW5pdApnaXQgcmVtb3RlIGFkZCBvcmlnaW4gaHR0cHM6Ly9wbGF5LXdpdGgtZ28uZGV2L3VzZXJndWlkZXMve3suUkVQTzF9fS5naXQK"}

Let's add a readme file to explain what this repository is all about:

```.term1
cat <<'EOD' > /home/gopher/repo1/README.md
## Our first repo

play-with-go.dev/userguides/{% raw %}{{.REPO1}}{% endraw %} is our first remote repo!
EOD
```

Create our initial commit and push to the remote repository:

```.term1
$ git add README.md
$ git commit -m "Initial commit"
[master (root-commit) abcd123] Initial commit
 1 file changed, 3 insertions(+)
 create mode 100644 README.md
$ git push -u origin master
remote: . Processing 1 references        
remote: Processed 1 references in total        
To https://play-with-go.dev/userguides/{% raw %}{{.REPO1}}{% endraw %}.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
```
{:data-command-src="Z2l0IGFkZCBSRUFETUUubWQKZ2l0IGNvbW1pdCAtbSAiSW5pdGlhbCBjb21taXQiCmdpdCBwdXNoIC11IG9yaWdpbiBtYXN0ZXIK"}


TODO:

* make this a Go module for a library
* then create a local Go module that uses the new library and pulls that through the proxy
* explain that a guide can run multiple presteps, or none

## Different types of step

`preguide` defines two basic steps that a user can perform:

* run a sequence of commands
* uploading a file

`preguide` exposes these to the guide author as four step types (the reference to the CUE package
`github.com/play-with-go/preguide` is shortened to simply `preguide`):

* `preguide.#Command` - run a sequence of commands, providing those steps inline with the step declaration
* `preguide.#CommandFile` - run a sequence of commands, with the steps being sourced from a file
* `preguide.#Upload` - upload a file to the remote session, providing the files contents inline with the step declaration
* `preguide.#UploadFile` - upload a file to the remote session, with the file contents being sourced from a file

Within a the markdown prose

## Translations and scenarios

TODO:

Explain that:

* a guide can vary by langauge (i.e. translated into a different language, potentially with different steps specific to
  that language), and/or
* a giude can vary by scenario. e.g. a guide is predominantly writtern for Go 1.15, but alternative language (and steps)
  are provided for Go 1.14 where there are differences


## Multiple remote sessions

TODO:

Explain that:

* guides can be written to leverage multiple terminals, i.e. remote sessions. Particularly useful for client-server
  interaction examples

## Reference directives

Consider the following commands:

```.term1
$ echo "Hello world"
Hello world
$ go env GOPATH
/go
```
{:data-command-src="ZWNobyAiSGVsbG8gd29ybGQiCmdvIGVudiBHT1BBVEgK"}

Notice how the step is declared in terms of a `Defs`-declared message. We can reference that message in the prose of a
guide using a `ref` directive: `"Hello world"`.

Similarly, we can use `outref` directives to refer to the result of executing the guide script. For example, here we
reference the output from the `go env GOPATH` command directly in our prose: `/go
`.

TODO:

Explain that, as the guide author, you can include `ref` and `outref` directives to reference specific aspects of a
guide.

`ref` directives refer to `Defs` fields that are defined as part of the _input_ guide CUE package. They can be
arbitrary string values. Those `Defs` fields are then typically used within step declarations for that guide. Using
`ref` directives in this way ensures that parts of the guide prose and script stay consistent.

`outref` directives refer to `Defs` fields that are defined as part of the _output_ guide CUE package. This allows
the guide author to reference specific parts of the output
<script>let pageGuide="2020-08-26-simple-guide"; let pageLanguage="en"; let pageScenario="go115";</script>
