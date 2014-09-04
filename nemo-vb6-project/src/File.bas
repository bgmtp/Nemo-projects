Attribute VB_Name = "File"
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


Private Declare Sub CopyMemory Lib "Kernel32.dll" Alias "RtlMoveMemory" ( _
    hpvDest As Any, _
    ByVal hpvSource As Any, _
    ByVal cbCopy As Long)
    
Private Declare Function GetFileVersionInfoSize Lib "Version.DLL" Alias "GetFileVersionInfoSizeA" ( _
    ByVal sFilename As String, _
    lVerHandle As Long) As Long
    
Private Declare Function GetFileVersionInfo Lib "Version.DLL" Alias "GetFileVersionInfoA" ( _
    ByVal sFilename As String, _
    ByVal lVerHandle As Long, _
    ByVal lSize As Long, _
    lData As Byte) As Long

Private Declare Function VerQueryValue Lib "Version.DLL" Alias "VerQueryValueA" ( _
    bVerData As Any, _
    ByVal sSubBlock As String, _
    lBufPos As Long, _
    lLen As Long) As Long

Private Const SUBBLOCK_FIXEDFILEINFO = "\"

Public Type VS_FIXEDFILEINFO
    Signature As Long
    StrucVersion As Long
    FileVersionMS As Long
    FileVersionLS As Long
    ProductVersionMS As Long
    ProductVersionLS As Long
    FileFlagsMask As Long
    FileFlags As Long
    FileOS As Long
    FileType As Long
    FileSubtype As Long
    FileDateMS As Long
    FileDateLS As Long
End Type

'''

Public Function IsReadOnly(ByVal Filename As String)
    Dim iAttr As Integer
    
    IsReadOnly = False
    
    If Not FSO.FileExists(Filename) Then Exit Function
    
    iAttr = GetAttr(Filename)
    If (iAttr And vbReadOnly) = vbReadOnly Then
        IsReadOnly = True
    End If
End Function

Public Sub SetReadOnly(ByVal Filename As String, ByVal ReadOnly As Boolean)
    Dim iAttr As Integer
    
    iAttr = GetAttr(Filename)
    
    If (iAttr And vbReadOnly) = vbReadOnly Then
        If Not ReadOnly Then
            iAttr = iAttr - vbReadOnly
        End If
    Else
        iAttr = iAttr + vbReadOnly
    End If
    
    SetAttr Filename, iAttr
End Sub

'''

Public Function ReadFixedFileInfo(ByVal Filename As String, _
                                  FixedFileInfo As VS_FIXEDFILEINFO)
                          
    Dim lVerSize As Long
    Dim lVerHandle As Long

    Dim lBufPtr As Long
    Dim bVerData() As Byte

    ReadFixedFileInfo = False

    lVerSize = GetFileVersionInfoSize(Filename, lVerHandle)
    If lVerSize > 0 Then
        ReDim bVerData(lVerSize)
        If GetFileVersionInfo(Filename, lVerHandle, lVerSize, bVerData(0)) <> 0 Then
            If VerQueryValue(bVerData(0), SUBBLOCK_FIXEDFILEINFO, lBufPtr, lVerSize) <> 0 Then
                CopyMemory FixedFileInfo, lBufPtr, lVerSize
                ReadFixedFileInfo = True
            End If
        End If
    End If
End Function


