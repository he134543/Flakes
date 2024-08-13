# Nix and Flake
Nix is a package manager that can create an isolated environment for running specific version of software.
It is similar to conda, but Nix is more stable especially for dealing with non-python softwares.

The `Flake.nix` is a control file to guide nix to create a virtual environmental, similar to the `environment.yml` file for `conda`.
This repository saves flake files that I've created for different uses.


# Quick Start

Take the `exactextract_python`, a working environment that contains a python binding of [exactextract](https://github.com/isciences/exactextract) as an example.

1. Install Nix and Enable Flake
Follow the official guide to install Nix in your Linux system.
Open the file `~/.config/nix/nix.conf` or `/etc/nix/nix.conf` with your text editor, add this line to the `nix.conf` file.
```
experimental-features = nix-command flakes
```

2. Develop your nix environment
Note: deactivate the `conda` environment first if it is automatically hooked to your terminal.
```{bash}
conda deactivate
cd exactextract_python
nix develop
```

3. Test if the `exactextract` python binding is successfully installed
```{bash}
python
...
>>> import exactextract
```