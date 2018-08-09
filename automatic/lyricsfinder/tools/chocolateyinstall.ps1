$ErrorActionPreference = 'Stop';
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$webFilePath = Join-Path $env:TEMP $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion | Join-Path -ChildPath 'LyricsFinder.exe'

$getArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $webFilePath
  url           = 'https://www.mediahuman.com/download/LyricsFinder.exe'
  checksum      = 'BF59876A6EF5D1224A881562DA3D1B9BE6E7D822489A35F087509ADD4BFBF3B8'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @getArgs

"Extracting using innounp..."
innounp -x "$webFilePath" -d"$toolsDir" -y -q

Remove-Item -path "$toolsDir\{tmp}" -recurse
Remove-Item -path "$toolsDir\install_script.iss"
Move-Item -Path "$toolsDir\{app}\*" -Destination "$toolsDir"
Remove-Item -path "$toolsDir\{app}"

Install-ChocolateyShortcut -shortcutFilePath "$($env:ProgramData)\Microsoft\Windows\Start Menu\Lyrics Finder.lnk" -targetPath "$toolsDir\LyricsFinder.exe"