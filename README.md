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

## Git

Git is a distributed version control system which saves every version of your software code and configuration files.

This allows you to track all changes made over time made by yourself and your colleagues, and handles most merging
of each other's changes as long as they're not on the same lines. 

### Git Commands

- `git init` - creates a new Git repository (creates `.git/` directory storing your file changes and metadata)
- `git add` - marks files to be committed
- `git diff` - shows you uncommitted changes made to files
- `git commit` - saves selected changed files in a new version hashref
   (a unique alphanumeric string representing this set of changes)
- `git push` - pushes your local commits to an upstream shared repository such as GitHub
- `git pull` - pulls the latest commits from the upstream shared repository

`.gitignore` - file listing paths to ignore, one per line, can be set globally in your home directory or in the root top level directory of the repository

#### Example

```
git init
git add README.md
git commit -m "added readme" 

# edit file
vim README.md

git diff
git commit -m "updated readme"
git push
```

### GitHub

GitHub is a website which stores your Git repositories and has nice management features as well as CI/CD.

