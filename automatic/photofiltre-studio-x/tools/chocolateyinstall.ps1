$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'http://static.infomaniak.ch/photofiltre/utils/pfsx-setup-fr-10.14.1.exe'
  checksum      = '1fa942b6829771f594f8f6b0899c557f31caa79eb8137dd59394121adf254bb5'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
