# Maya Sekhon - DevOps Zero-to-Hero Tutorial

[![README lint](https://github.com/MayaSekhon/DevOps-Tutorial/actions/workflows/readme-lint.yaml/badge.svg)](https://github.com/MayaSekhon/DevOps-Tutorial/actions/workflows/readme-lint.yaml)
[![URL lint](https://github.com/MayaSekhon/DevOps-Tutorial/actions/workflows/url-lint.yaml/badge.svg)](https://github.com/MayaSekhon/DevOps-Tutorial/actions/workflows/url-lint.yaml)
[![YAML lint](https://github.com/MayaSekhon/DevOps-Tutorial/actions/workflows/yaml-lint.yaml/badge.svg)](https://github.com/MayaSekhon/DevOps-Tutorial/actions/workflows/yaml-lint.yaml)
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/MayaSekhon/DevOps-Zero-to-Hero-Tutorial/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/MayaSekhon/DevOps-Zero-to-Hero-Tutorial/tree/main)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/MayaSekhon/DevOps-Tutorial?logo=github)](https://github.com/MayaSekhon/DevOps-Tutorial/commits/main)

[![Repo on Azure DevOps](https://img.shields.io/badge/repo-Azure%20DevOps-0078D7?logo=azure%20devops)](https://dev.azure.com/mayavsekhon/Git/_git/DevOps-Tutorial)
[![Repo on GitHub](https://img.shields.io/badge/repo-GitHub-2088FF?logo=github)](https://github.com/MayaSekhon/DevOps-Tutorial)
[![Repo on GitLab](https://img.shields.io/badge/repo-GitLab-FCA121?logo=gitlab)](https://gitlab.com/MayaSekhon/DevOps-Tutorial)
[![Repo on BitBucket](https://img.shields.io/badge/repo-BitBucket-0052CC?logo=bitbucket)](https://bitbucket.org/mayasekhon/devops-tutorial/src/main/)

## Index

- [Linux / Unix Basics](#linux--unix-basics)
  - [Unix File System Layout](#unix-file-system-layout)
  - [Unix Shells](#unix-shells)
  - [Standard Input, Standard Output and Standard Error](#standard-input-standard-output-and-standard-error)
- [Linux / Unix - Basic Commands](#linux--unix---basic-commands)
- [Networking Basics](#networking-basics)
- [SSH](#ssh)
- [Editor / IDE](#editor--ide)
- [Make / Makefiles](#make--makefiles)
- [Git](#git)
  - [Git Commands](#git-commands)
    - [Example](#example)
  - [GitHub](#github)
  - [GitHub alternatives - GitLab, BitBucket, Azure DevOps](#github-alternatives---gitlab-bitbucket-azure-devops)
- [CI/CD - Continuous Integration / Continuous Delivery](#cicd---continuous-integration--continuous-delivery)
  - [GitHub Actions](#github-actions)
  - [Azure DevOps Pipelines](#azure-devops-pipelines)
  - [CircleCI](#circleci)
- [Data Formats](#data-formats)

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

### Unix File System Layout

The [Filesystem Hierarchy Standard](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard) defines the common layout you'll find across all unix style systems, including Linux.

| Directory         | Description                                                                                                                |
|-------------------|----------------------------------------------------------------------------------------------------------------------------|
| `/bin`            | core binaries                                                                                                              |
| `/usr/bin`        | more user binaries                                                                                                         |
| `/sbin`           | system binaries                                                                                                            |
| `/usr/sbin`       | more system binaries                                                                                                       |
| `/usr/local/bin`  | 3rd party installed user binaries                                                                                          |
| `/usr/local/sbin` | 3rd party installed system binaries                                                                                        |
| `/etc`            | configuration files                                                                                                        |
| `/usr/local/etc`  | 3rd party installed config files                                                                                           |
| `/proc`           | process and kernel info exposed as virtual files                                                                           |
| `/sys`            | system info exposed as virtual files                                                                                       |
| `/dev`            | device files representing every piece of hardware, disk, device, usb etc.                                                  |
| `/mnt`            | mounted extra filesystems                                                                                                  |
| `/home`           | home directories for each user                                                                                             |
| `/User`           | home directories for each user on Mac instead of `/home`                                                                   |
| `/root`           | home directory for the root user                                                                                           |
| `/boot`           | contains the Linux kernel and `initrd` used to boot the OS                                                                 |
| `/lib`            | libraries for binaries in `bin` and `/sbin`                                                                                |
| `/usr/lib`        | libraries for the binaries in `/usr/bin` and `/usr/sbin`                                                                   |
| `/usr/local/lib`  | libraries for the binaries in `/usr/local/bin` and `/usr/local/sbin`                                                       |
| `/opt`            | another location for installing optional / 3rd party software, often used by major installation programs such as Oracle DB |
| `/tmp`            | temporary files (often wiped after shutdown)                                                                               |
| `/var/tmp`        | more temporary runtime files                                                                                               |
| `/var/cache`      | temporarily cached files for running software, package manager lists                                                       |

Everything is a file on Unix, even devices (found under `/dev`).

Each open file gets its own file descriptor eg. `/dev/fd/<number>`.

### Unix Shells

The Unix command line is extremely powerful and there are several shells to choose from.
The default shell on Linux is Bash, which is based on the Bourne shell (Bash stands for Bourne again shell).
Other popular shells include ZSH and Fish. Mac has in recent years switched the default shell to `zsh` to avoid GNU GPL open source licensing.

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

Open a terminal. On Mac open `Terminal`, on Linux open `xterm` or `aterm`. These are applications in which to run
your shell in a window inside your GUI.

To find a command, it must be in the `$PATH`. You will likely need to extend the path to include custom installation directories like so:

```shell
export PATH="$PATH:/path/to/some/directory"
```

Common switches are `-h` / `--help`, `-v` / `--verbose`, `-V` / `--version`. The long options with `--` are typically GNU convention

For more detailed help, type `man <command>`. To search for manual pages run `man -k <command>`.

- `pwd` - shows present working directory
- `cd` - change directory, `cd -` to jump to last directory, `cd` without args to jump to `$HOME` directory
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
- `clear` - clears the terminal screen, leaving your cursor at the top (`ctrl-l` is a shortcut)
- `tmux` - terminal multiplexer - runs multiple shells in your terminal window and preserves your shell sessions if your terminal crashes or is accidentally closed
- `nohup` - no hang up - lets a command keep running even if your shell is closed eg. broken ssh connection (this usually results in a HUP signal being sent to the process causing it to exit otherwise)
- `sudo` - elevate permissions to another user, usually root (must be pre-approved in `/etc/sudoers`)
- `su` - switch user, prompts for the user's password to start a new shell under their username
- `which` - prints the full path to a given command
- `type` - similar to `which` but finds shell built-in commands
- `ps` -  shows running processes. Commonly called as `ps -ef` or `ps aux` to show all processes on a unix based system
- `grep` - filters from standard input or a file and only prints to standard output lines that match the given regex filter argument
- `hostname` - prints the hostname with domain (FQDN), use `-s` for short name without domain
- `pbcopy` - copies Standard Input to the GUI clipboard on Mac
- `pbpaste` - pastes the GUI clipboard to Standard Output on Mac
- `xclip` -  copies Standard Input to the GUI (X) clipboard on Linux
- `mkdir` -  creates a directory
- `rmdir` - deletes an empty directory, fails with an error if not empty, in which case you need to use `rm -r` to also delete the directory and its contents (files / subdirectories)
- `rm` - deletes files / directories. Common switches are `-r` to recursively delete into directories, and `-f`/`--force`
- `tr` - replaces characters from standard input
- `sed` - stream editor - replaces strings or deletes from standard input via regex searches
- `awk` - text processing language, usually used for quick one-liners, also supports regex matches and prints numbered columns
- `cut` - cuts out selected portions of each line by bite, character or field eg. 1st and 3rd fields `cut -d ' ' -f 1,3`
- `column` - aligns input into vertically aligned columns, usually called as `column -t`
- `df` - disk free - shows disk space for one or all disks eg. `df -h` for human units, `df -h /` for disk space of root disk or `df -h .` for disk space in the current partition where you are (`$PWD`)
- `env` - prints environment variables or sets environment variables and runs commands
- `top` - shows live process information, usually sorted by CPU or RAM - most useful details are PID, CPU, RAM, USER and COMMAND
- `du` - disk used - counts the disk space used for given files or directories, eg. `du -h -s $HOME` to see how much space your home directory has taken in human-readable units eg. GB
- `lsof` - list open files - open files and directories, the processes which currently have them opened, along with the user and PID
- `vmstat` - virtual memory stats - shows RAM, CPU, disk I/O etc.
- `dstat` - similar to `vmstat`
- `lscpu` - shows number of CPUs, cores etc.
- `nproc` - the number of CPU cores available to the current process (could be less than the hardware if a limit has been applied to your user or process)
- `set` - sets shell options such as `set -e` (usually used in scripts), or without args prints everything defined in the shell such as environment variables, aliases and functions
- `vi` - text editor, the classic Unix terminal text editor, doesn't require a GUI, almost universally available on every server. If you need to edit a config file on a server, you will need to use this or another terminal editor program
- `strace` - traces system calls and signals, eg. file open / read / close, network socket open / send / close
- `dtruss` - similar to `strace` but for Mac
- `dmesg` - prints system kernel logs
- `journalctl` - opens systemd logs
- `diff` - compares files line by line, prints the differing lines
- `date` - prints date and time, sets date and time, or prints the date / time in the format specified by a strftime string
- `ifconfig` - prints or configures network interfaces, usually used to show your IP address
- `ip` - similar to `ifconfig`, `ip addr` to show your IP address
- `route` - prints or configures the network routing cables
- `netstat` - prints the network connections, connected or listening ports. Commonly called as `netstat -an` or `netstat -lntpu`
- `useradd` - creates a new user account
- `userdel` - deletes a user account
- `gpasswd` - administers the /etc/group and /etc/gshadow
- `kill` - kills a process by PID or sends it a specific signal
- `killall` - same as above, by name
- `pkill` - same as above, by regex pattern matching name
- `who` / `w` - display who is logged in
- `rsync` - transfers / synchronizes files or directories efficiently between two directories by comparing timestamps (or optionally checksums) and only copies the files that are newer than the destination
- `find` - finds files and directories, optionally perform commands on them, eg. `find . -name README.md`
- `xargs` - reads standard input and uses it as arguments to the given command eg. `| xargs <command>`
- `file` - shows the type of a given file eg. `ASCII text` or `POSIX tar archive`
- `tar` - creates or extracts tarballs (bundle archives of files / directories), usually used for backups eg. `tar cvfz my.tar.gz somedirectory` and `tar xvfz my.tar.gz`
- `gzip` - compresses files using the gzip compression algorithm
- `gunzip` - decompresses `.gz` files
- `bzip2` - compresses files using the bzip2 compression algorithm (more compression but slower)
- `bunzip2` - decompresses `.bz2` files
- `zless` - shows compressed or plain text files one screen at a time (pipes gzipped files through `gunzip` before opening in `less`)
- `bzless` - same as `zless` but for `bzip2`
- `zip` - creates zip compression archives
- `unzip` - extracts zip compression archives
- `md5sum` - generates md5 hash of a file's contents, or validates that a saved md5 checksum hash matches the hash computed for a given file's contents
- `md5` - same as above, on Mac
- `shasum` - computes the SHA-1 hash of a file's contents (a hex string that is unique to a given content input)
- `sha1sum` - same as above, on Mac
- `sha256sum` - same as above, with longer SHA-256 hash
- `sha512sum` - same as above, with longer SHA-512 hash
- `host` - performs DNS lookup for a given hostname or FQDN
- `dig` - same as above, returns more info
- `curl` - get a web page URL via HTTP(S) or send data eg. JSON to a web service in an HTTP(S) request
- `wget` - similar to curl, downloads web pages to local files by default, use `wget -O - ...` to output to stdout to

emulate curl's behaviour on minimalist systems that don't have curl installed but have wget bundled inside the busybox shell,
such as Alpine Linux

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

Find your public IP address via any of these commands:

```shell
curl ifconfig.co
```

```shell
curl ipinfo.io/ip
```

```shell
curl api.ipify.org
```

```shell
curl 'https://api.ipify.org?format=json'
```
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

Make sure to enable Two-factor authentication (2FA) in your [security settings](https://github.com/settings/security). Get [Microsoft Authenticator app](https://www.microsoft.com/en-gb/security/mobile-authenticator-app).

Copy and paste the contents of your `$HOME/.ssh/id_rsa.pub` into your profile [keys settings](https://github.com/settings/keys)
(hint: `pbcopy $HOME/.ssh/id_rsa.pub` on Mac to copy it straight into your clipboard).

Use SSH for your git clone / pull / push because you should be using autogenerated complex passwords that are stored in password managers such as [Chrome](https://www.google.com/intl/en_uk/chrome/)
/ [Lastpass](https://www.lastpass.com/)
/ [1password](https://1password.com/), and have MFA enabled.

If your organisation uses SSO enforced authentication for corporate controls via Azure Active Directory or similar IdP, 
then don't forget to authorize your SSH key for your enterprise GitHub organisation using the `Configure SSO` drop down
to the right of the key.

### GitHub alternatives - GitLab, BitBucket, Azure DevOps

These are all just Git repo hosting websites with CI/CD built in.

- [Azure DevOps](https://azure.microsoft.com/en-gb/products/devops) - unlimited free CI/CD build minutes
- [GitLab](https://about.gitlab.com/) - similar feature parity to GitHub, but few free CI/CD build minutes (legacy)
- [BitBucket](https://bitbucket.org/product) - less feature rich and few free CI/CD build minutes (legacy)

GitHub's advantages over these alternatives include:

- most popular and widely used
- feature rich repository management (rivalled only by GitLab)
- huge ecosystem support and integrations
- GitHub can be used for automatic SSO logins to many other 3rd party developer websites
- better CI/CD, see [GitHub Actions section](#github-actions) further down
- Pull Requests with extensive customization:
  - merge control behaviours enforcing peer review approvals
  - CI build / lint checks passed enforcement
  - CI can update / modify / comment on Pull Requests

## CI/CD - Continuous Integration / Continuous Delivery

Continuous Integration means to automatically run any actions upon changes in the repo related to building artifacts, installing dependencies (eg. software libraries or OS packages), testing, linting, code quality checks etc.

Continuous Delivery is the next step where the software is delivered eg. deployed to a server (eg. copied and executed to run a new version of a website or software or config).

CI/CD is done via specialised software that watches your Git repo and automatically runs upon any changes to the files in the repo.

There are many different CI/CD software tools available to fulfill this function. Some prominent ones include:

- Cloud Hosted:
  - [GitHub Actions](https://github.com/features/actions)
  - [CircleCI](https://circleci.com/)
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

### GitHub Actions

CI/CD built into each GitHub repo, requires just dropping in a yaml file into `.github/workflows`.

- unlimited free build minutes for public projects
- [Marketplace](https://github.com/marketplace?type=actions) of pre-built actions
- widespread support among 3rd party vendors providing ready made actions for their products such as various [SAST](https://en.wikipedia.org/wiki/Static_application_security_testing) tools
- better designed CI/CD than other cloud hosted vendors eg. multi-file workflows, separate repo badges etc.
- community pre-built reuseable workflows are ready ro run, such as [HariSekhon/GitHub-Actions](https://github.com/HariSekhon/GitHub-Actions)

For examples, see [.github/workflows](https://github.com/MayaSekhon/DevOps-Tutorial/tree/main/.github/workflows).

For a master template, see the [HariSekhon/GitHub-Actions](https://github.com/HariSekhon/GitHub-Actions) repo [main.yaml](https://github.com/HariSekhon/GitHub-Actions/blob/master/main.yaml).

### Azure DevOps Pipelines

Azure DevOps Pipelines is the built-in CI/CD available alongside repos. Simply add `azure-pipelines.yml` to the root of your repo and enable in the website.

For a simple example, see the local [azure-pipelines.yml](/azure-pipelines.yml), or for a more real-world example,
see DevOps-Bash-tools [azure-pipelines.yml](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/azure-pipelines.yml).

### CircleCI

A well established, polished CI/CD solution with a nice GUI.

For example, see the local [.circlci/config.yml](https://github.com/MayaSekhon/DevOps-Tutorial/blob/main/.circleci/config.yml)
or the DevOps-Bash-tools [.circleci/config.yml](https://github.com/HariSekhon/DevOps-Bash-tools/blob/master/.circleci/config.yml)

### Jenkins

The classic, most powerful and flexible CI/CD.

Free open-source server software, written in Java. You must install, run, administer and update it yourself.

Uses a lot of plugins to extend its core functionality.

Ultra powerful but more difficult to manage because you have to
administer the server yourself, including updating all your plugins, compared to Cloud hosted solutions like the above,
which require no administration.

Builds use a `Jenkinsfile` written in a DSL language, similar to code with braces and functions. See this master template [Jenkinsfile](https://github.com/HariSekhon/Jenkins/blob/master/Jenkinsfile) example.

Very powerful and flexible because you can write your own functions in the excellent [Groovy](https://groovy-lang.org/)
programming language. Many such functions can be found in the [HariSekhon/Jenkins](https://github.com/HariSekhon/Jenkins) repo.

Jenkins can have many agents installed on other servers to run pipelines. Jenkins integrates with the fantastic Kubernetes
platform to dynamically spawn agents in autoscaling Kubernetes clusters as needed. To quickly install Jenkins on Kubernetes
with auto-spawning agents, see the [HariSekhon/Kubernetes-configs](https://github.com/HariSekhon/Kubernetes-configs) repo.

A single Jenkins server will eventually hit performance and scalability limits in the server itself if coordinating and
scheduling hundreds of pipelines across agents.

[CloudBees](https://www.cloudbees.com/)
provides commercial software to run and manage multiple Jenkins servers centrally. This is because large enterprises
typically end up with many Jenkins installations for different teams and projects but want centralised control and governance.

For real-world Jenkins architecture and screenshots see the [HariSekhon/Jenkins](https://github.com/HariSekhon/Jenkins) repo.

## Data Formats

- [YAML](https://en.wikipedia.org/wiki/YAML) - Yet Another Markup Language - simple way of representing key value pairs, lists, dictionaries. Usually used for config files eg. [readme-lint.yaml](https://github.com/MayaSekhon/DevOps-Tutorial/blob/main/.github/workflows/readme-lint.yaml)
- [JSON](https://en.wikipedia.org/wiki/JSON) - JavaScript Object Notation - text-based data file written like a dictionary in code with braces, key-value pairs, lists, often used for data interchange between web services eg. `{ "name": "Maya", "hobbies": ["coding", "music"] }`
- [XML](https://en.wikipedia.org/wiki/XML) - Extensible Markup Language - text-based data file with a start \<tag\> and end \</tag\> (with a slash) surrounding each field eg. `<name>Maya</name>`, older format used for data interchange in older web services
