$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$vstDir = "C:/VST/64-bit/$env:ChocolateyPackageName"

$url64      = 'https://www.airwindows.com/wp-content/uploads/WinVST64s.zip' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $vstDir
  url64bit      = $url64
  #file         = $fileLocation

  softwareName  = 'airwindows*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  # Checksums are now required as of 0.10.0.
  # To determine checksums, you can get that from the original site if provided.
  # You can also use checksum.exe (choco install checksum) and use it
  # e.g. checksum -t sha256 -f path\to\file
  checksum      = ''
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = '45C6FCFA465926274840C9B1577995F34BE1D516286170FCAC2CEBCBECA6F37F'
  checksumType64= 'sha256' #default is checksumType
}

## Unzips a file to the specified location - auto overwrites existing content
## - https://docs.chocolatey.org/en-us/create/functions/get-chocolateyunzipp
Get-ChocolateyUnzip "$toolsDir/WinVST64s.zip" $vstDir
