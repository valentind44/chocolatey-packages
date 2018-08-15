import-module au

$releases = 'https://www.mediahuman.com/lyrics-finder/'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $re  = '.exe$'
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href
    $url = 'https://www.mediahuman.com/' + $url
    $re  = '<span itemprop="softwareVersion">(.+?)</span>'
    if ($download_page.Content -match $re)
    {
        $version = $matches[1]
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