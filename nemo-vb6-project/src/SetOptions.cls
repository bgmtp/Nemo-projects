VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SetOptions"
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

Const DEFAULT_VAL = "*"

Const OPT_MAJORVER = "MajorVer"
Const OPT_MINORVER = "MinorVer"
Const OPT_REVISIONVER = "RevisionVer"

Const OPT_CONDCOMP = "CondComp"
Const OPT_COMPILATIONTYPE = "CompilationType"
Const OPT_OPTIMIZATIONTYPE = "OptimizationType"
Const OPT_FAVORPENTIUMPRO = "FavorPentiumPro(tm)"
Const OPT_CODEVIEWDEBUGINFO = "CodeViewDebugInfo"

Public MajorVer As String
Public MinorVer As String
Public RevisionVer As String

Public CondComp As String
Public CompilationType As String
Public OptimizationType As String
Public FavorPentiumPro As String
Public CodeViewDebugInfo As String

Public Function GetNewValue(sName As String, sValue As String) As String
    Dim sNew As String
    Select Case sName
        Case OPT_MAJORVER:          sNew = MajorVer
        Case OPT_MINORVER:          sNew = MinorVer
        Case OPT_REVISIONVER:       sNew = RevisionVer
        
        Case OPT_CONDCOMP:          sNew = CondComp
        Case OPT_COMPILATIONTYPE:   sNew = CompilationType
        Case OPT_OPTIMIZATIONTYPE:  sNew = OptimizationType
        Case OPT_FAVORPENTIUMPRO:   sNew = FavorPentiumPro
        Case OPT_CODEVIEWDEBUGINFO: sNew = CodeViewDebugInfo
        Case Else:                  sNew = DEFAULT_VAL
    End Select
        
    If sNew <> DEFAULT_VAL Then
        GetNewValue = sNew
    Else
        GetNewValue = sValue
    End If
End Function

Private Sub Class_Initialize()
    MajorVer = DEFAULT_VAL
    MinorVer = DEFAULT_VAL
    RevisionVer = DEFAULT_VAL
    
    CondComp = DEFAULT_VAL
    CompilationType = DEFAULT_VAL
    OptimizationType = DEFAULT_VAL
    FavorPentiumPro = DEFAULT_VAL
    CodeViewDebugInfo = DEFAULT_VAL
End Sub
