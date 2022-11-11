use CitricStore
Go

--TẠO BẢNG
Create table NHAPHATHANH
(
	MaNPH int Identity(1,1),
	TenNPH nvarchar(70) not null,
	constraint PK_NHAPHATHANH primary key (MaNPH)
)

 Create table THELOAI
 (
	MaTheLoai int identity(1,1),
	TenTheLoai nvarchar(50),
	constraint PK_THELOAI primary key (MaTheLoai)
 )

Create table THELOAIGAME
(
	MaTheLoaiGame int identity(1,1),
	TenTheLoai nvarchar(50),
	constraint PK_THELOAIGAME primary key (MaTheLoaiGame)
)

Create table THELOAIAPP
(
	MaTheLoaiApp int identity(1,1),
	TenTheLoai nvarchar(50),
	constraint PK_THELOAIAPP primary key (MaTheLoaiApp)
)

select * from app

Create table APP
(
	MaApp int Identity(1,1),
	TenApp nvarchar(100) not null,
	GioiThieu ntext,
	DungLuong nvarchar(10),
	NgonNgu nvarchar(50),
	HeDieuHanh nvarchar(50),
	LinkTai ntext,
	MaTheLoaiApp int,
	MaNPH int,
	MaHDH int,
	MaNgonNgu int,
	NgayCapNhat datetime,
	DanhGia nvarchar(5),
	HinhNen nvarchar(30),
	HinhCT1 nvarchar(30),
	HinhCT2 nvarchar(30),
	HinhCT3 nvarchar(30),
	HinhCT4 nvarchar(30),
	constraint PK_APP primary key (MaApp)
)
Create table SEARCHALL
(
	MaSearch int Identity(1,1),
	TenSearch nvarchar(100) not null,
	GioiThieu ntext,
	DungLuong nvarchar(10),
	NgonNgu nvarchar(50),
	HeDieuHanh nvarchar(50),
	LinkTai ntext,
	MaNPH int,
	MaHDH int,
	MaNgonNgu int,
	NgayCapNhat datetime,
	DanhGia nvarchar(5),
	HinhNen nvarchar(30),
	HinhCT1 nvarchar(30),
	HinhCT2 nvarchar(30),
	HinhCT3 nvarchar(30),
	HinhCT4 nvarchar(30),
	constraint PK_All primary key (MaSearch)
)
Create table GAME
(
	MaGame int Identity(1,1),
	TenGame nvarchar(100) not null,
	GioiThieu ntext,
	DungLuong nvarchar(10),
	NgonNgu nvarchar(50),
	HeDieuHanh nvarchar(50),
	LinkTai ntext,
	MaTheLoaiGame int,
	MaNPH int,
	MaHDH int,
	MaNgonNgu int,
	NgayCapNhat datetime,
	DanhGia nvarchar(5),
	HinhNen nvarchar(30),
	HinhCT1 nvarchar(30),
	HinhCT2 nvarchar(30),
	HinhCT3 nvarchar(30),
	HinhCT4 nvarchar(30),
	constraint PK_Game primary key (MaGame)
)

 Create table KHACHHANG
 (
	MaKH INT IDENTITY(1,1),
	HoTenKH nVarchar(50) NOT NULL,
	DienthoaiKH Varchar(10),
	TenDN Varchar(15) UNIQUE,
	Matkhau Varchar(15) NOT NULL,
	Ngaysinh SMALLDATETIME,
	GioiTinh nvarchar(3),
	Email Varchar(50) UNIQUE,
	Daduyet Bit Default 0,
	CONSTRAINT PK_KHACHHANG PRIMARY KEY(MaKH)
 )

 Create table HEDIEUHANH
(
	MaHDH	int identity(1,1),
	TenHDH	nvarchar(50),
	constraint PK_HEDIEUHANH primary key (MaHDH)
)

 Create table NGONNGU
(
	MaNgonNgu	int identity(1,1),
	TenNgonNgu	nvarchar(70),
	constraint PK_NGONNGU primary key (MaNgonNgu)
)

 --KHOÁ NGOẠI
 Alter table APP add constraint FK_APP_NHAPHATHANH
					 foreign key (MaNPH)
					 references NHAPHATHANH (MaNPH) 
 Alter table APP add constraint FK_APP_THELOAIAPP
					 foreign key (MaTheLoaiApp)
					 references THELOAIAPP (MaTheLoaiApp) 
 Alter table APP add constraint FK_APP_NGONNGU
					 foreign key (MaNgonNgu)
					 references NGONNGU (MaNgonNgu) 
 Alter table APP add constraint FK_APP_HEDIEUHANH
					 foreign key (MaHDH)
					 references HEDIEUHANH (MaHDH) 

 Alter table GAME add constraint FK_GAME_NHAPHATHANH
					 foreign key (MaNPH)
					 references NHAPHATHANH (MaNPH) 
 Alter table GAME add constraint FK_GAME_THELOAIGAME
					 foreign key (MaTheLoaiGame)
					 references THELOAIGAME (MaTheLoaiGame) 
 Alter table GAME add constraint FK_GAME_NGONNGU
					 foreign key (MaNgonNgu)
					 references NGONNGU (MaNgonNgu) 
 Alter table GAME add constraint FK_GAME_HEDIEUHANH
					 foreign key (MaHDH)
					 references HEDIEUHANH (MaHDH) 

 Alter table SEARCHALL add constraint FK_SEARCHALL_NHAPHATHANH
					 foreign key (MaNPH)
					 references NHAPHATHANH (MaNPH) 
 Alter table SEARCHALL add constraint FK_SEARCHALL_NGONNGU
					 foreign key (MaNgonNgu)
					 references NGONNGU (MaNgonNgu) 
 Alter table SEARCHALL add constraint FK_SEARCHALL_HEDIEUHANH
					 foreign key (MaHDH)
					 references HEDIEUHANH (MaHDH) 


