$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-4.4.2-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-4.4.2.exe'
  checksum      = '5cd7b5b54c583b293516c6648bd407b555804fcb89bff61bd79b79ee0d74f877'
  checksum64    = '2e26599e998fad9fe25c89ed2f402aab92fe39a8442ca25c707644c962ee1ea5'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs
