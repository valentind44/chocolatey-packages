$ErrorActionPreference = 'Stop';

$url = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-2.2.2-ia32.exe'
$url64 = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-2.2.2.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64
  softwareName  = 'Molotov'
  checksum      = 'E50B61DFC76810D94F477404BD818F46'
  checksum64    = '4EF86E5FACF1C05A103CF5B142608907'
  checksumType  = 'md5'
  silentArgs   = '/s'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
