# inst

A minimal, universal package search and install tool.

Originally built for **OpenBSD** in 2003, when `pkg_add` had no built-in search and ports meant compiling from source. The idea was simple: give sysadmins two fast commands - search and install - with no ceremony.

Twenty years later, the same UX gap exists across platforms. Every OS has a different package manager with different syntax. `inst` aims to be the one command you can muscle-memory across all of them.

## Quick start

```sh
git clone https://github.com/knofte/inst.git
cd inst
sudo sh install.sh
```

Or manually:

```sh
sudo cp inst /usr/local/bin/
sudo cp inst.conf.example /etc/inst.conf
inst update
```

## Usage

```
inst search <pattern>           Search for packages
inst install <pkg> [pkg ...]    Install by name
inst install -c <num> [num ..]  Install by index number (from search results)
inst install -f <file>          Install all packages listed in a file
inst update                     Refresh the local package list
```

### Example session

```sh
$ inst search vim
34 vim-9.0.2073-no_x11.tgz
35 vim-9.0.2073.tgz
36 vim-lang-9.0.2073.tgz

$ inst install -c 34
Installing vim-9.0.2073-no_x11.tgz

$ inst install curl
Installing curl-8.5.0.tgz
```

Short aliases work too: `inst s` for search, `inst i` for install, `inst u` for update.

### Bulk install from file

Create a package manifest (one package per line, `#` comments supported):

```sh
# base-server.pkg
vim
curl
git
rsync
tmux
htop
```

Then install everything in one go:

```sh
$ inst install -f base-server.pkg
Installing vim
Installing curl
Installing git
...
```

This makes `inst` usable from Ansible, shell provisioning scripts, or any automation that needs a reproducible package baseline. See `examples/` for sample manifests.

## Supported platforms

| Platform | Backend | Status |
|----------|---------|--------|
| OpenBSD  | pkg_add | Supported (original target) |
| FreeBSD  | pkg     | Supported |
| NetBSD   | pkg_add | Supported |
| Debian/Ubuntu | apt | Supported |
| Fedora/RHEL | dnf | Supported |
| Arch Linux | pacman | Supported |
| Alpine   | apk     | Supported |
| macOS    | Homebrew | Supported |

## Configuration

Edit `/etc/inst.conf` to set a custom mirror:

```sh
pkg_site="https://your.local.mirror/pub/OpenBSD/7.6/packages/amd64"
```

Most platforms auto-detect sensible defaults - you only need this for custom mirrors or air-gapped environments.

## History

`inst` was created in March 2003 by Kristoffer Bjork and Kent Riboe, originally targeting OpenBSD's package system. It solved a real friction point: quickly finding and installing binary packages without resorting to ports or memorizing mirror paths.

The original `original/` directory contains the 2003 source for historical reference.

## Roadmap

- [x] Bulk install from file (`inst install -f`)
- [ ] Tab completion (bash/zsh/fish)
- [ ] `inst remove` and `inst list` (installed packages)
- [ ] `inst info <pkg>` (show description, version, deps)
- [ ] Package pinning / hold
- [ ] Config-free operation (zero setup on supported platforms)

## License

ISC

## Authors

- Kent Riboe - kent@riboe.se
- Kristoffer Bjork - kristoffer@alphix.se
  
