

---------------------- Case 1 ---------------------------------------
Select
    E.ExamSeq,
    E.ExamYmd,
    E.ReceiptKbn,
    E.PersonCd,
    E.PersonNm,
    E.UnionCd,
    E.UnionBrCd,
    E.UnionOfCd,
    case When isnull(MO.UnionCd,'') <> '' Then  MO.UnionOfNm
         When isnull(MB.UnionCd,'') <> '' Then  MB.UnionBrNm 
         Else MU.UnionNm End as UnionNm,
    case When isnull(MO.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MO.Address1,'') + ' ' + ISNULL(MO.Address2,''))
         When isnull(MB.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MB.Address1,'') + ' ' + ISNULL(MB.Address2,''))
         Else Convert(Varchar(71),ISNULL(MU.Address1,'') + ' ' + ISNULL(MU.Address2,'')) End As UnionAddress,
    E.CourseCd,
    E.RankCd
From
    TrnExam As E
Left Join
    MstUnion As MU
On
    E.UnionCd = MU.UnionCd
Left Join
    MstUnionBr As MB
On
    E.UnionCd = MB.UnionCd And E.UnionBrCd = MB.UnionBrCd
Left Join
    MstUnionOf As MO
On
    E.UnionCd = MO.UnionCd And E.UnionBrCd = MO.UnionBrCd And E.UnionofCd = Mo.UnionofCd
Where
    E.ReceiptKbn = N'3'
    And E.ExamYmd >= '2020/12/05'
    And E.ExamYmd <= '2022/12/07'
    And E.CourseCd >=N'000001'
    And E.CourseCd <=N'000010'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') >= N'00000001000001000001'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') <= N'00000010000010000010'
   And InsureCardKbn = N'1'
Order By
    E.UnionCd,E.UnionBrCd,E.UnionOfCd,E.ExamYmd

---------------------- Case 2: Choose CourseId only ---------------------------------------
Select
    E.ExamSeq,
    E.ExamYmd,
    E.ReceiptKbn,
    E.PersonCd,
    E.PersonNm,
    E.UnionCd,
    E.UnionBrCd,
    E.UnionOfCd,
    case When isnull(MO.UnionCd,'') <> '' Then  MO.UnionOfNm
         When isnull(MB.UnionCd,'') <> '' Then  MB.UnionBrNm 
         Else MU.UnionNm End as UnionNm,
    case When isnull(MO.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MO.Address1,'') + ' ' + ISNULL(MO.Address2,''))
         When isnull(MB.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MB.Address1,'') + ' ' + ISNULL(MB.Address2,''))
         Else Convert(Varchar(71),ISNULL(MU.Address1,'') + ' ' + ISNULL(MU.Address2,'')) End As UnionAddress,
    E.CourseCd,
    E.RankCd
From
    TrnExam As E
Left Join
    MstUnion As MU
On
    E.UnionCd = MU.UnionCd
Left Join
    MstUnionBr As MB
On
    E.UnionCd = MB.UnionCd And E.UnionBrCd = MB.UnionBrCd
Left Join
    MstUnionOf As MO
On
    E.UnionCd = MO.UnionCd And E.UnionBrCd = MO.UnionBrCd And E.UnionofCd = Mo.UnionofCd
Where
    E.ReceiptKbn = N'3'
    And E.ExamYmd >= '2020/12/07'
    And E.ExamYmd <= '2022/12/07'
    And E.CourseCd >=N'000001'
    And E.CourseCd <=N'000010'
Order By
    E.UnionCd,E.UnionBrCd,E.UnionOfCd,E.ExamYmd

-------------------------Case 3: Choose CourseId, Group only------------------------------------

Select
    E.ExamSeq,
    E.ExamYmd,
    E.ReceiptKbn,
    E.PersonCd,
    E.PersonNm,
    E.UnionCd,
    E.UnionBrCd,
    E.UnionOfCd,
    case When isnull(MO.UnionCd,'') <> '' Then  MO.UnionOfNm
         When isnull(MB.UnionCd,'') <> '' Then  MB.UnionBrNm 
         Else MU.UnionNm End as UnionNm,
    case When isnull(MO.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MO.Address1,'') + ' ' + ISNULL(MO.Address2,''))
         When isnull(MB.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MB.Address1,'') + ' ' + ISNULL(MB.Address2,''))
         Else Convert(Varchar(71),ISNULL(MU.Address1,'') + ' ' + ISNULL(MU.Address2,'')) End As UnionAddress,
    E.CourseCd,
    E.RankCd
