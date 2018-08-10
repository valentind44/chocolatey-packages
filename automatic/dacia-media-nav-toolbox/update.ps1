import-module au

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://dacia.naviextras.com/shop/portal/chooseDevice?p2ModelCode=3363290103891882' -SessionVariable session -UseBasicParsing
    $download_page = Invoke-WebRequest -Uri 'https://dacia.naviextras.com/shop/portal/downloads' -WebSession $session -UseBasicParsing
    $re  = ".*download.*"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href
    $url = 'https://dacia.naviextras.com' + $url
    
    $request = Invoke-WebRequest -Uri $url -MaximumRedirection 0 -ErrorAction Ignore -WebSession $session
 
    if($request.StatusDescription -eq 'found')
    {
       $url = $request.Headers.Location
    }

    $version = ($url -split '/' | select -Last 1 -Skip 1)
    $version = ($version -split '_' | select -Last 1 -Skip 2)
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