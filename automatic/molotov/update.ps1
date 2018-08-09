import-module au

$releases = 'https://desktop-auto-upgrade.molotov.tv/win/manifest.json'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases | ConvertFrom-Json
    @{
       URL32   = $download_page.url_ia32
       URL64   = $download_page.url_x64
       Version = $download_page.version
    }
}

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
          "(url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
          "(url64bit\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
		  "(checksum\s*=\s*)('.*')"      = "`$1'$($Latest.Checksum32)'"
		  "(checksum64\s*=\s*)('.*')"      = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update