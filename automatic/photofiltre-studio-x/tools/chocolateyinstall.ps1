$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'http://static.infomaniak.ch/photofiltre/utils/pfsx-setup-fr-10.14.0.exe'
  checksum      = '9F883BB57C6E6BB03DC08C30DB4163A56D66BA5F4E4F178CF6E2033F7B89226F'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
