$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'http://azure.distrib.naviextras.com/content/!application/LG/ToolboxDacia/2018080701_3.18.5.740218_STRICT_dacia/Dacia_Media_Nav_Toolbox_Setup.exe'
  checksum      = '496a42a56a164f549cb22489170c9f70e55066164aab9a6374d44537613f1764'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
