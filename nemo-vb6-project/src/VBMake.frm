VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "ComCtl32.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MsFlxGrd.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Begin VB.Form frmVBMake 
   BackColor       =   &H8000000C&
   Caption         =   "VB Make"
   ClientHeight    =   8205
   ClientLeft      =   1200
   ClientTop       =   1485
   ClientWidth     =   13680
   Icon            =   "VBMake.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8205
   ScaleWidth      =   13680
   Begin ComctlLib.Toolbar tbrVBMake 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   13680
      _ExtentX        =   24130
      _ExtentY        =   1111
      ButtonWidth     =   1323
      ButtonHeight    =   953
      AllowCustomize  =   0   'False
      Wrappable       =   0   'False
      Appearance      =   1
      ImageList       =   "imlToolbar"
      _Version        =   327682
      BeginProperty Buttons {0713E452-850A-101B-AFC0-4210102A8DA7} 
         NumButtons      =   18
         BeginProperty Button1 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Open"
            Key             =   "OPEN"
            Object.ToolTipText     =   "Open Project List"
            Object.Tag             =   ""
            ImageIndex      =   1
         EndProperty
         BeginProperty Button3 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button4 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Open VB"
            Key             =   "VB"
            Object.ToolTipText     =   "Open Visual Basic"
            Object.Tag             =   ""
            ImageIndex      =   2
         EndProperty
         BeginProperty Button5 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Edit vbp"
            Key             =   "EDITVBP"
            Object.ToolTipText     =   "Edit Project File"
            Object.Tag             =   ""
            ImageIndex      =   3
         EndProperty
         BeginProperty Button6 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button7 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Options"
            Key             =   "OPTIONS"
            Object.Tag             =   ""
            ImageIndex      =   4
         EndProperty
         BeginProperty Button8 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button9 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Make"
            Key             =   "MAKE"
            Object.ToolTipText     =   "Make Project"
            Object.Tag             =   ""
            ImageIndex      =   5
         EndProperty
         BeginProperty Button10 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Execute"
            Key             =   "EXECUTE"
            Object.Tag             =   ""
            ImageIndex      =   11
         EndProperty
         BeginProperty Button11 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
            Style           =   3
         EndProperty
         BeginProperty Button12 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Register"
            Key             =   "REGISTER"
            Object.ToolTipText     =   "Register Component"
            Object.Tag             =   ""
            ImageIndex      =   6
         EndProperty
         BeginProperty Button13 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Set"
            Key             =   "SET"
            Object.Tag             =   ""
            ImageIndex      =   7
         EndProperty
         BeginProperty Button14 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Touch"
            Key             =   "TOUCH"
            Object.ToolTipText     =   "Touch Projects"
            Object.Tag             =   ""
            ImageIndex      =   8
         EndProperty
         BeginProperty Button15 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button16 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Enabled         =   0   'False
            Caption         =   "Cancel"
            Key             =   "CANCEL"
            Object.ToolTipText     =   "Cancel Make"
            Object.Tag             =   ""
            ImageIndex      =   9
         EndProperty
         BeginProperty Button17 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button18 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Info"
            Key             =   "INFO"
            Object.Tag             =   ""
            ImageIndex      =   10
         EndProperty
      EndProperty
      BorderStyle     =   1
   End
   Begin VB.PictureBox picContainer 
      BorderStyle     =   0  'None
      Height          =   7035
      Index           =   0
      Left            =   120
      ScaleHeight     =   7035
      ScaleWidth      =   12795
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   780
      Width           =   12795
      Begin VB.ListBox lstVBMake 
         Height          =   1320
         IntegralHeight  =   0   'False
         Left            =   120
         TabIndex        =   17
         Top             =   5580
         Width           =   11295
      End
      Begin VB.PictureBox picHSplit 
         BorderStyle     =   0  'None
         Height          =   135
         Left            =   120
         MousePointer    =   7  'Size N S
         ScaleHeight     =   135
         ScaleWidth      =   11295
         TabIndex        =   23
         TabStop         =   0   'False
         Top             =   5400
         Width           =   11295
      End
      Begin VB.PictureBox picContainer 
         BorderStyle     =   0  'None
         Height          =   5355
         Index           =   1
         Left            =   60
         ScaleHeight     =   5355
         ScaleWidth      =   12615
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   120
         Width           =   12615
         Begin VB.PictureBox picContainer 
            BorderStyle     =   0  'None
            Height          =   5115
            Index           =   2
            Left            =   2400
            ScaleHeight     =   5115
            ScaleWidth      =   10095
            TabIndex        =   3
            Top             =   120
            Width           =   10095
            Begin VB.PictureBox picFrame 
               Height          =   4215
               Left            =   0
               ScaleHeight     =   4155
               ScaleWidth      =   9975
               TabIndex        =   18
               TabStop         =   0   'False
               Top             =   840
               Width           =   10035
               Begin MSFlexGridLib.MSFlexGrid flxVBMake 
                  Height          =   735
                  Left            =   180
                  TabIndex        =   20
                  Top             =   480
                  Width           =   2415
                  _ExtentX        =   4260
                  _ExtentY        =   1296
                  _Version        =   393216
                  AllowUserResizing=   1
                  BorderStyle     =   0
                  Appearance      =   0
               End
               Begin ComctlLib.TabStrip tabVBMake 
                  Height          =   1395
                  Left            =   0
                  TabIndex        =   19
                  Top             =   0
                  Width           =   2775
                  _ExtentX        =   4895
                  _ExtentY        =   2461
                  _Version        =   327682
                  BeginProperty Tabs {0713E432-850A-101B-AFC0-4210102A8DA7} 
                     NumTabs         =   3
                     BeginProperty Tab1 {0713F341-850A-101B-AFC0-4210102A8DA7} 
                        Caption         =   "Properties"
                        Key             =   "Properties"
                        Object.Tag             =   ""
                        ImageVarType    =   2
                     EndProperty
                     BeginProperty Tab2 {0713F341-850A-101B-AFC0-4210102A8DA7} 
                        Caption         =   "Files"
                        Key             =   "Files"
                        Object.Tag             =   ""
                        ImageVarType    =   2
                     EndProperty
                     BeginProperty Tab3 {0713F341-850A-101B-AFC0-4210102A8DA7} 
                        Caption         =   "References"
                        Key             =   "References"
                        Object.Tag             =   ""
                        ImageVarType    =   2
                     EndProperty
                  EndProperty
               End
            End
            Begin VB.PictureBox picVBMake 
               BorderStyle     =   0  'None
               Height          =   735
               Left            =   0
               ScaleHeight     =   735
               ScaleWidth      =   10035
               TabIndex        =   5
               TabStop         =   0   'False
               Top             =   0
               Visible         =   0   'False
               Width           =   10035
               Begin VB.PictureBox picProject 
                  AutoRedraw      =   -1  'True
                  AutoSize        =   -1  'True
                  BorderStyle     =   0  'None
                  Height          =   540
                  Left            =   120
                  ScaleHeight     =   540
                  ScaleWidth      =   540
                  TabIndex        =   6
                  TabStop         =   0   'False
                  Top             =   120
                  Width           =   540
               End
               Begin VB.TextBox txtPrjFilename 
                  BorderStyle     =   0  'None
                  Height          =   225
                  Left            =   1620
                  Locked          =   -1  'True
                  TabIndex        =   8
                  Top             =   120
                  Width           =   1935
               End
               Begin VB.TextBox txtPrjDate 
                  BorderStyle     =   0  'None
                  Height          =   225
                  Left            =   3600
                  Locked          =   -1  'True
                  TabIndex        =   9
                  Top             =   120
                  Width           =   1695
               End
               Begin VB.TextBox txtPrjVersion 
                  BorderStyle     =   0  'None
                  Height          =   225
                  Left            =   8100
                  Locked          =   -1  'True
                  TabIndex        =   11
                  Top             =   120
                  Width           =   1875
               End
               Begin VB.TextBox txtPrjPath 
                  BorderStyle     =   0  'None
                  Height          =   225
                  Left            =   5340
                  Locked          =   -1  'True
                  TabIndex        =   10
                  Top             =   120
                  Width           =   2715
               End
               Begin VB.TextBox txtDestPath 
                  BorderStyle     =   0  'None
                  Height          =   225
                  Left            =   5340
                  Locked          =   -1  'True
                  TabIndex        =   15
                  Top             =   420
                  Width           =   2715
               End
               Begin VB.TextBox txtDestVersion 
                  BorderStyle     =   0  'None
                  Height          =   225
                  Left            =   8100
                  Locked          =   -1  'True
                  TabIndex        =   16
                  Top             =   420
                  Width           =   1875
               End
               Begin VB.TextBox txtDestDate 
                  BorderStyle     =   0  'None
                  Height          =   225
                  Left            =   3600
                  Locked          =   -1  'True
                  TabIndex        =   14
                  Top             =   420
                  Width           =   1695
               End
               Begin VB.TextBox txtDestFilename 
                  BorderStyle     =   0  'None
                  Height          =   225
                  Left            =   1620
                  Locked          =   -1  'True
                  TabIndex        =   13
                  Top             =   420
                  Width           =   1935
               End
               Begin VB.Label lblDest 
                  Caption         =   "Destination:"
                  Height          =   195
                  Left            =   720
                  TabIndex        =   12
                  Top             =   420
                  Width           =   855
               End
               Begin VB.Label lblPrj 
                  Caption         =   "Project:"
                  Height          =   195
                  Left            =   720
                  TabIndex        =   7
                  Top             =   120
                  Width           =   855
               End
            End
         End
         Begin VB.PictureBox picVSplit 
            BorderStyle     =   0  'None
            Height          =   5115
            Left            =   2160
            MousePointer    =   9  'Size W E
            ScaleHeight     =   5115
            ScaleWidth      =   195
            TabIndex        =   22
            TabStop         =   0   'False
            Top             =   120
            Width           =   195
         End
         Begin ComctlLib.TreeView tvwVBMake 
            Height          =   5175
            Left            =   60
            TabIndex        =   4
            Top             =   60
            Width           =   2055
            _ExtentX        =   3625
            _ExtentY        =   9128
            _Version        =   327682
            Indentation     =   450
            LabelEdit       =   1
            LineStyle       =   1
            Style           =   7
            ImageList       =   "imlTree"
            Appearance      =   1
         End
      End
   End
   Begin ComctlLib.StatusBar sbrVBMake 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   21
      Top             =   7950
      Width           =   13680
      _ExtentX        =   24130
      _ExtentY        =   450
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            AutoSize        =   1
            Bevel           =   0
            Object.Width           =   23627
            TextSave        =   ""
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog cdlVBMake 
      Left            =   13080
      Top             =   2760
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin ComctlLib.ImageList imlTree 
      Left            =   13020
      Top             =   1440
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16711935
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   7
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":0442
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":0554
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":0666
            Key             =   "Missing"
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":0BB8
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":0CCA
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":0DDC
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":0EEE
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin ComctlLib.ImageList imlToolbar 
      Left            =   13020
      Top             =   780
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16711935
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   11
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":1000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":1552
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":1AA4
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":1FF6
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":2548
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":2A9A
            Key             =   "Registry"
         EndProperty
         BeginProperty ListImage7 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":2FEC
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":353E
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":3A90
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":3FE2
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":4534
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin ComctlLib.ImageList imlBig 
      Left            =   13020
      Top             =   2100
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   16711935
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   4
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":4A86
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":4D18
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":4FAA
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":523C
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin ComctlLib.ImageList imlVBMake 
      Left            =   13020
      Top             =   3360
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16711935
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   13
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":54CE
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":55E0
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":56F2
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":5C44
            Key             =   "VB"
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":6196
            Key             =   "Note"
         EndProperty
         BeginProperty ListImage6 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":66E8
            Key             =   "Properties"
         EndProperty
         BeginProperty ListImage7 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":6C3A
            Key             =   "Files"
         EndProperty
         BeginProperty ListImage8 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":718C
            Key             =   "Registry"
         EndProperty
         BeginProperty ListImage9 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":76DE
            Key             =   "Missing"
         EndProperty
         BeginProperty ListImage10 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":7C30
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":7D42
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":7E54
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "VBMake.frx":7F66
            Key             =   ""
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmVBMake"
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

