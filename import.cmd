:: This batch script makes the Caché application deployment much faster by building and importing the project.
:: Replace the variables below to match your Caché installation and build & import application to Caché using only one command.

:: Caché 2016.2+ IS REQUIRED TO PROCEED
@echo off

:: CHANGE THIS PATH TO YOUR CACHÉ INSTALLATION PATH ON WINDOWS (folder that contains bin, CSP, mgr and other folders)
set CACHE_DIR=C:\Program Files\InterSystems\Ensemble
:: NAMESPACE TO IMPORT PACKAGE TO
set NAMESPACE=USER
set USERNAME=_SYSTEM
set PASSWORD=SYS

:: Build and import application to Caché
echo Importing project...
(
echo %USERNAME%
echo %PASSWORD%
echo s st = $system.Status.GetErrorText($system.OBJ.ImportDir("%~dp0\source\cls",,"ck /checkuptodate=all",,1^^^)^^^) w "IMPORT STATUS: "_$case(st="",1:"OK",:st^^^) halt
) | "%CACHE_DIR%\bin\cache.exe" -s "%CACHE_DIR%\mgr" -U %NAMESPACE%
