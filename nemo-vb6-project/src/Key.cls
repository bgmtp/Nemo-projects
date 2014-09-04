VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Key"
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

Private lhKey As RegistryHKeyConstants
Private sName As String

Private oKeys As Keys
Private oValues As Values

Private lKey As Long

Private oDefault As Value
'
' Public Properties
'
Friend Property Get Registry() As Registry
    Set Registry = oRegistry
End Property
Friend Property Set Registry(ByVal NewVal As Registry)
    Set oRegistry = NewVal
End Property

Friend Property Get Parent() As Object
    Set Parent = oParent
End Property
Friend Property Set Parent(ByVal NewVal As Object)
    Set oParent = NewVal
End Property

Friend Property Get Root() As Boolean
    Root = bRoot
End Property
Friend Property Let Root(ByVal NewVal As Boolean)
    bRoot = NewVal
End Property

Public Property Get hKey() As RegistryHKeyConstants
    hKey = lhKey
End Property
Friend Property Let hKey(ByVal NewVal As RegistryHKeyConstants)
    lhKey = NewVal
End Property

Public Property Get Name() As String
    Name = sName
End Property
Public Property Let Name(ByVal NewVal As String)
    sName = NewVal
End Property

Public Property Get Path() As String
    Dim sParentPath As String
    If bRoot Then
        Path = sName
    Else
        sParentPath = oParent.Path
        If sParentPath <> "" Then
            Path = oParent.Path & "\" & sName
        Else
            Path = sName
        End If
    End If
End Property

Public Property Get Keys() As Keys
    If oKeys Is Nothing Then
        Set oKeys = New Keys
        With oKeys
            Set .Registry = oRegistry
            Set .Parent = Me
            .Root = False
        End With
    End If
    Set Keys = oKeys
End Property

Public Property Get Values() As Values
    If oValues Is Nothing Then
        Set oValues = New Values
        With oValues
            Set .Registry = oRegistry
        End With
    End If
    Set Values = oValues
End Property

Public Property Get Key() As Long
    Key = lKey
End Property

Public Property Get Default() As Value
    Set Default = Nothing
    
    If oDefault Is Nothing Then
        Set oDefault = New Value
        Set oDefault.Registry = oRegistry
        oDefault.Name = "" ' (Default)
    End If
    
    If OpenKey() Then
        If oDefault.QueryValue(lKey) Then
            Set Default = oDefault
        End If
        CloseKey
    End If
End Property
'
' Public Sub/Function
'
Public Function OpenKey() As Boolean
    OpenKey = oRegistry.OpenKey(hKey, Path, KEY_ALL_ACCESS, lKey)
End Function

Public Function CloseKey() As Boolean
    CloseKey = oRegistry.CloseKey(Path, lKey)
End Function

Public Function Check(ByVal WithSubKeys As Boolean, _
                      ByVal WithValues As Boolean) As Boolean
                      
    Dim bShowError As Boolean
    Dim bRaiseError As Boolean
    
    Dim oKey As Key
    Dim oValue As Value
        
    Check = False
    
    bShowError = oRegistry.ShowErrors
    bRaiseError = oRegistry.RaiseErrors
    oRegistry.ShowErrors = False
    oRegistry.RaiseErrors = False
    
    If OpenKey() Then
        If WithValues Then
            For Each oValue In Values
                If Not oValue.CheckValue(lKey) Then
                    CloseKey
                    GoTo Check_Exit
                End If
            Next
        End If

        If Not CloseKey() Then Exit Function

        If WithSubKeys Then
            For Each oKey In Keys
                If Not oKey.Check(WithSubKeys, WithValues) Then
                    GoTo Check_Exit
                End If
            Next
        End If
    Else
        GoTo Check_Exit
    End If
    
    Check = True
    
Check_Exit:
    oRegistry.ShowErrors = bShowError
    oRegistry.RaiseErrors = bRaiseError

End Function

