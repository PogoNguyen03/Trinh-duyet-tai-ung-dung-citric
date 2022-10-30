alter table UNGDUNG
add NgayCapNhat smalldatetime

delete from UNGDUNG
where MaUngDung = 1

alter table UNGDUNG
drop HinhMinhHoa

Set identity_insert [dbo].[UNGDUNG] on
Insert [dbo].[UNGDUNG]([MaUngDung],[TenUngDung],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[HinhMinhHoa],[NgayCapNhat])
values (1,N'SUPRALAND SIX INCHES UNDER',
		N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland.
Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người.
Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm.
Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng).
Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://bluemediafiles.homes/url-generator.php?url=KH1TK0eBXmDmljELeo4C+FFvmgHJbc++7psPlN6tioiOAlqFJyJr1Da7TS+/2OydxBiEj9qrLmBRlalrpjeVwHAr6vqfd6J7bAs53bHlBmY=',1,1,N'nền ứng dụng 1.jpg',CAST(0x95220000 AS SmallDateTime))
Set identity_insert [dbo].[UNGDUNG] off

Set identity_insert [dbo].[NHAPHATHANH] on
Insert [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH])
values (1,N'Supra Games UG')
Set identity_insert [dbo].[NHAPHATHANH] off




Set identity_insert [dbo].[THELOAI] on
insert [dbo].[THELOAI] ([MaTheLoai],[TenTheLoai])
values (1,N'Game Góc Nhìn Thứ Nhất')
Set identity_insert [dbo].[THELOAI] off


select * from UNGDUNG

Set identity_insert [dbo].[UNGDUNG] on
Insert [dbo].[UNGDUNG]([MaUngDung],[TenUngDung],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[HinhMinhHoa],[NgayCapNhat])
values (2,N'THE KING OF FIGHTERS XV',
		N'“Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://hadoantv.com/download?kind=old&url=https%3A%2F%2Fanotepad.com%2Fnotes%2Fx4asr7ek',1,1,N'ứng dụng 1.1.jpg',30/10/2022)
Set identity_insert [dbo].[UNGDUNG] off

