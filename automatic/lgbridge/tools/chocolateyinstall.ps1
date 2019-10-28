$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'http://tool.lime.gdms.lge.com/dn/downloader.dev?fileKey=PWZO7A26B9UW'
  checksum      = '7af549b2bf0bdc65548a2d234c07e6191566d58affb807b2e782cfb9705ff058'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
