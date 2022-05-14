#Author: aiola
#Force coloring of git and npm commands 
$env:TERM = 'cygwin'
$env:TERM = 'FRSX'
$global:foregroundColor = 'white'
$time = Get-Date
$psVersion = $host.Version.Major

#Get all ressources
$curUser = (Get-ChildItem Env:\USERNAME).Value
$curComp = (Get-ChildItem Env:\COMPUTERNAME).Value
$curSys = (Get-CimInstance Win32_OperatingSystem | Select-Object -Expandproperty InstallDate)
$curGC = (Get-WmiObject win32_VideoController | Select-Object -Expandproperty caption)
$curOS = (Get-CimInstance Win32_OperatingSystem | Select-Object -Expandproperty Caption)
$curArch = (Get-CimInstance Win32_OperatingSystem | Select-Object -Expandproperty OSArchitecture)
$curProc = (Get-WmiObject -Class Win32_Processor | Select-Object -Expandproperty Name)
$curProcPhy = (Get-WmiObject -Class Win32_Processor | Select-Object -Expandproperty NumberOfCores)
$curProcLog = (Get-WmiObject -Class Win32_Processor | Select-Object -Expandproperty NumberOfLogicalProcessors)
$curRAM = (Get-WmiObject win32_physicalmemory | Select-Object -Expandproperty Manufacturer) + (Get-WmiObject win32_physicalmemory | Select-Object -Expandproperty Configuredclockspeed) + "Mhz"
$PysicalMemory = (Get-WmiObject -class "win32_physicalmemory" -namespace "root\CIMV2" -ComputerName $curComp)

#Write on console
Write-Host
Write-Host "Hello, $curUser! "$([char]9829) -foregroundColor $foregroundColor -NoNewLine; Write-Host  -foregroundColor Red
Write-Host "Today is: $($time.ToLongDateString())"
Write-Host "Welcome to PowerShell version: $psVersion" -foregroundColor Green
Write-Host "My computer: $curComp" -foregroundColor green
Write-Host "Installed on : $curSys"
Write-Host "OS Version: $curOS $curArch"
Write-Host "Processor: $curProc $curProcPhy $curProcLog"
Write-Host "Graphic Card: $curGC"
Write-Host "RAM: $curRAM $((($PysicalMemory).Capacity | Measure-Object -Sum).Sum / 1GB)GB"
Write-Host "Let's Code !"
Write-Host

# Create home alias to folder in which shell was started
Set-Location -Path "~"
$_home = PWD
function goHome { Set-Location $_home }
Set-Alias home goHome

# Create root alias to folder in which shell was started
Set-Location -Path "C:\"
$_root = PWD
function goRoot { Set-Location $_root }
Set-Alias root goRoot

function Prompt {
	# Prompt Colors
	# Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow
	# Gray DarkGray Blue Green Cyan Red Magenta Yellow White

	# $prompt_text = "White"
	# $prompt_background = "DarkMagenta"
	$prompt_git_background = "Yellow"	
	$prompt_git_text = "Black"	
	$prompt_icon_foreground = "Green"
	
	# Grab Git Branch
	$git_string = "";
	git branch | foreach {
		if ($_ -match "^\* (.*)") {
			$git_string += $matches[1]
		}
	}
	
	$EmojiIcon = [System.Convert]::toInt32("1F47D", 16)

	#$curtime = Get-Date

	$path = PWD

	Write-Host -NoNewLine "" -foregroundColor Green 

	Write-Host -NoNewLine ("AiolaShell" + ([System.Char]::ConvertFromUtf32($EmojiIcon)) + $path) -foregroundColor $foregroundColor

	Write-Host -NoNewLine "$([char]955)" -foregroundColor Green

	if ($git_string) {
		Write-Host "($git_string)"  -NoNewLine -foregroundColor $prompt_git_text -backgroundColor $prompt_git_background
		Write-Host  ">" -NoNewline -foregroundColor $prompt_git_background 
	}
	else {
		Write-Host ">" -ForegroundColor $prompt_icon_foreground -NoNewline
	}

	Return " "

}