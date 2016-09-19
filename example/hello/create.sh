#!/usr/bin/env bash

## 建立「hello」這個「專案資料夾」和「hello/source」這個資料夾
mkdir hello/source -p

## 切換到「hello」這個資料夾
cd hello

## 產生「hi.use」這個檔
cat > hi.use << EOF
Name: Hello
Description: Nice to meet ooc!
Version: 0.1.0
SourcePath: source
Main: hi
EOF

## 產生「source/hi.ooc」這個檔
cat > source/hi.ooc << EOF
"what's up ooc" println()
EOF
