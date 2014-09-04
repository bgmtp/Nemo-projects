VERSION 5.00
Begin VB.Form frmVBMakeOpt 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Options"
   ClientHeight    =   2190
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4245
   Icon            =   "VBMakeOpt.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2190
   ScaleWidth      =   4245
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CheckBox chkWinRunnerSupport 
      Caption         =   "Make winrunner support file before compile."
      Height          =   255
      Left            =   180
      TabIndex        =   3
      Top             =   1260
      Width           =   3915
   End
   Begin VB.CheckBox chkTypeLibCompatible 
      Caption         =   "Make typelib compatible file before compile."
      Height          =   255
      Left            =   180
      TabIndex        =   2
      Top             =   900
      Width           =   3915
   End
   Begin VB.CheckBox chkReadOnlyTargets 
      Caption         =   "Ignore readonly attribute on targets."
      Height          =   255
      Left            =   180
      TabIndex        =   1
      Top             =   540
      Width           =   3915
   End
   Begin VB.CheckBox chkProjectFileDate 
      Caption         =   "Look project file date."
      Height          =   255
      Left            =   180
      TabIndex        =   0
      Top             =   180
      Width           =   3915
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   1860
      TabIndex        =   4
      Top             =   1680
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   3060
      TabIndex        =   5
      Top             =   1680
      Width           =   1095
   End
End
Attribute VB_Name = "frmVBMakeOpt"
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

Private lCommand As Long

Public Sub VBMakeOpt(VBMakeOptions As VBMakeOptions, Cancel As Boolean)
    Cancel = True

    With VBMakeOptions
        If .ProjectFileDate Then
            chkProjectFileDate.Value = vbChecked
        Else
            chkProjectFileDate.Value = vbUnchecked
        End If
        If .ReadOnlyTargets Then
            chkReadOnlyTargets.Value = vbChecked
        Else
            chkReadOnlyTargets.Value = vbUnchecked
        End If
        If .TypeLibCompatible Then
            chkTypeLibCompatible.Value = vbChecked
        Else
            chkTypeLibCompatible.Value = vbUnchecked
        End If
        If .WinRunnerSupport Then
            chkWinRunnerSupport.Value = vbChecked
        Else
            chkWinRunnerSupport.Value = vbUnchecked
        End If
    End With
    
    Show vbModal

    Select Case lCommand
        Case vbOK:
            With VBMakeOptions
                .ProjectFileDate = (chkProjectFileDate.Value = vbChecked)
                .ReadOnlyTargets = (chkReadOnlyTargets.Value = vbChecked)
                .TypeLibCompatible = (chkTypeLibCompatible.Value = vbChecked)
                .WinRunnerSupport = (chkWinRunnerSupport.Value = vbChecked)
            End With
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
