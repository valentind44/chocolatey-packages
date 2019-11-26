$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-4.2.1-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-4.2.1.exe'
  checksum      = 'b8a4270277c26174dc95162f224502acc1a7bb980a76347c1424a8a467507ea3'
  checksum64    = 'f08bb3cff076e310cedd4549e368e1b03ac38fc7976c2d194cd3d87d715f5851'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
