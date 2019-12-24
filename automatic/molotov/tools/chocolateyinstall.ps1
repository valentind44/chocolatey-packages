$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-4.2.2-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-4.2.2.exe'
  checksum      = '265becf14dd99152c12193b221a709aab0e5235be375c4efafd482673604b94c'
  checksum64    = '51e402a55a986acfeaaf27f5eb63e6cb94be801c82509bef5dd9f594806c8fc1'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
