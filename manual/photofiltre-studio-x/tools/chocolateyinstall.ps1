$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://static.infomaniak.ch/photofiltre/utils/pfsx-setup-fr-10.13.0.exe'
  checksum      = 'A0C6B066CF91CE94C53D1248307824410903F472BE7CFDCE2E14AD63DF6D3593'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs