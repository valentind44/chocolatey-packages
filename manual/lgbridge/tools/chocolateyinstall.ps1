$ErrorActionPreference = 'Stop';

$url = 'http://tool.cdn.gdms.lge.com/dn/downloader.dev?fileKey=PWZO7A26B9UW'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'LG Bridge'
  checksum      = '818D81DF522299E494495737CD386E49'
  checksumType  = 'md5'
  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
