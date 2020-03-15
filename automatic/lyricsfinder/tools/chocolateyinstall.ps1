$ErrorActionPreference = 'Stop';
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$webFilePath = Join-Path $env:TEMP $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion | Join-Path -ChildPath 'LyricsFinder.exe'

$getArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $webFilePath
  url           = 'https://www.mediahuman.com/download/LyricsFinder.exe'
  checksum      = '26cb350dbfdaf839febca6001bd227142a37619ff61acd201771823981184289'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @getArgs

"Extracting using innounp..."
innounp -x "$webFilePath" -d"$toolsDir" -y -q

Remove-Item -path "$toolsDir\{tmp}" -recurse
Remove-Item -path "$toolsDir\install_script.iss"
Move-Item -Path "$toolsDir\{app}\*" -Destination "$toolsDir" -Force
Remove-Item -path "$toolsDir\{app}"

Install-ChocolateyShortcut -shortcutFilePath "$($env:ProgramData)\Microsoft\Windows\Start Menu\Lyrics Finder.lnk" -targetPath "$toolsDir\LyricsFinder.exe"
