$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-3.0.0-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-3.0.0.exe'
  checksum      = '586a03d6f6a4983c92f7ddcc0555fa9dbc0a23ee56e48d6b106b3954b065d60c'
  checksum64    = '886f727b9ee2401327a02b42e85b301e5a954bcad27822a19d5dffe7bae77fb6'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