From
    TrnExam As E
Left Join
    MstUnion As MU
On
    E.UnionCd = MU.UnionCd
Left Join
    MstUnionBr As MB
On
    E.UnionCd = MB.UnionCd And E.UnionBrCd = MB.UnionBrCd
Left Join
    MstUnionOf As MO
On
    E.UnionCd = MO.UnionCd And E.UnionBrCd = MO.UnionBrCd And E.UnionofCd = Mo.UnionofCd
Where
    E.ReceiptKbn = N'3'
    And E.ExamYmd >= '2020/12/07'
    And E.ExamYmd <= '2022/12/07'
    And E.CourseCd >=N'000001'
    And E.CourseCd <=N'000010'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') >= N'00000001000000000000'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') <= N'00000010999999999999'
Order By
    E.UnionCd,E.UnionBrCd,E.UnionOfCd,E.ExamYmd

-------------------------Case 4: Choose CourseId, Group, GroupBrand only------------------------------------
Select
    E.ExamSeq,
    E.ExamYmd,
    E.ReceiptKbn,
    E.PersonCd,
    E.PersonNm,
    E.UnionCd,
    E.UnionBrCd,
    E.UnionOfCd,
    case When isnull(MO.UnionCd,'') <> '' Then  MO.UnionOfNm
         When isnull(MB.UnionCd,'') <> '' Then  MB.UnionBrNm 
         Else MU.UnionNm End as UnionNm,
    case When isnull(MO.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MO.Address1,'') + ' ' + ISNULL(MO.Address2,''))
         When isnull(MB.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MB.Address1,'') + ' ' + ISNULL(MB.Address2,''))
         Else Convert(Varchar(71),ISNULL(MU.Address1,'') + ' ' + ISNULL(MU.Address2,'')) End As UnionAddress,
    E.CourseCd,
    E.RankCd
From
    TrnExam As E
Left Join
    MstUnion As MU
On
    E.UnionCd = MU.UnionCd
Left Join
    MstUnionBr As MB
On
    E.UnionCd = MB.UnionCd And E.UnionBrCd = MB.UnionBrCd
Left Join
    MstUnionOf As MO
On
    E.UnionCd = MO.UnionCd And E.UnionBrCd = MO.UnionBrCd And E.UnionofCd = Mo.UnionofCd
Where
    E.ReceiptKbn = N'3'
    And E.ExamYmd >= '2020/12/07'
    And E.ExamYmd <= '2022/12/07'
    And E.CourseCd >=N'000001'
    And E.CourseCd <=N'000010'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') >= N'00000001000001000000'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') <= N'00000010000010999999'
Order By
    E.UnionCd,E.UnionBrCd,E.UnionOfCd,E.ExamYmd


-------------------------Case 5: Choose Group ------------------------------------
Select
    E.ExamSeq,
    E.ExamYmd,
    E.ReceiptKbn,
    E.PersonCd,
    E.PersonNm,
    E.UnionCd,
    E.UnionBrCd,
    E.UnionOfCd,
    case When isnull(MO.UnionCd,'') <> '' Then  MO.UnionOfNm
         When isnull(MB.UnionCd,'') <> '' Then  MB.UnionBrNm 
         Else MU.UnionNm End as UnionNm,
    case When isnull(MO.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MO.Address1,'') + ' ' + ISNULL(MO.Address2,''))
         When isnull(MB.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MB.Address1,'') + ' ' + ISNULL(MB.Address2,''))
         Else Convert(Varchar(71),ISNULL(MU.Address1,'') + ' ' + ISNULL(MU.Address2,'')) End As UnionAddress,
    E.CourseCd,
    E.RankCd
From
    TrnExam As E
Left Join
    MstUnion As MU
On
    E.UnionCd = MU.UnionCd
Left Join
    MstUnionBr As MB
On
    E.UnionCd = MB.UnionCd And E.UnionBrCd = MB.UnionBrCd
Left Join
    MstUnionOf As MO
On
    E.UnionCd = MO.UnionCd And E.UnionBrCd = MO.UnionBrCd And E.UnionofCd = Mo.UnionofCd
