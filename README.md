# Caché Project Development Without Studio <sup>(extended sample project)</sup>
This repository includes sample minimalistic Caché project, which is developed and maintained out of Caché
environment, directly in the file system. By running `import.bat` script the project imports to Caché.

Preview
-------

This project includes some sample classes, which create this web application:

![2016-06-30_154025](https://cloud.githubusercontent.com/assets/4989256/16488403/09f5006a-3ed9-11e6-8271-0ef6cfe7e1cb.png)

Requirements
------------

Requires [Node.JS](https://nodejs.org) (v0.10.0-6.2.2+), [Git](https://git-scm.com) and [Caché](http://www.intersystems.com/library/software-downloads/) 2016.2+ to be installed.

Prepare the import
------------------

0. Clone this repository to your local file system.
    * Use `git clone https://github.com/ZitRos/cache-dev-project` to clone the project.
    * Then enter cloned project's directory: `cd cache-dev-project`.
1. Edit [import.bat](https://github.com/ZitRos/cache-dev-project/blob/master/import.bat) (Windows) or [import.sh](https://github.com/ZitRos/cache-dev-project/blob/master/import.sh) (*nix) script:
    * Set `CACHE_DIR` variable to the directory of installed Caché in your system. Do not add whitespaces before or after `=` symbol.
    * Set `NAMESPACE` variable to the namespace you want import project to.
    * Set `USERNAME` and `PASSWORD` variables if Caché instance requires one.
    * Change `CSP_DIR` to the directory where you want static files to be copied to.
2. Each next time just run the `import.*` script!
    * You should receive build and import log, saying `IMPORT STATUS: OK` at the end.
    * After successful import, run `do ##class(DevProject.Robot).Message()` in Caché terminal to check if project imported.
    
A few more steps to make this project work
---------------------------------------------

1. Set up `/Robots` web-application in Caché and give it `DevProject.REST.Index` as a dispatch class.
2. Check if `/csp/user` web-application is set up (or whatever application you specified in `CSP_DIR`).
3. Go to `http://[host]:[port]/csp/user/index.html` after set up and import is done.
    
Contributing
------------

Feel free to improve and upgrade this repository, just keep it minimalistic.