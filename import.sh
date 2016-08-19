#!/usr/bin/env bash
# This batch script makes the Caché application deployment much faster by building and importing the project.
# Replace the variables below to match your Caché installation and build & import application to Caché using only one command.

# Caché 2016.2+ IS REQUIRED TO PROCEED
set +v
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# CHANGE THIS PATH TO YOUR CACHÉ INSTALLATION PATH (folder that contains bin, CSP, mgr and other folders)
CACHE_DIR=/InterSystems/Cache
# NAMESPACE TO IMPORT PACKAGE TO
NAMESPACE=USER
# Credentials
USERNAME=_SYSTEM
PASSWORD=SYS

# Build and import application to Caché
echo "Importing project..."
cat <<EOT | "$CACHE_DIR/bin/cache" -s "$CACHE_DIR/mgr" -U $NAMESPACE
$USERNAME
$PASSWORD
set st = \$system.Status.GetErrorText(\$system.OBJ.ImportDir("$DIR/source/cls",,"ck /checkuptodate=all",,1))
write "IMPORT STATUS: "_\$case(st="",1:"OK",:st), ! halt
EOT
