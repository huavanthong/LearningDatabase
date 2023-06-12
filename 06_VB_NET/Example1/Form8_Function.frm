VERSION 5.00
Begin VB.Form Form8_Function 
   Caption         =   "Form3"
   ClientHeight    =   5025
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   11115
   LinkTopic       =   "Form3"
   ScaleHeight     =   5025
   ScaleWidth      =   11115
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Frame1"
      Height          =   3855
      Left            =   1440
      TabIndex        =   0
      Top             =   360
      Width           =   7095
      Begin VB.CommandButton Command1 
         Caption         =   "Compute"
         Height          =   375
         Left            =   3480
         TabIndex        =   5
         Top             =   2520
         Width           =   1695
      End
      Begin VB.TextBox Text2 
         Height          =   495
         Left            =   2280
         TabIndex        =   4
         Top             =   1440
         Width           =   2895
      End
      Begin VB.TextBox Text1 
         Height          =   375
         Left            =   2280
         TabIndex        =   2
         Top             =   600
         Width           =   2775
      End
      Begin VB.Label Label2 
         Caption         =   "Result"
         Height          =   495
         Left            =   960
         TabIndex        =   3
         Top             =   1560
         Width           =   735
      End
      Begin VB.Label Label1 
         Caption         =   "Enter the First Value"
         Height          =   375
         Left            =   480
         TabIndex        =   1
         Top             =   720
         Width           =   1455
      End
   End
End
Attribute VB_Name = "Form8_Function"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Text2.Text = factorial(Val(Text1.Text))
End Sub

Public Function factorial(a As Integer) As Long
    Dim i As Integer
    Dim temp As Long
    factorial = 1
    
    For i = 1 To a
        temp = temp + factorial * i
        Next
    factorial = temp
End Function

Private Sub Form_Load()

End Sub
