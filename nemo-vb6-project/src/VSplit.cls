VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "VSplit"
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

Private mHostPane As Object
Private mLeftPane As Object
Private mRightPane As Object
Private mSplitBar As Object
Private mSplitOn As Boolean

Public Property Set SplitBar(ByVal vData As Object)
    Set mSplitBar = vData
End Property

Public Property Get SplitBar() As Object
    Set SplitBar = mSplitBar
End Property

Public Property Set RightPane(ByVal vData As Object)
    Set mRightPane = vData
End Property

Public Property Get RightPane() As Object
    Set RightPane = mRightPane
End Property

Public Property Set LeftPane(ByVal vData As Object)    '
    Set mLeftPane = vData
End Property

Public Property Get LeftPane() As Object
    Set LeftPane = mLeftPane
End Property

Public Property Set HostPane(ByVal vData As Object)
    Set mHostPane = vData
End Property

Public Property Get HostPane() As Object
    Set HostPane = mHostPane
End Property

Public Property Let SplitOn(ByVal vData As Boolean)
    mSplitOn = vData
    
    Select Case mSplitOn
        Case True:  mSplitBar.BackColor = vbButtonShadow
        Case False: mSplitBar.BackColor = vbButtonFace
    End Select
End Property

Public Property Get SplitOn() As Boolean
    SplitOn = mSplitOn
End Property

Public Sub SetPointer(ByVal pType As Integer)    '
    mHostPane.MousePointer = pType
End Sub

Public Sub ResizePanes(Optional Twips As Single)
    On Error GoTo LocalErr
    
    If IsMissing(Twips) Then
        Twips = 0
    End If
    
    With mSplitBar
        .Top = 0
        .Left = .Left + Twips
        .Height = mHostPane.ScaleHeight
        .Width = 45
    End With
    
    With mLeftPane
        .Top = 0
        .Left = 0
        .Height = mHostPane.ScaleHeight
        .Width = mSplitBar.Left
    End With
    
    With mRightPane
        .Top = 0
        .Left = mSplitBar.Left + mSplitBar.Width
        .Height = mHostPane.ScaleHeight
        .Width = mHostPane.ScaleWidth - (mLeftPane.Width + mSplitBar.Width)
    End With
    
    Exit Sub
    
LocalErr:

End Sub

