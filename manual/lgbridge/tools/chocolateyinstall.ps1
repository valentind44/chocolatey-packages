$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'http://tool.cdn.gdms.lge.com/dn/downloader.dev?fileKey=PWZO7A26B9UW'
  checksum      = '85A7D2838DD51952F60059C0460E27FA3F9389572941980F0C8F0F7BDA24ADAA'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
