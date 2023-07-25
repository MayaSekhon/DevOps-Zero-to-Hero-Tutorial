# Maya Sekhon - DevOps Zero-Hero Tutorial

[![Repo on Azure DevOps](https://img.shields.io/badge/repo-Azure%20DevOps-0078D7?logo=azure%20devops)](https://dev.azure.com/mayavsekhon/Git/_git/DevOps-Tutorial)
[![Repo on GitHub](https://img.shields.io/badge/repo-GitHub-2088FF?logo=github)](https://github.com/MayaSekhon/DevOps-Tutorial)
[![Repo on GitLab](https://img.shields.io/badge/repo-GitLab-FCA121?logo=gitlab)](https://gitlab.com/MayaSekhon/DevOps-Tutorial)
[![Repo on BitBucket](https://img.shields.io/badge/repo-BitBucket-0052CC?logo=bitbucket)](https://bitbucket.org/mayasekhon/devops-tutorial/src/main/)

## Index

- [Linux Basics](https://github.com/MayaSekhon/DevOps-Tutorial/tree/main#linux-basics)
- [Command Basics](https://github.com/MayaSekhon/DevOps-Tutorial/tree/main#command-basics)

## Linux / Unix Basics

Linux is the standard open source operating system, based on Unix design.

Everything is a file on Linux, even devices. Each open file gets its own file descriptor path.

The Linux command line is extremely powerful and there are several shells to choose from.
The default shell is Bash, which is based on the Bourne shell (Bash stands for Bourne again shell).
Other popular shells include ZSH and Fish.

The `root` account is the superuser admin account which always has UID 0.
There should be no other account with UID 0 otherwise it would also be a root superuser account.

### Standard Input, Standard Output and Standard Error

Standard Input is the data input that is streamed into any command via an interactive prompt, or a pipe (`|`) from another command, or an input redirect (`<`) from a file. 
Commands that expect standard input like `cat` or `grep`, if not given file arguments, will hang waiting until they receive some input.

Standard Output is the main output stream from any command that is printed to the terminal unless you redirect it into a pipe (`|`) to another command's Standard Input, or an output redirect (`>`/ `>>`) to a file.

Standard Error is the secondary output where only errors or logs are sent. This is also printed to the terminal unless redirected via `2>` / `2>>`

The standard file descriptors for Standard Input, Standard Output and Standard Error are 0, 1 and 2 respectively and can be used at the command line via their file descriptors at `/dev/fd/0`, `/dev/fd/1`, `dev/fd/2`.

Most Unix commands often work as standard Unix filter programs where they can accept input from Standard Input or read the contents of a file given as an argument and they output to Standard Output so that they can be chained into any number of subsequent commands separated by pipe symbols.

This combined with the rich ecosystem of bundled Unix commands is the true power of Unix shells.

## Linux / Unix - Basic Commands

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
- `ps` -  shows running processes. Commonly called as `ps -ef` or `ps aux` to show all processes on a unix based system
- `grep` - filters from standard input or a file and only prints to standard output lines that match the given regex filter argument
- `netstat` - prints the network connections, connected or listening ports. Commonly called as `netstat -an` or `netstat -lntpu`
- `more` - a paging program that displays one screenfull at a time and allows you to scroll down through longer outputs such as standard output from piped commands or files
- `less` - a better replacement of `more` that allows you to scroll upwards as well as downwards 
- `pbcopy` - copies Standard Input to the GUI clipboard on Mac
- `pbpaste` - pastes the GUI clipboard to Standard Output on Mac
- `xclip` -  copies Standard Input to the GUI (X) clipboard on Linux

## SSH

SSH stands for Secure Shell. It is the standard for connecting into remote shells on other computers across the network. 
The connection is encrypted on port 22 and requires a remote username and password or SSH key.
An SSH server must be running on the remote computer (`sshd`).

```shell
ssh maya@somecomputer.domain.com
```

```shell
ssh maya@192.168.1.2
```

Create an ssh key
```shell
ssh-keygen
```
This generates a public and private key pair under `$HOME/.ssh/`,
by default `id_rsa` for the secret private key and `id_rsa.pub` for the public key.

Copy and paste the public key contents from `$HOME/.ssh/id_rsa.pub` into the `$HOME/.ssh/authorized_keys`
in any computer you want to automatically log into without a password prompt, or any public service like GitHub. 

The public key is safe to send to colleagues via emails etc because you cannot derive the secret private key from it due to one-way asymmetric cryptography, so that they can add you into their servers authorised keys.

## Editor / IDE

Get yourself a good IDE (text editor with fancy features like autocomplete, syntax highlighting, version control etc.)

There are many to choose from, if you don't already have a favourite one just go with [Intellij IDEA](https://www.jetbrains.com/idea/) community edition (free).

## Git

[Git](https://git-scm.com/) is a distributed version control system which saves every version of your software code and configuration files.

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

```shell
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

[GitHub](https://github.com/) is a website which stores your Git repositories and has nice management features as well as CI/CD.

Copy and paste the contents of your `$HOME/.ssh/id_rsa.pub` into your profile [settings](https://github.com/settings/keys)
(hint: `pbcopy $HOME/.ssh/id_rsa.pub` on Mac to copy it straight into your clipboard).

Use SSH for your git clone / pull / push because you should be using autogenerated complex passwords that are stored in password managers such as [Chrome](https://www.google.com/intl/en_uk/chrome//lastpass/onepass)
/ [Lastpass](https://www.lastpass.com/)
/ [1password](https://1password.com/), and have MFA enabled.

If your organisation uses SSO enforced authentication for corporate controls via Azure Active Directory or similar IdP, then don't forget to authorize your SSH key for your enterprise GitHub organisation using the `Configure SSO` drop down to the right of the key.

