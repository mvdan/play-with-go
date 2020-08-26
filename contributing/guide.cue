package guide

import (
	// "github.com/play-with-go/gitea"
	"github.com/play-with-go/preguide"
)

Defs: {
	playWithGoCommit: "65a8ddf72152cfb78df0f99336f5f11b678f9125"
}

Delims: ["{{{", "}}}"]

Scenarios: go115: preguide.#Scenario & {
	Description: "Go 1.15"
}

Terminals: term1: preguide.#Guide.#Terminal & {
	Description: "The main terminal"
	Scenarios: go115: Image: "playwithgo/create-your-first-guide"
}

Steps: tool_versions: en: preguide.#Command & {Source: """
docker version -f {{.Server.Version}}
docker-compose version
go version
mkcert -version
"""}

Steps: clone_play_with_go: en: preguide.#Command & {Source: """
git clone https://github.com/play-with-go/play-with-go
cd play-with-go
"""}

Steps: create_branch: en: preguide.#Command & {Source: """
git checkout -b myfirstguide \(Defs.playWithGoCommit)
"""}