-- TẠO CỘT TRONG BẢNG
alter table game
add DungLuong nvarchar(10)

-- XOÁ DÒNG TRON BẢNG
delete from NGONNGU
where MaNgonNgu = 5

Select * from HEDIEUHANH

Select * from NHAPHATHANH

Select * from NGONNGU

Select * from THELOAI

Update HEDIEUHANH
set TenHDH=N'MacOS'
where MaHDH=10

-- XOÁ CỘT TRONG BẢNG
alter table Game
drop column DungLuong

Select * from Game
-- NHẬP DỮ LIỆU
Set identity_insert [dbo].[GAME] on

Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[DungLuong],[MaHDH],[MaNgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (1,N'SUPRALAND SIX INCHES UNDER',
		N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland.
Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người.
Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm.
Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng).
Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.
',
		N'2500', 1, 1,N'https://bluemediafiles.homes/url-generator.php?url=KH1TK0eBXmDmljELeo4C+FFvmgHJbc++7psPlN6tioiOAlqFJyJr1Da7TS+/2OydxBiEj9qrLmBRlalrpjeVwHAr6vqfd6J7bAs53bHlBmY=',1,1,N'2022/10/31',N'BgGame1.jpg')

Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[DungLuong],[MaHDH],[MaNgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (2,N'THE KING OF FIGHTERS XV',
		N'“Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!
',
		N'523', 1, 1,N'https://hadoantv.com/download?kind=old&url=https%3A%2F%2Fanotepad.com%2Fnotes%2Fx4asr7ek',1,1,N'2022/10/30',N'Game1.jpg')
Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[DungLuong],[MaHDH],[MaNgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (3,N'SUPRALAND SIX INCHES UNDER',
		N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland.
Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người.
Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm.
Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng).
Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.
',
		N'1000', 2, 2,N'https://bluemediafiles.homes/url-generator.php?url=KH1TK0eBXmDmljELeo4C+FFvmgHJbc++7psPlN6tioiOAlqFJyJr1Da7TS+/2OydxBiEj9qrLmBRlalrpjeVwHAr6vqfd6J7bAs53bHlBmY=',1,1,N'2022/10/31',N'BgGame1.jpg')
		
Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[DungLuong],[MaHDH],[MaNgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (4,N'THE KING OF FIGHTERS XV',
		N'“Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!
',
		N'5600', 7, 2,N'https://hadoantv.com/download?kind=old&url=https%3A%2F%2Fanotepad.com%2Fnotes%2Fx4asr7ek',1,1,N'2022/11/04',N'Game1.jpg')
Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[DungLuong],[MaHDH],[MaNgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (5,N'SUPRALAND SIX INCHES UNDER',
		N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland.
Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người.
Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm.
Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng).
Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.
',
		N'8GB', 1, 1,N'https://bluemediafiles.homes/url-generator.php?url=KH1TK0eBXmDmljELeo4C+FFvmgHJbc++7psPlN6tioiOAlqFJyJr1Da7TS+/2OydxBiEj9qrLmBRlalrpjeVwHAr6vqfd6J7bAs53bHlBmY=',1,1,N'2022/10/31',N'BgGame1.jpg')

Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[DungLuong],[MaHDH],[MaNgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (6,N'THE KING OF FIGHTERS XV',
		N'“Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!
',
		N'1986', 1, 1,N'https://hadoantv.com/download?kind=old&url=https%3A%2F%2Fanotepad.com%2Fnotes%2Fx4asr7ek',1,1,N'2022/10/30',N'Game1.jpg')
Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[DungLuong],[MaHDH],[MaNgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (7,N'SUPRALAND SIX INCHES UNDER',
		N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland.
Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người.
Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm.
Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng).
Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.
',
		N'2689', 1, 1,N'https://bluemediafiles.homes/url-generator.php?url=KH1TK0eBXmDmljELeo4C+FFvmgHJbc++7psPlN6tioiOAlqFJyJr1Da7TS+/2OydxBiEj9qrLmBRlalrpjeVwHAr6vqfd6J7bAs53bHlBmY=',1,1,N'2022/10/31',N'BgGame1.jpg')

Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[DungLuong],[MaHDH],[MaNgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (8,N'THE KING OF FIGHTERS XV',
		N'“Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!
',
		N'1900', 1, 1,N'https://hadoantv.com/download?kind=old&url=https%3A%2F%2Fanotepad.com%2Fnotes%2Fx4asr7ek',1,1,N'2022/11/02',N'Game1.jpg')




		Select * from GAME
		Select * from hedieuhanh

Set identity_insert [dbo].[NHAPHATHANH] off

Set identity_insert [dbo].[NHAPHATHANH] on
Insert [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH])
values (1,N'Supra Games UG')
Set identity_insert [dbo].[NHAPHATHANH] off


Set identity_insert [dbo].[THELOAI] on

insert [dbo].[THELOAI] ([MaTheLoai],[TenTheLoai])
values (1,N'Góc Nhìn Thứ Nhất')
insert [dbo].[THELOAI] ([MaTheLoai],[TenTheLoai])
values (2,N'Hành Động')

Set identity_insert [dbo].[THELOAI] off


Set identity_insert [dbo].[NGONNGU] on

insert [dbo].[NGONNGU] ([MaNgonNgu],[TenNgonNgu])
values (1,N'Tiếng Việt')
insert [dbo].[NGONNGU] ([MaNgonNgu],[TenNgonNgu])
values (2,N'Tiếng Anh')

Set identity_insert [dbo].[NGONNGU] off

Set identity_insert [dbo].[HEDIEUHANH] on

insert [dbo].[HEDIEUHANH] ([MaHDH],[TenHDH])
values (1,N'Windows')
insert [dbo].[HEDIEUHANH] ([MaHDH],[TenHDH])
values (2,N'Android')

Set identity_insert [dbo].[HEDIEUHANH] off


select * from NHAPHATHANH
select * from THELOAI
select * from HEDIEUHANH



Update GAME
set DanhGia = 3
where MaGame = 8

Set identity_insert [dbo].[KHACHHANG] off
Insert [dbo].[APP]([MaApp],[TenApp],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[DanhGia],[HinhNen])
values (1,N'FACEBOOK',
		N'Facebook là một phương tiện truyền thông xã hội và dịch vụ mạng xã hội trực tuyến thành lập vào năm 2004 của Mỹ thuộc sở hữu của Meta Platforms có trụ sở tại Menlo Park, California. Nó được Mark Zuckerberg, cùng với các sinh viên Đại học Harvard và bạn cùng phòng là Eduardo Saverin, Andrew McCollum, Dustin Moskovitz, Chris Hughes sáng lập.
Facebook là một mạng xã hội giúp cho chúng ta có thể kết nối với nhau qua một tài khoản ảo. 
Trên Facebook chúng ta có thể đăng trạng thái, hình ảnh, video và chia sẻ tất cả những gì mà bạn muốn. 
Không những vậy, chúng ta còn có thể kết bạn với những người dùng khác từ khắp nơi trên thế giới và tương tác với những họ qua các tương tác (reation) và bình luận (comment). 
Với những người dùng Facebook chuyên nghiệp thì họ tận dụng Facebook để bán hàng, quảng cáo sản phẩm rất hiệu quả 
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://download.com.vn/facebook-cho-windows-10-98824',1,1,31/10/2022,5,N'BgApp1.jpg')

Insert [dbo].[APP]([MaApp],[TenApp],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[DanhGia],[HinhNen])
values (2,N'INSTAGRAM',
		N'+	Kết nối với bạn bè, chia sẻ những gì bạn đang làm hoặc xem những gì mới từ những người khác trên khắp thế giới. Khám phá cộng đồng của chúng tôi, nơi bạn có thể thoải mái là chính mình và chia sẻ mọi thứ, từ những khoảnh khắc hàng ngày đến những điểm nổi bật trong cuộc sống..',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://play.google.com/store/apps/details?id=com.instagram.android&hl=vi&gl=US',1,1,31/10/2022,4.5,N'BgApp1.jpg')
Insert [dbo].[APP]([MaApp],[TenApp],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[DanhGia],[HinhNen])
values (3,N'FACEBOOK',
		N'Facebook là một phương tiện truyền thông xã hội và dịch vụ mạng xã hội trực tuyến thành lập vào năm 2004 của Mỹ thuộc sở hữu của Meta Platforms có trụ sở tại Menlo Park, California. Nó được Mark Zuckerberg, cùng với các sinh viên Đại học Harvard và bạn cùng phòng là Eduardo Saverin, Andrew McCollum, Dustin Moskovitz, Chris Hughes sáng lập.
Facebook là một mạng xã hội giúp cho chúng ta có thể kết nối với nhau qua một tài khoản ảo. 
Trên Facebook chúng ta có thể đăng trạng thái, hình ảnh, video và chia sẻ tất cả những gì mà bạn muốn. 
Không những vậy, chúng ta còn có thể kết bạn với những người dùng khác từ khắp nơi trên thế giới và tương tác với những họ qua các tương tác (reation) và bình luận (comment). 
Với những người dùng Facebook chuyên nghiệp thì họ tận dụng Facebook để bán hàng, quảng cáo sản phẩm rất hiệu quả 
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://download.com.vn/facebook-cho-windows-10-98824',1,1,31/10/2022,5,N'BgApp1.jpg')

Insert [dbo].[APP]([MaApp],[TenApp],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[DanhGia],[HinhNen])
values (4,N'INSTAGRAM',
		N'+	Kết nối với bạn bè, chia sẻ những gì bạn đang làm hoặc xem những gì mới từ những người khác trên khắp thế giới. Khám phá cộng đồng của chúng tôi, nơi bạn có thể thoải mái là chính mình và chia sẻ mọi thứ, từ những khoảnh khắc hàng ngày đến những điểm nổi bật trong cuộc sống..',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://play.google.com/store/apps/details?id=com.instagram.android&hl=vi&gl=US',1,1,31/10/2022,4.5,N'App1.1.jpg')
Insert [dbo].[APP]([MaApp],[TenApp],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[DanhGia],[HinhNen])
values (5,N'FACEBOOK',
		N'Facebook là một phương tiện truyền thông xã hội và dịch vụ mạng xã hội trực tuyến thành lập vào năm 2004 của Mỹ thuộc sở hữu của Meta Platforms có trụ sở tại Menlo Park, California. Nó được Mark Zuckerberg, cùng với các sinh viên Đại học Harvard và bạn cùng phòng là Eduardo Saverin, Andrew McCollum, Dustin Moskovitz, Chris Hughes sáng lập.
Facebook là một mạng xã hội giúp cho chúng ta có thể kết nối với nhau qua một tài khoản ảo. 
Trên Facebook chúng ta có thể đăng trạng thái, hình ảnh, video và chia sẻ tất cả những gì mà bạn muốn. 
Không những vậy, chúng ta còn có thể kết bạn với những người dùng khác từ khắp nơi trên thế giới và tương tác với những họ qua các tương tác (reation) và bình luận (comment). 
Với những người dùng Facebook chuyên nghiệp thì họ tận dụng Facebook để bán hàng, quảng cáo sản phẩm rất hiệu quả 
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://download.com.vn/facebook-cho-windows-10-98824',1,1,31/10/2022,5,N'BgApp1.jpg')

Insert [dbo].[APP]([MaApp],[TenApp],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[DanhGia],[HinhNen])
values (6,N'INSTAGRAM',
		N'+	Kết nối với bạn bè, chia sẻ những gì bạn đang làm hoặc xem những gì mới từ những người khác trên khắp thế giới. Khám phá cộng đồng của chúng tôi, nơi bạn có thể thoải mái là chính mình và chia sẻ mọi thứ, từ những khoảnh khắc hàng ngày đến những điểm nổi bật trong cuộc sống..',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://play.google.com/store/apps/details?id=com.instagram.android&hl=vi&gl=US',1,1,31/10/2022,4.5,N'App1.1.jpg')
Insert [dbo].[APP]([MaApp],[TenApp],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[DanhGia],[HinhNen])
values (7,N'FACEBOOK',
		N'Facebook là một phương tiện truyền thông xã hội và dịch vụ mạng xã hội trực tuyến thành lập vào năm 2004 của Mỹ thuộc sở hữu của Meta Platforms có trụ sở tại Menlo Park, California. Nó được Mark Zuckerberg, cùng với các sinh viên Đại học Harvard và bạn cùng phòng là Eduardo Saverin, Andrew McCollum, Dustin Moskovitz, Chris Hughes sáng lập.
Facebook là một mạng xã hội giúp cho chúng ta có thể kết nối với nhau qua một tài khoản ảo. 
Trên Facebook chúng ta có thể đăng trạng thái, hình ảnh, video và chia sẻ tất cả những gì mà bạn muốn. 
Không những vậy, chúng ta còn có thể kết bạn với những người dùng khác từ khắp nơi trên thế giới và tương tác với những họ qua các tương tác (reation) và bình luận (comment). 
Với những người dùng Facebook chuyên nghiệp thì họ tận dụng Facebook để bán hàng, quảng cáo sản phẩm rất hiệu quả 
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://download.com.vn/facebook-cho-windows-10-98824',1,1,31/10/2022,5,N'BgApp1.jpg')

Insert [dbo].[APP]([MaApp],[TenApp],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[DanhGia],[HinhNen])
values (8,N'INSTAGRAM',
		N'+	Kết nối với bạn bè, chia sẻ những gì bạn đang làm hoặc xem những gì mới từ những người khác trên khắp thế giới. Khám phá cộng đồng của chúng tôi, nơi bạn có thể thoải mái là chính mình và chia sẻ mọi thứ, từ những khoảnh khắc hàng ngày đến những điểm nổi bật trong cuộc sống..',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://play.google.com/store/apps/details?id=com.instagram.android&hl=vi&gl=US',1,1,31/10/2022,4.5,N'App1.1.jpg')






alter table GAME
drop column NgonNgu

alter table GAME
add MaNgonNgu int

update Game
set MaNgonNgu = 1
where MaGame = 1

Select * from searchstring



update KHACHHANG
set TenDN = N'b3tran'
where MaKH=1

Create table SEARCHSTRING
(
	MaSearch int identity(1,1),
	MaGame int,
	MaApp int,
	constraint PK_SearchString primary key (MaSearch)
)

 Alter table SEARCHSTRING add constraint FK_APP_SEARCHSTRING
					 foreign key (MaApp)
					 references APP (MaApp) 

 Alter table SEARCHSTRING add constraint FK_GAME_SEARCHSTRING
					 foreign key (MaGame)
					 references GAME (MaGame) 

select * from app

select * from game
select * from hedieuhanh
					 SET IDENTITY_INSERT [dbo].[APP] ON 

INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (10, N'FACEBOOK', N'Facebook là một phương tiện truyền thông xã hội và dịch vụ mạng xã hội trực tuyến thành lập vào năm 2004 của Mỹ thuộc sở hữu của Meta Platforms có trụ sở tại Menlo Park, California. Nó được Mark Zuckerberg, cùng với các sinh viên Đại học Harvard và bạn cùng phòng là Eduardo Saverin, Andrew McCollum, Dustin Moskovitz, Chris Hughes sáng lập. Facebook là một mạng xã hội giúp cho chúng ta có thể kết nối với nhau qua một tài khoản ảo.  Trên Facebook chúng ta có thể đăng trạng thái, hình ảnh, video và chia sẻ tất cả những gì mà bạn muốn.  Không những vậy, chúng ta còn có thể kết bạn với những người dùng khác từ khắp nơi trên thế giới và tương tác với những họ qua các tương tác (reation) và bình luận (comment).  Với những người dùng Facebook chuyên nghiệp thì họ tận dụng Facebook để bán hàng, quảng cáo sản phẩm rất hiệu quả ', N'https://download.com.vn/facebook-cho-windows-10-98824', 14, 3, N'BGAPP6.jpg', N'APP6.1.jpg', N'APP6.2.jpg', N'APP6.3.jpg', N'APP6.4.jpg', N'4.5', CAST(N'2022-10-22' AS Date), N'214',7 , 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (11, N'ADOBE AUDITION CS5', N'Adobe Audition CS5.5 mang các tính năng tốt nhất từ các sản phẩm âm thanh của Adobe vào một gói đa nền tảng duy nhất. Nó tập trung vào hiệu suất cao trong quy trình hậu sản xuất. Một số tính năng trong phiên bản Windows của Adobe Audition 3.0 không khả dụng trong CS5.5. Nhóm phát hành đang tích cực thu thập phản hồi về những tính năng nào là ưu tiên hàng đầu của khách hàng thông qua một cuộc khảo sát công khai. Adobe cũng khuyến khích bạn gửi các yêu cầu tính năng bổ sung mà nhóm thường xuyên xem xét khi lập kế hoạch cho các phiên bản trong tương lai.', N'https://drive.google.com/uc?id=1NDElm5ikrTDcho-uAnBvUJHJuQV9r267&export=download', 10, 4, N'BGAPP3.jpg', N'APP3.1.jpg', N'APP3.2.jpg', N'APP3.3.jpg', N'APP3.4.jpg', N'4.3', CAST(N'2022-10-21' AS Date), N'512', 7, 2)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (12, N'HAPPY COW', N'HappyCow là một dịch vụ trực tuyến liệt kê các nguồn thực phẩm thuần chay , ăn chay và tốt cho sức khỏe.', N'https://play.google.com/store/apps/details?id=com.hcceg.veg.compassionfree&referrer=utm_source%3Dhappycow%26utm_campaign%3Dmobile_page', 16, 9, N'BGAPP8.jpg', N'APP8.1.jpg', N'APP8.2.jpg', N'APP8.3.jpg', N'APP8.4.jpg', N'4', CAST(N'2022-10-19' AS Date), N'100', 7, 2)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (13, N'INSTAGRAM', N'Đưa bạn đến gần hơn với những người và những điều bạn yêu thích Kết nối với bạn bè, chia sẻ những gì bạn đang làm hoặc xem những gì mới từ những người khác trên khắp thế giới. Khám phá cộng đồng của chúng tôi, nơi bạn có thể thoải mái là chính mình và chia sẻ mọi thứ, từ những khoảnh khắc hàng ngày đến những điểm nổi bật trong cuộc sống..', N'https://play.google.com/store/apps/details?id=com.instagram.android&hl=vi&gl=US', 14, 10, N'BGAPP9.jpg', N'APP9.1.jpg', N'APP9.2.jpg', N'APP9.3.jpg', N'APP9.4.jpg', N'4.5', CAST(N'2022-10-18' AS Date), N'200', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (14, N'MESSENGER', N'Một dịch vụ và ứng dụng phần mềm tin nhắn tức thời chia sẻ giao tiếp bằng ký tự và giọng nói . Được tích hợp trên ứng dụng chat của Facebook và được xây dựng trên giao thức MQTT.', N'Mạng xã hội', 14, 10, N'BGAPP10.jpg', N'APP10.1.jpg', N'APP10.2.jpg', N'APP10.3.jpg', N'APP10.4.jpg', N'4.5', CAST(N'2022-10-10' AS Date), N'200', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (15, N'TIKOK', N'TikTok là một trong những ứng dụng mạng xã hội video phổ biến nhất hiện nay. Ứng dụng hỗ trợ sáng tạo và chia sẻ clip ngắn bằng âm nhạc cực chất, thu hút hàng ngàn người xem và theo dõi. Được phát hành miễn phí trên nhiều nền tảng khác nhau.', N'https://play.google.com/store/apps/details?id=com.ss.android.ugc.trill&hl=vi&gl=US', 14, 11, N'BGAPP11.jpg', N'APP11.1.jpg', N'APP11.2.jpg', N'APP11.3.jpg', N'APP11.4.jpg', N'4.5', CAST(N'2022-10-11' AS Date), N'84', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (17, N'YOUTUBE', N'Youtube là một nền tảng chia sẻ video trực tuyến, là ứng dụng mạng xã hội video số một trên thế giới với số lượng video cực khủng và nhiều chủ đề khác nhau. Đây là ứng dụng hoàn toàn miễn phí được phát triển trên nhiều nền tảng và thiết bị khác nhau.', N'https://play.google.com/store/apps/details?id=com.google.android.youtube&hl=vi&gl=US', 14, 13, N'BGAPP13.jpg', N'APP13.1.jpg', N'APP13.2.jpg', N'APP13.3.jpg', N'APP13.4.jpg', N'4.7', CAST(N'2022-10-14' AS Date), N'85', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (18, N'MICROSOFT WORD', N'Microsoft word là một chương trình soạn thảo văn bản, là ứng dụng tạo và chỉnh sửa tài liệu của hãng Microsoft, có thể giúp bạn soạn thảo theo bố cục đa dạng và chia sẻ dễ dàng. Ứng dụng được phát triển trên nhiều nền tảng, tương thích với hầu hết thiết bị.', N'https://microsoft-word.softonic.vn/', 20, 3, N'BGAPP14.jpg', N'APP14.1.jpg', N'APP14.2.jpg', N'APP14.3.jpg', N'APP14.4.jpg', N'4.7', CAST(N'2022-10-12' AS Date), N'85', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (19, N'MICROSOFT EXCEL', N'Microsoft Excel là ứng dụng xử lý tác vụ văn phòng giúp tạo và chỉnh sửa trang tính excel phổ biến, chuyên nghiệp nhất hiện tại. Ứng dụng hỗ trợ chức năng thao tác bảng tính cơ bản và các biểu đồ dữ liệu, cùng bộ công cụ hỗ trợ làm công việc xử lý trở nên dễ dàng, tiện lợi hơn bao giờ hết.', N'https://microsoft-excel.softonic.vn/', 21, 14, N'BGAPP15.jpg', N'APP15.1.jpg', N'APP15.2.jpg', N'APP15.3.jpg', N'APP15.4.jpg', N'4.7', CAST(N'2022-10-08' AS Date), N'90', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (20, N'MICROSOFT POWERPOINT', N' Microsoft Powerpoint là phần mềm tạo trang trình chiếu độc đáo, cùng với tính năng tương tác đa năng như viết tay, cảm biến và giọng nói. Ứng dụng đượcMicrosoft phát hành rộng rãi trên mọi nền tảng thiết bị.', N'https://microsoft-powerpoint-2010.softonic.vn/', 22, 14, N'BGAPP16.jpg', N'APP16.1.jpg', N'APP16.2.jpg', N'APP16.3.jpg', N'APP16.4.jpg', N'4.3', CAST(N'2022-10-11' AS Date), N'93', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (21, N'DISCORD', N'Discord là một ứng dụng liên lạc dành cho các game thủ, mang các game thủ lại gần nhau hơn và cùng trải qua các trận game đỉnh cao. Ngoài ra cộng đồng game được kết nối với nhau rất đông đảo lên đến hàng triệu thành viên trên ứng dụng này.', N'https://discord.com/download', 14, 15, N'BGAPP17.jpg', N'APP17.1.jpg', N'APP17.2.jpg', N'APP17.3.jpg', N'APP17.4.jpg', N'4.7', CAST(N'2022-10-12' AS Date), N'80', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (22, N'MICROSOFT PAINT ', N'Được xem là một phần mềm có những tính năng mang tính cách tân và đổi mới, Paint là phần mềm chỉnh sửa ảnh hoàn toàn miễn phí cho Windows. Cùng tìm hiểu bộ công cụ gọn nhẹ nhưng cực kỳ hiệu quả của Paint ngay sau đây nhé!', N'https://vi.downloadastro.com/apps/microsoft_paint/', 24, 14, N'BGAPP20.jpg', N'APP20.1.jpg', N'APP20.2.jpg', N'APP20.3.jpg', N'APP20.4.jpg', N'4.5', CAST(N'2022-10-08' AS Date), N'49.8', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (23, N'ZALO', N'Zalo là ứng dụng liên lạc đảm bảo kết nối nhanh, ổn định, tiện lợi và riêng tư cho người dùng mọi lúc, mọi nơi, nhanh và ổn định', N'https://zalo.me/pc', 14, 18, N'BGAPP21.jpg', N'APP21.1.jpg', N'APP21.2.jpg', N'APP21.3.jpg', N'APP21.4.jpg', N'4.5', CAST(N'2022-10-10' AS Date), N'250', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (24, N'ADOBE PHOTOSHOP', N'Adobe Photoshop là phần mềm thiết kế đồ họa, chỉnh sửa ảnh mạnh mẽ được nhiều người dùng ưa chuộng trên toàn thế giới. Adobe Photoshop có đầy đủ công cụ chỉnh sửa ảnh chuyên nghiệp, xoay cắt ghép ảnh dễ dàng, hỗ trợ bạn thỏa sức sáng tạo.', N'https://download.com.vn/download/adobe-photoshop-cs5-extended-22394', 25, 4, N'BGAPP22.jpg', N'APP22.1.jpg', N'APP22.2.jpg', N'APP22.3.jpg', N'APP22.4.jpg', N'4.4', CAST(N'2022-10-13' AS Date), N'1536', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (25, N'ADOBE LIGHTROOM', N'Adobe Lightroom là phần mềm chỉnh sửa, xử lý ảnh RAW chuyên nghiệp được người dùng ưa chuộng sử dụng với công cụ chỉnh sửa ảnh mạnh mẽ, bạn dễ dàng loại bỏ mắt đó, chỉnh quang sai màu, chỉnh ảnh tự động nhanh chóng.', N'https://creativecloud.adobe.com/apps/download/lightroom', 26, 4, N'BGAPP23.jpg', N'APP23.1.jpg', N'APP23.2.jpg', N'APP23.3.jpg', N'APP23.4.jpg', N'4.6', CAST(N'2022-10-09' AS Date), N'2304', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (26, N'ADOBE ILLUSTRATOR', N'Adobe Illustrator là trình chỉnh sửa đồ họa vector được phát triển bởi Adobe, phần mềm cho phép bạn thiết kế đồ họa 3D chuyên nghiệp, hình ảnh minh họa, đồ họa kĩ thuật số, nội dung trang web, video và nội dung,...', N'https://taimienphi.vn/download-adobe-illustrator-17074#showlink', 25, 4, N'BGAPP24.jpg', N'APP24.1.jpg', N'APP24.2.jpg', N'APP24.3.jpg', N'APP24.4.jpg', N'4.4', CAST(N'2022-10-07' AS Date), N'1024', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (27, N'ADOBE PREMIERE PRO', N'Adobe Premiere là phần mềm chỉnh sửa video phổ thông được mọi người tin dùng trên khắp thế giới. Phần mềm cung cấp cho người sử dụng tất cả công cụ và tính năng liên quan đến chỉnh sửa video.', N'https://www.adobe.com/products/premiere.html', 17, 4, N'BGAPP25.jpg', N'APP25.1.jpg', N'APP25.2.jpg', N'APP25.3.jpg', N'APP25.4.jpg', N'4.6', CAST(N'2022-10-07' AS Date), N'9216', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (28, N'LAZADA', N'Lazada là một trong những website mua sắm trực tuyến lớn nhất tại Việt Nam hiện nay (ngoài ra còn có Shopee, META.vn, ZARA, Adayroi...). Đây cũng là một sàn giao dịch thương mại điện tử lớn và uy tín đã góp phần thúc đẩy các dịch vụ mua sắm online tại thị trường nội địa phát triển mạnh mẽ hơn trong những năm vừa qua.', N'https://taimienphi.vn/download-lazada-19510/cho-pc-phien-ban', 18, 33, N'BGAPP42.jpg', N'APP42.1.jpg', N'APP42.2.jpg', N'APP42.3.jpg', N'APP43.4.jpg', N'4.6', CAST(N'2022-10-09' AS Date), N'80', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (29, N'VIEON', N'Siêu Ứng dụng Giải trí VieON là ứng dụng xem phim truyền hình (phim bộ), phim chiếu rạp (phim lẻ), tivi trực tuyến, show truyền hình thực tế và video giải trí. Phim mới mỗi ngày, show đỉnh độc quyền. Thể thao Ngoại Hạng Anh, La Liga, SerieA, Bundesliga, Ligue 1, V-League, Golf, Tennis.', N'https://taimienphi.vn/download-vieon-75862/taive', 37, 34, N'BGAPP43.jpg', N'APP43.1.jpg', N'APP43.2.jpg', N'APP43.3.jpg', N'APP43.4.jpg', N'4.2', CAST(N'2022-10-11' AS Date), N'230', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (30, N'NETFLIX', N' Netflix là ứng dụng xem phim được ưa chuộng nhất hiện nay với kho phim chất lượng cao mang lại những giây phút giải trí tuyệt vời cho người dùng', N'https://en.softonic.com/downloads/netflix-for-windows', 37, 35, N'BGAPP44.jpg', N'APP44.1.jpg', N'APP44.2.jpg', N'APP44.3.jpg', N'APP44.4.jpg', N'4.6', CAST(N'2022-10-08' AS Date), N'180', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (31, N'SPOTIFY', N'Spotify là ứng dụng nghe nhạc được sản xuất bởi Spotify AB tại Thụy Điển. Nó cho phép người sử dụng có quyền truy cập để nghe những ca khúc, bài hát, video,... của các nghệ sĩ trên thế giới. Ứng dụng này có đặc điểm tương tự những app khác như: Apple Music, Zing MP3,..., người dùng có thể nghe nhạc trực tiếp trên đó mà không bị yêu cầu phí bản quyền. Để làm được điều này, Spotify đã chia ra làm hai phiên bản là có phí và miễn phí. Dịch vụ miễn phí có thể nói là một trong những ưu điểm của Spotify so với App nghe nhạc khác.', N'https://spotify.en.softonic.com/', 38, 36, N'BGAPP45.jpg', N'APP45.1.jpg', N'APP45.2.jpg', N'APP45.3.jpg', N'APP45.4.jpg', N'3.8', CAST(N'2022-10-13' AS Date), N'27', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (32, N'ZING MP3', N'Cùng thưởng thức âm nhạc đỉnh cao với ứng dụng nghe nhạc số 1 Việt Nam  Zing MP3 là ứng dụng nghe nhạc miễn phí hàng đầu Việt Nam. Với kho nhạc chất lượng cao đồ sộ từ Zing mp3 bạn sẽ có trải nghiệm âm nhạc tuyệt vời nhất trên thiết bị di động của mình. ', N'https://vn.ldplayer.net/apps/com-zing-mp3-on-pc.html', 38, 11, N'BGAPP46.jpg', N'APP46.1.jpg', N'APP46.2.jpg', N'APP46.3.jpg', N'APP46.4.jpg', N'4.3', CAST(N'2022-10-13' AS Date), N'50', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (33, N'GIAOHANGTIETKIEM', N'Ứng dụng giao nhận dành cho các Shop bán hàng online của Giaohangtietkiem.vn  Đây là ứng dụng giao nhận mới dành cho các Shop bán hàng online chuyển phát hàng hóa, phục vụ lấy – giao tại 63 tỉnh thành toàn quốc. Ứng dụng cho phép các Shop bán hàng online tại 63 tỉnh thành trên toàn quốc đăng ký tài khoản, đăng nhập, kiểm tra trạng thái đơn hàng.  Với app, Shop bán hàng online gửi yêu cầu thẳng cho vận hành Giaohangtietkiem để được hỗ trợ nhanh chóng. Mọi phát sinh trong quá trình giao hàng sẽ được thông báo tức thời cho Shop qua ứng dụng, tạo kết nối chặt chẽ và dễ dàng giữa Shop và vận hành.', N'https://appsonwindows.com/apk/1175563/', 39, 37, N'BGAPP47.jpg', N'APP47.1.jpg', N'APP47.2.jpg', N'APP47.3.jpg', N'APP47.4.jpg', N'4.6', CAST(N'2022-10-14' AS Date), N'91', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (34, N'BILIBILI', N'Cộng đồng xem anime, giải trí và thế giới 2D với bình luận trực tiếp', N'https://www.ldplayer.net/apps/bilibili-on-pc.html', 37, 38, N'BGAPP48.jpg', N'APP48.1.jpg', N'APP48.2.jpg', N'APP48.3.jpg', N'APP48.4.jpg', N'3.4', CAST(N'2022-10-10' AS Date), N'55', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (35, N'MICROSOFT OUTLOOK', N'Microsoft Outlook là ứng dụng lưu trữ email miễn phí được phát triển và cung cấp bởi Microsoft, cho phép bạn gửi/ nhận email nhanh chóng mà không giới hạn không gian lưu trữ. Ứng dụng còn hỗ trợ việc gửi mail đính kèm tập tin có dung lượng lớn, sắp xếp email theo dung lượng, thời gian nhận, thời gian gửi và nhiều hơn thế nữa.', N'https://microsoft-outlook.softonic.vn/', 40, 14, N'BGAPP49.jpg', N'APP49.1.jpg', N'APP49.2.jpg', N'APP49.3.jpg', N'APP49.4.jpg', N'4.2', CAST(N'2022-10-11' AS Date), N'120', 7, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) VALUES (36, N'TRAVELOKA', N'Đặt vé máy bay, khách sạn, vé vui chơi, giải trí, tour du lịch nội địa & quốc tế. Du lịch dễ dàng với Traveloka – người bạn đồng hành đáp ứng mọi nhu cầu du lịch, cùng bạn làm giàu trải nghiệm trong cuộc sống. Là một trong những Siêu ứng dụng du lịch và tiện ích sống hàng đầu tại Đông Nam Á, Traveloka mang đến cho bạn hơn 20 sản phẩm, dịch vụ du lịch cùng vô vàn tính năng tiện lợi', N'https://www.ldplayer.net/apps/traveloka-book-flight-hotel-on-pc.html', 41, 3, N'BGAPP50.jpg', N'APP50.1.jpg', N'APP50.2.jpg', N'APP50.3.jpg', N'APP50.4.jpg', N'4.8', CAST(N'2022-10-11' AS Date), N'42',7, 1)
SET IDENTITY_INSERT [dbo].[APP] OFF

					 SET IDENTITY_INSERT [dbo].[Searchstring] on

Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaGame])
values (1,1)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaGame])
values (2,2)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaGame])
values (3,3)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaGame])
values (4,4)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaGame])
values (5,5)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaGame])
values (6,6)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaGame])
values (7,7)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaGame])
values (8,8)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (9,10)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (10,11)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (11,12)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (12,13)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (13,14)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (14,15)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (15,16)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (16,17)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (17,18)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (18,19)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (19,20)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (20,21)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (21,22)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (22,23)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (23,24)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (24,25)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (25,26)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (26,27)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (27,28)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (28,29)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (29,30)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (30,31)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (31,32)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (32,33)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (33,34)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (34,35)
Insert [dbo].[SEARCHSTRING] ([MaSearch],[MaApp]) values (35,36)



					 SET IDENTITY_INSERT [dbo].[Searchstring] off


				select * from app	 
select * from SEARCHSTRING
