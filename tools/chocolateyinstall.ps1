$ErrorActionPreference = 'Stop'
$packageName= 'docker-toolbox'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/docker/toolbox/releases/download/v1.10.3/DockerToolbox-1.10.3.exe'

$params = $env:chocolateyPackageParameters
$components = 'Docker,DockerMachine,DockerCompose'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

if (-Not ("$params" -match "/SkipVirtualBox")) {
  $components += ",VirtualBox"
}

if (-Not ("$params" -match "/SkipKitematic")) {
  $components += ",Kitematic"
}

if (-Not ("$params" -match "/SkipGit")) {
  $components += ",Git"
}

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  silentArgs    = "/COMPONENTS='$components' $silentArgs"
  validExitCodes= @(0)
  softwareName  = 'Docker Toolbox*'
  checksum      = ''
  checksumType  = 'md5'
  checksum64    = ''
  checksumType64= 'md5'
}

Install-ChocolateyPath "C:\Program Files\Docker Toolbox" Machine
Install-ChocolateyPackage @packageArgs