Const VBMAKE_INI_FILE = "VBMake.ini"
Const VBMAKE_DEP_FILE = "VBMake.dep"

Const PREFIX_FOLDER = "FLD-"

Const DLL_EXT = "dll"
Const OCX_EXT = "ocx"
Const EXE_EXT = "exe"

Const VBP_PRJ_EXT = "vbp"

Private VBMAKECOMMAND As String

Const VBMAKEVBPPARAM = "%1"
Const VBMAKEOUTOPT = "/out"
Const VBMAKEOUTFILE = "VBMake.out"

Const REGPGM = "Regsvr32.exe"
Const REGSVR = "/regserver"

Const VBP_KEY_TYPE = "TYPE"

Const VBP_KEY_TYPE_EXE = "EXE"
Const VBP_KEY_TYPE_OLEEXE = "OLEEXE"
Const VBP_KEY_TYPE_OLEDLL = "OLEDLL"
Const VBP_KEY_TYPE_CONTROL = "CONTROL"

Const VBP_KEY_OBJECT = "OBJECT"
Const VBP_KEY_REFERENCE = "REFERENCE"
Const VBP_KEY_CLASS = "CLASS"
Const VBP_KEY_MODULE = "MODULE"
Const VBP_KEY_FORM = "FORM"
Const VBP_KEY_USERCONTROL = "USERCONTROL"
Const VBP_KEY_USERDOCUMENT = "USERDOCUMENT"
Const VBP_KEY_RELATEDDOC = "RELATEDDOC"
Const VBP_KEY_DESTNAME = "EXENAME32"
Const VBP_KEY_DESTPATH = "PATH32"

Const VBP_KEY_MAJORVER = "MAJORVER"
Const VBP_KEY_MINORVER = "MINORVER"
Const VBP_KEY_REVISIONVER = "REVISIONVER"

Const VBP_KEY_BASEADDR = "DLLBASEADDRESS"

'''

Private Enum TreeImageConstants
    imgFolderClosed = 1
    imgFolderOpen
    imgMissing
    imgStandardExe
    imgActiveXExe
    imgActiveXDll
    imgActiveXOcx
End Enum

Private Enum BigImageConstants
    img32StandardExe = 1
    img32ActiveXExe
    img32ActiveXDll
    img32ActiveXOcx
End Enum

'''

Const COL_NUM = 0
Const COL_NAME = 1
Const COL_VALU = 2
Const COL_DATE = 2
Const COL_PATH = 3
Const COL_FVER = 4
Const COL_FTLB = 5
Const COL_PTLB = 6
Const COL_RTLB = 7
Const COL_STAT = 8

Private Enum GridViewConstant
    GridProperties
    GridFiles
    GridReferences
    GridOff
End Enum

Private lGridView As GridViewConstant

Private oVBMakeOptions As New VBMakeOptions

Private oRegKeyVBP As Key

Private sProjectsFilename As String
Private sProjectsPath As String
Private sProjectsFile As String

Private oCurrentProject As New VBProject

Private bMakeAction As Boolean
Private bMakeCanceled As Boolean

Private oProjects As New Collection

'''

Private oHSplit As New HSplit
Private oVSplit As New VSplit

'''

Private Sub Form_Initialize()
    With oHSplit
        Set .HostPane = picContainer(0)
        Set .TopPane = picContainer(1)
        Set .BottomPane = lstVBMake
        Set .SplitBar = picHSplit
        .SplitOn = False
    End With
    With oVSplit
        Set .HostPane = picContainer(1)
        Set .LeftPane = tvwVBMake
        Set .RightPane = picContainer(2)
        Set .SplitBar = picVSplit
        .SplitOn = False
    End With
End Sub

