$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-4.3.0-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-4.3.0.exe'
  checksum      = '14f4324363ff381d19a7044294e326c7157caa7bf5ab6510f090b5e01a20520d'
  checksum64    = 'af33ab3ce0843d34ee8a9cb2352de331367fe903cab6a37d6da16edb53b3f48d'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
