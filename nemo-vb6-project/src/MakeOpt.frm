VERSION 5.00
Begin VB.Form frmMakeOpt 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Make Options"
   ClientHeight    =   1845
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4215
   Icon            =   "MakeOpt.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1845
   ScaleWidth      =   4215
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.OptionButton optMake 
      Caption         =   "Make dependet projects only."
      Height          =   255
      Index           =   2
      Left            =   180
      TabIndex        =   2
      Top             =   780
      Width           =   3915
   End
   Begin VB.OptionButton optMake 
      Caption         =   "Make current project only."
      Height          =   255
      Index           =   1
      Left            =   180
      TabIndex        =   1
      Top             =   480
      Width           =   3915
   End
   Begin VB.OptionButton optMake 
      Caption         =   "Make current and all depended projects"
      Height          =   255
      Index           =   0
      Left            =   180
      TabIndex        =   0
      Top             =   180
      Value           =   -1  'True
      Width           =   3915
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   3000
      TabIndex        =   4
      Top             =   1320
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   1800
      TabIndex        =   3
      Top             =   1320
      Width           =   1095
   End
End
Attribute VB_Name = "frmMakeOpt"
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

Private lMakeOption As VBMakeMakeOptionsConstants

Public Property Set VBP(ByVal NewVal As VBProject)
    Set oVBP = NewVal
End Property

Public Sub MakeOpt(MakeOption As VBMakeMakeOptionsConstants, Cancel As Boolean)
    Caption = "Make '" & oVBP.Filename & "'"
    
    Cancel = True

    lMakeOption = MakeOption
    optMake(MakeOption).Value = True
    
    Show vbModal

    Select Case lCommand
        Case vbOK:
            MakeOption = lMakeOption
            Cancel = False
        Case vbCancel:
    End Select
    
    Unload Me
End Sub

Private Sub optMake_Click(Index As Integer)
    lMakeOption = Index
End Sub

Private Sub cmdCancel_Click()
    lCommand = vbCancel
    Me.Hide
End Sub

Private Sub cmdOK_Click()
    lCommand = vbOK
    Me.Hide
End Sub

