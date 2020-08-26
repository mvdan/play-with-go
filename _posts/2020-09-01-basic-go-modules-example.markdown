---
categories: intermediate
guide: 2020-09-01-basic-go-modules-example
lang: en
layout: post
tags:
- modules
- tools
- versioning
terms: 1
title: A simple Go modules guide
toc: true
---

Create a module:

```.term1
$ echo {% raw %}{{{% endraw %} Hello {% raw %}}}{% endraw %}
{% raw %}{{{% endraw %} Hello {% raw %}}}{% endraw %}
$ mkdir /home/gopher/mod1
$ cd /home/gopher/mod1
$ git init
Initialized empty Git repository in /home/gopher/mod1/.git/
$ git remote add origin https://play-with-go.dev/userguides/{% raw %}{{{.REPO1}}}{% endraw %}.git
$ go mod init play-with-go.dev/userguides/{% raw %}{{{.REPO1}}}{% endraw %}
go: creating new go.mod: module play-with-go.dev/userguides/{% raw %}{{{.REPO1}}}{% endraw %}
```
{:data-command-src="ZWNobyB7eyBIZWxsbyB9fQpta2RpciAvaG9tZS9nb3BoZXIvbW9kMQpjZCAvaG9tZS9nb3BoZXIvbW9kMQpnaXQgaW5pdApnaXQgcmVtb3RlIGFkZCBvcmlnaW4gaHR0cHM6Ly9wbGF5LXdpdGgtZ28uZGV2L3VzZXJndWlkZXMve3t7LlJFUE8xfX19LmdpdApnbyBtb2QgaW5pdCBwbGF5LXdpdGgtZ28uZGV2L3VzZXJndWlkZXMve3t7LlJFUE8xfX19Cg=="}

Write a readme:

```.term1
cat <<'EOD' > /home/gopher/mod1/README.md
## `play-with-go.dev/userguides/{% raw %}{{{.REPO1}}}{% endraw %}`
EOD
```

Write a readme:

```.term1
cat <<'EOD' > /home/gopher/mod1/main.go
package main

import "fmt"

func main() {
        fmt.Println("Hello, world!")
}
EOD
```

Commit and push:

```.term1
$ git add -A
$ git commit -m "Initial commit"
[main (root-commit) abcd123] Initial commit
 3 files changed, 11 insertions(+)
 create mode 100644 README.md
 create mode 100644 go.mod
 create mode 100644 main.go
$ git push -u origin main
remote: . Processing 1 references        
remote: Processed 1 references in total        
To https://play-with-go.dev/userguides/{% raw %}{{{.REPO1}}}{% endraw %}.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```
{:data-command-src="Z2l0IGFkZCAtQQpnaXQgY29tbWl0IC1tICJJbml0aWFsIGNvbW1pdCIKZ2l0IHB1c2ggLXUgb3JpZ2luIG1haW4K"}

Use the module:

```.term1
$ mkdir /home/gopher/mod2
$ cd /home/gopher/mod2
$ go mod init mod.com
go: creating new go.mod: module mod.com
$ go get play-with-go.dev/userguides/{% raw %}{{{.REPO1}}}{% endraw %}
go: downloading play-with-go.dev/userguides/{% raw %}{{{.REPO1}}}{% endraw %} v0.0.0-20060102150405-abcde12345
go: play-with-go.dev/userguides/{% raw %}{{{.REPO1}}}{% endraw %} upgrade => v0.0.0-20060102150405-abcde12345
$ go run play-with-go.dev/userguides/{% raw %}{{{.REPO1}}}{% endraw %}
Hello, world!
```
{:data-command-src="bWtkaXIgL2hvbWUvZ29waGVyL21vZDIKY2QgL2hvbWUvZ29waGVyL21vZDIKZ28gbW9kIGluaXQgbW9kLmNvbQpnbyBnZXQgcGxheS13aXRoLWdvLmRldi91c2VyZ3VpZGVzL3t7ey5SRVBPMX19fQpnbyBydW4gcGxheS13aXRoLWdvLmRldi91c2VyZ3VpZGVzL3t7ey5SRVBPMX19fQo="}

<script>let pageGuide="2020-09-01-basic-go-modules-example"; let pageLanguage="en"; let pageScenario="go115";</script>
