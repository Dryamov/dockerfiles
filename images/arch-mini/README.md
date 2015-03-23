Arch Linux: Minimal Base Image
=====

11 packages explicitly installed:

* [bash](https://www.archlinux.org/packages/core/x86_64/bash/)
* [coreutils](https://www.archlinux.org/packages/core/x86_64/coreutils/)
* [curl](https://www.archlinux.org/packages/core/x86_64/curl/)
* [filesystem](https://www.archlinux.org/packages/core/x86_64/filesystem/)
* [gcc-libs](https://www.archlinux.org/packages/core/x86_64/gcc-libs/)
* [glibc](https://www.archlinux.org/packages/core/x86_64/glibc/)
* [gzip](https://www.archlinux.org/packages/core/x86_64/gzip/)
* [pacman](https://www.archlinux.org/packages/core/x86_64/pacman/)
* [shadow](https://www.archlinux.org/packages/core/x86_64/shadow/)
* [tar](https://www.archlinux.org/packages/core/x86_64/tar/)
* [xz](https://www.archlinux.org/packages/core/x86_64/xz/)

Build archive by running `scripts/build_archive.sh` as root.

When building the image you need to run [haveged](https://wiki.archlinux.org/index.php/Haveged) or similar if your available random entropy is low.