$ErrorActionPreference = 'Stop';
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$webFilePath = Join-Path $env:TEMP $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion | Join-Path -ChildPath 'LyricsFinder.exe'

$getArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $webFilePath
  url           = 'https://www.mediahuman.com/download/LyricsFinder.exe'
  checksum      = 'b79dadac5e4111965f8c770faaf31b42334ca94df8e8fa0964031faf21207c5b'
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
