$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'http://static.infomaniak.ch/photofiltre/utils/pfsx-setup-fr-10.13.1.exe'
  checksum      = '2289e58e91bb5dd3de0b58fb62536f82541f600b4bdb2766bd60066330b3eb50'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
