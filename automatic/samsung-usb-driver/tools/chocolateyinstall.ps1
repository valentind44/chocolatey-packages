$ErrorActionPreference = 'Stop';
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$webFilePath = Join-Path $env:TEMP $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion | Join-Path -ChildPath 'SAMSUNG_USB_Driver_for_Mobile_Phones.zip'

$getArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $webFilePath
  url           = 'https://developer.samsung.com/common/download.do?actId=698'
  checksum      = '4B3602237A636A26CB894B61BA718F7B1C9DF24DF63CACF64185EC0AB242F39C'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @getArgs


$unzipArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $webFilePath
  destination   = Join-Path $env:TEMP $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion
}

Get-ChocolateyUnzip @unzipArgs


$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  file         = Join-Path $unzipArgs.destination 'SAMSUNG_USB_Driver_for_Mobile_Phones.exe'
  silentArgs   = '-s'
}

Install-ChocolateyInstallPackage @packageArgs