Private Sub Form_Load()
    Dim sCommandline As String
    
    Set oRegKeyVBP = REG.Keys.Add(HKEY_CLASSES_ROOT, "VisualBasic.Project\shell\make\command")
    
    VBMAKECOMMAND = oRegKeyVBP.Default.Value + " " + VBMAKEOUTOPT + " " + App.Path + "\" + VBMAKEOUTFILE
    
    lGridView = GridProperties
    
    ChDir App.Path
    
    sCommandline = Trim$(Command())
    
    If Len(sCommandline) = 0 Then
        sProjectsFilename = FSO.BuildPath(App.Path, VBMAKE_INI_FILE)
        sProjectsPath = App.Path + "\"
        sProjectsFile = VBMAKE_INI_FILE
    Else
        sProjectsFilename = FSO.GetAbsolutePathName(sCommandline)
        sProjectsPath = FSO.GetParentFolderName(sProjectsFilename)
        sProjectsFile = FSO.GetFileName(sProjectsFilename)
    End If
        
    ChDir sProjectsPath
        
    Caption = App.Title & " - " & sProjectsFilename
    
    SetCommands
    
    If FSO.FileExists(sProjectsFilename) Then
        ReadProjectList
    Else
        MsgBox "File '" + sProjectsFilename + "' not found!", vbExclamation, App.Title
        OpenProjectList
    End If
End Sub

'''

Private Function ReadVBPFile(ByVal sFilename As String, oVBP As VBProject) As Boolean
    Dim bOK As Boolean
    Dim oFile As Scripting.File
    Dim oStream As Scripting.TextStream
    Dim hFile As Integer
    Dim sLine As String
    Dim sValue As String
    Dim sKey As String
    Dim iPos As Integer
    Dim sPath As String
    Dim sFile As String
    
    bOK = False
    
    If Not FSO.FileExists(sFilename) Then
        MsgFileNotExist sFilename
        Exit Function
    End If
    
    oVBP.Clear
    
    Set oFile = FSO.GetFile(sFilename)
    With oVBP
        .Path = oFile.ParentFolder
        .Filename = oFile.Name
        .Filedate = oFile.DateLastModified
    End With
    
    ' read project file
    
    Set oStream = oFile.OpenAsTextStream
    Do While Not oStream.AtEndOfStream
        sLine = oStream.ReadLine
        iPos = InStr(1, sLine, "=")
        If iPos > 0 Then
            sKey = Trim(Left(sLine, iPos - 1))
            sValue = Trim(Mid(sLine, iPos + 1))
            Select Case UCase(sKey)
                Case VBP_KEY_OBJECT:        ReadVBPLineObject sLine, sValue, oVBP
                Case VBP_KEY_REFERENCE:     ReadVBPLineReference sLine, sValue, oVBP
                Case VBP_KEY_CLASS:         ReadVBPLineClass sLine, sValue, oVBP
                Case VBP_KEY_MODULE:        ReadVBPLineModule sLine, sValue, oVBP
                Case VBP_KEY_FORM:          ReadVBPLineForm sLine, sValue, oVBP
                Case VBP_KEY_USERCONTROL:   ReadVBPLineUserControl sLine, sValue, oVBP
                Case VBP_KEY_USERDOCUMENT:  ReadVBPLineUserDocument sLine, sValue, oVBP
                Case VBP_KEY_RELATEDDOC:    ReadVBPLineRelatedDocument sLine, sValue, oVBP
                Case Else:                  ReadVBPLineProperty sLine, sKey, sValue, oVBP
            End Select
        Else
            ReadVBPLineOther sLine, oVBP
        End If
    Loop
        
    oStream.Close
        
    ' check destination
    
    With oVBP
        .DestExists = FSO.FileExists(FSO.BuildPath(.DestPath, .DestFilename))
        If .DestExists Then
            Set oFile = FSO.GetFile(FSO.BuildPath(.DestPath, .DestFilename))
            .DestFiledate = oFile.DateLastModified
            .GetDestVersionInfo
        End If
    End With
    
    IsProjectUpToDate oVBP
    
    bOK = True
    
    ReadVBPFile = bOK
End Function

Private Sub ReadVBPLineObject(ByVal sLine As String, _
                              ByVal sValue As String, _
                              oVBP As VBProject)
    Dim iPos1 As Integer
    Dim iPos2 As Integer
    Dim oObject As New VBPObject
    
    Dim sFilename As String
    Dim sRegVersion As String
    
    With oObject
        Set .VBP = oVBP
        .Line = sLine
        iPos1 = InStr(1, sValue, "#")
        If iPos1 > 0 Then
            .TypeLib = Trim(Mid(sValue, 2, iPos1 - 3))
            iPos2 = InStr(iPos1 + 1, sValue, "#")
            If iPos2 > 0 Then
                .Version = LCase(Trim(Mid(sValue, iPos1 + 1, iPos2 - iPos1 - 1)))
                iPos1 = iPos2
                iPos2 = InStr(iPos1 + 1, sValue, ";")
                If iPos2 > 0 Then
                    .LangID = Trim(Mid(sValue, iPos1 + 1, iPos2 - iPos1 - 1))
                    .Filename = Trim(Mid(sValue, iPos2 + 1))
                End If
            End If
            
        End If
    
        ' version vbp file for objects is decimal, we need a hex number for registry
        iPos1 = InStr(1, .Version, ".")
        If iPos1 > 0 Then
            .Version = Hex(Left(.Version, iPos1 - 1)) & Mid(.Version, iPos1)
        End If
        
        .GetTypeLibInfoRegistry
        .GetFileInfo
        .GetFileVersionInfo
        .GetTypeLibInfoFile
    End With
    
    oVBP.Add oObject
End Sub

Private Sub ReadVBPLineReference(ByVal sLine As String, _
                                 ByVal sValue As String, _
                                 oVBP As VBProject)
    Dim iPos1 As Integer
    Dim iPos2 As Integer
    Dim oObject As New VBPReference
    Dim sRegVersion As String
    
    With oObject
        Set .VBP = oVBP
        .Line = sLine
        iPos1 = InStr(1, sValue, "#")
        If iPos1 > 0 Then
            .TypeLib = Trim(Mid(sValue, 5, iPos1 - 6))
            iPos2 = InStr(iPos1 + 1, sValue, "#")
            If iPos2 > 0 Then
                .Version = LCase(Trim(Mid(sValue, iPos1 + 1, iPos2 - iPos1 - 1)))
                iPos1 = iPos2
                iPos2 = InStr(iPos1 + 1, sValue, "#")
                If iPos2 > 0 Then
                    .LangID = Trim(Mid(sValue, iPos1 + 1, iPos2 - iPos1 - 1))
                    iPos1 = iPos2
                    iPos2 = InStr(iPos1 + 1, sValue, "#")
                    If iPos2 > 0 Then
                        .Name = Trim(Mid(sValue, iPos2 + 1))
                    End If
                End If
            End If
        End If
        
        .GetTypeLibInfoRegistry
        .GetFileInfo
        .GetFileVersionInfo
        .GetTypeLibInfoFile
    End With
    
    oVBP.Add oObject
End Sub

Private Sub ReadVBPLineClass(ByVal sLine As String, _
                             ByVal sValue As String, _
                             oVBP As VBProject)
    Dim iPos1 As Integer
    Dim iPos2 As Integer
    Dim oObject As New VBPClass
    
    With oObject
        .Line = sLine
        iPos1 = InStr(1, sValue, ";")
        If iPos1 > 0 Then
            .Name = Trim(Left(sValue, iPos1 - 1))
            GetFileInfo oObject, Trim(Mid(sValue, iPos1 + 1)), oVBP
        End If
    End With
    
    oVBP.Add oObject
End Sub

Private Sub ReadVBPLineModule(ByVal sLine As String, _
                              ByVal sValue As String, _
                              oVBP As VBProject)
    Dim iPos1 As Integer
    Dim iPos2 As Integer
    Dim oObject As New VBPModule
    
    With oObject
        .Line = sLine
        iPos1 = InStr(1, sValue, ";")
        If iPos1 > 0 Then
            .Name = Trim(Left(sValue, iPos1 - 1))
            GetFileInfo oObject, Trim(Mid(sValue, iPos1 + 1)), oVBP
        End If
    End With
    
    oVBP.Add oObject
End Sub

Private Sub ReadVBPLineForm(ByVal sLine As String, _
                            ByVal sValue As String, _
                            oVBP As VBProject)
    Dim iPos1 As Integer
    Dim iPos2 As Integer
    Dim oObject As New VBPForm
    
    With oObject
        .Line = sLine
        GetFileInfo oObject, Trim(sValue), oVBP
    End With
    
    oVBP.Add oObject
End Sub

Private Sub ReadVBPLineUserControl(ByVal sLine As String, _
                                   ByVal sValue As String, _
                                   oVBP As VBProject)
    Dim iPos1 As Integer
    Dim iPos2 As Integer
    Dim oObject As New VBPUserControl
    
    With oObject
        .Line = sLine
        GetFileInfo oObject, Trim(sValue), oVBP
    End With
    
    oVBP.Add oObject
End Sub

Private Sub ReadVBPLineUserDocument(ByVal sLine As String, _
                                    ByVal sValue As String, _
                                    oVBP As VBProject)
    Dim iPos1 As Integer
    Dim iPos2 As Integer
    Dim oObject As New VBPUserDocument
    
    With oObject
        .Line = sLine
        GetFileInfo oObject, Trim(sValue), oVBP
    End With
    
    oVBP.Add oObject
End Sub

Private Sub ReadVBPLineRelatedDocument(ByVal sLine As String, _
                                       ByVal sValue As String, _
                                       oVBP As VBProject)
    Dim iPos1 As Integer
    Dim iPos2 As Integer
    Dim oObject As New VBPRelatedDocument
    
    With oObject
        .Line = sLine
        GetFileInfo oObject, Trim(sValue), oVBP
    End With
    
    oVBP.Add oObject
End Sub

Private Sub ReadVBPLineProperty(ByVal sLine As String, _
                                ByVal sKey As String, _
                                ByVal sValue As String, _
                                oVBP As VBProject)
    Dim oObject As New VBPProperty

    With oObject
        .Line = sLine
        .Name = sKey
        .Value = sValue
        If Left$(.Value, 1) = """" Then .Value = Trim$(Mid$(.Value, 2))
        If Right$(.Value, 1) = """" Then .Value = Trim$(Left$(.Value, Len(.Value) - 1))
    End With
        
    oVBP.Add oObject
    
    Select Case UCase$(sKey)
        Case VBP_KEY_TYPE:                oVBP.ProjectType = oObject.Value
        Case VBP_KEY_DESTNAME:            oVBP.DestFilename = oObject.Value
        Case VBP_KEY_DESTPATH:            oVBP.DestPath = FSO.GetAbsolutePathName(FSO.BuildPath(oVBP.Path, oObject.Value))
        Case VBP_KEY_MAJORVER:            oVBP.MajorVersion = oObject.Value
        Case VBP_KEY_MINORVER:            oVBP.MinorVersion = oObject.Value
        Case VBP_KEY_REVISIONVER:         oVBP.RevisionVersion = oObject.Value
        Case VBP_KEY_BASEADDR:            oVBP.BaseAddr = oObject.Value
    End Select
End Sub

Private Sub ReadVBPLineOther(ByVal sLine As String, _
                             oVBP As VBProject)
    Dim oObject As New VBPLine

    With oObject
        .Line = sLine
    End With
        
    oVBP.Add oObject
End Sub

'''

