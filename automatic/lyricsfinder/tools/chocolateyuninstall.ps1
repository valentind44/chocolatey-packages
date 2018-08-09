$shortcutFilePath = "$($env:ProgramData)\Microsoft\Windows\Start Menu\Lyrics Finder.lnk"
$registryKeyPathSoftware = "HKCU:\Software\MediaHuman\Lyrics Finder"
$registryKeyPathEditor = "HKCU:\Software\MediaHuman"

if (Test-Path $shortcutFilePath) {
  Remove-Item -path $shortcutFilePath
}

if (Test-Path $registryKeyPathSoftware) {
  Remove-Item -path $registryKeyPathSoftware -recurse
}

if (!(Test-Path $registryKeyPathEditor\*)) {
  Remove-Item -path $registryKeyPathEditor -recurse
}