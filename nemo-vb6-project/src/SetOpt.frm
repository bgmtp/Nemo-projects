VERSION 5.00
Begin VB.Form frmSetOpt 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Set Options"
   ClientHeight    =   3375
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3960
   Icon            =   "SetOpt.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3375
   ScaleWidth      =   3960
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdStamp 
      Caption         =   "Stamp"
      Height          =   315
      Left            =   2760
      TabIndex        =   17
      Top             =   420
      Width           =   1095
   End
   Begin VB.CommandButton cmdNoDebug 
      Caption         =   "No Debug"
      Height          =   315
      Left            =   2760
      TabIndex        =   21
      Top             =   1860
      Width           =   1095
   End
   Begin VB.CommandButton cmdDebug 
      Caption         =   "Debug"
      Height          =   315
      Left            =   2760
      TabIndex        =   20
      Top             =   1500
      Width           =   1095
   End
   Begin VB.CommandButton cmdVer73 
      Caption         =   "Ver 7.3"
      Height          =   315
      Left            =   2760
      TabIndex        =   19
      Top             =   1140
      Width           =   1095
   End
   Begin VB.CommandButton cmdVer72 
      Caption         =   "Ver 7.2"
      Height          =   315
      Left            =   2760
      TabIndex        =   18
      Top             =   780
      Width           =   1095
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   315
      Left            =   2760
      TabIndex        =   16
      Top             =   60
      Width           =   1095
   End
   Begin VB.TextBox txtRevisionVer 
      Height          =   285
      Left            =   1740
      TabIndex        =   5
      Text            =   "*"
      Top             =   660
      Width           =   855
   End
   Begin VB.TextBox txtMinorVer 
      Height          =   285
      Left            =   1740
      TabIndex        =   3
      Text            =   "*"
      Top             =   360
      Width           =   855
   End
   Begin VB.TextBox txtMajorVer 
      Height          =   285
      Left            =   1740
      TabIndex        =   1
      Text            =   "*"
      Top             =   60
      Width           =   855
   End
   Begin VB.TextBox txtCodeViewDebugInfo 
      Height          =   285
      Left            =   1740
      TabIndex        =   15
      Text            =   "*"
      Top             =   2160
      Width           =   855
   End
   Begin VB.TextBox txtFavorPentiumPro 
      Height          =   285
      Left            =   1740
      TabIndex        =   13
      Text            =   "*"
      Top             =   1860
      Width           =   855
   End
   Begin VB.TextBox txtOptimizationType 
      Height          =   285
      Left            =   1740
      TabIndex        =   11
      Text            =   "*"
      Top             =   1560
      Width           =   855
   End
   Begin VB.TextBox txtCompilationType 
      Height          =   285
      Left            =   1740
      TabIndex        =   9
      Text            =   "*"
      Top             =   1260
      Width           =   855
   End
   Begin VB.TextBox txtCondComp 
      Height          =   285
      Left            =   1740
      TabIndex        =   7
      Text            =   "*"
      Top             =   960
      Width           =   855
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   2760
      TabIndex        =   25
      Top             =   2880
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   1620
      TabIndex        =   24
      Top             =   2880
      Width           =   1095
   End
   Begin VB.CheckBox chkRecursive 
      Caption         =   "Recursive"
      Height          =   255
      Left            =   120
      TabIndex        =   23
      Top             =   2940
      Width           =   1335
   End
   Begin VB.Label lblInfo 
      Caption         =   "( * = leave value )"
      Height          =   195
      Left            =   1740
      TabIndex        =   22
      Top             =   2520
      Width           =   1275
   End
   Begin VB.Label lblMinorVer 
      Caption         =   "MinorVer"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   420
      Width           =   1575
   End
   Begin VB.Label lblRevisionVer 
      Caption         =   "Revision"
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   720
      Width           =   1575
   End
   Begin VB.Label lblMajorVer 
      Caption         =   "MajorVer"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1575
   End
   Begin VB.Label lblCodeViewDebugInfo 
      Caption         =   "CodeViewDebugInfo"
      Height          =   195
      Left            =   120
      TabIndex        =   14
      Top             =   2220
      Width           =   1575
   End
   Begin VB.Label lblFavorPentiumPro 
      Caption         =   "FavorPentiumPro(tm)"
      Height          =   195
      Left            =   120
      TabIndex        =   12
      Top             =   1920
      Width           =   1575
   End
   Begin VB.Label lblOptimizationType 
      Caption         =   "OptimizationType"
      Height          =   195
      Left            =   120
      TabIndex        =   10
      Top             =   1620
      Width           =   1575
   End
   Begin VB.Label lblCompilationType 
      Caption         =   "CompilationType"
      Height          =   195
      Left            =   120
      TabIndex        =   8
      Top             =   1320
      Width           =   1575
   End
   Begin VB.Label lblCondComp 
      Caption         =   "CondComp"
      Height          =   195
      Left            =   120
      TabIndex        =   6
      Top             =   1020
      Width           =   1575
   End
End
Attribute VB_Name = "frmSetOpt"
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

Public Sub SetOptions(Opt As SetOptions, _
                      Recursive As Boolean, _
                      Cancel As Boolean)
    Caption = "Set Options '" & oVBP.Filename & "'"
    
    Cancel = True

    If Recursive Then
        chkRecursive.Value = vbChecked
    Else
        chkRecursive.Value = vbUnchecked
    End If
    
    Show vbModal

    Select Case lCommand
        Case vbOK:
            With Opt
                .MajorVer = Trim$(txtMajorVer.Text)
                .MinorVer = Trim$(txtMinorVer.Text)
                .RevisionVer = Trim$(txtRevisionVer.Text)
                .CondComp = Trim$(txtCondComp.Text)
                .CompilationType = Trim$(txtCompilationType.Text)
                .OptimizationType = Trim$(txtOptimizationType.Text)
                .FavorPentiumPro = Trim$(txtFavorPentiumPro.Text)
                .CodeViewDebugInfo = Trim$(txtCodeViewDebugInfo.Text)
            End With
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

Private Sub cmdClear_Click()
    txtMajorVer.Text = "*"
    txtMinorVer.Text = "*"
    txtRevisionVer.Text = "*"
    txtCondComp.Text = "*"
    txtCompilationType.Text = "*"
    txtOptimizationType.Text = "*"
    txtFavorPentiumPro.Text = "*"
    txtCodeViewDebugInfo.Text = "*"
End Sub

Private Sub cmdDebug_Click()
    txtCondComp.Text = "DBG = 1"
    txtCompilationType.Text = "0"
    txtOptimizationType.Text = "2"
    txtFavorPentiumPro.Text = "0"
    txtCodeViewDebugInfo.Text = "-1"
End Sub

Private Sub cmdNoDebug_Click()
    txtCondComp.Text = ""
    txtCompilationType.Text = "0"
    txtOptimizationType.Text = "0"
    txtFavorPentiumPro.Text = "0"
    txtCodeViewDebugInfo.Text = "0"
End Sub

Private Sub cmdOK_Click()
    lCommand = vbOK
    Me.Hide
End Sub

Private Sub cmdStamp_Click()
    txtMajorVer.Text = "7000"
    txtMinorVer.Text = "2000"
    txtRevisionVer.Text = "9000"
End Sub

Private Sub cmdVer72_Click()
    txtMajorVer.Text = "7"
    txtMinorVer.Text = "2"
    txtRevisionVer.Text = "0"
End Sub

Private Sub cmdVer73_Click()
    txtMajorVer.Text = "7"
    txtMinorVer.Text = "3"
    txtRevisionVer.Text = "0"
End Sub
