$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://developer.samsung.com/common/download.do?actId=698'
  checksum      = '41fdd3f8c2fa7ff3500ffa170121a91897fc7a13b2952d821d36a75e7706d1d3'
  checksumType  = 'sha256'
  silentArgs   = '-s -no_chk_inst_ui -quiet -force_inst'
}

Install-ChocolateyPackage @packageArgs