Private Sub GetFileInfo(ByVal oObject As Object, _
                        ByVal sFilename As String, _
                        ByVal oVBP As VBProject)
                        
    Dim oFile As Scripting.File
    
    With oObject
        .Path = FSO.GetAbsolutePathName(FSO.BuildPath(oVBP.Path, FSO.GetParentFolderName(sFilename)))
        .Filename = FSO.GetFileName(sFilename)
        .Exists = FSO.FileExists(.FullFilename)
        If .Exists Then
            Set oFile = FSO.GetFile(.FullFilename)
            .Filedate = oFile.DateLastModified
        End If
    End With
End Sub

Private Sub Fill()
    FillHead
    FillGrid
    sbrVBMake.Panels(1).Text = oCurrentProject.Path & oCurrentProject.Filename
End Sub

Private Sub FillHead()
    Dim lImage As BigImageConstants
    With oCurrentProject
        Select Case UCase(.ProjectType)
            Case VBP_KEY_TYPE_EXE:      lImage = img32StandardExe
            Case VBP_KEY_TYPE_OLEEXE:   lImage = img32ActiveXExe
            Case VBP_KEY_TYPE_OLEDLL:   lImage = img32ActiveXDll
            Case VBP_KEY_TYPE_CONTROL:  lImage = img32ActiveXOcx
        End Select
        
        picProject.Cls
        If lImage > 0 Then
            imlBig.ListImages(lImage).Draw picProject.hDC, 0, 0, imlTransparent
        End If

        txtPrjFilename.Text = .Filename
        txtPrjDate.Text = .Filedate
        txtPrjVersion.Text = .MajorVersion & "." & .MinorVersion & ".0." & .RevisionVersion
        txtPrjPath.Text = .Path
        
        txtDestFilename.Text = .DestFilename
        txtDestDate.Text = .DestFiledate
        txtDestVersion.Text = .DestVersionInfo.VersionString
        txtDestPath.Text = .DestPath
        
        If oVBMakeOptions.ProjectFileDate Then
            If .Filedate > .DestFiledate Then
                txtPrjDate.ForeColor = RGB(255, 0, 0)
                txtDestDate.ForeColor = RGB(255, 0, 0)
            Else
                txtPrjDate.ForeColor = RGB(0, 0, 0)
                txtDestDate.ForeColor = RGB(0, 0, 0)
            End If
        Else
            txtPrjDate.ForeColor = RGB(0, 0, 0)
            txtDestDate.ForeColor = RGB(0, 0, 0)
        End If
        
        If .UpToDate Then
            txtDestFilename.ForeColor = RGB(0, 0, 0)
        Else
            txtDestFilename.ForeColor = RGB(255, 0, 0)
        End If
    End With
    picVBMake.Visible = True
End Sub

Private Sub FillGrid()
    Select Case lGridView
        Case GridProperties: FillGridProperties
        Case GridFiles:      FillGridFiles
        Case GridReferences: FillGridReferences
        Case GridOff:        flxVBMake.Visible = False
    End Select
End Sub

Private Sub FillGridProperties()
    Dim oObject As Object
    Dim s As String
    Dim iRow As Integer
    
    With flxVBMake
        .Clear
    
        .Cols = 3
        
        .TextMatrix(0, COL_NAME) = "Name"
        .TextMatrix(0, COL_VALU) = "Value"
        
        .ColWidth(COL_NUM) = 360
        .ColWidth(COL_NAME) = txtPrjFilename.Width + 45
        .ColWidth(COL_VALU) = txtPrjPath.Width + 45
        
        .ColAlignment(COL_NUM) = flexAlignRightCenter
        .ColAlignment(COL_NAME) = flexAlignLeftCenter
        .ColAlignment(COL_VALU) = flexAlignLeftCenter
        
        .Visible = True
    End With
    
    iRow = 1
    For Each oObject In oCurrentProject
        If oObject.VBPEntryType = VBPProperty Then
            If iRow >= flxVBMake.Rows Then
                flxVBMake.Rows = flxVBMake.Rows + 10
            End If
            With oObject
                flxVBMake.Row = iRow
                flxVBMake.TextMatrix(iRow, COL_NUM) = CStr(iRow)
                flxVBMake.TextMatrix(iRow, COL_NAME) = .Name
                flxVBMake.TextMatrix(iRow, COL_VALU) = .Value
            End With
            iRow = iRow + 1
        End If
    Next
    flxVBMake.Rows = iRow
    flxVBMake.TopRow = 1
End Sub

