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

The `.venv` appeared in the directory saved all installed packages and softwares specified in the Flake file.
![Snapshot1](https://github.com/he134543/Flakes/docs/1.gif)

3. Test if the `exactextract` python binding is successfully installed
![Snapshot2](https://github.com/he134543/Flakes/docs/2.gif)

4. Exit the nix environment
Type `exit` to exit the nix environment, and run `nix develop` to enter the nix env again. If the nix env has been successfully built last time with the `.venv` presents, the second time will automatically identify the `.venv` and skip the process of downloading/installing packages.

![Snapshot3](https://github.com/he134543/Flakes/docs/3.gif)