Where
    E.ReceiptKbn = N'3'
    And E.ExamYmd >= '2020/12/07'
    And E.ExamYmd <= '2022/12/07'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') >= N'00000001000000000000'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') <= N'00000010999999999999'
Order By
    E.UnionCd,E.UnionBrCd,E.UnionOfCd,E.ExamYmd

-------------------------Case 6: Choose Group only and fill one data ------------------------------------

Select
    E.ExamSeq,
    E.ExamYmd,
    E.ReceiptKbn,
    E.PersonCd,
    E.PersonNm,
    E.UnionCd,
    E.UnionBrCd,
    E.UnionOfCd,
    case When isnull(MO.UnionCd,'') <> '' Then  MO.UnionOfNm
         When isnull(MB.UnionCd,'') <> '' Then  MB.UnionBrNm 
         Else MU.UnionNm End as UnionNm,
    case When isnull(MO.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MO.Address1,'') + ' ' + ISNULL(MO.Address2,''))
         When isnull(MB.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MB.Address1,'') + ' ' + ISNULL(MB.Address2,''))
         Else Convert(Varchar(71),ISNULL(MU.Address1,'') + ' ' + ISNULL(MU.Address2,'')) End As UnionAddress,
    E.CourseCd,
    E.RankCd
From
    TrnExam As E
Left Join
    MstUnion As MU
On
    E.UnionCd = MU.UnionCd
Left Join
    MstUnionBr As MB
On
    E.UnionCd = MB.UnionCd And E.UnionBrCd = MB.UnionBrCd
Left Join
    MstUnionOf As MO
On
    E.UnionCd = MO.UnionCd And E.UnionBrCd = MO.UnionBrCd And E.UnionofCd = Mo.UnionofCd
Where
    E.ReceiptKbn = N'3'
    And E.ExamYmd >= '2020/12/07'
    And E.ExamYmd <= '2022/12/07'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') >= N'00000001000000000000'
Order By
    E.UnionCd,E.UnionBrCd,E.UnionOfCd,E.ExamYmd

-------------------------Case 7: Choose Group only and fill two data ------------------------------------
+		sbSql	{Select
    E.ExamSeq,
    E.ExamYmd,
    E.ReceiptKbn,
    E.PersonCd,
    E.PersonNm,
    E.UnionCd,
    E.UnionBrCd,
    E.UnionOfCd,
    case When isnull(MO.UnionCd,'') <> '' Then  MO.UnionOfNm
         When isnull(MB.UnionCd,'') <> '' Then  MB.UnionBrNm 
         Else MU.UnionNm End as UnionNm,
    case When isnull(MO.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MO.Address1,'') + ' ' + ISNULL(MO.Address2,''))
         When isnull(MB.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MB.Address1,'') + ' ' + ISNULL(MB.Address2,''))
         Else Convert(Varchar(71),ISNULL(MU.Address1,'') + ' ' + ISNULL(MU.Address2,'')) End As UnionAddress,
    E.CourseCd,
    E.RankCd
From
    TrnExam As E
Left Join
    MstUnion As MU
On
    E.UnionCd = MU.UnionCd
Left Join
    MstUnionBr As MB
On
    E.UnionCd = MB.UnionCd And E.UnionBrCd = MB.UnionBrCd
Left Join
    MstUnionOf As MO
On
    E.UnionCd = MO.UnionCd And E.UnionBrCd = MO.UnionBrCd And E.UnionofCd = Mo.UnionofCd
Where
    E.ReceiptKbn = N'3'
    And E.ExamYmd >= '2020/12/07'
    And E.ExamYmd <= '2022/12/07'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') >= N'00000001000000000000'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') <= N'00000010999999999999'
Order By
    E.UnionCd,E.UnionBrCd,E.UnionOfCd,E.ExamYmd
}	System.Text.StringBuilder

-------------------------Case 8: Choose Group only and fill data one but wrong data ------------------------------------
Select
    E.ExamSeq,
    E.ExamYmd,
    E.ReceiptKbn,
    E.PersonCd,
    E.PersonNm,
    E.UnionCd,
    E.UnionBrCd,
    E.UnionOfCd,
    case When isnull(MO.UnionCd,'') <> '' Then  MO.UnionOfNm
         When isnull(MB.UnionCd,'') <> '' Then  MB.UnionBrNm 
         Else MU.UnionNm End as UnionNm,
    case When isnull(MO.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MO.Address1,'') + ' ' + ISNULL(MO.Address2,''))
         When isnull(MB.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MB.Address1,'') + ' ' + ISNULL(MB.Address2,''))
         Else Convert(Varchar(71),ISNULL(MU.Address1,'') + ' ' + ISNULL(MU.Address2,'')) End As UnionAddress,
    E.CourseCd,
    E.RankCd
