# Log4j Updater

With the inevitable need to update the famous Java framework called Log4j, numerous companies are needing to update Log4j on several computers at the same time, which takes time and cost, and that's where the **Log4j Updater** comes in.

`log4jupdater.sh` is a simple bash script with the aim of **automatically detecting the package manager to be used by the system and, if you have a log4j repository, update it and install the latest version possible, automating the process of updating it on multiple machines at once.**

## compatibility

The only package managers compatible with the script are `APT` and `YUM`.

The following links can be useful to check if log4j packages exist on famous linux systems and version used:

| System | Link |
|:------:|------|
| CentOS | [here](https://pkgs.org/download/log4j) |
| Debian | [here](https://packages.debian.org/search?keywords=liblog4j1.2-java&searchon=names&suite=stable&section=all) |
| Ubuntu | [here](https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=liblog4j2-java) |   

## Safe versions

The script will attempt to update Log4j to the latest possible version supported by the package manager. The following versions below are considered safe against **CVE-2021-44228**:

- **1.X versions** are all safe
- **2.X versions** are only safe from 2.15.0 or above (>=2.15.0)

## Script Usage

```sh
bash log4jupdater.sh
```