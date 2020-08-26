package out

{
	Scenarios: [{
		Name:        "go115"
		Description: "Go 1.15"
	}]
	Networks: []
	Env: []
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
	Langs: {
		en: {
			Steps: {
				tool_versions: {
					Name:     "tool_versions"
					StepType: 1
					Terminal: "term1"
					Order:    0
					Stmts: [{
						Negated:  false
						CmdStr:   "docker version -f {{.Server.Version}}"
						ExitCode: 0
						Output: """
        19.03.12
        
        """
					}, {
						Negated:  false
						CmdStr:   "docker-compose version"
						ExitCode: 0
						Output: """
        docker-compose version 1.26.2, build eefe0d31
        docker-py version: 4.2.2
        CPython version: 3.7.7
        OpenSSL version: OpenSSL 1.1.0l  10 Sep 2019
        
        """
					}, {
						Negated:  false
						CmdStr:   "go version"
						ExitCode: 0
						Output: """
        go version go1.15.1 linux/amd64
        
        """
					}, {
						Negated:  false
						CmdStr:   "mkcert -version"
						ExitCode: 0
						Output: """
        v1.4.1
        
        """
					}]
				}
				clone_play_with_go: {
					Name:     "clone_play_with_go"
					StepType: 1
					Terminal: "term1"
					Order:    1
					Stmts: [{
						Negated:  false
						CmdStr:   "git clone https://github.com/play-with-go/play-with-go"
						ExitCode: 0
						Output: """
        Cloning into 'play-with-go'...
        
        """
					}, {
						Negated:  false
						CmdStr:   "cd play-with-go"
						ExitCode: 0
						Output:   ""
					}]
				}
				create_branch: {
					Name:     "create_branch"
					StepType: 1
					Terminal: "term1"
					Order:    2
					Stmts: [{
						Negated:  false
						CmdStr:   "git checkout -b myfirstguide 65a8ddf72152cfb78df0f99336f5f11b678f9125"
						ExitCode: 0
						Output: """
        Switched to a new branch 'myfirstguide'
        
        """
					}]
				}
			}
			Hash: "8d582f489b068f0f490d85be2896032bbccf3c56ac55aaee6c3b0a70becf3389"
		}
	}
}
