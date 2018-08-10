$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'http://azure.distrib.naviextras.com/content/!application/LG/ToolboxDacia/2016042601_3.18.5.647040_STRICT_dacia/Dacia_Media_Nav_Toolbox_Setup.exe'
  checksum      = '7CFFBCDC04F0BC53D52521E7E75C85A17FE4D4023CE58A523D85CE5BCB9B1F32'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs