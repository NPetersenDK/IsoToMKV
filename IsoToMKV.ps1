<#

.Author
Nikolaj Petersen
https://nipetersen.dk
github@nipetersen.dk
gist.github.com/NPetersenDK


.Changelog
26. December 2016:
Initial Release

27. December 2016:
Touch up and release to gist.github.com/NPetersenDK

14. December 2017:
People got errors, inserted a test to check if MakeMKV is installed.

31. May 2019:
Making Write-Progress and adding Rename-Item for file: title_t00.mkv
It will make error one of them (non-issue), but due to lazyness i haven't added a Test-Path check.

31. May 2019 2:
Making a test if the path exists, and does not create or try converting if it does (why didn't i think of this..?)
Making Write-Progress show percentage/status bar (yay!)
Also removing title00.mkv to the rename thingy.

.Description
Getting rid of the old and beloved method
to rip movies in: ISO, with this script you
can convert all files in a directory to MKV

I do not support this, check out the MakeMKV 
Forum and make your own if it's broken.

Needed Requirements:
- MakeMKV 32-BIT VERSION
- PowerShell 2.0
- A little bit of brain, to analyze and understand

#>

$Date = Get-Date -UFormat "%d-%m-%Y-%H%M%S"
$Logfile = "$PSScriptRoot\IsoToMKV-$Date.txt"

function Logging($data){
    $LogFile = "$PSScriptRoot\IsoToMKV-$Date.txt"
    "$((Get-Date).ToLocalTime()): $data" | Out-File -FilePath $LogFile -Encoding utf8 -Append
}

$MakeMKVLocation = "I:\Bjarne Film 1"
$ExportLocation = "H:\NotRedundant_Disk3\Film_Disk3\EN\Retail\DVD\Bjarne-film10"

Logging "IsoToMKV started! Looking for files in $MakeMKVLocation and inserting them as MKV to $ExportLocation"

$ISO = Get-ChildItem $MakeMKVLocation | select -ExpandProperty FullName
$ISO1 = Get-ChildItem $MakeMKVLocation | select -ExpandProperty BaseName

$TestMakeMKV = Test-Path "C:\Program Files (x86)\MakeMKV\makemkvcon.exe"
$i = 0
if ($TestMakeMKV -eq $false) {

    Write-Host "MakeMKV does not seem to be installed, please check exiting."
    Logging "Could not find MakeMKV, exited."

}

else {
   
    Write-Host "MakeMKV exists! Starting on files in $MakeMKVLocation"

    foreach ($File in $ISO1) {
        Write-Progress -Activity "Coverting to MKV" -Status "Working on $file" -PercentComplete ((($i++) / $ISO1.Count) * 100)

        $TestFolder = Test-Path $ExportLocation\$File 

        if ($TestFolder) {
            Write-Host "Already converted: skipped $file"
            Logging "Already converted: skipped $file"
        }

        else {
        
            Write-Host "Working on $file"
            Logging "Working on $file"

            New-Item $ExportLocation\$File -ItemType Directory
            Write-Host "Starting on: $File" -ForegroundColor Green
            
            [String]$pathtomakemkv = "C:\Program Files (x86)\MakeMKV\makemkvcon.exe";
            [Array]$arguments = "--minlength=2500","mkv","iso:$MakeMKVLocation\$File.iso","all","$ExportLocation\$File";
            & $pathtomakemkv $arguments;
            
            $FileTest_Title_t00 = Test-Path "$ExportLocation\$File\title_t00.mkv"
            $FileTest_Title_t01 = Test-Path "$ExportLocation\$File\title_t01.mkv"

            if ($FileTest_Title_t00) {
                Write-Host "Renaming title_t00 to $File.mkv" -ForegroundColor Green
                Logging "Renaming title_t00 to $File.mkv"
                Rename-Item $ExportLocation\$File\title_t00.mkv "$File.mkv"
            }
            else {
                Write-Host "title_t00 was not found in $File - Please check!" -ForegroundColor Red
                Logging "ERROR: title_t00 was not found in $File - Please check!"
                
            }

            if ($FileTest_Title_t01) {
                Write-Host "There is more than one title in $File - Please check!" -ForegroundColor Red
                Logging "NOTE: There is more than one title in $File - Please check!"

            }
        }
    }

}
