$vstDir = "C:/VST/64-bit/$env:ChocolateyPackageName"

$ErrorActionPreference = 'Stop'; # stop on all errors
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'airwindows*'  #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
}

rm -r -fo "$vstDir"
