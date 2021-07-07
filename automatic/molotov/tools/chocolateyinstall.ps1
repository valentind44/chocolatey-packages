$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-4.4.4-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-4.4.4.exe'
  checksum      = 'b8ea8a9b0012b0b3c62c8ce04a8d985433e449a92d3e97afdb510c2f631ed79c'
  checksum64    = 'bae9f8bfbdc53f32b220e071d874eaa805ceb00ab71efa8811e37c16f01b65f9'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
