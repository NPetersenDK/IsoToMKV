# IsoToMKV - Converting ISO files the easy and fast way.

A PowerShell script that can convert the "old" beloved ISO format to MKV. This script only needs two types of input - where you have your current ISO's and where you want the script to export them.

IsoToMKV uses MakeMKV that are a licensed software to do this.

## Prerequisites
1) PowerShell 2.0 or higher
2) MakeMKV in a licensed / beta version. You can find MakeMKV here: https://www.makemkv.com/
3) A little bit of brain to understand the script

# What this script does
1) Checks for ISO-files in the $MakeMKVLocation parameter: No subdirectories are being checked. Making MKV look for Titles over 2500 seconds (40 minutes - can be changed in script)
2) Converting them to MKV to the destination ($ExportLocation)
3) Renaming title_t00 to the file name of the ISO.

All actions are logged in a file named: IsoToMKV-timestamp.txt that are placed the same place as the script.

## How to use:
Open the script and change these two variables: $MakeMKVLocation and $ExportLocation
The $MakeMKVLocation is where your ISO's is right now. And they need to be in the root of that directory, they can't be in subdirectories.
$ExportLocation is where you want the converted versions to be. I recommend two diffrent paths for example:

```
$MakeMKVLocation = "C:\Users\$env:username\Desktop\MyMovies"
$ExportLocation = "C:\Users\$env:username\Desktop\MyExportedMovies"
```

## Disclaimer:
1) I'm not a part of the MakeMKV Team and therefore don't any rights to their software. I recommend going to their community website for help. You can support MakeMKV by buying their software here: https://www.makemkv.com/buy/
2) I do not support this script, but you are more than welcome to make an issue and maybe i'll look into it.

## License
This project is licensed under the MIT License, therefore a copyright notice is required to be given.

## Contact
If you want to contact me about this project, you can do so by sending me an e-mail at github@nipetersen.dk. Support is very limited, but I might help if I have the time to do so.

```
 ____  _____ _____ _____ ____  ____  _____ _   _
|  _ \| ____|_   _| ____|  _ \/ ___|| ____| \ | |
| |_) |  _|   | | |  _| | |_) \___ \|  _| |  \| |
|  __/| |___  | | | |___|  _ < ___) | |___| |\  |
|_|   |_____| |_| |_____|_| \_|____/|_____|_| \_|
            https://nipetersen.dk
```
