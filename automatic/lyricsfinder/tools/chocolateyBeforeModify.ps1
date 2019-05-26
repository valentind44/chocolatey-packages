$ErrorActionPreference = 'Stop';
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Remove-Item -path "$toolsDir\*" -exclude chocolateyBeforeModify.ps1,chocolateyInstall.ps1,chocolateyUninstall.ps1 -recurse