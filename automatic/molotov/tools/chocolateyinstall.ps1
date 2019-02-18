$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-3.1.0-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-3.1.0.exe'
  checksum      = '288ee4909b1794d98e3859b8f88075584338513e4fb577eea4cc1d971d4060ad'
  checksum64    = 'f62945f2bcbac77ec1b81ab327cb96853586085f717e0e876b979795e639aeb1'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
