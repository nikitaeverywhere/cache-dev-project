# Caché Project Development Without Studio
This repository includes sample minimalistic Caché project, which is developed and maintained out of Caché
environment, directly in the file system. By running `import.bat` script the project imports to Caché.

This project includes `DevProject.Robot` class with `Message()` method. Any other classes should go
in hierarchy under the [source/cls](https://github.com/ZitRos/cache-dev-project/tree/master/source/cls)
directory.

Requirements
------------

Requires [Node.JS](https://nodejs.org) (v0.10.0-6.2.2+), [Git](https://git-scm.com) and [Caché](http://www.intersystems.com/library/software-downloads/) 2016.2+ to be installed.

Prepare the import (Windows)
----------------------------

0. Clone this repository to your local file system.
    * Use `git clone https://github.com/ZitRos/cache-dev-project` to clone the project.
    * Then enter cloned project's directory: `cd cache-dev-project`.
1. Edit [import.bat](https://github.com/ZitRos/cache-dev-project/blob/master/import.bat) script:
    * Set `CACHE_DIR` variable to the directory of installed Caché in your system. Do not add whitespaces before or after `=` symbol.
    * Set `NAMESPACE` variable to the namespace you want import project to.
    * Change other variables if necessary.
2. Each next time just run the `import.bat` script!
    * You should receive build and import log, saying `IMPORT STATUS: OK` at the end.
    * After successful import, run `do ##class(DevProject.Robot).Message()` in Caché terminal to check if project imported.

Prepare the import (*nix)
-------------------------

0. Clone this repository to your local file system.
    * Use `git clone https://github.com/ZitRos/cache-dev-project` to clone the project.
    * Then enter cloned project's directory: `cd cache-dev-project`.
1. Write analogue of windows `import.bat` script and make a pull request :) Thanks!