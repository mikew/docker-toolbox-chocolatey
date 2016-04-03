$ErrorActionPreference = 'Stop'
$packageName= 'docker-toolbox'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/docker/toolbox/releases/download/v1.10.3/DockerToolbox-1.10.3.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
  softwareName  = 'Docker Toolbox*'
  checksum      = ''
  checksumType  = 'md5'
  checksum64    = ''
  checksumType64= 'md5'
}

Install-ChocolateyPath "C:\Program Files\Docker Toolbox" Machine
Install-ChocolateyPackage @packageArgs
