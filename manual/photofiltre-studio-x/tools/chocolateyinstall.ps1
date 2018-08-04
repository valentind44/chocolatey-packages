$ErrorActionPreference = 'Stop';

$url        = 'https://static.infomaniak.ch/photofiltre/utils/pfsx-setup-fr-10.13.0.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'PhotoFiltre Studio X'
  checksum      = 'C1032AD962E02E3FD764281D22C7F0FF'
  checksumType  = 'md5'
  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
