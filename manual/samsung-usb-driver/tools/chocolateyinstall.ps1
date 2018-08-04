$ErrorActionPreference = "Stop";
$packageName = "samsung-usb-driver"
$installerType = "exe"
$silentArgs = "/S"
$url = "https://developer.samsung.com/common/download.do?actId=698"
$checksum = "473B36AD3E63CCF3D5C293A34753FD6A"
$checksumType  = "md5"
$validExitCodes = @(0)
 
$filename = "SAMSUNG_USB_Driver_for_Mobile_Phones"
$zipFile = "$filename.zip"
$exeFile = "$filename.exe"
 
$chocTempDir = Join-Path $env:TEMP "chocolatey"
$tempDir = Join-Path $chocTempDir "$packageName"
if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
$file = Join-Path $tempDir $zipFile
 
Get-ChocolateyWebFile -PackageName "$packageName" `
                      -FileFullPath "$file" `
                      -Url "$url" `
                      -Checksum "$checksum" `
                      -ChecksumType "$checksumType"
 
Get-ChocolateyUnzip -FileFullPath "$file" `
                    -Destination "$tempDir" `
                    -PackageName "$packageName"
 
$file = Join-Path $tempDir $exeFile
 
Install-ChocolateyInstallPackage -PackageName "$packageName" `
                                 -FileType "$installerType" `
                                 -SilentArgs "$silentArgs" `
                                 -File "$file" `
                                 -ValidExitCodes $validExitCodes