Public Function Create(ByVal WithSubKeys As Boolean, _
                       ByVal WithValues As Boolean) As Boolean
    
    Dim lDisposition As Long
    Dim oKey As Key
    Dim oValue As Value
    
    Create = False
    
    If oRegistry.CreateKey(hKey, Path, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, lKey, lDisposition) Then
        If WithValues Then
            For Each oValue In Values
                If Not oValue.CreateValue(lKey) Then
                    If Not CloseKey() Then Exit Function
                    Exit Function
                End If
            Next
        End If
        
        If Not CloseKey() Then Exit Function
        
        If WithSubKeys Then
            For Each oKey In Keys
                If Not oKey.Create(WithSubKeys, WithValues) Then
                    Exit Function
                End If
            Next
        End If
    Else
        Exit Function
    End If

    Create = True
End Function

Public Function QueryValues(ByVal WithSubKeys As Boolean) As Boolean
                       
    Dim oKey As Key
    Dim oValue As Value
    
    QueryValues = False
    
    If OpenKey() Then
        For Each oValue In Values
            If Not oValue.QueryValue(lKey) Then
                Exit Function
            End If
        Next
        
        If Not CloseKey() Then Exit Function
    
        If WithSubKeys Then
            For Each oKey In Keys
                If Not oKey.QueryValues(WithSubKeys) Then
                    Exit Function
                End If
            Next
        End If
    Else
        Exit Function
    End If
    
    QueryValues = True
End Function

Public Function SetValues(ByVal WithSubKeys As Boolean) As Boolean
                       
    Dim oKey As Key
    Dim oValue As Value
    
    SetValues = False

    If OpenKey() Then
        For Each oValue In Values
            If Not oValue.SetValue(lKey) Then
                Exit Function
            End If
        Next
        
        If Not CloseKey() Then Exit Function
        
        If WithSubKeys Then
            For Each oKey In Keys
                If Not oKey.SetValues(WithSubKeys) Then
                    Exit Function
                End If
            Next
        End If
    Else
        Exit Function
    End If
    
    SetValues = True
End Function

Public Function DeleteValues(ByVal WithSubKeys As Boolean) As Boolean
    Dim oKey As Key
    Dim oValue As Value
    
    DeleteValues = False

    If OpenKey() Then
        For Each oValue In Values
            If Not oValue.DeleteValue(lKey) Then
                Exit Function
            End If
        Next
        
        If Not CloseKey() Then Exit Function
        
        If WithSubKeys Then
            For Each oKey In Keys
                If Not oKey.DeleteValues(WithSubKeys) Then
                    Exit Function
                End If
            Next
        End If
    Else
        Exit Function
    End If
    
    DeleteValues = True
End Function

Public Function EnumKeys(ByVal WithSubKeys As Boolean, _
                         ByVal WithValues As Boolean) As Boolean
                         
    Dim lRC As Long
    Dim lIndex As Long
    Dim sName As String
    Dim lName As Long
    Dim ftKey As FILETIME
    Dim oKey As Key
        
    EnumKeys = False
    
    If WithValues Then
        If Not EnumValues() Then
            Exit Function
        End If
    End If

    If OpenKey() Then
        lIndex = 0
        Do
            sName = Space(256)
            lName = Len(sName)
            lRC = RegEnumKeyEx(lKey, lIndex, sName, lName, 0&, 0&, 0&, ftKey)
            Select Case lRC
                Case ERROR_MORE_DATA:
                    sName = Left(sName, lName)
                    
                    If Not Keys.Exists(sName) Then
                        Set oKey = Keys.Add(hKey, sName)
                    Else
                        Set oKey = Keys.Item(sName)
                    End If
                    
                    If WithSubKeys Then
                        If Not oKey.EnumKeys(WithSubKeys, WithValues) Then
                            Exit Function
                        End If
                    End If
                    
                    lIndex = lIndex + 1
                Case ERROR_NO_MORE_ITEMS:
                    Exit Do
                Case Else:
                    If Not CloseKey() Then Exit Function
                    Exit Function
            End Select
        Loop
        
        If Not CloseKey() Then Exit Function
    
    Else
        Exit Function
    End If
    
    EnumKeys = True
