# PowerShell-Profile

Powershell Profile is just here to prettifies your prompt and create a "unix-like" environment.

## Prerequisites
- git for windows (winget install Git.Git)
- PSColor powershell module (Install-Module PSColor)

## Installing
Clone this repo
git clone https://github.com/aiola13/PowerShell-Profile.git

### PowerShell Profile Location
Open PowerShell
Type $profile

The $profile variable returns the profile for the current user in the current program (host). 

Usually
```
> $Home\[My ]Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

### Edit the PowerShell Profile
The profile is now created, allowing you to open and edit the PowerShell Profile. Again we are using the PowerShell command to open the profile file:

```
> ise $profile
```

### Execution Policy
To use the profile you will need to make sure you have set the Execution Policy to Remote Signed. Otherwise, you won’t be able to run the script when PowerShell opens. Make sure you run PowerShell with elevated permissions (admin mode) to change the execution policy:

```
Get-ExecutionPolicy
# Set the ExecutionPolicy to RemoteSigned:
Set-ExecutionPolicy RemoteSigned
```

## Contributing
Submit a Pull Request if you want to add something.
