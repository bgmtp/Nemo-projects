VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Value"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
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

Private oRegistry As Registry

Public Name As String
Public Value As Variant
Public ValueType As RegistryTypeConstants
'
' Public Properties
'
Friend Property Get Registry() As Registry
    Set Registry = oRegistry
End Property
Friend Property Set Registry(ByVal NewVal As Registry)
    Set oRegistry = NewVal
End Property
'
' Public Sub/Function
'
Public Function CheckValue(ByVal lKey As Long) As Boolean
    Dim bShowError As Boolean
    Dim bRaiseError As Boolean
    
    Dim lType As RegistryTypeConstants
    Dim lValueLen As Long
        
    bShowError = oRegistry.ShowErrors
    bRaiseError = oRegistry.RaiseErrors
    oRegistry.ShowErrors = False
    oRegistry.RaiseErrors = False
        
    CheckValue = oRegistry.QueryValueNull(lKey, Name, lType, lValueLen)

    oRegistry.ShowErrors = bShowError
    oRegistry.RaiseErrors = bRaiseError
End Function

Public Function CreateValue(ByVal lKey As Long) As Boolean
    CreateValue = SetValue(lKey)
End Function

Public Function QueryValue(ByVal lKey As Long) As Boolean
    Dim lValueLen As Long
    Dim sValue As String
    Dim lValue As Long
    
    QueryValue = False
    
    If oRegistry.QueryValueNull(lKey, Name, ValueType, lValueLen) Then
        Select Case ValueType
            Case REG_SZ:
                If oRegistry.QueryValueString(lKey, Name, sValue, lValueLen) Then
                    Value = sValue
                    QueryValue = True
                Else
                    Value = Empty
                End If
        
            Case REG_DWORD:
                If oRegistry.QueryValueLong(lKey, Name, lValue) Then
                    Value = lValue
                    QueryValue = True
                Else
                    Value = Empty
                End If
        End Select
    End If
End Function

Public Function SetValue(ByVal lKey As Long) As Boolean
    SetValue = False
    
    Select Case ValueType
        Case REG_SZ:
            If oRegistry.SetValueString(lKey, Name, CStr(Value)) Then
                SetValue = True
            End If
        Case REG_DWORD:
            If oRegistry.SetValueLong(lKey, Name, CLng(Value)) Then
                SetValue = True
            End If
    End Select
End Function

Public Function DeleteValue(ByVal lKey As Long) As Boolean
    DeleteValue = oRegistry.DeleteValue(lKey, Name)
End Function


