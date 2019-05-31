# IsoToMKV
Convert your ISO files to MKV by using PowerShell and MakeMKV

## Prerequisites
1) PowerShell 2.0 or higher
2) MakeMKV in a licensed / beta version
3) A little bit of brain to understand the script

## How to use:
Open the script and change these two variables: $MakeMKVLocation and $ExportLocation
The $MakeMKVLocation is where your ISO's is right now. And they need to be in the root of that directory, they can't be in subdirectories.
$ExportLocation is where you want the converted versions to be. I recommend two diffrent paths for example:

```
$MakeMKVLocation = "C:\Users\$env:username\Desktop\MyMovies"
$ExportLocation = "C:\Users\$env:username\Desktop\MyExportedMovies"
