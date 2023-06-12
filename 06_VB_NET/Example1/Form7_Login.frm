VERSION 5.00
Begin VB.Form Form7_Login 
   Caption         =   "Form3"
   ClientHeight    =   5640
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   10590
   LinkTopic       =   "Form3"
   ScaleHeight     =   5640
   ScaleWidth      =   10590
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Login"
      Height          =   4095
      Left            =   840
      TabIndex        =   0
      Top             =   480
      Width           =   7455
      Begin VB.CommandButton Command1 
         BackColor       =   &H8000000E&
         Caption         =   "Submit"
         Height          =   495
         Left            =   2160
         TabIndex        =   5
         Top             =   2160
         Width           =   1335
      End
      Begin VB.TextBox Text2 
         Height          =   495
         Left            =   1680
         TabIndex        =   4
         Top             =   1200
         Width           =   2775
      End
      Begin VB.TextBox Text1 
         Height          =   495
         Left            =   1680
         TabIndex        =   2
         Top             =   360
         Width           =   2775
      End
      Begin VB.Label Label1 
         Caption         =   "Password"
         Height          =   495
         Left            =   600
         TabIndex        =   3
         Top             =   1320
         Width           =   735
      End
      Begin VB.Label Login 
         Caption         =   "User Id"
         Height          =   495
         Left            =   600
         TabIndex        =   1
         Top             =   480
         Width           =   1095
      End
   End
End
Attribute VB_Name = "Form7_Login"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim db As Database
Dim rs As Recordset
Dim flag As Boolean
Dim userid, pass As String


Private Sub Login_Click()
    userid = Trim(Text1.Text)
    pass = Trim(Text2.Text)
    Set db = OpenDatabase("C:\01_Work\01_Programming\VisualBasic\Sample\myaccount.mdb")
    Set rs = db.OpenRecordset("select * from mytable")
    
    Do While rs.EOF <> True
    If rs.Fields(0).Value = userid And rs.Fields(1).Value = pass Then
        flag = True
    End If
    
    rs.MoveNext
    Loop
    
    If flag = True Then
        MsgBox ("Password Accept")
        Form2.Show
        Form1.Hide
    Else
        Text1.Text = ""
        Text2.Text = ""
        MsgBox ("Password or User Id not match")
        Text1.SetFocus
    End If
    
End Sub
