package out

Presteps: [{
	Variables: ["GITEA_USERNAME", "GITEA_PASSWORD", "PAINKILLER"]
	Version: """
		{
		  "Path": "github.com/play-with-go/gitea/cmd/gitea",
		  "Main": {
		    "Path": "github.com/play-with-go/gitea",
		    "Version": "v0.0.0-20201112105710-13a90a7e8526",
		    "Sum": "h1:0JH9kWYqa8pAgFfmX70kBO1IbtWPOdtUPxkfvFOB0Oo=",
		    "Replace": null
		  },
		  "Deps": [
		    {
		      "Path": "code.gitea.io/sdk/gitea",
		      "Version": "v0.13.1",
		      "Sum": "h1:Y7bpH2iO6Q0KhhMJfjP/LZ0AmiYITeRQlCD8b0oYqhk=",
		      "Replace": null
		    },
		    {
		      "Path": "cuelang.org/go",
		      "Version": "v0.3.0-alpha4",
		      "Sum": "h1:BIPutFX2WhHXwERWZka8PZBxcl6amdKO0Vry4n5qUEc=",
		      "Replace": null
		    },
		    {
		      "Path": "github.com/cockroachdb/apd/v2",
		      "Version": "v2.0.1",
		      "Sum": "h1:y1Rh3tEU89D+7Tgbw+lp52T6p/GJLpDmNvr10UWqLTE=",
		      "Replace": null
		    },
		    {
		      "Path": "github.com/emicklei/proto",
		      "Version": "v1.6.15",
		      "Sum": "h1:XbpwxmuOPrdES97FrSfpyy67SSCV/wBIKXqgJzh6hNw=",
		      "Replace": null
		    },
		    {
		      "Path": "github.com/hashicorp/go-version",
		      "Version": "v1.2.0",
		      "Sum": "h1:3vNe/fWF5CBgRIguda1meWhsZHy3m8gCJ5wx+dIzX/E=",
		      "Replace": null
		    },
		    {
		      "Path": "github.com/mpvl/unique",
		      "Version": "v0.0.0-20150818121801-cbe035fff7de",
		      "Sum": "h1:D5x39vF5KCwKQaw+OC9ZPiLVHXz3UFw2+psEX+gYcto=",
		      "Replace": null
		    },
		    {
		      "Path": "github.com/pkg/errors",
		      "Version": "v0.8.1",
		      "Sum": "h1:iURUrRGxPUNPdy5/HRSm+Yj6okJ6UtLINN0Q9M4+h3I=",
		      "Replace": null
		    },
		    {
		      "Path": "github.com/play-with-go/preguide",
		      "Version": "v0.0.2-0.20201112105706-464aa7e03365",
		      "Sum": "h1:rIO+qeZcanEl9kEkrVEASR1EnjRZFW4cljBwiM7Iq7E=",
		      "Replace": null
		    },
		    {
		      "Path": "golang.org/x/net",
		      "Version": "v0.0.0-20200602114024-627f9648deb9",
		      "Sum": "h1:pNX+40auqi2JqRfOP1akLGtYcn15TUbkhwuCO3foqqM=",
		      "Replace": null
		    },
		    {
		      "Path": "golang.org/x/text",
		      "Version": "v0.3.2",
		      "Sum": "h1:tW2bmiBqwgJj/UpqtC8EpXEZVYOwU0yG4iWbprSVAcs=",
		      "Replace": null
		    },
		    {
		      "Path": "golang.org/x/xerrors",
		      "Version": "v0.0.0-20191204190536-9bdfabe68543",
		      "Sum": "h1:E7g+9GITq07hpfrRu66IVDexMakfv52eLZ2CXBWiKr4=",
		      "Replace": null
		    },
		    {
		      "Path": "gopkg.in/retry.v1",
		      "Version": "v1.0.3",
		      "Sum": "h1:a9CArYczAVv6Qs6VGoLMio99GEs7kY9UzSF9+LD+iGs=",
		      "Replace": null
		    },
		    {
		      "Path": "gopkg.in/yaml.v3",
		      "Version": "v3.0.0-20200121175148-a6ecf24a6d71",
		      "Sum": "h1:Xe2gvTZUJpsvOWUnvmL/tmhVBZUmHSvLbMjRj6NUUKo=",
		      "Replace": null
		    }
		  ]
		}
		"""
	Args: {
		Repos: [{
			Var:     "PAINKILLER"
			Private: false
			Pattern: "painkiller"
		}]
	}
	Package: "github.com/play-with-go/gitea"
	Path:    "/newuser"
}]
Terminals: [{
	Description: "The main terminal"
	Scenarios: {
		go115: {
			Image: "playwithgo/go1.15.3@sha256:0212016958cbedb4297dd05407256f3f92dbbac4dd7f5ccf514117e79c6c92d2"
		}
	}
	Name: "term1"
}]
Scenarios: [{
	Description: "Go 1.15"
	Name:        "go115"
}]
Networks: ["playwithgo_pwg"]
Env: []
Steps: {
	painkiller_check_fever_advice: {
		Stmts: [{
			ComparisonOutput: """
				For headaches, take Ibuprofen
				For a fever, take Paracetamol

				"""
			Output: """
				For headaches, take Ibuprofen
				For a fever, take Paracetamol

				"""
			ExitCode: 0
			CmdStr:   "go run ."
			Negated:  false
		}]
		Order:           20
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "painkiller_check_fever_advice"
	}
	painkiller_gogenerate_again: {
		Stmts: [{
			ComparisonOutput: ""
			Output:           ""
			ExitCode:         0
			CmdStr:           "go generate ."
			Negated:          false
		}]
		Order:           19
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "painkiller_gogenerate_again"
	}
	painkiller_add_fever_advice: {
		Order: 18
		Source: """
			package main

			import "fmt"

			//go:generate go run golang.org/x/tools/cmd/stringer -type=Pill

			type Pill int

			const (
			\tPlacebo Pill = iota
			\tIbuprofen
			\tParacetamol
			)

			func main() {
			\tfmt.Printf("For headaches, take %v\\n", Ibuprofen)
			\tfmt.Printf("For a fever, take %v\\n", Paracetamol)
			}

			"""
		Renderer: {
			Pre: """
				package main

				import "fmt"

				//go:generate go run golang.org/x/tools/cmd/stringer -type=Pill

				type Pill int

				const (
				\tPlacebo Pill = iota
				\tIbuprofen
				)

				func main() {
				\tfmt.Printf("For headaches, take %v\\n", Ibuprofen)
				}

				"""
			RendererType: 3
		}
		Language: "go"
		Target:   "/home/gopher/painkiller/painkiller.go"
		Terminal: "term1"
		StepType: 2
		Name:     "painkiller_add_fever_advice"
	}
	painkiller_gogenerate: {
		Stmts: [{
			ComparisonOutput: ""
			Output:           ""
			ExitCode:         0
			CmdStr:           "go generate ."
			Negated:          false
		}]
		Order:           17
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "painkiller_gogenerate"
	}
	painkiller_add_gogenerate_directive: {
		Order: 16
		Source: """
			package main

			import "fmt"

			//go:generate go run golang.org/x/tools/cmd/stringer -type=Pill

			type Pill int

			const (
			\tPlacebo Pill = iota
			\tIbuprofen
			)

			func main() {
			\tfmt.Printf("For headaches, take %v\\n", Ibuprofen)
			}

			"""
		Renderer: {
			Pre: """
				package main

				import "fmt"

				type Pill int

				const (
				\tPlacebo Pill = iota
				\tIbuprofen
				)

				func main() {
				\tfmt.Printf("For headaches, take %v\\n", Ibuprofen)
				}

				"""
			RendererType: 3
		}
		Language: "go"
		Target:   "/home/gopher/painkiller/painkiller.go"
		Terminal: "term1"
		StepType: 2
		Name:     "painkiller_add_gogenerate_directive"
	}
	painkiller_check_stringer: {
		Stmts: [{
			ComparisonOutput: """
				For headaches, take Ibuprofen

				"""
			Output: """
				For headaches, take Ibuprofen

				"""
			ExitCode: 0
			CmdStr:   "go run ."
			Negated:  false
		}]
		Order:           15
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "painkiller_check_stringer"
	}
	stringer_cat_generated: {
		Stmts: [{
			ComparisonOutput: """
				// Code generated by "stringer -type Pill"; DO NOT EDIT.

				package main

				import "strconv"

				func _() {
				\t// An "invalid array index" compiler error signifies that the constant values have changed.
				\t// Re-run the stringer command to generate them again.
				\tvar x [1]struct{}
				\t_ = x[Placebo-0]
				\t_ = x[Ibuprofen-1]
				}

				const _Pill_name = "PlaceboIbuprofen"

				var _Pill_index = [...]uint8{0, 7, 16}

				func (i Pill) String() string {
				\tif i < 0 || i >= Pill(len(_Pill_index)-1) {
				\t\treturn "Pill(" + strconv.FormatInt(int64(i), 10) + ")"
				\t}
				\treturn _Pill_name[_Pill_index[i]:_Pill_index[i+1]]
				}

				"""
			Output: """
				// Code generated by "stringer -type Pill"; DO NOT EDIT.

				package main

				import "strconv"

				func _() {
				\t// An "invalid array index" compiler error signifies that the constant values have changed.
				\t// Re-run the stringer command to generate them again.
				\tvar x [1]struct{}
				\t_ = x[Placebo-0]
				\t_ = x[Ibuprofen-1]
				}

				const _Pill_name = "PlaceboIbuprofen"

				var _Pill_index = [...]uint8{0, 7, 16}

				func (i Pill) String() string {
				\tif i < 0 || i >= Pill(len(_Pill_index)-1) {
				\t\treturn "Pill(" + strconv.FormatInt(int64(i), 10) + ")"
				\t}
				\treturn _Pill_name[_Pill_index[i]:_Pill_index[i+1]]
				}

				"""
			ExitCode: 0
			CmdStr:   "cat pill_string.go"
			Negated:  false
		}]
		Order:           14
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "stringer_cat_generated"
	}
	stringer_ls_output: {
		Stmts: [{
			ComparisonOutput: """
				go.mod\tgo.sum\tpainkiller.go  pill_string.go  tools.go

				"""
			Output: """
				go.mod\tgo.sum\tpainkiller.go  pill_string.go  tools.go

				"""
			ExitCode: 0
			CmdStr:   "ls"
			Negated:  false
		}]
		Order:           13
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "stringer_ls_output"
	}
	stringer_run_by_hand: {
		Stmts: [{
			ComparisonOutput: ""
			Output:           ""
			ExitCode:         0
			CmdStr:           "go run golang.org/x/tools/cmd/stringer -type Pill"
			Negated:          false
		}]
		Order:           12
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "stringer_run_by_hand"
	}
	stringer_help: {
		Stmts: [{
			ComparisonOutput: """
				Usage of stringer:
				\tstringer [flags] -type T [directory]
				\tstringer [flags] -type T files... # Must be a single package
				For more information, see:
				\thttps://pkg.go.dev/golang.org/x/tools/cmd/stringer
				Flags:
				  -linecomment
				    \tuse line comment text as printed text when present
				  -output string
				    \toutput file name; default srcdir/<type>_string.go
				  -tags string
				    \tcomma-separated list of build tags to apply
				  -trimprefix prefix
				    \ttrim the prefix from the generated constant names
				  -type string
				    \tcomma-separated list of type names; must be set

				"""
			Output: """
				Usage of stringer:
				\tstringer [flags] -type T [directory]
				\tstringer [flags] -type T files... # Must be a single package
				For more information, see:
				\thttps://pkg.go.dev/golang.org/x/tools/cmd/stringer
				Flags:
				  -linecomment
				    \tuse line comment text as printed text when present
				  -output string
				    \toutput file name; default srcdir/<type>_string.go
				  -tags string
				    \tcomma-separated list of build tags to apply
				  -trimprefix prefix
				    \ttrim the prefix from the generated constant names
				  -type string
				    \tcomma-separated list of type names; must be set

				"""
			ExitCode: 0
			CmdStr:   "go run golang.org/x/tools/cmd/stringer -help"
			Negated:  false
		}]
		Order:           11
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "stringer_help"
	}
	painkiller_go_mod_tidy: {
		Stmts: [{
			ComparisonOutput: ""
			Output:           ""
			ExitCode:         0
			CmdStr:           "go mod tidy"
			Negated:          false
		}]
		Order:           10
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "painkiller_go_mod_tidy"
	}
	painkiller_cat_go_mod: {
		Stmts: [{
			ComparisonOutput: """
				module painkiller

				go 1.15

				require golang.org/x/tools v0.0.0-20201105220310-78b158585360 // indirect

				"""
			Output: """
				module painkiller

				go 1.15

				require golang.org/x/tools v0.0.0-20201105220310-78b158585360 // indirect

				"""
			ExitCode: 0
			CmdStr:   "cat go.mod"
			Negated:  false
		}]
		Order:           9
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "painkiller_cat_go_mod"
	}
	stringer_go_get: {
		Stmts: [{
			ComparisonOutput: """

				go: downloading golang.org/x/mod v0.3.0
				go: downloading golang.org/x/tools v0.0.0-20201105220310-78b158585360
				go: downloading golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1
				go: found golang.org/x/tools/cmd/stringer in golang.org/x/tools v0.0.0-20201105220310-78b158585360
				"""
			Output: """
				go: downloading golang.org/x/tools v0.0.0-20201105220310-78b158585360
				go: found golang.org/x/tools/cmd/stringer in golang.org/x/tools v0.0.0-20201105220310-78b158585360
				go: downloading golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1
				go: downloading golang.org/x/mod v0.3.0

				"""
			ExitCode: 0
			CmdStr:   "go get golang.org/x/tools/cmd/stringer@v0.0.0-20201105220310-78b158585360"
			Negated:  false
		}]
		Order:           8
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "stringer_go_get"
	}
	tools_go_initial: {
		Order: 7
		Source: """
			// +build tools

			package tools

			import (
			\t_ "golang.org/x/tools/cmd/stringer"
			)

			"""
		Renderer: {
			RendererType: 1
		}
		Language: "go"
		Target:   "/home/gopher/painkiller/tools.go"
		Terminal: "term1"
		StepType: 2
		Name:     "tools_go_initial"
	}
	painkiller_remove_hand_written_string: {
		Order: 6
		Source: """
			package main

			import "fmt"

			type Pill int

			const (
			\tPlacebo Pill = iota
			\tIbuprofen
			)

			func main() {
			\tfmt.Printf("For headaches, take %v\\n", Ibuprofen)
			}

			"""
		Renderer: {
			Pre: """
				package main

				import "fmt"

				type Pill int

				func (p Pill) String() string {
				\tswitch p {
				\tcase Placebo:
				\t\treturn "Placebo"
				\tcase Ibuprofen:
				\t\treturn "Ibuprofen"
				\tdefault:
				\t\tpanic(fmt.Errorf("unknown Pill value %v", p))
				\t}
				}

				const (
				\tPlacebo Pill = iota
				\tIbuprofen
				)

				func main() {
				\tfmt.Printf("For headaches, take %v\\n", Ibuprofen)
				}

				"""
			RendererType: 3
		}
		Language: "go"
		Target:   "/home/gopher/painkiller/painkiller.go"
		Terminal: "term1"
		StepType: 2
		Name:     "painkiller_remove_hand_written_string"
	}
	painkiller_run_manual_string: {
		Stmts: [{
			ComparisonOutput: """
				For headaches, take Ibuprofen

				"""
			Output: """
				For headaches, take Ibuprofen

				"""
			ExitCode: 0
			CmdStr:   "go run ."
			Negated:  false
		}]
		Order:           5
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "painkiller_run_manual_string"
	}
	manual_string: {
		Order: 4
		Source: """
			package main

			import "fmt"

			type Pill int

			func (p Pill) String() string {
			\tswitch p {
			\tcase Placebo:
			\t\treturn "Placebo"
			\tcase Ibuprofen:
			\t\treturn "Ibuprofen"
			\tdefault:
			\t\tpanic(fmt.Errorf("unknown Pill value %v", p))
			\t}
			}

			const (
			\tPlacebo Pill = iota
			\tIbuprofen
			)

			func main() {
			\tfmt.Printf("For headaches, take %v\\n", Ibuprofen)
			}

			"""
		Renderer: {
			Pre: """
				package main

				import "fmt"

				type Pill int

				const (
				\tPlacebo Pill = iota
				\tIbuprofen
				)

				func main() {
				\tfmt.Printf("For headaches, take %v\\n", Ibuprofen)
				}

				"""
			RendererType: 3
		}
		Language: "go"
		Target:   "/home/gopher/painkiller/painkiller.go"
		Terminal: "term1"
		StepType: 2
		Name:     "manual_string"
	}
	painkiller_run_basic: {
		Stmts: [{
			ComparisonOutput: """
				For headaches, take 1

				"""
			Output: """
				For headaches, take 1

				"""
			ExitCode: 0
			CmdStr:   "go run ."
			Negated:  false
		}]
		Order:           3
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "painkiller_run_basic"
	}
	basic_app: {
		Order: 2
		Source: """
			package main

			import "fmt"

			type Pill int

			const (
			\tPlacebo Pill = iota
			\tIbuprofen
			)

			func main() {
			\tfmt.Printf("For headaches, take %v\\n", Ibuprofen)
			}

			"""
		Renderer: {
			RendererType: 1
		}
		Language: "go"
		Target:   "/home/gopher/painkiller/painkiller.go"
		Terminal: "term1"
		StepType: 2
		Name:     "basic_app"
	}
	painkiller_go_mod_init: {
		Stmts: [{
			ComparisonOutput: ""
			Output:           ""
			ExitCode:         0
			CmdStr:           "mkdir painkiller"
			Negated:          false
		}, {
			ComparisonOutput: ""
			Output:           ""
			ExitCode:         0
			CmdStr:           "cd painkiller"
			Negated:          false
		}, {
			ComparisonOutput: """
				go: creating new go.mod: module painkiller

				"""
			Output: """
				go: creating new go.mod: module painkiller

				"""
			ExitCode: 0
			CmdStr:   "go mod init painkiller"
			Negated:  false
		}]
		Order:           1
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "painkiller_go_mod_init"
	}
	goversion: {
		Stmts: [{
			ComparisonOutput: """
				go version go1.15.3 linux/amd64

				"""
			Output: """
				go version go1.15.3 linux/amd64

				"""
			ExitCode: 0
			CmdStr:   "go version"
			Negated:  false
		}]
		Order:           0
		InformationOnly: false
		DoNotTrim:       false
		Terminal:        "term1"
		StepType:        1
		Name:            "goversion"
	}
}
Hash: "28917659b5e4d043fa9c63bce4cc2a61fb5f4f324f7612e536cc5fc18689552b"
Delims: ["{{{", "}}}"]
