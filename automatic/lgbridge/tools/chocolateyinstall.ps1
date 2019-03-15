$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'http://tool.cdn.gdms.lge.com/dn/downloader.dev?fileKey=PWZO7A26B9UW'
  checksum      = '57ce9bdfbecf5d3bd5a4f14ba86c2fa44bab944fa0459a52f2b4508ab6cecb46'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