End Function

Public Function EnumValues() As Boolean

    Dim lRC As Long
    Dim lIndex As Long
    Dim sName As String
    Dim lName As Long
    Dim lType As Long
    Dim bValue As ByteValue
    Dim lValue As Long
    Dim sValue As String
    Dim lSize As Long
    Dim oValue As Value
    
    EnumValues = False

    If OpenKey() Then ' Access = KEY_QUERY_VALUE
        lIndex = 0
        Do
            sName = Space(250)
            lName = Len(sName)
            lSize = Len(bValue)
            lRC = RegEnumValue(lKey, lIndex, sName, lName, 0&, lType, bValue.b(0), lSize)
            Select Case lRC
                Case ERROR_SUCCESS:
                    sName = Left(sName, lName)
                    Select Case lType
                        Case REG_SZ:
                            sValue = BytesToString(bValue)
                            If Not Values.Exists(sName) Then
                                Set oValue = Values.Add(sName, sValue, REG_SZ)
                            Else
                                Set oValue = Values.Item(sName)
                                With oValue
                                    .Value = sValue
                                    .ValueType = REG_SZ
                                End With
                            End If
                        Case REG_DWORD:
                            lValue = BytesToLong(bValue)
                            If Not Values.Exists(sName) Then
                                Set oValue = Values.Add(sName, lValue, REG_DWORD)
                            Else
                                Set oValue = Values.Item(sName)
                                With oValue
                                    .Value = lValue
                                    .ValueType = REG_DWORD
                                End With
                            End If
                    End Select
                    lIndex = lIndex + 1
                Case ERROR_NO_MORE_ITEMS:
                    Exit Do
                Case Else:
                    If Not CloseKey() Then Exit Function
                    Exit Function
            End Select
        Loop
        
        If Not CloseKey() Then Exit Function
    
    Else
        Exit Function
    End If
    
    EnumValues = True
End Function

Public Function Rename(ByVal NewName As String) As Boolean
    
    Rename = False
    
    If Delete() Then
        Name = NewName
        Create True, True
    Else
        Exit Function
    End If

    Rename = True
End Function

Public Function Delete() As Boolean

    Dim oKey As Key
    
    Delete = False
    
    For Each oKey In Keys
        If Not oKey.Delete() Then
            Exit Function
        End If
    Next
    
    If Not oRegistry.DeleteKey(hKey, Path) Then
        Exit Function
    End If

    Delete = True
End Function

Public Function FindKeyByPath(ByVal WithSubKeys As Boolean, _
                              ByVal FindPath As String) As Key
    Dim oKey As Key
    
    Set FindKeyByPath = Nothing
    
    If FindPath = Path Then
        Set FindKeyByPath = Me
        Exit Function
    End If
    
    For Each oKey In Keys
        If FindPath = oKey.Path Then
            Set FindKeyByPath = oKey
            Exit Function
        End If
    Next

    For Each oKey In Keys
        If WithSubKeys Then
            Set FindKeyByPath = oKey.FindKeyByPath(WithSubKeys, FindPath)
            If Not FindKeyByPath Is Nothing Then
                Exit Function
            End If
        End If
    Next
End Function
'
' Private Sub/Function
'
Private Sub Class_Initialize()
    'Debug.Print "INIT Key"
    
    Set oRegistry = Nothing
    Set oParent = Nothing
    bRoot = False
    
    lhKey = HKEY_CLASSES_ROOT
    sName = ""
    
    Set oKeys = Nothing
    Set oValues = Nothing
    
    lKey = 0
    
    Set oDefault = Nothing
End Sub

Private Sub Class_Terminate()
    'Debug.Print "TERM Key"
End Sub

