import-module au

$releases = 'https://www.lg.com/us/support/product-help/CT10000027-1438110404543'

function global:au_GetLatest {
$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

$re  = ".*downloader.dev.*"
$url = $download_page.links | ? href -match $re | select -First 1 -expand href

$re  = 'Last Updated </em>(.+?)</span>'
if ($download_page.Content -match $re)
    {
        $date = $matches[1]
    }

if (!(Test-Path "date.txt")) {
   'No date' | Out-File -filepath date.txt       
}
$packageDate = Get-Content date.txt


if ($date -ne $packageDate)
    {
        "Date mismatch: new version may be available"
        $date | Out-File -filepath date.txt

        "Downloading file to get version"
        if (Test-Path "$env:TEMP\aufile-lgbridge") {
          Remove-Item -path "$env:TEMP\aufile-lgbridge"
        }
        Invoke-WebRequest -Uri $url -OutFile "$env:TEMP\aufile-lgbridge"

        $version = (Get-Item "$env:TEMP\aufile-lgbridge").VersionInfo.ProductVersion

    }
    else{
    [xml]$nuspec = Get-Content 'lgbridge.nuspec'
    $version = $nuspec.package.metadata.version
    }
    @{
       URL32   = $url
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