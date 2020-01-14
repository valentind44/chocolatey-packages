$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-4.2.3-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-4.2.3.exe'
  checksum      = 'd7e3ef609db2403ce5f1aebc0c63ae84f62c66e381158e028bc77bd1a9925ba7'
  checksum64    = '6342b7c620f489c916d98a983ba45d88745838fb1f41e1e7c5ed5adb4d42231e'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
