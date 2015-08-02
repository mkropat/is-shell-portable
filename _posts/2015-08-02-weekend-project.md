---
layout: post
title:  "Weekend Project"
date:   2015-08-02
---

What does shell portability really mean?  Is it sticking to [the official POSIX commands](http://shellhaters.org/)?  Is it avoiding Bashisms?

Frankly that's not what I care about.  I've [released][jumpapp] [a][luks-mount] [number][shpy]
[of][sslfie] [projects][vim-dwiw2015] written in various dialects of shell.  The only thing I care
is that they run out-of-the-box on the platforms that you'd reasonably expect each of them to run on.
Out-of-the-box support means the user doesn't need to install any additional commands or
software.  And the platforms that someone would reasonably expect?  Well, I'm working on an
`iptables` wrapper in shell.  That just needs to work on Linux.  My ["portable, pure shell
implementation of realpath" library][sh-realpath] on the other hand would ideally work on any \*nix
platform that is still in widespread use.

Once you decide that you are no longer limited to POSIX commands, you've got a new problem:
finding out what commands are actually available on your target platforms.  That's the problem I'm
hoping to tackle with this site.  I want to help re-define what "portable shell" means.  I want to
create an automated survey of what actually ports across differnet platforms.  When I do web
development I have access to [caniuse.com](http://caniuse.com/).  Why isn't there a portable
shell version of that site?

#### What Platforms?

One challenge is that there are 1000s upon 1000s of \*nix variants out there that people still use.
For the initial release, I've arbitrarily chosen what I hope is a representative sampling of the
different platform families out there:

- __centos__ — a popular `.rpm`-based Linux distro
- __freebsd__ — the most popular BSD platform
- __msys__ — \*nix environment running in a popular, decidedly non-\*nix OS
- __openwrt__ — an embedded Linux distro (the only one I could find [a Vagrant
  image][vagrant-boxes] for)
- __os-x__ — the most widely-used desktop \*nix platform by far
- __solaris__ — an actual Unix
- __ubuntu__ — a popular `.deb`-based Linux distro

The choice of platform is in part dictated by what can be automated with Vagrant.  A design goal of
this site is to be as automated as possible.  That way the site can evolve as portabily across
platforms evolves, all with minimal upkeep by me.

#### Reflection

The site's in a pretty basic state right now, but I've already started [listing
ideas](https://github.com/mkropat/is-shell-portable/labels/enhancement) of where the site can go.
I'm releasing the site as it stands now after working on it since yesterday.  If people find it
useful, I expect to keep improving it over time.

As for how the implemention went, I was particularly pleased to discover that a site about shell
scripting could be implemented with just shell scripting, more or less.  The .html etc. was
rendered with Jekyll, which is very much a Ruby tool, but at least it didn't require any coding.  A
tiny amount of Ruby code was needed to get Vagrant to play well with the shell scripts.  Other than
that, it's all shell scripting.  Most of the heavy lifting is done by [`jq`][jq], which I've
never used before, and I'm pleased to report is the coolest JSON-processing language ever.  I
suspect it's only a matter of time before `jq` becomes widely-regarded as the trilogy-completing
addition to the `sed` and `awk` family.

[jq]: https://stedolan.github.io/jq/
[jumpapp]: https://github.com/mkropat/jumpapp
[luks-mount]: https://github.com/mkropat/luks-mount
[sdimap]: https://github.com/mkropat/standalone-dovecot-imap
[sh-realpath]: https://github.com/mkropat/sh-realpath
[shpy]: https://github.com/mkropat/shpy
[sslfie]: https://github.com/mkropat/sslfie
[vagrant-boxes]: http://www.vagrantbox.es/
[vim-dwiw2015]: https://github.com/mkropat/vim-dwiw2015
