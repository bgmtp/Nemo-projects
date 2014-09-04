VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Keys"
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
Private oParent As Object
Private bRoot As Boolean

Private oItems As New Collection
'
' Public Properties
'
Friend Property Set Registry(ByVal NewVal As Registry)
    Set oRegistry = NewVal
End Property

Friend Property Set Parent(ByVal NewVal As Object)
    Set oParent = NewVal
End Property

Friend Property Let Root(ByVal NewVal As Boolean)
    bRoot = NewVal
End Property

Public Property Get Count() As Integer
    Count = oItems.Count
End Property

Public Property Get Item(ByVal Index As Variant) As Key
Attribute Item.VB_UserMemId = 0
    Set Item = oItems(Index)
End Property

Public Property Get NewEnum()
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = oItems.[_NewEnum]
End Property
'
' Public Sub/Function
'
Public Function Add(ByVal hKey As RegistryHKeyConstants, _
                    ByVal Name As String) As Key
               
    Dim oItem As New Key
               
    With oItem
        Set .Registry = oRegistry
        Set .Parent = oParent
        .Root = bRoot
        
        .hKey = hKey
        .Name = Name
    End With
               
    oItems.Add oItem, Name
    
    Set Add = oItem
End Function

Public Sub Remove(ByVal Index As Variant)
    oItems.Remove Index
End Sub

Public Function Exists(ByVal Index As Variant) As Boolean
    Dim oItem As Key
    On Error Resume Next
    Set oItem = oItems.Item(Index)
    Exists = (Err.Number = 0)
End Function

Public Sub Clear()
    Dim i As Integer
    For i = 1 To oItems.Count
        oItems.Remove 1
    Next
End Sub

Public Sub Rename(ByVal Index As Variant, ByVal Name As String)
    Dim oKey As Key
        
    Set oKey = oItems(Index)
    
    oItems.Remove Index
    
    oKey.Name = Name
    
    oItems.Add oKey, Name
End Sub

Private Sub Class_Initialize()
    'Debug.Print "INIT Keys"
End Sub

Private Sub Class_Terminate()
    'Debug.Print "TERM Keys"
End Sub
