savedcmd_jazz_char.mod := printf '%s\n'   jazz_char.o | awk '!x[$$0]++ { print("./"$$0) }' > jazz_char.mod
