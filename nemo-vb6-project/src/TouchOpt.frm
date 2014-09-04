VERSION 5.00
Begin VB.Form frmTouchOpt 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Touch Options"
   ClientHeight    =   615
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4200
   Icon            =   "TouchOpt.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   615
   ScaleWidth      =   4200
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CheckBox chkRecursive 
      Caption         =   "Recursive"
      Height          =   255
      Left            =   360
      TabIndex        =   2
      Top             =   180
      Width           =   1335
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   1860
      TabIndex        =   1
      Top             =   120
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   3000
      TabIndex        =   0
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "frmTouchOpt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
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

Private oVBP As VBProject
Private lCommand As Long

Public Property Set VBP(ByVal NewVal As VBProject)
    Set oVBP = NewVal
End Property

Public Sub TouchOpt(Recursive As Boolean, _
                    Cancel As Boolean)
                    
    Caption = "Touch '" & oVBP.Filename & "'"
    
    Cancel = True

    If Recursive Then
        chkRecursive.Value = vbChecked
    Else
        chkRecursive.Value = vbUnchecked
    End If
    
    Show vbModal

    Select Case lCommand
        Case vbOK:
            Recursive = (chkRecursive.Value = vbChecked)
            Cancel = False
        Case vbCancel:
    End Select
    
    Unload Me
End Sub

Private Sub cmdCancel_Click()
    lCommand = vbCancel
    Me.Hide
End Sub

Private Sub cmdOK_Click()
    lCommand = vbOK
    Me.Hide
End Sub
