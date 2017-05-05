$build= [int32](((get-date).Year-2000)*366)+(Get-Date).DayOfYear

$VersionNumber = 'VersionNumber = ' + $env:Major_Revision + '.' + $env:Minor_Revision + '.' + $build + '.' + $env:Build_Id

$VersionNumber1 = $env:Major_Revision + '.' + $env:Minor_Revision + '.' + $build + '.' + $env:Build_Id

$MajorNumber = 'MajorNumber = ' + $env:Major_Revision
$MinorNumber = 'MinorNumber = ' + $env:Minor_Revision
$BuildNumber = 'BuildNumber = ' + $build
$RevisionNumber = 'RevisionNumber = ' + $env:Build_Id

$VersionNumber | Set-Content $env:workspace\$env:Deployment_Details_File.properties
$MajorNumber | Add-Content $env:workspace\$env:Deployment_Details_File.properties
$MinorNumber | Add-Content $env:workspace\$env:Deployment_Details_File.properties
$BuildNumber | Add-Content $env:workspace\$env:Deployment_Details_File.properties
$RevisionNumber | Add-Content $env:workspace\$env:Deployment_Details_File.properties

cd $env:workspace\$env:SVN_FOLDER_NAME
cd 'New Design\Workspace\XaftServer'
cmd.exe /c mvn -e versions:set -DnewVersion="$VersionNumber1"