Private Sub FillGridFiles()
    Dim oObject As Object
    Dim s As String
    Dim iRow As Integer
    
    With flxVBMake
        .Clear
    
        .Cols = 4
        
        .TextMatrix(0, COL_NAME) = "Name"
        .TextMatrix(0, COL_DATE) = "Date"
        .TextMatrix(0, COL_PATH) = "Path"
        
        .ColWidth(COL_NUM) = 360
        .ColWidth(COL_NAME) = txtPrjFilename.Width + 45
        .ColWidth(COL_DATE) = txtPrjDate.Width + 45
        .ColWidth(COL_PATH) = txtPrjPath.Width + 45
        
        .ColAlignment(COL_NUM) = flexAlignRightCenter
        .ColAlignment(COL_NAME) = flexAlignLeftCenter
        .ColAlignment(COL_DATE) = flexAlignLeftCenter
        .ColAlignment(COL_PATH) = flexAlignLeftCenter
        
        .Visible = True
    End With
    
    iRow = 1
    For Each oObject In oCurrentProject
        If oObject.VBPEntryType <> VBPProperty And _
           oObject.VBPEntryType <> VBPReference And _
           oObject.VBPEntryType <> VBPLine And _
           oObject.VBPEntryType <> VBPObject Then
            If iRow >= flxVBMake.Rows Then
                flxVBMake.Rows = flxVBMake.Rows + 10
            End If
            With oObject
                flxVBMake.Row = iRow
                flxVBMake.TextMatrix(iRow, COL_NUM) = CStr(iRow)
                flxVBMake.TextMatrix(iRow, COL_NAME) = .Filename
                If .Filedate = 0 Then
                    flxVBMake.TextMatrix(iRow, COL_DATE) = ""
                Else
                    flxVBMake.TextMatrix(iRow, COL_DATE) = .Filedate
                End If
                flxVBMake.TextMatrix(iRow, COL_PATH) = .Path
                If oObject.Filedate > oCurrentProject.DestFiledate Then
                    flxVBMake.Col = COL_DATE
                    flxVBMake.CellForeColor = RGB(255, 0, 0)
                End If
            End With
            iRow = iRow + 1
        End If
    Next
    flxVBMake.Rows = iRow
    flxVBMake.TopRow = 1
End Sub

Private Sub FillGridReferences()
    Dim oObject As Object
    Dim s As String
    Dim iRow As Integer
    Dim sFileTlb As String
    Dim sPrjVersion As String
    Dim sRegVersion As String
    
    With flxVBMake
        .Clear
    
        .Cols = 9
        
        .TextMatrix(0, COL_NAME) = "Name"
        .TextMatrix(0, COL_DATE) = "Date"
        .TextMatrix(0, COL_PATH) = "Path"
        .TextMatrix(0, COL_FVER) = "File Version"
        .TextMatrix(0, COL_FTLB) = "File TypeLib"
        .TextMatrix(0, COL_PTLB) = "Prj TypeLib"
        .TextMatrix(0, COL_RTLB) = "Reg TypeLib"
        .TextMatrix(0, COL_STAT) = "Status"
        
        .ColWidth(COL_NUM) = 360
        .ColWidth(COL_NAME) = txtPrjFilename.Width + 45
        .ColWidth(COL_DATE) = txtPrjDate.Width + 45
        .ColWidth(COL_PATH) = txtPrjPath.Width + 45
        .ColWidth(COL_FVER) = txtPrjVersion.Width + 45
        .ColWidth(COL_FTLB) = txtPrjVersion.Width + 45
        .ColWidth(COL_PTLB) = txtPrjVersion.Width + 45
        .ColWidth(COL_RTLB) = txtPrjVersion.Width + 45
        .ColWidth(COL_STAT) = txtPrjVersion.Width + 45
        
        .ColAlignment(COL_NUM) = flexAlignRightCenter
        .ColAlignment(COL_NAME) = flexAlignLeftCenter
        .ColAlignment(COL_DATE) = flexAlignLeftCenter
        .ColAlignment(COL_PATH) = flexAlignLeftCenter
        .ColAlignment(COL_FVER) = flexAlignLeftCenter
        .ColAlignment(COL_FTLB) = flexAlignLeftCenter
        .ColAlignment(COL_PTLB) = flexAlignLeftCenter
        .ColAlignment(COL_RTLB) = flexAlignLeftCenter
        .ColAlignment(COL_STAT) = flexAlignLeftCenter
        
        .Visible = True
    End With
    
    iRow = 1
    For Each oObject In oCurrentProject
        If oObject.VBPEntryType = VBPReference Or oObject.VBPEntryType = VBPObject Then
            If iRow >= flxVBMake.Rows Then
                flxVBMake.Rows = flxVBMake.Rows + 10
            End If
            With oObject
                flxVBMake.Row = iRow
                flxVBMake.TextMatrix(iRow, COL_NUM) = CStr(iRow)
                flxVBMake.TextMatrix(iRow, COL_NAME) = .Filename
                If .Filedate = 0 Then
                    flxVBMake.TextMatrix(iRow, COL_DATE) = ""
                    flxVBMake.TextMatrix(iRow, COL_PATH) = ""
                    flxVBMake.TextMatrix(iRow, COL_FVER) = ""
                Else
                    flxVBMake.TextMatrix(iRow, COL_DATE) = .Filedate
                    flxVBMake.TextMatrix(iRow, COL_PATH) = .Path
                    flxVBMake.TextMatrix(iRow, COL_FVER) = .FileVersionInfo.VersionString
                End If
                
                sFileTlb = LCase(.TypeLibVersionFile)
                flxVBMake.TextMatrix(iRow, COL_FTLB) = sFileTlb
                
                sPrjVersion = LCase(.TypeLibVersionProject)
                flxVBMake.TextMatrix(iRow, COL_PTLB) = sPrjVersion
                If .Registered Then
                    sRegVersion = LCase(.TypeLibVersionRegistry)
                    flxVBMake.TextMatrix(iRow, COL_RTLB) = sRegVersion
                    If InStr(1, sRegVersion, sFileTlb) = 0 Then
                        flxVBMake.Col = COL_FTLB
                        flxVBMake.CellForeColor = RGB(255, 0, 0)
                        flxVBMake.TextMatrix(iRow, COL_STAT) = flxVBMake.TextMatrix(iRow, COL_STAT) & " " & "VERSION"
                    End If
                    If InStr(1, sRegVersion, sPrjVersion) = 0 Then
                        flxVBMake.Col = COL_PTLB
                        flxVBMake.CellForeColor = RGB(255, 0, 0)
                        flxVBMake.TextMatrix(iRow, COL_STAT) = flxVBMake.TextMatrix(iRow, COL_STAT) & " " & "VERSION"
                    End If
                Else
                    flxVBMake.TextMatrix(iRow, COL_RTLB) = ""
                    flxVBMake.Col = COL_PTLB
                    flxVBMake.CellForeColor = RGB(255, 0, 0)
                    flxVBMake.TextMatrix(iRow, COL_STAT) = flxVBMake.TextMatrix(iRow, COL_STAT) & " " & "NOTREG"
                End If
                If oObject.Filedate > oCurrentProject.DestFiledate Then
                    flxVBMake.Col = COL_DATE
                    flxVBMake.CellForeColor = RGB(255, 0, 0)
                    flxVBMake.TextMatrix(iRow, COL_STAT) = flxVBMake.TextMatrix(iRow, COL_STAT) & " " & "DATE"
                End If
                If Not oObject.Exists Then
                    flxVBMake.TextMatrix(iRow, COL_STAT) = flxVBMake.TextMatrix(iRow, COL_STAT) & " " & "MISSING"
                End If
            End With
            iRow = iRow + 1
        End If
    Next
    flxVBMake.Rows = iRow
    If flxVBMake.Rows > 1 Then
        flxVBMake.TopRow = 1
    End If
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If kernel32.ProcessRunning Then
        MsgBox "Can not close VBMAKE, process is running!", vbExclamation
        Cancel = True
    End If
End Sub

Private Sub Form_Resize()
    Dim iHeight As Integer
    iHeight = ScaleHeight - tbrVBMake.Height - sbrVBMake.Height
    If iHeight < 0 Then iHeight = 0
    picContainer(0).Move 0, tbrVBMake.Height, ScaleWidth, iHeight
End Sub

Private Sub ReadDependenciesForNode(ByVal oNode As Node)
    Dim sFilename As String
    
    sFilename = oNode.Tag
    
    ReadDependenciesRecursive sFilename, FSO.GetBaseName(sFilename)
End Sub

