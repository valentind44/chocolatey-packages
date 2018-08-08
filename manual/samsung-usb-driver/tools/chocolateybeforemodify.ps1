$key = Get-UninstallRegistryKey -SoftwareName "SAMSUNG USB Driver for Mobile Phones"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = '-s'
  file          = $key.UninstallString
}

Uninstall-ChocolateyPackage @packageArgs