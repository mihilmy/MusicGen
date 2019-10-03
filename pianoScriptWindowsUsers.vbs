Set WshShell = CreateObject("WScript.Shell")
strString = "etieyjptiosu8wetosfudgdgosuo6etudyIOti8etypdgospdryi8wypaueypdspapdastietusetuOtiosulkhftufoSqeukfj"
WshShell.AppActivate "Google Chrome"
WScript.sleep 5000
For i=1 To Len(strString)
    WshShell.SendKeys Mid(strString,i,1)
	WScript.sleep 350
Next
