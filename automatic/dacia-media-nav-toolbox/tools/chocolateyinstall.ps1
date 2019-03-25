$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'http://cdns.distrib.naviextras.com/content/!application/LG/ToolboxDacia/2019031917_3.18.5.753187_STRICT_dacia/Dacia_Media_Nav_Toolbox_Setup.exe'
  checksum      = 'a7878428a535b37a2000728b4281e8f1faac042d25258e6f7cb07687f948aada'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
