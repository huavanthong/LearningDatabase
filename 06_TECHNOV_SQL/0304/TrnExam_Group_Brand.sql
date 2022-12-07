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
