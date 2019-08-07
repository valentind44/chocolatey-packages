$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-4.1.0-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-4.1.0.exe'
  checksum      = 'af79b17e7fa9a22edaccfd0077158eb6113665412b10521e41cbf1f34534b6cd'
  checksum64    = '17d7153dbd22d19441db6770ed12ae99cdbf5c4f90100979547905e8ec4b9a1e'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
