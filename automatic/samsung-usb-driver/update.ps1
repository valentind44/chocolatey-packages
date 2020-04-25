import-module au

function global:au_GetLatest {
    $url = 'https://d3unf4s5rp9dfh.cloudfront.net/Mobile_doc/SAMSUNG_USB_Driver_for_Mobile_Phones.exe'
    $tempDl = "$env:TEMP\aufile-samsung-usb-driver\SAMSUNG_USB_Driver_for_Mobile_Phones.exe"

    "Downloading file to get version"
    if (Test-Path $tempDl) {
        Remove-Item -path $tempDl
    }
    New-Item -Path "$env:TEMP\aufile-samsung-usb-driver" -ItemType Directory -Force
    Invoke-WebRequest -Uri $url -OutFile $tempDl
    $version = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($tempDl).FileVersion
    $checksum = (Get-FileHash $tempDl -Algorithm SHA256).Hash

    @{
       URL32   = $url
       Checksum32 = $checksum
       Version = $version
    }
}

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
          "(url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
		  "(checksum\s*=\s*)('.*')"      = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update