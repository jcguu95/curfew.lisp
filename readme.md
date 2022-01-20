### Usage

+ Customize `main.lisp` as you wish.
+ Ensure `sbcl`, `asdf`, and `local-time`.
+ Then`make build` to build a standalone executable `./bin/curfew`.
+ Instruct the root to run the executable at boot.

### Install

After installing the executable `/root/curfew.lisp/bin/curfew`, instruct the
root to run it at boot. On archlinux, systemd is used for running automatic
jobs. Put the following in `/etc/systemd/system/curfew.service`.

```
[Unit]
Description=curfew.lisp

[Service]
Type=forking
ExecStart=/root/curfew.lisp/bin/curfew
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
```

And run `systemctl [enable|start] curfew.service`.

### Bugs

+ The function `#'lock-url` has a weird bug; see comment in its code.
