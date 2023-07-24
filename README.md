# Maya Sekhon - DevOps Zero-Hero Tutorial

## Index

- [Linux Basics](https://github.com/MayaSekhon/DevOps-Tutorial/tree/main#linux-basics)
- [Command Basics](https://github.com/MayaSekhon/DevOps-Tutorial/tree/main#command-basics)

## Linux Basics

Linux is the standard open source operating system, based on Unix design.

Everything is a file on Linux, even devices.

The Linux command line is extremely powerful and there are several shells to choose from.
The default shell is Bash, which is based on the Bourne shell (Bash stands for Bourne again shell).
Other popular shells include ZSH and Fish.

The `root` account is the superuser admin account which always has UID 0.
There should be no other account with UID 0 otherwise it would also be a root superuser account.

## Command Basics

- `pwd` - shows present working directory
- `cd` - change directory
- `ls -l` - list files and directories
- `cat` - reads the contents of the file to the terminal
- `echo` - prints a given string argument
- `>` -  overwrite file
- `>>` - append file
- `sudo` - elevate permissions to another user, usually root (must be pre-approved in `/etc/sudoers`)
- `su` - switch user, prompts for the user's password to start a new shell under their username
- `which` - prints the full path to a given command