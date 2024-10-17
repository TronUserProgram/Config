mDrive = "S:\"
Set oShell = CreateObject("Shell.Application")
oShell.NameSpace(mDrive).Self.Name = "Drive 1"

mDrive = "T:\"
Set oShell = CreateObject("Shell.Application")
oShell.NameSpace(mDrive).Self.Name = "Drive 2"

mDrive = "U:\"
Set oShell = CreateObject("Shell.Application")
oShell.NameSpace(mDrive).Self.Name = "Drive 3"

mDrive = "J:\"
Set oShell = CreateObject("Shell.Application")
oShell.NameSpace(mDrive).Self.Name = "Drive 4"
