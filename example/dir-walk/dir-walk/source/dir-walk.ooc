import io/File
import os/Env

/*
	## File
	* https://ooc-lang.org/docs/sdk/io/
	* https://ooc-lang.org/docs/sdk/lang/exceptions/
	* https://github.com/ooc-lang/rock/blob/master/sdk/io/File.ooc
	* https://github.com/ooc-lang/rock/blob/master/sdk/io/native/FileUnix.ooc

	## Env
	* https://ooc-lang.org/docs/sdk/os/env/
	* https://github.com/ooc-lang/rock/blob/master/sdk/os/Env.ooc
 */

DirWalk: class {

	init: func () {

	}


	run: func (path := ".") {
		try {
			node := File new(path)
			this runDir(node)
		} catch (e: Exception) {
			"Error: %s" printfln(e message)
		}
	}

	run: func ~file_instance (node: File) {
		try {
			this runDir(node)
		} catch (e: Exception) {
			"Error: %s" printfln(e message)
		}
	}



	runDir: func (dir: File) {
		for (node in dir getChildren()) {
			if (node dir?()) {
				this runDir(node)
			} else {
				this runFile(node)
			}
		}

	}

	runFile: func (file: File) {
		file path println()
	}

} // End Class

walk := DirWalk new()

// ## string argument
walk run(".")
//walk run("/tmp")
//walk run(Env get("HOME"))

// ## file argument
//walk run(File new("."))
//walk run(File new("/tmp"))
//walk run(File new(Env get("HOME")))
//walk run(File new(Env get("HOME"), ".config"))
//walk run(File new(Env get("HOME", "/home/user"), ".config"))
