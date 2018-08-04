$ErrorActionPreference = 'Stop';
$packageName = 'lyricsfinder'
$url = 'https://www.mediahuman.com/download/LyricsFinder.exe'
$checksum = '9F47879BDE2BA4263CB3C782F0A1934B'
$checksumType  = "md5"
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
 
$filename = [System.IO.Path]::GetFileNameWithoutExtension($url.Substring($url.LastIndexOf("/") + 1))
 
$chocTempDir = Join-Path $env:TEMP "chocolatey"
$tempDir = Join-Path $chocTempDir "$packageName"
if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
$file = Join-Path $tempDir "$filename.exe"
 
Get-ChocolateyWebFile -PackageName "$packageName" `
                      -FileFullPath "$file" `
                      -Url "$url" `
                      -Checksum "$checksum" `
                      -ChecksumType "$checksumType"
 
innounp -x $file -d"$toolsDir" -y

Remove-Item –path $toolsDir\`{tmp`} –recurse
Remove-Item –path $toolsDir\install_script.iss
Move-Item -Path $toolsDir\`{app`}\* -Destination $toolsDir
Remove-Item –path $toolsDir\`{app`}

Install-ChocolateyShortcut -shortcutFilePath "$($env:ProgramData)\Microsoft\Windows\Start Menu\Lyrics Finder.lnk" -targetPath "$toolsDir\LyricsFinder.exe"