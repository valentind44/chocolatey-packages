$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-2.3.0-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-2.3.0.exe'
  checksum      = '2f714a73238b0b8b808d1bb3ff442c3589a67db07160a4a025b0d81e8a8cc5ab'
  checksum64    = 'd172b7357cca35ac555fe0f3420f2e2b5d8c06f1106ddcbf7db7b887f6dfa3c9'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
