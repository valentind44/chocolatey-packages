import-module au

$releases = 'http://www.photofiltre-studio.com/download.htm'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $re  = ".*pfsx-setup-fr-.*.exe"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href
    $version = $url -split '-|.exe' | select -Last 1 -Skip 1
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