$URL = "https://github.com/jsoftware/jinstall/releases/download/build/revision.txt"
Invoke-WebRequest -URI $URL -OutFile "revision.txt"

$Version = Get-Content revision.txt

$t = $Version.Split(".")
$maj = $t[0]
$min = $t[1]
$num = ($maj + "." + $min)

$Folder = 'j' + $num
$ID = "Jsoftware.J." + $num

echo "Version=$Version" >> $env:GITHUB_ENV
echo "Folder=$Folder" >> $env:GITHUB_ENV
echo "ID=$ID" >> $env:GITHUB_ENV

$EXE = ("https://www.jsoftware.com/download/$env:Folder/install/j" + $Version + "_win64_slim.exe")
echo ($ID + ".slim -u " + $EXE + " -s -v " + $Version)
