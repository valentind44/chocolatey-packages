$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'http://static.infomaniak.ch/photofiltre/utils/pfsx-setup-fr-10.14.0.exe'
  checksum      = '7154108bcce3b6e4229e3e2d272fc2322504fd8840f668ff54fadd54c384ba8c'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
