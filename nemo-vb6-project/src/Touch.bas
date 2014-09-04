Attribute VB_Name = "modTouch"
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

Private Type FILETIME
    dwLowDateTime As Long
    dwHighDateTime As Long
End Type

Private Type SYSTEMTIME
    wYear As Integer
    wMonth As Integer
    wDayOfWeek As Integer
    wDay As Integer
    wHour As Integer
    wMinute As Integer
    wSecond As Integer
    wMilliseconds As Integer
End Type

Private Declare Sub GetLocalTime Lib "kernel32" ( _
    lpSystemTime As SYSTEMTIME)

Private Declare Function GetFileTime Lib "kernel32" ( _
    ByVal hFile As Long, _
    lpCreationTime As FILETIME, _
    lpLastAccessTime As FILETIME, _
    lpLastWriteTime As FILETIME) As Long

Private Declare Function SetFileTime Lib "kernel32" ( _
    ByVal hFile As Long, _
    lpCreationTime As FILETIME, _
    lpLastAccessTime As FILETIME, _
    lpLastWriteTime As FILETIME) As Long
    
Private Declare Function SystemTimeToFileTime Lib "kernel32" ( _
    lpSystemTime As SYSTEMTIME, _
    lpFileTime As FILETIME) As Long
    
Private Declare Function LocalFileTimeToFileTime Lib "kernel32" ( _
    lpLocalFileTime As FILETIME, _
    lpFileTime As FILETIME) As Long
    
Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" ( _
    ByVal lpFileName As String, _
    ByVal dwDesiredAccess As Long, _
    ByVal dwShareMode As Long, _
    ByVal lpSecurityAttributes As Long, _
    ByVal dwCreationDisposition As Long, _
    ByVal dwFlagsAndAttributes As Long, _
    ByVal hTemplateFile As Long) As Long

Private Declare Function CloseHandle Lib "kernel32" ( _
    ByVal hObject As Long) As Long

Const GENERIC_READ = &H80000000
Const GENERIC_WRITE = &H40000000
Const FILE_SHARE_READ = &H1
Const OPEN_EXISTING = 3
Const FILE_ATTRIBUTE_NORMAL = &H80
Const INVALID_HANDLE_VALUE = -1

Public Sub Touch(sFilename As String)
    Dim ftCreation As FILETIME
    Dim ftLastAccess As FILETIME
    Dim ftLastWrite As FILETIME
    Dim stNowLocal As SYSTEMTIME
    Dim ftNowLocal As FILETIME
    Dim ftNow As FILETIME
    Dim lRC As Long
    Dim hFile As Long
    
    GetLocalTime stNowLocal
    lRC = SystemTimeToFileTime(stNowLocal, ftNowLocal)
    lRC = LocalFileTimeToFileTime(ftNowLocal, ftNow)
    
    hFile = CreateFile(sFilename, GENERIC_READ + GENERIC_WRITE, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0)

    If hFile <> INVALID_HANDLE_VALUE Then
        lRC = GetFileTime(hFile, ftCreation, ftLastAccess, ftLastWrite)
        If lRC <> 0 Then
            lRC = SetFileTime(hFile, ftCreation, ftLastAccess, ftNow)
        End If
        lRC = CloseHandle(hFile)
    End If
End Sub



