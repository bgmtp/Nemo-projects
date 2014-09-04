VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "VBProject"
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

Const WINRUNNER_SUPPORT_REF = "Reference=*\G{DAB07E39-CC6F-11D0-8AE4-0080C8362177}#1.0#0#C:\WINNT\System32\wrvbasr.dll#WinRunner - VisualBasic Support"
Const WINRUNNER_SUPPORT_MOD = "Module=WinRunnerSupport; WinRunnerSupport.bas"
Const WINRUNNER_SUPPORT_FIL = "WinRunnerSupport.bas"

Const OPT_VERPRONAME = "VersionProductName"
Const OPT_CONDCOMP = "CondComp"

Public Enum VBPTypeConstant
    VBPProperty
    VBPClass
    VBPForm
    VBPUserControl
    VBPUserDocument
    VBPModule
    VBPObject
    VBPReference
    VBPRelatedDocument
    VBPLine
End Enum

Public ProjectType As String

Public Path As String
Public Filename As String
Public Filedate As Date

Public DestPath As String
Public DestFilename As String
Public DestExists As Boolean
Public DestFiledate As Date

Public DestVersionInfo As New FileVersionInfo

Public MajorVersion As String
Public MinorVersion As String
Public RevisionVersion As String

Public BaseAddr As String

Public UpToDate As Boolean

'''

Private REG As New Registry

'''

Private oItems As New Collection

'''

Public Property Get Count() As Long
    Count = oItems.Count
End Property

Public Property Get Item(ByVal Index As Variant) As Object
Attribute Item.VB_UserMemId = 0
    Set Item = oItems.Item(Index)
End Property

Public Property Get NewEnum()
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = oItems.[_NewEnum]
End Property

'''

Public Sub Add(ByVal oVBPKey As Object)
    oItems.Add oVBPKey
End Sub

Public Sub Clear()
    Dim i As Integer
    
    Path = ""
    Filename = ""
    Filedate = Empty
    
    DestPath = ""
    DestFilename = ""
    DestFiledate = Empty
    
    MajorVersion = ""
    MinorVersion = ""
    RevisionVersion = ""
    
    For i = 1 To oItems.Count
        oItems.Remove 1
    Next
    
    REG.Keys.Clear
End Sub

'''

Public Property Get FullFilename() As String
    FullFilename = FSO.BuildPath(Path, Filename)
End Property

Public Property Get FullDestFilename() As String
    FullDestFilename = FSO.BuildPath(DestPath, DestFilename)
End Property

'''

Public Sub GetDestVersionInfo()
    DestVersionInfo.ReadFixedFileInfo FSO.BuildPath(DestPath, DestFilename)
End Sub


'''

Friend Property Get Registry() As Registry
    Set Registry = REG
End Property

'''

Public Sub SaveAs(ByVal Filename As String)
    Dim oStream As Scripting.TextStream
    Dim i As Integer
    
    Set oStream = FSO.OpenTextFile(Filename, ForWriting, True)

    For i = 1 To oItems.Count
        oStream.WriteLine oItems(i).Line
    Next
    
    oStream.Close
End Sub

Public Sub MakeVBPFile(ByVal Filename As String, _
                       ByVal TypLibCompatible As Boolean, _
                       ByVal WinRunnerSupport As Boolean)
                       
    Dim i As Integer
    Dim bRefExists As Boolean
    Dim bModExists As Boolean
    Dim iLineRef As Integer
    Dim iLineMod As Integer
                       
    Dim bWinRunnerFile As Boolean
                       
    Dim oStream As Scripting.TextStream
    Dim oItem As Object
    Dim sLine As String
       
    iLineRef = 0
    iLineMod = 0
    
    If WinRunnerSupport Then
    
        bRefExists = False
        bModExists = False
        For i = 1 To oItems.Count
            Set oItem = oItems(i)
            If oItem.VBPEntryType = VBPReference Then
                If UCase$(Left$(oItem.Line, 50)) = UCase$(Left$(WINRUNNER_SUPPORT_REF, 50)) Then
                    bRefExists = True
                End If
            End If
            If oItem.VBPEntryType = VBPModule Then
                If UCase$(Left$(oItem.Line, 23)) = UCase$(Left$(WINRUNNER_SUPPORT_MOD, 23)) Then
                    bModExists = True
                End If
            End If
        Next
    
        For i = 1 To oItems.Count
            Set oItem = oItems(i)
            If oItem.VBPEntryType = VBPObject Or _
               oItem.VBPEntryType = VBPReference _
            Then
                iLineRef = i
            End If
            If oItem.VBPEntryType = VBPModule Or _
               oItem.VBPEntryType = VBPClass Or _
               oItem.VBPEntryType = VBPForm Or _
               oItem.VBPEntryType = VBPUserControl Or _
               oItem.VBPEntryType = VBPUserDocument _
            Then
                iLineMod = i
            End If
        Next
        If iLineRef = 0 Then iLineRef = 1
        If iLineMod = 0 Then iLineMod = 1
    End If
    
    '''
    
    bWinRunnerFile = False
    
    If FSO.FileExists(FSO.BuildPath(Path, WINRUNNER_SUPPORT_FIL)) Then
        bWinRunnerFile = True
    End If
    
    '''
    
    Set oStream = FSO.OpenTextFile(Filename, ForWriting, True)
    

    For i = 1 To oItems.Count
        Set oItem = oItems(i)
        If TypLibCompatible And _
           (oItem.VBPEntryType = VBPReference Or _
            oItem.VBPEntryType = VBPObject) _
        Then
            sLine = oItem.GetTypeLibCompatibleLine()
        Else
            sLine = oItem.Line
        End If
        
        oStream.WriteLine sLine
        
        If bWinRunnerFile Then
            If Not bRefExists Then
                If WinRunnerSupport And i = iLineRef Then
                    oStream.WriteLine WINRUNNER_SUPPORT_REF
                End If
            End If
            
            If Not bModExists Then
                If WinRunnerSupport And i = iLineMod Then
                    oStream.WriteLine WINRUNNER_SUPPORT_MOD
                End If
            End If
        End If
    Next
    
    oStream.Close
End Sub

Public Sub SetOptions(ByVal Filename As String, _
                      ByVal Opt As SetOptions)

    Dim i As Integer
    Dim bExists As Boolean
    Dim iIndex As Integer
    Dim oProp As New VBPProperty
    Dim oStream As Scripting.TextStream
    Dim oItem As Object
    Dim sLine As String
    
    bExists = False
    iIndex = 0
    For i = 1 To oItems.Count
        Set oItem = oItems(i)
        If oItem.VBPEntryType = VBPProperty Then
            If oItem.Name = OPT_VERPRONAME Then
                iIndex = i
            End If
            If oItem.Name = OPT_CONDCOMP Then
                bExists = True
            End If
        End If
    Next
    
    If Not bExists And iIndex > 0 Then
        oProp.Line = OPT_CONDCOMP + "="
        oProp.Name = OPT_CONDCOMP
        oProp.Value = ""
        oItems.Add oProp, , , iIndex
    End If

    Set oStream = FSO.OpenTextFile(Filename, ForWriting, True)

    For i = 1 To oItems.Count
        Set oItem = oItems(i)
        If oItem.VBPEntryType = VBPProperty Then
            sLine = oItem.Name + "=" + Opt.GetNewValue(oItem.Name, oItem.Value)
        Else
            sLine = oItem.Line
        End If
        
        oStream.WriteLine sLine
    Next
    
    oStream.Close
End Sub

Public Property Get LicenseFilename() As String
    LicenseFilename = FSO.GetBaseName(DestFilename) + ".vbl"
End Property
