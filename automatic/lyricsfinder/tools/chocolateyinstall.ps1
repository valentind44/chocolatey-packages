$ErrorActionPreference = 'Stop';
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$webFilePath = Join-Path $env:TEMP $env:ChocolateyPackageName | Join-Path -ChildPath $env:ChocolateyPackageVersion | Join-Path -ChildPath 'LyricsFinder.exe'

$getArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $webFilePath
  url           = 'https://www.mediahuman.com/download/LyricsFinder.exe'
  checksum      = 'c4c20012308f68ab4aa6a819a50b5a6df5ecc7b4927a69803b85cb917a64c24f'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @getArgs

"Extracting using innounp..."
innounp -x "$webFilePath" -d"$toolsDir" -y -q

Remove-Item -path "$toolsDir\{tmp}" -recurse
Remove-Item -path "$toolsDir\install_script.iss"
Move-Item -Path "$toolsDir\{app}\*" -Destination "$toolsDir" -Force -ErrorAction SilentlyContinue
Remove-Item -path "$toolsDir\{app}"

Install-ChocolateyShortcut -shortcutFilePath "$($env:ProgramData)\Microsoft\Windows\Start Menu\Lyrics Finder.lnk" -targetPath "$toolsDir\LyricsFinder.exe"