From
    TrnExam As E
Left Join
    MstUnion As MU
On
    E.UnionCd = MU.UnionCd
Left Join
    MstUnionBr As MB
On
    E.UnionCd = MB.UnionCd And E.UnionBrCd = MB.UnionBrCd
Left Join
    MstUnionOf As MO
On
    E.UnionCd = MO.UnionCd And E.UnionBrCd = MO.UnionBrCd And E.UnionofCd = Mo.UnionofCd
Where
    E.ReceiptKbn = N'3'
    And E.ExamYmd >= '2020/12/07'
    And E.ExamYmd <= '2022/12/07'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') >= N'00000004000000000000'
Order By
    E.UnionCd,E.UnionBrCd,E.UnionOfCd,E.ExamYmd




select * from TrnExam
select * from MstUnion



select * from MstUnionBr

select * from MstUnionOf




select 
	MU.UnionNm AS OfficeNm,
	CONCAT(MU.Address1, ' ' , MU.Address2) AS OfficeLn
from 
	MstUnion AS MU 
where
	MU.UnionCd = 1

 
select 
	ME.UnionBrNm,
	ME.Address1
from 
	MstUnionBr AS ME 
where
	ME.UnionCd = 1
	AND ME.UnionBrCd = 1




select 
	ME.UnionOfNm,
	ME.Address1
from 
	MstUnionOf AS ME 
where
	ME.UnionCd = 1
	AND ME.UnionBrCd = 1
	AND ME.UnionOfCd = 1

select 
	MU.UnionNm AS OfficeNm,
	CONCAT(MU.Address1, ' ' , MU.Address2) AS OfficeLn
from 
	MstUnion AS MU 
inner join 
	MstUnionBr AS ME
ON	
	MU.UnionCd = ME.UnionCd
	AND ME.UnionBrCd = 1

Select
    MU.UnionNm AS OfficeNm,
    CONCAT(MU.Address1, ' ' , MU.Address2) AS OfficeLn
From
    MstUnion As MU
Where
    MU.UnionCd = N'00000001'



Select
    E.ExamSeq,
    E.ExamYmd,
    E.ReceiptKbn,
    E.PersonCd,
    E.PersonNm,
    E.UnionCd,
    E.UnionBrCd,
    E.UnionOfCd,
    case When isnull(MO.UnionCd,'') <> '' Then  MO.UnionOfNm
         When isnull(MB.UnionCd,'') <> '' Then  MB.UnionBrNm 
         Else MU.UnionNm End as UnionNm,
    case When isnull(MO.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MO.Address1,'') + ' ' + ISNULL(MO.Address2,''))
         When isnull(MB.UnionCd,'') <> '' Then  Convert(Varchar(71),ISNULL(MB.Address1,'') + ' ' + ISNULL(MB.Address2,''))
         Else Convert(Varchar(71),ISNULL(MU.Address1,'') + ' ' + ISNULL(MU.Address2,'')) End As UnionAddress,
    E.CourseCd,
    E.RankCd
From
    TrnExam As E
Left Join
    MstUnion As MU
On
    E.UnionCd = MU.UnionCd
Left Join
    MstUnionBr As MB
On
    E.UnionCd = MB.UnionCd And E.UnionBrCd = MB.UnionBrCd
Left Join
    MstUnionOf As MO
On
    E.UnionCd = MO.UnionCd And E.UnionBrCd = MO.UnionBrCd And E.UnionofCd = Mo.UnionofCd
Where
    E.ReceiptKbn = N'3'
    And E.ExamYmd >= '2020/12/06'
    And E.ExamYmd <= '2022/12/06'
    And E.UnionCd
    + Isnull(E.UnionBrCd,'000000')
    + Isnull(E.UnionOfCd,'000000') >= N'00000001000001000002'
Order By
    E.UnionCd,E.UnionBrCd,E.UnionOfCd,E.ExamYmd

