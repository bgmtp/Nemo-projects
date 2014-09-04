VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "VBPReference"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
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

Public VBP As VBProject

Public Line As String

Public TypeLib As String
Public Version As String
Public LangID As String
Public Path As String
Public Filename As String
Public Exists As Boolean
Public Filedate As Date
Public Name As String
Public Registered As Boolean

Public FileVersionInfo As New FileVersionInfo

Public RegKeyTypeLib As Key

'''

Public TypeLibVersionRegistry As String
Public TypeLibWin32Registry As String

Public TypeLibVersionFile As String

'''

Public Property Get TypeLibVersionProject() As String
    TypeLibVersionProject = Version & "." & LangID
End Property

Public Property Get VBPEntryType() As VBPTypeConstant
    VBPEntryType = VBPReference
End Property

Public Property Get FullFilename() As String
    FullFilename = FSO.BuildPath(Path, Filename)
End Property

Public Sub GetFileVersionInfo()
    FileVersionInfo.ReadFixedFileInfo Path & Filename
End Sub

Public Sub GetFileInfo()
    Dim oFile As Scripting.File
    Exists = FSO.FileExists(TypeLibWin32Registry)
    If Exists Then
        Set oFile = FSO.GetFile(TypeLibWin32Registry)
        Filedate = oFile.DateLastModified
    End If
End Sub

Public Sub GetTypeLibInfoRegistry()
    Dim oKeyTypeLib As Key
    Dim oKey As Key
    Dim s As String
    
    Set oKeyTypeLib = VBP.Registry.Keys.Add(HKEY_CLASSES_ROOT, "TypeLib\{" & TypeLib & "}")
    If oKeyTypeLib.Check(False, False) Then
        oKeyTypeLib.EnumKeys True, True
        If oKeyTypeLib.Keys.Count > 0 Then
            Registered = True
        End If
    End If
    
    '''
    
    s = ""
    For Each oKey In oKeyTypeLib.Keys
        s = s & oKey.Name & "." & oKey.Keys(1).Name & " | "
    Next
    If s <> "" Then s = Left(s, Len(s) - 3)
    
    TypeLibVersionRegistry = s
    
    '''
    
    If Registered Then
        With oKeyTypeLib
            s = ""
            If .Keys.Exists(CStr(Version)) Then
                If .Keys(Version).Keys.Exists(LangID) Then
                    If .Keys(Version).Keys(LangID).Keys.Exists("win32") Then
                        s = .Keys(Version).Keys(LangID).Keys("win32").Values(1).Value ' Default
                    End If
                End If
            End If
            If s = "" Then
                s = .Keys(.Keys.Count).Keys("0").Keys("win32").Values(1).Value
            End If
        End With
        
        TypeLibWin32Registry = s
        
        Path = FSO.GetParentFolderName(s)
        Filename = FSO.GetFileName(s)
    End If
End Sub

Public Sub GetTypeLibInfoFile()
    Dim TypeLibInfo As TLI.TypeLibInfo
    
    If Exists Then
        Set TypeLibInfo = TLI.TLIApplication.TypeLibInfoFromFile(FullFilename)
        
        TypeLibVersionFile = LCase(Hex(TypeLibInfo.MajorVersion)) & "." & _
                             LCase(Hex(TypeLibInfo.MinorVersion)) & "." & _
                             CStr(TypeLibInfo.LCID)
                             
        Set TypeLibInfo = Nothing
    End If
End Sub

'Reference=*\G{16FA0BB5-8CB0-11D1-A965-00A0C9447ED5}#1.0#0#..\..\..\..\..\usr\bin\SAPDBxErrHndl.dll#SAPDB Error Handler Object Library

Public Function GetTypeLibCompatibleLine() As String
    Dim TypeLibInfo As TLI.TypeLibInfo
    Dim iPos1 As Integer
    Dim iPos2 As Integer
    Dim sNew As String
    
    GetTypeLibCompatibleLine = Line
    
    If Exists Then
        Set TypeLibInfo = TLI.TLIApplication.TypeLibInfoFromFile(FullFilename)
        
        iPos1 = InStr(1, Line, "#")
        If iPos1 > 0 Then
            iPos2 = InStr(iPos1 + 1, Line, "#")
            If iPos2 > 0 Then
                sNew = Left(Line, iPos1)
                sNew = sNew & LCase(Hex(TypeLibInfo.MajorVersion)) & "." & LCase(Hex(TypeLibInfo.MinorVersion))
                sNew = sNew & Mid(Line, iPos2)
                GetTypeLibCompatibleLine = sNew
            End If
        End If
        Set TypeLibInfo = Nothing
    End If
End Function
