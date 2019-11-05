$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-4.2.0-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-4.2.0.exe'
  checksum      = '3ba3b5a9f876bdf317f21dfaef504f50a16b1d60dd62ee04e8b0b5c1dea0fe35'
  checksum64    = '04b3e27fd596a73e0b87d37281312dd8d426321f4911a8d6b94236799a4bf406'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
