$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-4.4.0-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-4.4.0.exe'
  checksum      = '65548b7d0b03c6a57f7b9a5bfba5dd2dc5d1a39fcbd0706e7f3a5c6833f29956'
  checksum64    = '2f41e6f4923ac5ba75ecc87cded2f45389009776b96af3322a767dcc35ab6365'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
