LogPurge
--------

### Description ###

This script is designed to traverse all folders (and subfolders) in a given directory and delete stagnant files that are no longer required.

### Installation ###

You must set the execution policy to unrestricted before running this script. Manually execute this command before running this script:

`Set-ExecutionPolicy Unrestricted`

To schedule this task using windows scheduler, use the following configurations:

* Run whether user is logged in or not
* Configure for Windows 7 / Server 2008 R2
* Actions > Start a Program:
	* Program: `powershell.exe`
	* Arguments: `"& 'E:\Scripts\logPurge.ps1'"` (assuming this is the correct path)