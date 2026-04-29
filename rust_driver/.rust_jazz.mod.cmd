savedcmd_rust_jazz.mod := printf '%s\n'   rust_jazz.o | awk '!x[$$0]++ { print("./"$$0) }' > rust_jazz.mod
