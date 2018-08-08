$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://desktop-auto-upgrade.molotov.tv/win/ia32/MolotovSetup-2.2.2-ia32.exe'
  url64bit      = 'https://desktop-auto-upgrade.molotov.tv/win/x64/MolotovSetup-2.2.2.exe'
  checksum      = '341088AC3E5DB93EC0763B93D9459FF17C5B8A95E38A33D2D9464449C5C1534B'
  checksum64    = '964A453F3BAD51EB591985C51592D74C8D33999A71EBBDEA7D002CA5BE6CDF11'
  checksumType  = 'sha256'
  silentArgs   = '/s'
}

Install-ChocolateyPackage @packageArgs