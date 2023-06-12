VERSION 5.00
Begin VB.Form Form4_SearchStudent 
   Caption         =   "StudentRecord"
   ClientHeight    =   7335
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   11160
   LinkTopic       =   "Form3"
   ScaleHeight     =   7335
   ScaleWidth      =   11160
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Details 
      Caption         =   "Detail"
      Height          =   7455
      Left            =   2520
      TabIndex        =   0
      Top             =   120
      Width           =   9135
      Begin VB.CommandButton StudentRecord 
         Caption         =   "Submit"
         Height          =   375
         Left            =   3840
         TabIndex        =   14
         Top             =   6240
         Width           =   1215
      End
      Begin VB.ComboBox Combo1 
         Height          =   315
         Left            =   2520
         TabIndex        =   13
         Text            =   "Combo1"
         Top             =   5520
         Width           =   2535
      End
      Begin VB.TextBox Text4 
         Height          =   735
         Left            =   2520
         TabIndex        =   11
         Top             =   4560
         Width           =   2415
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Female"
         Height          =   435
         Left            =   3840
         TabIndex        =   9
         Top             =   3840
         Width           =   1095
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Male"
         Height          =   435
         Left            =   2520
         TabIndex        =   8
         Top             =   3840
         Width           =   1335
      End
      Begin VB.TextBox Text3 
         Height          =   855
         Left            =   2520
         TabIndex        =   6
         Top             =   2640
         Width           =   2415
      End
      Begin VB.TextBox Text2 
         Height          =   855
         Left            =   2520
         TabIndex        =   4
         Top             =   1440
         Width           =   2415
      End
      Begin VB.TextBox Text1 
         Height          =   855
         Left            =   2520
         TabIndex        =   2
         Top             =   360
         Width           =   2415
      End
      Begin VB.Label Label6 
         Caption         =   "City"
         Height          =   255
         Left            =   480
         TabIndex        =   12
         Top             =   5640
         Width           =   615
      End
      Begin VB.Label Label5 
         Caption         =   "Contact"
         Height          =   495
         Left            =   480
         TabIndex        =   10
         Top             =   4680
         Width           =   1335
      End
      Begin VB.Label Label4 
         Caption         =   "Gender"
         Height          =   375
         Left            =   480
         TabIndex        =   7
         Top             =   3840
         Width           =   1215
      End
      Begin VB.Label Label3 
         Caption         =   "Father's Name"
         Height          =   495
         Left            =   480
         TabIndex        =   5
         Top             =   2760
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "Name"
         Height          =   375
         Left            =   600
         TabIndex        =   3
         Top             =   1680
         Width           =   975
      End
      Begin VB.Label Label1 
         Caption         =   "Roll no"
         Height          =   375
         Left            =   600
         TabIndex        =   1
         Top             =   600
         Width           =   1215
      End
   End
End
Attribute VB_Name = "Form4_SearchStudent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim db As Database
Dim rs As Recordset

Private Sub Form_Load()
Combo1.AddItem "Da Lat"
Combo1.AddItem "Ho Chi Minh"
Combo1.AddItem "Ha Noi"
Combo1.AddItem "Nha Trang"

Text1.Text = ""
Text2.Text = ""
Text3.Text = ""
Text4.Text = ""

Combo1.Text = "Select"

End Sub

Private Sub SearchStudent_Click()
    Set db = OpenDatabase("C:\Users\huava\OneDrive\Desktop\Sample\studentDB.mdb")
    Set rs = OpenRecordset("select * from student10 where rollno = " + Str(k))
    
    If rs.EOF() Then
        MsgBox ("Record not found")
    Else
        MsgBox ("Record found: click ok for show Record")
        Text1.Enabled = False
        Text2.Enabled = False
        Text3.Enabled = False
        Combo1.Enabled = False
        Option1.Enabled = False
        Option2.Enabled = False
        Text4.Enabled = False
        Text2.Text = rs.Fields(1).Value
        Text3.Text = rs.Fields(2).Value
        
        If rs.Fields(3).Value = "male" Then
            Option1.Value = True
        End If
        
        If rs.Fields(3).Value = "female" Then
            Option2.Value = True
        End If
    
        Text4.Text = rs.Fields(4).Value
        
        Combo1.Text = rs.Fields(5).Value
        
        End If
End Sub

