$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-3.0.2-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-3.0.2.exe'
  checksum      = '74290e43bca03809a1fd22aa32aed509dda91379ffb1cec26f28038952aa581d'
  checksum64    = '68c35c6168d7aefde5f9235fcc37807b561923e7c501beecf5d384c25932cb6e'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
