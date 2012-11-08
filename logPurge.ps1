#######################################################################################
## logPurge.ps1                                                                      ##
##                                                                                   ##
## This script is designed to traverse all folders (and subfolders) in a given       ##
## directory and delete stagnant files that are no longer required.                  ##
#######################################################################################

## You must set the execution policy to unrestricted before running this script. 
## Manually execute this command before running this script
#Set-ExecutionPolicy Unrestricted

## To schedule this task using windows scheduler, use the following configurations:
##   * Run whether user is logged in or not
##   * Configure for Windows 7 / Server 2008 R2
##   * Actions > Start a Program:
##      - Program: powershell.exe
##      - Arguments: "& 'E:\Scripts\logPurge.ps1'" (assuming this is the correct path)

## Define Variables

# Number of days to keep files
$days = 14

# Path to files in question
$path = "E:\Apache2.2\logs"

# Define what today is
$today = (Get-Date)

# Date to match for files to be deleted
$deleteDate = (Get-Date).AddDays(-$days)

## Code execution

foreach ($file in Get-ChildItem $path -recurse)
{
	if ($file.LastWriteTime -lt $deleteDate)
	{
		Remove-Item $file.FullName
	}
}

exit