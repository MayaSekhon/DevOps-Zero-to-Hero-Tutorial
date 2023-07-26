# Maya Sekhon - DevOps Zero-Hero Tutorial

[![README lint](https://github.com/MayaSekhon/DevOps-Tutorial/actions/workflows/readme-lint.yaml/badge.svg)](https://github.com/MayaSekhon/DevOps-Tutorial/actions/workflows/readme-lint.yaml)
[![Repo on Azure DevOps](https://img.shields.io/badge/repo-Azure%20DevOps-0078D7?logo=azure%20devops)](https://dev.azure.com/mayavsekhon/Git/_git/DevOps-Tutorial)
[![Repo on GitHub](https://img.shields.io/badge/repo-GitHub-2088FF?logo=github)](https://github.com/MayaSekhon/DevOps-Tutorial)
[![Repo on GitLab](https://img.shields.io/badge/repo-GitLab-FCA121?logo=gitlab)](https://gitlab.com/MayaSekhon/DevOps-Tutorial)
[![Repo on BitBucket](https://img.shields.io/badge/repo-BitBucket-0052CC?logo=bitbucket)](https://bitbucket.org/mayasekhon/devops-tutorial/src/main/)

## Index

- [Linux Basics](https://github.com/MayaSekhon/DevOps-Tutorial/tree/main#linux-basics)
- [Command Basics](https://github.com/MayaSekhon/DevOps-Tutorial/tree/main#command-basics)

## Linux / Unix Basics

Linux is the standard open source operating system, based on Unix design.

Linux is technically just the operating system kernel, while the many command line tools called Core Utils are typically provided by [GNU](https://www.gnu.org/home.en.html).
Together they form a complete operating system called GNU / Linux which is further wrapped by Linux distributions
which include easy installers and commands to download and install further software (software package management).
The most popular Linux distributions include
[Redhat](https://www.redhat.com/en)
, [Debian](https://www.debian.org/)
and [Ubuntu](https://ubuntu.com/)
or are based on one of those.
There are many more Linux distributions that fill specific niches.

Everything is a file on Unix, even devices. Each open file gets its own file descriptor path.

The Unix command line is extremely powerful and there are several shells to choose from.
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

## Networking Basics

- IP address - the unique address of the computer / device on a network. Most computers are still using IPv4 addresses in the format `1.2.3.4`, with the eventual intention of migrating to IPv6
- Subnet mask / netmask - an address that when AND'd against the IP address, leaves just the network portion of the IP address
- Network address - the IP address range, used by every device to determine if the remote IP is on the local network or a remote network
- Switch - device with multiples ports connecting different computers on the local network
- Router - device which connects 2 or more networks together
- Gateway - a router that is sent traffic to forward on to other networks
- Default Gateway - the router that you send all your remote traffic to when you don't have a more specific router to send it to e.g. your home broadband router for all traffic going to the internet
- DNS - Domain Name System -  software that translates host names and domain names into IP addresses for network connections to initiate. Every computer has a DNS client that queries DNS servers on the internet that is used everytime you put a URL into your web browser
- Hostname - the name of your computer on the local network
- Domain Name - the address suffix used to group websites and email addresses eg. google.com
- FQDN - Fully Qualified Domain Name - the complete host name and domain address eg. www.google.com
- URL - Uniform Resource Locator - the full path to a website's webpage eg. https://linkedin.com/in/maya-sekhon

## Linux / Unix - Basic Commands

To find a command, it must be in the `$PATH`. You will likely need to extend the path to include custom installation directories like so:

```shell
export PATH="$PATH:/path/to/some/directory"
```

Common switches are `-h` / `--help`, `-v` / `--verbose`, `-V` / `--version`. The long options with `--` are typically GNU convention

- `pwd` - shows present working directory
- `cd` - change directory
- `ls -l` - list files and directories
- `echo` - prints a given string argument
- `cp` - copies files or directories
- `mv` - moves files or directories
- `cat` - reads the contents of the file or standard input to standard output, your terminal if not redirected or piped to another command
- `head` - reads the first N lines of a file or standard input
- `tail` - reads the last N lines of a file or standard input
- `more` - a paging program that displays one screenfull at a time and allows you to scroll down through longer outputs such as standard output from piped commands or files
- `less` - a better replacement of `more` that allows you to scroll upwards as well as downwards
- `>` -  overwrite file
- `>>` - append file
- `sudo` - elevate permissions to another user, usually root (must be pre-approved in `/etc/sudoers`)
- `su` - switch user, prompts for the user's password to start a new shell under their username
- `which` - prints the full path to a given command
- `ps` -  shows running processes. Commonly called as `ps -ef` or `ps aux` to show all processes on a unix based system
- `grep` - filters from standard input or a file and only prints to standard output lines that match the given regex filter argument
- `hostname` - prints the hostname with domain (FQDN), use `-s` for short name without domain
- `netstat` - prints the network connections, connected or listening ports. Commonly called as `netstat -an` or `netstat -lntpu`

- `pbcopy` - copies Standard Input to the GUI clipboard on Mac
- `pbpaste` - pastes the GUI clipboard to Standard Output on Mac
- `xclip` -  copies Standard Input to the GUI (X) clipboard on Linux
- `mkdir` -  creates a directory
- `rmdir` - deletes an empty directory, fails with an error if not empty, in which case you need to use `rm -r` to also delete the directory and its contents (files / subdirectories)
- `rm` - deletes files / directories. Common switches are `-r` to recursively delete into directories, and `-f`/`--force`

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

If you're on Mac and want to be able to open files from the command line using the `idea` command from your shell, you will need to add it to the path:

```shell
export PATH="$PATH:/Applications/IntelliJ IDEA CE.app/Contents/MacOS"
```

## Make / Makefiles

Make is the classic, standard build system that executes the script contents of `Makefile`
in the current directory when you execute the `make` command.

For example, see the [Makefile](https://github.com/MayaSekhon/DevOps-Tutorial/blob/main/Makefile) in this repo.

If you're using Intellij, remember to add the [Makefile plugin](https://plugins.jetbrains.com/plugin/9333-makefile-language) for syntax support.

## Git

[Git](https://git-scm.com/) is a distributed version control system which saves every version of your software code and configuration files.

This allows you to track all changes made over time made by yourself and your colleagues, and handles most merging
of each other's changes as long as they're not on the same lines.

### Git Commands

- `git init` - creates a new Git repository (creates `.git/` directory storing your file changes and metadata)
- `git clone` - clones a repo locally from an upstream server, such as GitHub
- `git add` - marks files to be committed
- `git mv` - moves or renames files (necessary for Git to track the move or rename, don't just use Unix `mv`)
- `git diff` - shows you uncommitted changes made to files
- `git commit` - saves selected changed files in a new version hashref
   (a unique alphanumeric string representing this set of changes)
- `git push` - pushes your local commits to an upstream shared repository such as GitHub
- `git pull` - pulls the latest commits from the upstream shared repository
- `git branch` - show branches / create a new branch
- `git checkout` - checks out the files at a given ref (branch / tag / hashref)
- `git remote -v` - prints the remote repos and their URLs

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

## CI/CD - Continuous Integration / Continuous Delivery

Continuous Integration means to automatically run any actions upon changes in the repo related to building artifacts, installing dependencies (eg. software libraries or OS packages), testing, linting, code quality checks etc.

Continuous Delivery is the next step where the software is delivered eg. deployed to a server (eg. copied and executed to run a new version of a website or software or config).

CI/CD is done via specialised software that watches your Git repo and automatically runs upon any changes to the files in the repo.

There are many different CI/CD software tools available to fulfill this function. Some prominent ones include:

- Cloud Hosted:
  - [GitHub Actions](https://github.com/features/actions)
  - [GitLab CI/CD](https://docs.gitlab.com/ee/ci/)
  - [Azure DevOps Pipelines](https://azure.microsoft.com/en-gb/products/devops/pipelines)
  - [BitBucket Pipelines](https://bitbucket.org/product/features/pipelines)
  - [AWS CodeBuild](https://aws.amazon.com/codebuild/)
  - [GCP CloudBuild](https://cloud.google.com/build)
- Self Hosted (Install and run on your own server or computer):
  - [Jenkins](https://www.jenkins.io/)
  - [Concourse](https://concourse-ci.org/)
  - [TeamCity](https://www.jetbrains.com/teamcity/)

and many others. For a more comprehensive list of badges of different CI, see [HariSekhon/CI-CD](https://github.com/HariSekhon/CI-CD) or https://harisekhon.netlify.app/.

## Data Formats 

- [YAML](https://en.wikipedia.org/wiki/YAML) - Yet Another Markup Language - simple way of representing key value pairs, lists, dictionaries. Usually used for config files eg. [readme-lint.yaml](https://github.com/MayaSekhon/DevOps-Tutorial/blob/main/.github/workflows/readme-lint.yaml)
- [JSON](https://en.wikipedia.org/wiki/JSON) - JavaScript Object Notation - text-based data file written like a dictionary in code with braces, key-value pairs, lists, often used for data interchange between web services eg. `{ "name": "Maya", "hobbies": ["coding", "music"] }`
- [XML](https://en.wikipedia.org/wiki/XML) - Extensible Markup Language - text-based data file with a start \<tag\> and end \</tag\> (with a slash) surrounding each field eg. `<name>Maya</name>`, older format used for data interchange in older web services 
