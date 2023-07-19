$URL = "https://github.com/jsoftware/jinstall/releases/download/build/revision.txt"
Invoke-WebRequest -URI $URL -OutFile "revision.txt"
         
$Version = Get-Content revision.txt
$Folder = 'j' +$Version.Substring(0, 3)
$ID = "Jsoftware.J." + $Version.Substring(0, 3)
         
echo "Version=$Version" >> $env:GITHUB_ENV
echo "Folder=$Folder" >> $env:GITHUB_ENV
echo "ID=$ID" >> $env:GITHUB_ENV