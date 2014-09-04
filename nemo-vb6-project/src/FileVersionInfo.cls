VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "FileVersionInfo"
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

Private Type INTEGER_2_TYPE
    lo As Integer
    hi As Integer
End Type

Private Type LONG_1_TYPE
    l As Long
End Type

Private tFixedFileInfo As VS_FIXEDFILEINFO

Public Property Get VersionString()
    Dim l As LONG_1_TYPE
    Dim ms As INTEGER_2_TYPE
    Dim ls As INTEGER_2_TYPE

    l.l = tFixedFileInfo.FileVersionMS
    LSet ms = l

    l.l = tFixedFileInfo.FileVersionLS
    LSet ls = l

    VersionString = CStr(ms.hi) & "." & CStr(ms.lo) & "." & CStr(ls.hi) & "." & CStr(ls.lo)
End Property


Public Sub ReadFixedFileInfo(ByVal Filename As String)
    File.ReadFixedFileInfo Filename, tFixedFileInfo
End Sub

