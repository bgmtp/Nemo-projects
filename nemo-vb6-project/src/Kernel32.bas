Attribute VB_Name = "Kernel32"
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

Private Type STARTUPINFO
    cb As Long
    lpReserved As String
    lpDesktop As String
    lpTitle As String
    dwX As Long
    dwY As Long
    dwXSize As Long
    dwYSize As Long
    dwXCountChars As Long
    dwYCountChars As Long
    dwFillAttribute As Long
    dwFlags As Long
    wShowWindow As Integer
    cbReserved2 As Integer
    lpReserved2 As Long
    hStdInput As Long
    hStdOutput As Long
    hStdError As Long
End Type
 
Private Type PROCESS_INFORMATION
    hProcess As Long
    hThread As Long
    dwProcessID As Long
    dwThreadID As Long
End Type
 
Private Declare Function CreateProcessA Lib "Kernel32.dll" ( _
    ByVal lpApplicationName As Long, ByVal lpCommandLine As String, _
    ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, _
    ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, _
    ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, _
    lpStartupInfo As STARTUPINFO, lpProcessInformation As _
    PROCESS_INFORMATION) As Long

Private Declare Function WaitForSingleObject Lib "Kernel32.dll" ( _
    ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
 
Private Declare Function CloseHandle Lib "Kernel32.dll" ( _
    ByVal hObject As Long) As Long

Private Declare Function TerminateProcess Lib "Kernel32.dll" ( _
    ByVal hProcess As Long, _
    ByVal uExitCode As Long) As Long
    
Private Declare Function GetExitCodeProcess Lib "Kernel32.dll" ( _
    ByVal hProcess As Long, _
    lpExitCode As Long) As Long

Private Const INFINITE = -1&
 
Private Const CREATE_NEW_CONSOLE = &H10
Private Const CREATE_NEW_PROCESS_GROUP = &H200
Private Const CREATE_SEPARATE_WOW_VDM = &H800

Private Const NORMAL_PRIORITY_CLASS = &H20
Private Const IDLE_PRIORITY_CLASS = &H40
Private Const HIGH_PRIORITY_CLASS = &H80
Private Const REALTIME_PRIORITY_CLASS = &H100

Private Const STARTF_FORCEOFFFEEDBACK = &H80
Private Const STARTF_FORCEONFEEDBACK = &H40
Private Const STARTF_RUNFULLSCREEN = &H20
Private Const STARTF_USECOUNTCHARS = &H8
Private Const STARTF_USEFILLATTRIBUTE = &H10
Private Const STARTF_USEPOSITION = &H4
Private Const STARTF_USESHOWWINDOW = &H1
Private Const STARTF_USESIZE = &H2
Private Const STARTF_USESTDHANDLES = &H100

Public Const SW_HIDE = 0
Public Const SW_SHOWNORMAL = 1
Public Const SW_SHOWMINIMIZED = 2
Public Const SW_SHOWMAXIMIZED = 3
Public Const SW_SHOWNOACTIVATE = 4
Public Const SW_SHOW = 5
Public Const SW_SHOWMINNOACTIVE = 7
Public Const SW_SHOWNA = 8
Public Const SW_RESTORE = 9
Public Const SW_SHOWDEFAULT = 10

Private Const WAIT_FAILED = &HFFFF
Private Const WAIT_TIMEOUT = &H102

Private bProcessRunning As Boolean

'''

Public Property Get ProcessRunning() As Boolean
    ProcessRunning = bProcessRunning
End Property

'''

'
' Process()
'
' Execute a command and wait until it has been terminated.
'
Public Function Process(ByVal CommandLine, _
                        ByVal Show As Long, _
                        ByVal LowPriority As Boolean) As Boolean
                        
    Dim tProcessInfo As PROCESS_INFORMATION
    Dim tStartupInfo As STARTUPINFO
    Dim lCreationFlags As Long
    Dim lReturn As Long
    Dim sMsg As String
    
    Process = False
    
    lCreationFlags = CREATE_NEW_CONSOLE + CREATE_NEW_PROCESS_GROUP + CREATE_SEPARATE_WOW_VDM
    
    If LowPriority Then
        lCreationFlags = lCreationFlags + IDLE_PRIORITY_CLASS
    End If
    
    With tStartupInfo
        .dwFlags = STARTF_USESHOWWINDOW
        .wShowWindow = Show
        .cb = Len(tStartupInfo)
    End With
    
    bProcessRunning = False
    
    If CreateProcessA(0&, CommandLine, 0&, 0&, 1&, lCreationFlags, 0&, 0&, tStartupInfo, tProcessInfo) Then
        
        bProcessRunning = True
        
        Do
            lReturn = WaitForSingleObject(tProcessInfo.hProcess, 800)
            
            DoEvents
            
        Loop While lReturn = WAIT_TIMEOUT
    
        If lReturn = WAIT_FAILED Then
            MsgBox "Error: WaitForSingleObject()", vbExclamation, App.Title
        Else
            If CloseHandle(tProcessInfo.hProcess) = 0& Then
                MsgBox "Error: CloseHandle()", vbExclamation, App.Title
            End If
            Process = True
        End If
        
        bProcessRunning = False
    Else
        sMsg = "Error: CreateProcess()" & vbCrLf
        sMsg = sMsg & "Can not execute '" & CommandLine & "'!"
        MsgBox sMsg, vbExclamation, App.Title
    End If
End Function



