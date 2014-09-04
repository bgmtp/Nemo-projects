VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "HSplit"
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
Private mTopPane As Object
Private mBottomPane As Object
Private mSplitBar As Object
Private mSplitOn As Boolean

Public Property Set SplitBar(ByVal vData As Object)
    Set mSplitBar = vData
End Property

Public Property Get SplitBar() As Object
    Set SplitBar = mSplitBar
End Property

Public Property Set BottomPane(ByVal vData As Object)
    Set mBottomPane = vData
End Property

Public Property Get BottomPane() As Object
    Set BottomPane = mBottomPane
End Property

Public Property Set TopPane(ByVal vData As Object)
    Set mTopPane = vData
End Property

Public Property Get TopPane() As Object
    Set TopPane = mTopPane
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

'''

Public Sub SetPointer(pType As Integer)
    mHostPane.MousePointer = pType
End Sub

Public Sub ResizePanes(Optional Twips As Single = 0)
    On Error GoTo LocalErr
    
    With mSplitBar
        .Left = 0
        .Top = .Top + Twips
        .Height = 45
        .Width = mHostPane.ScaleWidth
    End With

    With mTopPane
        .Left = 0
        .Top = 0
        .Width = mHostPane.ScaleWidth
        .Height = mSplitBar.Top
    End With
    
    With mBottomPane
        .Left = 0
        .Top = mSplitBar.Top + mSplitBar.Height
        .Width = mHostPane.ScaleWidth
        .Height = mHostPane.ScaleHeight - (mTopPane.Height + mSplitBar.Height)
    End With
    
    Exit Sub

LocalErr:

End Sub

