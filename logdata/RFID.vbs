'NOTE: To start scripting please press <Ctrl><Space> and see the wide variety of functions.
'Write scripts by using system functions or the WinCC flexible object model. You can easily access to the
'system through the HMI runtime object. For a convenient picking of an object reference
'you can press <Alt><Right Arrow>. Design complex scripts by employing the basic features
'of the programming language VBScript and access tags directly by name e.g. tag = 5.
'author: WuTong
'email: master@void-3.cn

Dim fso,file,timeText,FileName,textStream
Set fso = CreateObject("Scripting.FileSystemObject")

timeText = CStr(DatePart("h",Time)) &":"& CStr(DatePart("n",Time)) &":"& CStr(DatePart("s",Time))
FileName = Path &"\"&Name&"-"& CStr(DatePart("yyyy",Date)) &"-"& CStr(DatePart("m",Date)) &"-"& CStr(DatePart("d",Date)) & ".csv"

If Not fso.FileExists(FileName) Then
    'fso.CreateFolder(Path)
    fso.CreateTextFile(FileName)
    Set file = fso.GetFile(FileName)
    Set textStream = file.OpenAsTextStream(8,-2)
    textStream.WriteLine(Title)
    textStream.WriteLine("File saved at " & timeText)
    textStream.WriteLine(field_1 &",;"& field_2)
    textStream.Close
End If

Set file = fso.GetFile(FileName)
Set textStream = file.OpenAsTextStream(8,-2)

textStream.WriteLine(timeText &",;"& Tag)
textStream.Close
