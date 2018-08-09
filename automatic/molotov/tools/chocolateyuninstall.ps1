$ErrorActionPreference = "Stop";

$setupExePath = (Get-ItemProperty HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Molotov).InstallLocation
 
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$setupExePath\Update.exe"
  fileType      = 'exe'
  silentArgs    = '--uninstall -s'
}

Uninstall-ChocolateyPackage @packageArgs