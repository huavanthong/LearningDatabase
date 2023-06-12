VERSION 5.00
Begin VB.Form Form1_Display 
   Caption         =   "Display"
   ClientHeight    =   3015
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   8370
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   3015
   ScaleWidth      =   8370
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Display"
      Height          =   375
      Left            =   2640
      TabIndex        =   2
      Top             =   960
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   2160
      TabIndex        =   1
      Top             =   480
      Width           =   2055
   End
   Begin VB.Label Form2 
      BackColor       =   &H8000000A&
      Caption         =   "Display"
      Height          =   255
      Left            =   720
      TabIndex        =   0
      Top             =   480
      Width           =   1215
   End
End
Attribute VB_Name = "Form1_Display"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Display_Click()

End Sub

Private Sub Command1_Click()
Text1.Text = "Hello World"
End Sub

