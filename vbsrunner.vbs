' Store the arguments in a variable:
Set objArgs = Wscript.Arguments

'Count the arguments
'WScript.Echo objArgs.Count
MsgBox objArgs.Count

' Display all command-line arguments
For Each strArg in objArgs
 MsgBox strArg
 ' WScript.Echo strArg
Next