Private Sub ReadDependenciesRecursive(ByVal sProjectFile As String, ByVal sRoot As String)
    Dim oStream As Scripting.TextStream
    Dim sProjectPath As String
    Dim sDepFile As String
    Dim sLine As String
    Dim sFilename As String
    Dim sName As String
    Dim oNode As Node
    
    sProjectPath = FSO.GetParentFolderName(sProjectFile)
    sDepFile = FSO.BuildPath(sProjectPath, VBMAKE_DEP_FILE)
    
    If FSO.FileExists(sDepFile) Then
        Set oStream = FSO.OpenTextFile(sDepFile)
        
        Do While Not oStream.AtEndOfStream
            sLine = oStream.ReadLine
            sLine = Trim$(sLine)
            If Len(sLine) > 0 Then
                sFilename = FSO.BuildPath(sProjectPath, sLine)
                sFilename = FSO.GetAbsolutePathName(sFilename)
                sName = FSO.GetBaseName(sFilename)
                
                Set oNode = tvwVBMake.Nodes.Add(sRoot, tvwChild, sRoot + "\" + sName, sName, GetProjectImage(sFilename))
                oNode.Tag = sFilename
                
                ReadDependenciesRecursive sFilename, sRoot + "\" + sName
            End If
        Loop
        
        oStream.Close
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Dim sOutFile As String
    sOutFile = FSO.BuildPath(App.Path, "VBMake.out")
    If FSO.FileExists(sOutFile) Then
        FSO.DeleteFile sOutFile
    End If
End Sub

Private Sub picContainer_Resize(Index As Integer)
    Dim iHeight As Integer
    Select Case Index
        Case 0: oHSplit.ResizePanes
        Case 1: oVSplit.ResizePanes
        Case 2:
            picVBMake.Move 0, 0, picContainer(2).ScaleWidth
            iHeight = picContainer(2).ScaleHeight - picVBMake.Height
            If iHeight < 0 Then iHeight = 0
            picFrame.Move 0, picVBMake.Height, picContainer(2).ScaleWidth, iHeight
    End Select
End Sub

Private Sub picFrame_Resize()
    Dim iW As Integer
    Dim iH As Integer
    tabVBMake.Move 0, 0, picFrame.ScaleWidth, picFrame.ScaleHeight
    With tabVBMake
        iW = .ClientWidth - 120
        If iW < 0 Then iW = 0
        iH = .ClientHeight - 120
        If iH < 0 Then iH = 0
        flxVBMake.Move .ClientLeft + 60, .ClientTop + 60, iW, iH
    End With
End Sub

Private Sub picVSplit_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    oVSplit.SplitOn = True
End Sub

Private Sub picVSplit_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If oVSplit.SplitOn = True Then
        oVSplit.ResizePanes X
    End If
End Sub

Private Sub picVSplit_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If oVSplit.SplitOn = True Then
        oVSplit.ResizePanes X
        oVSplit.SplitOn = False
    End If
End Sub

Private Sub picHSplit_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    oHSplit.SplitOn = True
End Sub

Private Sub picHSplit_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If oHSplit.SplitOn = True Then
        oHSplit.ResizePanes Y
    End If
End Sub

Private Sub picHSplit_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If oHSplit.SplitOn = True Then
        oHSplit.ResizePanes Y
        oHSplit.SplitOn = False
    End If
End Sub

Private Sub tabVBMake_Click()
    Select Case UCase(tabVBMake.SelectedItem.Key)
        Case "PROPERTIES":
            lGridView = GridProperties
            FillGridProperties
        Case "FILES":
            lGridView = GridFiles
            FillGridFiles
        Case "REFERENCES"
            lGridView = GridReferences
            FillGridReferences
    End Select
End Sub

Private Sub tbrVBMake_ButtonClick(ByVal Button As ComctlLib.Button)
    Select Case UCase(Button.Key)
        Case "OPEN":        OpenProjectList
        Case "VB":          OpenVisualBasic
        Case "EDITVBP":     EditProjectFile
        Case "OPTIONS":     VBMakeOptions
        Case "MAKE":        MakeProjectByNode
        Case "EXECUTE":     ExecuteFile oCurrentProject.FullDestFilename
        Case "REGISTER":    RegisterFile oCurrentProject.FullDestFilename
        Case "SET":         SetProjectByNode
        Case "TOUCH":       TouchProjectByNode
        Case "CANCEL":      bMakeCanceled = True
        Case "INFO":        ShowInfo
    End Select
End Sub

Private Sub tvwVBMake_NodeClick(ByVal Node As ComctlLib.Node)
    Dim sFilename As String
    
    sFilename = Node.Tag
    
    If Len(sFilename) > 0 Then
        If sFilename = oCurrentProject.Path & oCurrentProject.Filename Then Exit Sub
        
        If ReadVBPFile(sFilename, oCurrentProject) Then
            Fill
        End If
        SetCommands
    End If
End Sub

Private Sub OpenProjectList()
    sProjectsFilename = ""
    
    cdlVBMake.DialogTitle = "Open VBMake Project List..."
    cdlVBMake.Flags = cdlOFNFileMustExist + cdlOFNHideReadOnly + cdlOFNLongNames + cdlOFNPathMustExist
    cdlVBMake.Filename = VBMAKE_INI_FILE
    cdlVBMake.Filter = "VBMake Project Lists (*.ini)|*.ini|All Files (*.*)|*.*"
    cdlVBMake.FilterIndex = 1
    cdlVBMake.CancelError = True
    On Error Resume Next
    cdlVBMake.ShowOpen
    If Err.Number = cdlCancel Then
        sProjectsFilename = ""
        sProjectsPath = ""
        sProjectsFile = ""
        Exit Sub
    Else
        sProjectsFilename = cdlVBMake.Filename
        sProjectsPath = FSO.GetParentFolderName(sProjectsFilename)
        sProjectsFile = FSO.GetFileName(sProjectsFilename)
    End If
    
    ReadProjectList
End Sub

Private Sub ReadProjectList()
    Dim oStream As Scripting.TextStream
    Dim sLine As String
    Dim oNode As Node
    Dim sFilename As String
    Dim sName As String
    Dim sParent As String
    
    tvwVBMake.Nodes.Clear
    
    sParent = ""
    
    Set oStream = FSO.OpenTextFile(sProjectsFilename)
    
    Do While Not oStream.AtEndOfStream
        sLine = oStream.ReadLine
        sLine = Trim$(sLine)
        If Len(sLine) > 0 Then
            If Left$(sLine, 1) = "[" And Right$(sLine, 1) = "]" Then
                sName = Mid$(sLine, 2, Len(sLine) - 2)
                Set oNode = tvwVBMake.Nodes.Add(, , PREFIX_FOLDER + sName, sName, imgFolderClosed, imgFolderClosed)
                sParent = oNode.Key
            Else
                sFilename = FSO.GetAbsolutePathName(sLine)
                sName = FSO.GetBaseName(sFilename)
                
                If Len(sParent) > 0 Then
                    Set oNode = tvwVBMake.Nodes.Add(sParent, tvwChild, sName, sName, GetProjectImage(sFilename))
                    oNode.Tag = sFilename
                Else
                    Set oNode = tvwVBMake.Nodes.Add(, , sName, sName, GetProjectImage(sFilename))
                    oNode.Tag = sFilename
                End If
            
                ReadDependenciesForNode oNode
            End If
        End If
    Loop
    
    oStream.Close
    
    For Each oNode In tvwVBMake.Nodes
        If Not Left$(oNode.Key, Len(PREFIX_FOLDER)) = PREFIX_FOLDER Then
            oNode.EnsureVisible
            oNode.Selected = True
            If ReadVBPFile(oNode.Tag, oCurrentProject) Then
                Fill
            End If
            Exit For
        End If
    Next
    
    SetCommands
End Sub

Private Function GetProjectImage(ByVal sFilename As String) As Long
    Dim oStream  As Scripting.TextStream
    Dim sLine As String
    Dim lImage As TreeImageConstants
    
    If FSO.FileExists(sFilename) Then
        Set oStream = FSO.OpenTextFile(sFilename)
        sLine = oStream.ReadLine
        oStream.Close
        
        Select Case UCase(sLine)
            Case "TYPE=EXE":      lImage = imgStandardExe
            Case "TYPE=OLEEXE":   lImage = imgActiveXExe
            Case "TYPE=OLEDLL":   lImage = imgActiveXDll
            Case "TYPE=CONTROL":  lImage = imgActiveXOcx
            Case Else:            lImage = imgStandardExe
        End Select
    Else
        lImage = imgMissing
    End If
    GetProjectImage = lImage
End Function

Private Sub MsgFileNotExist(ByVal sFilename As String)
    MsgBox "File '" & sFilename & "' not exists!", vbExclamation, App.Title
End Sub

Private Sub OpenVisualBasic()
    Dim lRC As Long
    
    ChDir oCurrentProject.Path
    
    lRC = ShellExecute(Me.hWnd, "open", oCurrentProject.FullFilename, "", "", SW_SHOWNORMAL)
End Sub

Private Sub EditProjectFile()
    Dim lRC As Long
    lRC = Shell("notepad.exe " & oCurrentProject.FullFilename, vbNormalFocus)
End Sub

Private Sub MakeProjectByNode()
    Dim f As New frmMakeOpt
    Dim lMakeOption As VBMakeMakeOptionsConstants
    Dim bCancel As Boolean
    
    DoEvents
    
    If tvwVBMake.SelectedItem Is Nothing Then Exit Sub
        
    lMakeOption = vbmMakeAll
    Set f.VBP = oCurrentProject
    f.MakeOpt lMakeOption, bCancel
    
    If bCancel Then Exit Sub
    
    bMakeCanceled = False
    
    bMakeAction = True
    SetCommands
    
    ProjectsClear
    
    lstVBMake.Clear
    
    MakeProjectRecursive tvwVBMake.SelectedItem, lMakeOption
    
    ReadVBPFile tvwVBMake.SelectedItem.Tag, oCurrentProject
    Fill
    
    bMakeAction = False
    SetCommands
End Sub

Private Sub MakeProjectRecursive(ByVal oNode As Node, ByVal lMakeOption As VBMakeMakeOptionsConstants)
    Dim oChild As Node
    
    If (lMakeOption = vbmMakeAll) Or _
       (lMakeOption = vbmMakeDepended) Then
       
        If Not oNode.Child Is Nothing Then
            Set oChild = oNode.Child
                Do
                MakeProjectRecursive oChild, False
                Set oChild = oChild.Next
            Loop Until oChild Is Nothing Or bMakeCanceled
        End If
        
    End If
    
    If Not bMakeCanceled Then
    
        If (lMakeOption = vbmMakeAll) Or _
           (lMakeOption = vbmMakeProject) Then
           
            MakeProject oNode.Tag
            
        End If
    
    End If
    
    DoEvents
End Sub

Private Sub MakeProject(ByVal sFilename As String)
    Dim oVBP As New VBProject
    Dim bMake As Boolean
    Dim oObject As Object
    Dim sCommand As String
    Dim sOutFile As String
    Dim bResetReadOnlyPrj As Boolean
    Dim bResetReadOnlyLic As Boolean
    Dim bUseVBMakeProject As Boolean
    
    If ProjectExists(sFilename) Then Exit Sub
    
    ReadVBPFile sFilename, oVBP
    
    oProjects.Add oVBP, sFilename
    
    bMake = Not oVBP.UpToDate
  
    bResetReadOnlyPrj = False
    bResetReadOnlyLic = False
    bUseVBMakeProject = False
    
    ' ReadOnly Project File
    If bMake Then
        If File.IsReadOnly(oVBP.FullDestFilename) Then
            If oVBMakeOptions.ReadOnlyTargets Then
                File.SetReadOnly oVBP.FullDestFilename, False
                bResetReadOnlyPrj = True
            Else
                MsgBox "Target '" + oVBP.FullDestFilename + "' is readonly!", vbExclamation, App.Title
                bMakeCanceled = True
                bMake = False
            End If
        End If
    End If
    
    ' ReadOnly License File
    If bMake Then
        If FSO.FileExists(oVBP.LicenseFilename) Then
            If File.IsReadOnly(oVBP.LicenseFilename) Then
                If oVBMakeOptions.ReadOnlyTargets Then
                    File.SetReadOnly oVBP.LicenseFilename, False
                    bResetReadOnlyLic = True
                Else
                    MsgBox "License from target '" + oVBP.FullDestFilename + "' is readonly!", vbExclamation, App.Title
                    bMakeCanceled = True
                    bMake = False
                End If
            End If
        End If
    End If
    
    If bMake Then
        If oVBMakeOptions.TypeLibCompatible Or _
           oVBMakeOptions.WinRunnerSupport _
        Then
            oVBP.MakeVBPFile FSO.BuildPath(oVBP.Path, "VBMake.vbp"), _
                             oVBMakeOptions.TypeLibCompatible, _
                             oVBMakeOptions.WinRunnerSupport
            bUseVBMakeProject = True
        End If
    End If
    
    If bMake Then
        lstVBMake.AddItem sFilename & " -> " & "Make ...", 0
        sbrVBMake.Panels(1).Text = "Make Project '" & sFilename & "'..."
        DoEvents
        
        sOutFile = FSO.BuildPath(App.Path, "VBMake.out")
        If FSO.FileExists(sOutFile) Then Kill sOutFile
        
        If Not bUseVBMakeProject Then
            sCommand = GetVBMakeCommand(sFilename)
        Else
            sCommand = GetVBMakeCommand(FSO.BuildPath(oVBP.Path, "VBMake.vbp"))
        End If
        
        If kernel32.Process(sCommand, 0, True) Then
        End If
                
        If bResetReadOnlyPrj Then
            File.SetReadOnly oVBP.FullDestFilename, True
        End If
        If bResetReadOnlyLic Then
            File.SetReadOnly oVBP.LicenseFilename, True
        End If
        
        lstVBMake.List(0) = sFilename & " -> " & ReadProtocolFirstLine()
    Else
        If Not bMakeCanceled Then
            lstVBMake.AddItem sFilename & " -> " & "Is up to date!", 0
        Else
            lstVBMake.AddItem sFilename & " -> " & "Canceled!", 0
        End If
    End If
End Sub

Private Function ProjectExists(ByVal sName As String) As Boolean
    Dim oVBP As VBProject

    On Error Resume Next
    Set oVBP = oProjects.Item(sName)
    ProjectExists = (Err.Number = 0)
End Function

Private Sub ProjectsClear()
    Dim i As Integer
    For i = 1 To oProjects.Count
        oProjects.Remove 1
    Next
End Sub

Private Sub ExecuteFile(ByVal sFilename As String)
    Dim lRC As Long
    lRC = ShellExecute(Me.hWnd, "open", sFilename, "", "", SW_SHOWNORMAL)
End Sub

Private Sub RegisterFile(ByVal sFilename As String)
    Dim sExtension As String
    Dim sCommand As String
    
    If Not FSO.FileExists(sFilename) Then
        MsgFileNotExist sFilename
        Exit Sub
    End If
        
    sExtension = Right(sFilename, 3)
    
    Select Case LCase(sExtension)
        Case DLL_EXT, OCX_EXT:  sCommand = REGPGM & " " & sFilename
        Case EXE_EXT:           sCommand = sFilename & " " & REGSVR
        Case Else:
            MsgBox "Don't know how to register '" & sFilename & "'!", vbExclamation, App.Title
            Exit Sub
    End Select
    
    If kernel32.Process(sCommand, 0, False) Then
    End If
End Sub

Private Sub ReadProtocol()
    Dim oStream As Scripting.TextStream
    Dim sOutFile As String
    Dim sLine As String
    
    sOutFile = FSO.BuildPath(App.Path, "VBMake.out")
    If Not FSO.FileExists(sOutFile) Then Exit Sub
    
    Set oStream = FSO.OpenTextFile(sOutFile)
    
    Do While Not oStream.AtEndOfStream
        sLine = oStream.ReadLine
        lstVBMake.AddItem sLine, 0
    Loop
    
    oStream.Close
End Sub

Private Function ReadProtocolFirstLine() As String
    Dim oStream As Scripting.TextStream
    Dim sOutFile As String
    Dim sLine As String
    
    ReadProtocolFirstLine = ""
    
    sOutFile = FSO.BuildPath(App.Path, "VBMake.out")
    If Not FSO.FileExists(sOutFile) Then Exit Function
    
    Set oStream = FSO.OpenTextFile(sOutFile)
    
    Do While Not oStream.AtEndOfStream
        sLine = oStream.ReadLine
        sLine = Trim$(sLine)
        If Len(sLine) > 0 Then
            ReadProtocolFirstLine = sLine
            Exit Do
        End If
    Loop
    
    oStream.Close
End Function

Private Function IsProjectUpToDate(ByVal oVBP As VBProject) As Boolean
    Dim bUpToDate As Boolean
    Dim oObject As Object
    
    bUpToDate = True

    If oVBMakeOptions.ProjectFileDate Then
        If oVBP.Filedate > oVBP.DestFiledate Then
            bUpToDate = False
        End If
    End If
    For Each oObject In oVBP
        If oObject.VBPEntryType <> VBPProperty And _
           oObject.VBPEntryType <> VBPLine Then
            If oVBP.DestFiledate < oObject.Filedate Then
                bUpToDate = False
                Exit For
            End If
        End If
    Next
    
    oVBP.UpToDate = bUpToDate
    
    IsProjectUpToDate = bUpToDate
End Function

Private Sub VBMakeOptions()
    Dim f As New frmVBMakeOpt
    Dim bCancel As Boolean
        
    f.VBMakeOpt oVBMakeOptions, bCancel
    
    If bCancel Then Exit Sub
    
    ReadVBPFile tvwVBMake.SelectedItem.Tag, oCurrentProject
    Fill
End Sub

'''

Private Sub SetProjectByNode()
    Dim f As New frmSetOpt
    Dim oOpt As New SetOptions
    Dim bRecursive As Boolean
    Dim bCancel As Boolean

    DoEvents
    
    If tvwVBMake.SelectedItem Is Nothing Then Exit Sub
        
    bRecursive = False
        
    Set f.VBP = oCurrentProject
    f.SetOptions oOpt, bRecursive, bCancel
    
    If bCancel Then Exit Sub
    
    ProjectsClear
    
    lstVBMake.Clear
    
    SetProjectRecursive tvwVBMake.SelectedItem, oOpt, bRecursive
    
    ReadVBPFile tvwVBMake.SelectedItem.Tag, oCurrentProject
    Fill
End Sub

Private Sub SetProjectRecursive(ByVal oNode As Node, _
                                ByVal oOpt As SetOptions, _
                                ByVal bRecursive As Boolean)
    Dim oChild As Node
    
    If bRecursive Then
        If Not oNode.Child Is Nothing Then
            Set oChild = oNode.Child
            Do
                SetProjectRecursive oChild, oOpt, bRecursive
                Set oChild = oChild.Next
            Loop Until oChild Is Nothing
        End If
    End If
    
    SetProject oNode.Tag, oOpt
    
    DoEvents
End Sub

Private Sub SetProject(ByVal sFilename As String, _
                       ByVal oOpt As SetOptions)
                       
    Dim oVBP As New VBProject
    Dim bResetReadOnly As Boolean
    Dim oTempFolder As Scripting.Folder
    
    If ProjectExists(sFilename) Then Exit Sub
    
    ReadVBPFile sFilename, oVBP
    
    oProjects.Add oVBP, sFilename
    
    bResetReadOnly = False
    
    If File.IsReadOnly(sFilename) Then
       File.SetReadOnly sFilename, False
       bResetReadOnly = True
    End If
    
    oVBP.SetOptions FSO.BuildPath(oVBP.Path, "VBMake.vbp"), oOpt
    
    Set oTempFolder = FSO.GetSpecialFolder(TemporaryFolder)
    
    FileCopy oVBP.FullFilename, FSO.BuildPath(oTempFolder.Path, FSO.GetTempName)
    FileCopy FSO.BuildPath(oVBP.Path, "VBMake.vbp"), oVBP.FullFilename
    
    lstVBMake.AddItem sFilename & " -> " & "Set Options", 0
   
    If bResetReadOnly Then
       File.SetReadOnly sFilename, True
    End If
End Sub

'''

Private Sub TouchProjectByNode()
    Dim f As New frmTouchOpt
    Dim bFileDate As Boolean
    Dim bTypeLib As Boolean
    Dim bRecursive As Boolean
    Dim bCancel As Boolean
    
    DoEvents
    
    If tvwVBMake.SelectedItem Is Nothing Then Exit Sub
    
    bFileDate = True
    bTypeLib = True
    bRecursive = False
    
    Set f.VBP = oCurrentProject
    f.TouchOpt bRecursive, bCancel
    
    If bCancel Then Exit Sub
    
    ProjectsClear
    
    lstVBMake.Clear
    
    TouchProjectRecursive tvwVBMake.SelectedItem, bRecursive
    
    ReadVBPFile tvwVBMake.SelectedItem.Tag, oCurrentProject
    Fill
End Sub

Private Sub TouchProjectRecursive(ByVal oNode As Node, _
                                  ByVal bRecursive As Boolean)
    Dim oChild As Node
    
    If bRecursive Then
        If Not oNode.Child Is Nothing Then
            Set oChild = oNode.Child
            Do
                TouchProjectRecursive oChild, bRecursive
                Set oChild = oChild.Next
            Loop Until oChild Is Nothing
        End If
    End If
    
    TouchProject oNode.Tag
    
    DoEvents
End Sub

Private Sub TouchProject(ByVal sFilename As String)
    Dim oVBP As New VBProject
    Dim bResetReadOnly As Boolean
    
    If ProjectExists(sFilename) Then Exit Sub
    
    ReadVBPFile sFilename, oVBP
    
    oProjects.Add oVBP, sFilename
    
    bResetReadOnly = False
    
    If File.IsReadOnly(sFilename) Then
       File.SetReadOnly sFilename, False
       bResetReadOnly = True
    End If
    
    modTouch.Touch sFilename
    
    lstVBMake.AddItem sFilename & " -> " & "Touched", 0
   
    If bResetReadOnly Then
       File.SetReadOnly sFilename, True
    End If
End Sub

'''

Private Sub SetCommands()
    Dim bCurrent As Boolean
    bCurrent = (Len(oCurrentProject.Filename) > 0)
    With tbrVBMake
        .Buttons("OPEN").Enabled = Not bMakeAction
        .Buttons("VB").Enabled = Not bMakeAction And bCurrent
        .Buttons("EDITVBP").Enabled = Not bMakeAction And bCurrent
        .Buttons("OPTIONS").Enabled = Not bMakeAction And bCurrent
        .Buttons("MAKE").Enabled = Not bMakeAction And bCurrent
        
        .Buttons("EXECUTE").Enabled = (Not bMakeAction) And bCurrent And _
                                      (oCurrentProject.DestExists) And _
                                      ((UCase(oCurrentProject.ProjectType) = VBP_KEY_TYPE_EXE) Or _
                                       (UCase(oCurrentProject.ProjectType) = VBP_KEY_TYPE_OLEEXE) _
                                      )

        .Buttons("REGISTER").Enabled = (Not bMakeAction) And bCurrent And _
                                       (oCurrentProject.DestExists) And _
                                       ((UCase(oCurrentProject.ProjectType) = VBP_KEY_TYPE_OLEEXE) Or _
                                        (UCase(oCurrentProject.ProjectType) = VBP_KEY_TYPE_OLEDLL) Or _
                                        (UCase(oCurrentProject.ProjectType) = VBP_KEY_TYPE_CONTROL) _
                                       )
                                       
        .Buttons("SET").Enabled = Not bMakeAction And bCurrent
        .Buttons("TOUCH").Enabled = Not bMakeAction And bCurrent
        .Buttons("CANCEL").Enabled = bMakeAction And bCurrent
        .Buttons("INFO").Enabled = Not bMakeAction
    End With
End Sub

Private Function GetVBMakeCommand(sFilename As String) As String
    Dim lPos As Long
    Dim sCmd As String
    
    sCmd = VBMAKECOMMAND
    
    lPos = InStr(1, VBMAKECOMMAND, VBMAKEVBPPARAM)
    If lPos > 0 Then
        sCmd = Left$(VBMAKECOMMAND, lPos - 1) + sFilename + Mid$(VBMAKECOMMAND, lPos + Len(VBMAKEVBPPARAM))
    End If
    
    GetVBMakeCommand = sCmd
End Function

Private Sub ShowInfo()
    frmInfo.Show vbModal
End Sub
