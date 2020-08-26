package guides

"2020-08-26-creating-your-first-guide": {
	Scenarios: [{
		Name:        "go115"
		Description: "Go 1.15"
	}]
	Networks: ["playwithgo_gitea"]
	Env: ["PLAYWITHGO_ROOTCA"]
	Delims: ["{{{", "}}}"]
	Terminals: [{
		Name:        "term1"
		Description: "The main terminal"
		Scenarios: {
			go115: {
				Image: "playwithgo/create-your-first-guide"
			}
		}
	}]
}

