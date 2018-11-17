$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'http://tool.cdn.gdms.lge.com/dn/downloader.dev?fileKey=PWZO7A26B9UW'
  checksum      = 'f3cccca6ba2ccafb626dc2b6131d30a594d53ad8469f14b91a69c341a988fa21'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
