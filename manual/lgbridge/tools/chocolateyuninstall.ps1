$ErrorActionPreference = "Stop";
 
$is64bit = Get-ProcessorBits 64
  
if ($is64bit) {
  $setupExePath = (Get-ItemProperty "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\LG Bridge").UninstallString
}
else {
  $setupExePath = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\LG Bridge").UninstallString
}
 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = $setupExePath
  fileType      = 'exe'
  silentArgs    = '/S'
}

Uninstall-ChocolateyPackage @packageArgs