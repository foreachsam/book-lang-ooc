#!/usr/bin/env bash

## 建立「dir-walk」這個「專案資料夾」和「dir-walk/source」這個資料夾
mkdir dir-walk/source -p

## 切換到「dir-walk」這個資料夾
cd dir-walk

## 產生「dir-walk.use」這個檔
cat > dir-walk.use << EOF
Name: DirWalk
Description: Demo Dir Walk
Version: 0.1.0
SourcePath: source
Main: dir-walk
EOF

## 產生「source/dir-walk.ooc」這個檔
cat > source/dir-walk.ooc << EOF
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
EOF
