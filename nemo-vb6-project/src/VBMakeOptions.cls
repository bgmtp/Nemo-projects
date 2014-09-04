VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "VBMakeOptions"
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

Private Const REG_KEY_VBMAKE = "Software\SAP\ADABAS\VBMake"
Private Const REG_VAL_PRJFILEDATE = "ProjectFileDate"
Private Const REG_VAL_READONLYTARGETS = "ReadOnlyTargets"
Private Const REG_VAL_TYPELIBCOMP = "TypeLibCompatible"
Private Const REG_VAL_WINRUNNERSUP = "WinRunnerSupport"

Private oRegKeyVBMake As Key

Public Property Get ProjectFileDate() As Boolean
    ProjectFileDate = CBool(oRegKeyVBMake.Values(REG_VAL_PRJFILEDATE).Value)
End Property
Public Property Let ProjectFileDate(ByVal NewVal As Boolean)
    oRegKeyVBMake.Values(REG_VAL_PRJFILEDATE).Value = CLng(NewVal)
End Property

Public Property Get ReadOnlyTargets() As Boolean
    ReadOnlyTargets = CBool(oRegKeyVBMake.Values(REG_VAL_READONLYTARGETS).Value)
End Property
Public Property Let ReadOnlyTargets(ByVal NewVal As Boolean)
    oRegKeyVBMake.Values(REG_VAL_READONLYTARGETS).Value = CLng(NewVal)
End Property

Public Property Get TypeLibCompatible() As Boolean
    TypeLibCompatible = CBool(oRegKeyVBMake.Values(REG_VAL_TYPELIBCOMP).Value)
End Property
Public Property Let TypeLibCompatible(ByVal NewVal As Boolean)
    oRegKeyVBMake.Values(REG_VAL_TYPELIBCOMP).Value = CLng(NewVal)
End Property

Public Property Get WinRunnerSupport() As Boolean
    WinRunnerSupport = CBool(oRegKeyVBMake.Values(REG_VAL_WINRUNNERSUP).Value)
End Property
Public Property Let WinRunnerSupport(ByVal NewVal As Boolean)
    oRegKeyVBMake.Values(REG_VAL_WINRUNNERSUP).Value = CLng(NewVal)
End Property

Private Sub Class_Initialize()
    Set oRegKeyVBMake = REG.Keys.Add(HKEY_CURRENT_USER, REG_KEY_VBMAKE)
    With oRegKeyVBMake
        .Values.Add REG_VAL_PRJFILEDATE, CLng(False), REG_DWORD
        .Values.Add REG_VAL_READONLYTARGETS, CLng(True), REG_DWORD
        .Values.Add REG_VAL_TYPELIBCOMP, CLng(True), REG_DWORD
        .Values.Add REG_VAL_WINRUNNERSUP, CLng(True), REG_DWORD
        If Not .Check(False, True) Then
            If .Create(False, True) Then
            End If
        Else
            If .QueryValues(False) Then
            End If
        End If
    End With
End Sub

Private Sub Class_Terminate()
    If oRegKeyVBMake.SetValues(False) Then
    End If
End Sub
