VERSION 5.00
Begin VB.Form Form2_Sum 
   Caption         =   "Form1"
   ClientHeight    =   5325
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   10365
   LinkTopic       =   "Form1"
   ScaleHeight     =   5325
   ScaleWidth      =   10365
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Calculate Sum"
      Height          =   495
      Left            =   2880
      TabIndex        =   6
      Top             =   3960
      Width           =   1695
   End
   Begin VB.TextBox Text3 
      Height          =   735
      Left            =   2520
      TabIndex        =   5
      Top             =   2880
      Width           =   2775
   End
   Begin VB.TextBox Text2 
      Height          =   735
      Left            =   2520
      TabIndex        =   3
      Top             =   1800
      Width           =   2415
   End
   Begin VB.TextBox Text1 
      Height          =   615
      Left            =   2520
      TabIndex        =   1
      Top             =   960
      Width           =   2295
   End
   Begin VB.Label Label3 
      Caption         =   "Value 3"
      Height          =   615
      Left            =   1320
      TabIndex        =   4
      Top             =   3000
      Width           =   855
   End
   Begin VB.Label Label2 
      Caption         =   "Value 2"
      Height          =   615
      Left            =   1200
      TabIndex        =   2
      Top             =   1800
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "Value 1"
      Height          =   375
      Left            =   1320
      TabIndex        =   0
      Top             =   1080
      Width           =   975
   End
End
Attribute VB_Name = "Form2_Sum"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Text3.Text = Val(Text1.Text) + Val(Text2.Text)
End Sub

