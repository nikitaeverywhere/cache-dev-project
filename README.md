# Caché Project Development Without Studio
This repository includes sample minimalistic Caché project, which is developed and maintained out of Caché
environment, directly in the file system. By running `import.bat` script the project imports to Caché.

To get **more advanced example**, please check the [extended version](https://github.com/ZitRos/cache-dev-project/tree/extended) tree.

This project includes `DevProject.Robot` class with `Message()` method. Any other classes should go
in hierarchy under the [source/cls](https://github.com/ZitRos/cache-dev-project/tree/master/source/cls)
directory.

Requirements
------------

Requires [Git](https://git-scm.com) and [Caché](http://www.intersystems.com/library/software-downloads/) 2016.2+ to be installed.

Prepare the import
------------------

0. Clone this repository to your local file system.
    * Use `git clone https://github.com/ZitRos/cache-dev-project` to clone the project.
    * Then enter cloned project's directory: `cd cache-dev-project`.
1. Edit [import.bat](https://github.com/ZitRos/cache-dev-project/blob/master/import.bat) (Windows) or [import.sh](https://github.com/ZitRos/cache-dev-project/blob/master/import.sh) (*nix) script:
    * Set `CACHE_DIR` variable to the directory of installed Caché in your system. Do not add whitespaces before or after `=` symbol.
    * Set `NAMESPACE` variable to the namespace you want to import project to.
    * Set `USERNAME` and `PASSWORD` variables if Caché instance requires ones.
2. Each next time just run the `import.*` script!
    * You should receive build and import log, saying `IMPORT STATUS: OK` at the end.
    * After successful import, run `do ##class(DevProject.Robot).Message()` in Caché terminal to check if project imported.
    
Contributing
------------

Feel free to improve and upgrade this repository, just keep it minimalistic.
