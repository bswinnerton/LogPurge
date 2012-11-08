## You must set the execution policy to unrestricted before running this script. 
## Manually execute this command before running this script
#Set-ExecutionPolicy Unrestricted

## Define Variables

# Number of days to keep logs
$days = 30;

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