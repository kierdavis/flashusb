flashusb - flash USB sticks with a template filesystem, in parallel
===================================================================

# Prerequisites

* A Linux-based operating system
* [Python](https://www.python.org/) (>= 3.6)
* [parted](https://www.gnu.org/software/parted/)
* [rsync](https://rsync.samba.org/)

Nix/NixOS users can start a shell in which these dependencies are available by running `nix-shell` in a checkout of this repository.

# Usage

Flash `/dev/sdb`, `/dev/sdc` and `/dev/sdd` each with a single partition containing an empty FAT filesystem:

```bash
./flashusb /dev/sdb /dev/sdc /dev/sdd
```

As above, but taking advantage of [bash brace expansion](https://www.gnu.org/software/bash/manual/html_node/Brace-Expansion.html) to be more concise:

```bash
./flashusb /dev/sd{b,c,d}
```

## Customising the USB stick

To populate the filesystem with some files, create a directory to be used as a template.

```bash
mkdir my_template
cat >my_template/main.py <<EOF
from sbot import Robot
r = Robot()
r.motor_board.motors[0].power = 0.5
EOF
```

Then pass it to flashusb using `-t`/`--template`:

```bash
./flashusb -t my_template /dev/sd{b,c,d}
```

The volume label (which will be visible in Windows Explorer on Windows or in `/dev/disk/by-label` on Linux) can be customised with `-L/--label`. It defaults to `ROBOT`. Due to the requirements imposed by the FAT filesystem format, it can be no more than 11 ASCII characters long.

```bash
./flashusb -L MY_ROBOT /dev/sd{b,c,d}
```

## License

This project is released under the MIT Licence. For more information, please see `LICENSE`.
