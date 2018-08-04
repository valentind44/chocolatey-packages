$ErrorActionPreference = 'Stop';

$url        = 'http://azure.distrib.naviextras.com/content/!application/LG/ToolboxDacia/2016042601_3.18.5.647040_STRICT_dacia/Dacia_Media_Nav_Toolbox_Setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'Dacia Media Nav Toolbox'
  checksum      = '287A82E896BEC832688B9F1CED93D75F'
  checksumType  = 'md5'
  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
