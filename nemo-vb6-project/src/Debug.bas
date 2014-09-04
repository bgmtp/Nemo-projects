Attribute VB_Name = "DBG"
' --- GPL ---
'
' Copyright (C) 1999 SAP AG
'
' This program is free software; you can redistribute it and/or
' modify it under the terms of the GNU General Public License
' as published by the Free Software Foundation; either version 2
' of the License, or (at your option) any later version.
'
' This program is distributed in the hope that it will be useful,
' but WITHOUT ANY WARRANTY; without even the implied warranty of
' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
' GNU General Public License for more details.
'
' You should have received a copy of the GNU General Public License
' along with this program; if not, write to the Free Software
' Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
'
' --- GPL ---
Option Explicit

Public Const dbgDestVB = 1
Public Const dbgDestFile = 2
Public Const dbgDestObject = 4

Public Const dbgDestDefault = dbgDestVB

Public Const dbgInit = 0
Public Const dbgTerm = 1

Const HDR_INIT_CLASS = "INIT CLASS: "
Const HDR_TERM_CLASS = "TERM CLASS: "
Const HDR_BUFFER = "BUFFER    : "
Const HDR_INTEGER = "INTEGER   : "
Const HDR_STRING = "STRING    : "
Const HDR_SQL = "SQL STMT  : "
Const HDR_EMPTY = "          : "
Const HDR_FILEBEG = "FILE BEGIN: "
Const HDR_FILEEND = "FILE END  : "
Const HDR_TIME = "TIME      : "

Private lDest As Long
Private sFile As String
Private hFile
Private bFileOpen As Boolean

Private oObject As Object

Public Sub Init()
    lDest = dbgDestDefault
    sFile = App.Path & "\" & App.EXEName & ".log"
    bFileOpen = False
    Set oObject = Nothing
End Sub

Public Sub Destination(lDestination As Long)
    lDest = lDestination
End Sub

Public Sub OpenFile()
    If (lDest And dbgDestFile) = dbgDestFile Then
        hFile = FreeFile()
        Open sFile For Output As #hFile
        bFileOpen = True
        DebugLine HDR_FILEBEG & Format(Now(), "Long Time") & "  " & Format(Now(), "Long Date")
    End If
End Sub

Public Sub CloseFile()
    Close #hFile
    bFileOpen = False
End Sub

Public Sub OutputObject(oOutput As Object)
    Set oObject = oOutput
    
    If TypeOf oObject Is Form Then
        oObject.Cls
    ElseIf TypeOf oObject Is PictureBox Then
        oObject.Cls
    ElseIf TypeOf oObject Is ListBox Then
        oObject.Clear
    End If
End Sub

Public Sub Done()
    If bFileOpen Then
        DebugLine HDR_FILEEND & Format(Now(), "Long Time") & "  " & Format(Now(), "Long Date")
        CloseFile
    End If
End Sub
'
'
'
Public Sub IntVal(sName As String, lValue As Long)
    DebugLine HDR_INTEGER & sName & ", Value = " & lValue & " (0x" & Format(Hex(lValue), "00000000") & ")"
End Sub

Public Sub StrVal(sName As String, sValue As String)
    OutText HDR_STRING, sName, sValue
End Sub

Public Sub SQL(sName As String, sSQL As String)
    OutText HDR_SQL, sName, sSQL
End Sub

Public Sub Time()
    DebugLine HDR_TIME & Format(Now(), "Long Time") & "  " & Format(Now(), "Long Date")
End Sub

Public Sub Class(iFunc As Integer, o As Object)
    Select Case iFunc
        Case dbgInit: DebugLine HDR_INIT_CLASS & o.Class & ", Key=" & o.Key
        Case dbgTerm: DebugLine HDR_TERM_CLASS & o.Class & ", Key=" & o.Key
    End Select
End Sub

Public Sub Buffer(sText As String, bBuffer() As Byte, lLength As Long)
    Dim lPos1 As Long
    Dim lPos2 As Long
    Dim sPos As String
    Dim sHex As String
    Dim sAsc As String
    
    DebugLine HDR_BUFFER & sText & ", Length = " & lLength & " (0x" & Format(Hex(lLength), "00000000") & ")"
    
    lPos1 = 0
    Do While lPos1 < lLength
        lPos2 = 0
        sPos = Format(Hex(lPos1), "00000000") & " "
        sHex = ""
        sAsc = ""
        Do While lPos1 + lPos2 < lLength And lPos2 < 16
            sHex = sHex & Format(Hex(bBuffer(lPos1 + lPos2)), "00") & " "
            If bBuffer(lPos1 + lPos2) > 31 Then
                sAsc = sAsc & Chr(bBuffer(lPos1 + lPos2))
            Else
                sAsc = sAsc & "."
            End If
            lPos2 = lPos2 + 1
        Loop
        sHex = sHex & Space((16 - lPos2) * 3)
        DebugLine HDR_EMPTY & sPos & sHex & sAsc
        lPos1 = lPos1 + lPos2
    Loop
End Sub
'
'
'
Private Sub OutText(sHeader As String, sText As String, sValue As String)
    Dim lLength As Long
    Dim lPos1 As Long
    Dim lPos2 As Long
    Dim sPart As String
    
    lLength = Len(sValue)
    
    DebugLine sHeader & sText & ", Length = " & lLength & " (0x" & Format(Hex(lLength), "00000000") & ")"

    lPos1 = 1
    Do While lPos1 <= lLength
        sPart = Mid(sValue, lPos1, 80)
        DebugLine HDR_EMPTY & sPart
        lPos1 = lPos1 + 80
    Loop
End Sub

Private Sub DebugLine(sLine As String)
    If lDest = 0 Then lDest = dbgDestDefault
    
    If (lDest And dbgDestVB) = dbgDestVB Then DebugLineVB sLine
    If (lDest And dbgDestFile) = dbgDestFile Then DebugLineFile sLine
    If (lDest And dbgDestObject) = dbgDestObject Then DebugLineObject sLine
End Sub

Private Sub DebugLineVB(sLine As String)
    Debug.Print sLine
End Sub

Private Sub DebugLineFile(sLine As String)
    If Not bFileOpen Then
        OpenFile
    End If
    Print #hFile, sLine
End Sub

Private Sub DebugLineObject(sLine As String)
    If Not oObject Is Nothing Then
        If TypeOf oObject Is Form Then
            oObject.Print sLine
        ElseIf TypeOf oObject Is PictureBox Then
            oObject.Print sLine
        ElseIf TypeOf oObject Is ListBox Then
            oObject.AddItem sLine
        End If
    End If
End Sub

