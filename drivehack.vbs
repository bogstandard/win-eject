Set oWMP = CreateObject("WMPlayer.OCX.7") 
Set colCDROMs = oWMP.cdromCollection 
Set drives = CreateObject("Scripting.Dictionary")
Set args = Wscript.Arguments
Set fso = CreateObject ("Scripting.FileSystemObject")
Set stdout = fso.GetStandardStream (1)
ArrDrives = "{"
    if colCDROMs.Count >= 1 then 
        For i = 0 to colCDROMs.Count -1 
            drives.Add colCDROMs.Item(i).driveSpecifier, i
            ArrDrives = ArrDrives & """" & colCDROMs.Item(i).driveSpecifier & """ : " & """found"""
        Next 
    End If 
ArrDrives = ArrDrives & "}"
If args.Count < 1 then 
    stdout.WriteLine ArrDrives
    WScript.Quit
End If
If args(0) = "open" then 
    if args.Count > 1 then 
        colCDROMs.Item(drives.Item(args(1)&":")).Eject
    Else
        For i = 0 to colCDROMs.Count -1 
            colCDROMs.Item(i).Eject 
        Next 
    End If
End If
If args(0) = "close" then 
    if args.Count > 1 then 
        'HACK HACK HACK
        colCDROMs.Item(drives.Item(args(1)&":")).Eject
        colCDROMs.Item(drives.Item(args(1)&":")).Eject
    Else
        For i = 0 to colCDROMs.Count -1 
            'HACK HACK HACK
            colCDROMs.Item(i).Eject 
            colCDROMs.Item(i).Eject 
        Next 
    End If
End If