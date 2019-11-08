# MBE Warzone (Bionic Edition)
The warzone VM from RPISEC's awesome [Modern Binary Exploitation](https://github.com/RPISEC/MBE) course, updated with modern tools

## Help wanted!
I am still working through the MBE course myself, and while I will fix as many labs that may have been broken with this build as I can, I have not gotten to the later exercises yet to verify they still work. If any experienced pwners want to help test the labs and make sure they still work as intended I would really appreciate it!

## Installation
Clone this repository and build the warzone VM with `vagrant up`. Supported hypervisors include VirtualBox and libvirt.

## Usage
After deploying the warzone, you can connect to the VM using SSH on 10.10.10.10. The administrator credentials are `gameadmin:gameadmin`. Alternatively you can connect as the `vagrant` user with `vagrant ssh` and manage everything with that account since it has passwordless sudo.

See [Modern Binary Exploitation](https://github.com/RPISEC/MBE) for more information on how to use the VM with the course.

## Differences from the original warzone
Major differences between this version and the original warzone:

* Ubuntu has been upgraded from 14.04 to 18.04
* The python packages and tooling have been moved to python 3 versions (pwntools, capstone, ropper, ropgadget, xortool). This means you should now write python 3 scripts and run them with `python3` instead of `python`
* `gef` is installed and is now the default gdb plugin. You can change this back to `peda` by editing `/etc/cfg/.gdbinit` and commenting out the line with `source .../gef.py` and uncommenting the line that sources `peda.py`
* All `gef` optional dependencies have been installed, including `capstone`, `keystone`, `unicorn`, and `ropper`. They are also all available in the python 3 environment
* The immutable bit has been removed from lab user home directories, so you no longer have to work in `/tmp`. This restriction made sense in a shared environment, but I decided to remove it since most people are working on this solo and working from /tmp was annoying
* Removed some further restrictions on common programs like `tmux`, `ps`, `kill`, etc. since there is no reason for them in single-user environments
* The VM is now 64 bit, so if you need to compile any native code you should pass the `-m32` flag to compile it in 32-bit mode
* All other tools should be updated to current versions

## Motivation
The tools and platform in the original warzone VM are starting to become dated and I wanted to continue working through the course with modern tools I use in CTFs and real life pwning. 