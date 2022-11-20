﻿use CitricStore
Go

--TẠO BẢNG
Create table NHAPHATHANH
(
	MaNPH int Identity(1,1),
	TenNPH nvarchar(70) not null,
	constraint PK_NHAPHATHANH primary key (MaNPH)
)

 Create table SEARCH_THELOAI
 (
	MaTheLoai int identity(1,1),
	TenTheLoai nvarchar(50),
	constraint PK_SEARCH_THELOAI primary key (MaTheLoai)
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
	MaTheLoaiApp int,
	MaNPH int,
	MaHDH int,
	MaNgonNgu int,
	NgayCapNhat datetime,
	DanhGia nvarchar(5),
	DonGia decimal(18,2),
	HinhNen nvarchar(30),
	HinhCT1 nvarchar(30),
	HinhCT2 nvarchar(30),
	HinhCT3 nvarchar(30),
	HinhCT4 nvarchar(30),
		LinkTai ntext,

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
	MaTheLoai int,
	NgayCapNhat datetime,
	DanhGia nvarchar(5),
	HinhNen nvarchar(30),
	HinhCT1 nvarchar(30),
	HinhCT2 nvarchar(30),
	HinhCT3 nvarchar(30),
	HinhCT4 nvarchar(30),
	constraint PK_All primary key (MaSearch)
)
Create table OVERALL
(
	Ma int Identity(1,1),
	Ten nvarchar(100) not null,
	GioiThieu ntext,
	DungLuong nvarchar(10),
	MaNPH int,
	MaHDH int,
	MaNgonNgu int,
	MaTheLoai int,
	NgayCapNhat datetime,
	DanhGia nvarchar(5),
	DonGia decimal(18,2),
	HinhNen nvarchar(30),
	HinhCT1 nvarchar(30),
	HinhCT2 nvarchar(30),
	HinhCT3 nvarchar(30),
	HinhCT4 nvarchar(30),
			LinkTai ntext,

	constraint PK_Overall primary key (Ma)
)

Create table GAME
(
	MaGame int Identity(1,1),
	TenGame nvarchar(100) not null,
	GioiThieu ntext,
	DungLuong nvarchar(10),
	NgonNgu nvarchar(50),
	HeDieuHanh nvarchar(50),
	MaTheLoaiGame int,
	MaNPH int,
	MaHDH int,
	MaNgonNgu int,
	NgayCapNhat datetime,
	DanhGia nvarchar(5),
		DonGia decimal(18,2),

	HinhNen nvarchar(30),
	HinhCT1 nvarchar(30),
	HinhCT2 nvarchar(30),
	HinhCT3 nvarchar(30),
	HinhCT4 nvarchar(30),
		LinkTai ntext,

	constraint PK_Game primary key (MaGame)
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
	CONSTRAINT PK_KHACHHANG PRIMARY KEY(MaKH)
 )
 select * from KHACHHANG
 Create table ORDER_INFO
 (
	MaOrder int identity(1,1),
	NgayOrder datetime,
	MaKH int,
	TenOrder nvarchar(max),
	SDTOrder varchar(10),
	DiaChiOrder nvarchar(max),
	EmailOrder varchar(50),
	Constraint PK_ORDERINFO primary key (MaOrder)
 )
 alter table order_info
add MaTaiKhoan varchar(50)
 alter table order_info
add TenTaiKhoan nvarchar(max)
 alter table order_info
add TongTien decimal(18,2)

select * from ORDER_INFO

select * from ORDER_PRODUCT

select * from OVERALL

select * from NGONNGU
Create table BANK
(
	BankID int identity(1,1),
	BankName nvarchar(Max),
	constraint PK_BANK primary key (BankID)
)
Set identity_insert [dbo].[BANK] off
insert [dbo].[Bank] ([BankID],[BankName])
values (1, N'Ngân hàng TMCP Kỹ Thương Việt Nam (Techcombank)')
insert [dbo].[Bank] ([BankID],[BankName])

values (2, N'Ngân hàng TMCP Á Châu (ACB)')
insert [dbo].[Bank] ([BankID],[BankName])
values (3, N'Ngân hàng TMCP Đầu tư và Phát triển Việt Nam (BIDV)')



alter table ORDER_INFO add constraint FK_ORDERINFO_BANK
						foreign key (MaNganHang)
						references BANK(BankID)

select * from ORDER_PRODUCT

 Create table ORDER_PRODUCT
 (
	ID int identity(1,1),
	MaUngDung int,
	MaOrder int,
	SoLuong int,
	DonGia decimal (18,2),
	constraint PK_ORDERPRODUCT
							primary key (ID)

 )


  Alter table ORDER_PRODUCT add constraint FK_ORDERPRODUCT_ORDERINFO
					 foreign key (MaOrder)
					 references ORDER_INFO (MaOrder) 
  Alter table ORDER_PRODUCT add constraint FK_ORDERPRODUCT_OVERALL
					 foreign key (MaUngDung)
					 references OVERALL (Ma) 


  Alter table ORDER_INFO add constraint FK_ORDERINFO_KHACHHANG
					 foreign key (MaKH)
					 references KHACHHANG (MaKH) 

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
 Alter table SEARCHALL add constraint FK_SEARCHALL_THELOAI
					 foreign key (MaTheLoai)
					 references SEARCH_THELOAI (MaTheLoai) 

 Alter table OVERALL add constraint FK_OVERALL_NHAPHATHANH
					 foreign key (MaNPH)
					 references NHAPHATHANH (MaNPH) 
 Alter table OVERALL add constraint FK_OVERALL_NGONNGU
					 foreign key (MaNgonNgu)
					 references NGONNGU (MaNgonNgu) 
 Alter table OVERALL add constraint FK_OVERALL_HEDIEUHANH
					 foreign key (MaHDH)
					 references HEDIEUHANH (MaHDH) 
 Alter table OVERALL add constraint FK_OVERALL_THELOAI
					 foreign key (MaTheLoai)
					 references THELOAI (MaTheLoai) 


-- TẠO CỘT TRONG BẢNG

select * from searchall

alter table Overall
add AppOrGame nvarchar(10)

-- XOÁ DÒNG TRON BẢNG
delete from OVERALL
where Ma > 1

Select * from HEDIEUHANH

Select * from NHAPHATHANH

Select * from NGONNGU

Select * from THELOAI
Select * from OVERALL

Update OVERALL
set AppOrGame = N'Game'
where Ma>27

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



-- Input HDH
Select * from HEDIEUHANH
SET IDENTITY_INSERT [dbo].[HEDIEUHANH] ON 
INSERT [dbo].[HEDIEUHANH] ([MaHDH], [TenHDH]) VALUES (1, N'IOS')
INSERT [dbo].[HEDIEUHANH] ([MaHDH], [TenHDH]) VALUES (2, N'Android')
INSERT [dbo].[HEDIEUHANH] ([MaHDH], [TenHDH]) VALUES (3, N'MacOS')
INSERT [dbo].[HEDIEUHANH] ([MaHDH], [TenHDH]) VALUES (4, N'Microsoft')
INSERT [dbo].[HEDIEUHANH] ([MaHDH], [TenHDH]) VALUES (5, N'Chrome OS')
INSERT [dbo].[HEDIEUHANH] ([MaHDH], [TenHDH]) VALUES (6, N'Windows')
SET IDENTITY_INSERT [dbo].[HEDIEUHANH] OFF


-- Input Ngôn ngữ
SET IDENTITY_INSERT [dbo].[NGONNGU] ON 

INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (1, N'Tiếng Việt')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (2, N'Tiếng Anh')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (3, N'Tiếng Thái')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (4, N'Tiếng Ukraina')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (5, N'Tiếng Trung')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (6, N'Tiếng Miến Điện')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (7, N'Tiếng Hàn Quốc')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (8, N'Tiếng Nhật')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (9, N'Tiếng Nga')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (10, N'Tiếng Tây Ban Nha')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (11, N'Tiếng Bồ Đào Nha')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (12, N'Tiếng Thỗ Nhĩ Kì')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (13, N'Tiếng Ả Rập')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (14, N'Tiếng Đức')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (15, N'Tiếng Ý')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (16, N'Tiếng Pháp')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (17, N'Tiếng Hà Lan')
INSERT [dbo].[NGONNGU] ([MaNgonNgu], [TenNgonNgu]) VALUES (18, N'Tiếng Khmer')
SET IDENTITY_INSERT [dbo].[NGONNGU] OFF


-- Input NPH
SET IDENTITY_INSERT [dbo].[NHAPHATHANH] ON 
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (1, N'Traveloka')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (2, N'Supra Games UG')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (3, N'Công Ty Cổ Phần SNK')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (4, N'Adobe')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (5, N'Công Ty Tnhh Cognosphere Pte.')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (6, N'Trò Chơi Sử Thi')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (7, N'Facebook Inc.')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (8, N'Mediatonic')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (9, N'Eric Brent')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (10, N'Meta')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (11, N'ByteDance')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (12, N'Sea Ltd')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (13, N'Chad Hurley, Steve Chen và Jawed Karim')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (14, N'Microsoft')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (15, N'Discord Inc.')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (16, N'Social Point')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (17, N'VNG Game Publishing')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (18, N'Zalo Group')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (19, N'SYBO Games')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (20, N'Innersloth LLC')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (21, N'Garena Mobile Private')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (22, N'PopCap Games')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (23, N'King')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (24, N'1DP Lee')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (25, N'Playrix')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (26, N'VNG Zing Play Game Studio')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (27, N'Wonder Group')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (28, N'Super Nice Digital Marketing Co.,Ltd.')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (29, N'Hidea')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (30, N'Lilith Game')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (31, N'Nanobit')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (32, N'Zynga')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (33, N'Lazada Mobile')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (34, N'VieOn Corporation')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (35, N'Reed Hastings, Marc Randolph')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (36, N'Spotify AB')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (37, N'Công Ty Cổ Phần Giao Hàng Tiết Kiệm')
INSERT [dbo].[NHAPHATHANH] ([MaNPH], [TenNPH]) VALUES (38, N'Balaboom Pte. Ltd.')
SET IDENTITY_INSERT [dbo].[NHAPHATHANH] OFF



-- Input values SEARCH_THELOAI
SET IDENTITY_INSERT [dbo].[SEARCH_THELOAI] ON 

INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (1, N'Giải Đố')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (2, N'Phiêu Lưu')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (3, N'3D')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (4, N'Đối Kháng')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (5, N'Hành Động')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (6, N'Nhập Vai')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (7, N'Mở Rộng Thế Giới')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (8, N'Bắn Súng')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (9, N'Party')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (10, N'Chiến Thuật')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (11, N'Đấu Pet')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (12, N'Nông Trại')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (13, N'Giải Trí')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (14, N'Góc Nhìn Thứ Nhất')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (15, N'Marketing')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (16, N'Mạng Xã Hội')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (17, N'Dịch Vụ Đặt Đồ Ăn')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (18, N'Chỉnh Sửa Video')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (19, N'Sàn Giao Dịch Thương Mại Điện Tử')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (20, N'Dịch Vụ Lưu Trữ Video')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (21, N'Ứng Dụng Văn Phòng')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (22, N'Đồ Họa')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (23, N'Mô Phỏng')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (24, N'Âm Nhạc')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (25, N'Dịch Vụ Du Lịch')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (26, N'Dịch Vụ Giao Hàng')
INSERT [dbo].[SEARCH_THELOAI] ([MaTheLoai], [TenTheLoai]) VALUES (27, N'Tiện Ích')
SET IDENTITY_INSERT [dbo].[SEARCH_THELOAI] OFF


-- Input values THELOAIGAME + THELOAIAPP
SET IDENTITY_INSERT [dbo].[THELOAIGAME] ON 
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (1, N'Giải Đố')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (2, N'Phiêu Lưu')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (3, N'3D')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (4, N'Đối Kháng')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (5, N'Hành Động')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (6, N'Nhập Vai')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (7, N'Mở Rộng Thế Giới')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (8, N'Bắn Súng')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (9, N'Party')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (10, N'Chiến Thuật')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (11, N'Đấu Pet')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (12, N'Nông Trại')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (13, N'Giải Trí')
INSERT [dbo].[THELOAIGAME] ([MaTheLoaiGame], [TenTheLoai]) 
VALUES (14, N'Góc Nhìn Thứ Nhất')
SET IDENTITY_INSERT [dbo].[THELOAIGAME] OFF


SET IDENTITY_INSERT [dbo].[THELOAIAPP] ON 
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (15, N'Marketing')
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (16, N'Mạng Xã Hội')
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (17, N'Dịch Vụ Đặt Đồ Ăn')
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (18, N'Chỉnh Sửa Video')
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (19, N'Sàn Giao Dịch Thương Mại Điện Tử')
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (20, N'Dịch Vụ Lưu Trữ Video')
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (21, N'Ứng Dụng Văn Phòng')
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (22, N'Đồ Họa')
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (23, N'Mô Phỏng')
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (24, N'Âm Nhạc')
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (25, N'Dịch Vụ Du Lịch')
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (26, N'Dịch Vụ Giao Hàng')
INSERT [dbo].[THELOAIAPP] ([MaTheLoaiApp], [TenTheLoai]) 
VALUES (27, N'Tiện Ích')

SET IDENTITY_INSERT [dbo].[THELOAIAPP] OFF

--Input values APP
SET IDENTITY_INSERT [dbo].[APP] ON 
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (1, N'ADOBE AUDITION CS5', N'Adobe Audition CS5.5 mang các tính năng tốt nhất từ các sản phẩm âm thanh của Adobe vào một gói đa nền tảng duy nhất. Nó tập trung vào hiệu suất cao trong quy trình hậu sản xuất. Một số tính năng trong phiên bản Windows của Adobe Audition 3.0 không khả dụng trong CS5.5. Nhóm phát hành đang tích cực thu thập phản hồi về những tính năng nào là ưu tiên hàng đầu của khách hàng thông qua một cuộc khảo sát công khai. Adobe cũng khuyến khích bạn gửi các yêu cầu tính năng bổ sung mà nhóm thường xuyên xem xét khi lập kế hoạch cho các phiên bản trong tương lai.', N'https://drive.google.com/uc?id=1NDElm5ikrTDcho-uAnBvUJHJuQV9r267&export=download', NULL, 4, N'BGAPP3.jpg', N'APP3.1.jpg', N'APP3.2.jpg', N'APP3.3.jpg', N'APP3.4.jpg', N'4.3', CAST(N'2022-10-21' AS Date), N'512', 6, 2)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (2, N'HAPPY COW', N'HappyCow là một dịch vụ trực tuyến liệt kê các nguồn thực phẩm thuần chay , ăn chay và tốt cho sức khỏe.', N'https://play.google.com/store/apps/details?id=com.hcceg.veg.compassionfree&referrer=utm_source%3Dhappycow%26utm_campaign%3Dmobile_page', NULL, 9, N'BGAPP8.jpg', N'APP8.1.jpg', N'APP8.2.jpg', N'APP8.3.jpg', N'APP8.4.jpg', N'4', CAST(N'2022-10-19' AS Date), N'100', 6, 2)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (3, N'INSTAGRAM', N'Đưa bạn đến gần hơn với những người và những điều bạn yêu thích Kết nối với bạn bè, chia sẻ những gì bạn đang làm hoặc xem những gì mới từ những người khác trên khắp thế giới. Khám phá cộng đồng của chúng tôi, nơi bạn có thể thoải mái là chính mình và chia sẻ mọi thứ, từ những khoảnh khắc hàng ngày đến những điểm nổi bật trong cuộc sống..', N'https://play.google.com/store/apps/details?id=com.instagram.android&hl=vi&gl=US', NULL, 10, N'BGAPP9.jpg', N'APP9.1.jpg', N'APP9.2.jpg', N'APP9.3.jpg', N'APP9.4.jpg', N'4.5', CAST(N'2022-10-18' AS Date), N'200', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (4, N'MESSENGER', N'Một dịch vụ và ứng dụng phần mềm tin nhắn tức thời chia sẻ giao tiếp bằng ký tự và giọng nói . Được tích hợp trên ứng dụng chat của Facebook và được xây dựng trên giao thức MQTT.', N'Mạng xã hội',NULL, 10, N'BGAPP10.jpg', N'APP10.1.jpg', N'APP10.2.jpg', N'APP10.3.jpg', N'APP10.4.jpg', N'4.5', CAST(N'2022-10-10' AS Date), N'200', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (5, N'TIKOK', N'TikTok là một trong những ứng dụng mạng xã hội video phổ biến nhất hiện nay. Ứng dụng hỗ trợ sáng tạo và chia sẻ clip ngắn bằng âm nhạc cực chất, thu hút hàng ngàn người xem và theo dõi. Được phát hành miễn phí trên nhiều nền tảng khác nhau.', N'https://play.google.com/store/apps/details?id=com.ss.android.ugc.trill&hl=vi&gl=US', NULL, 11, N'BGAPP11.jpg', N'APP11.1.jpg', N'APP11.2.jpg', N'APP11.3.jpg', N'APP11.4.jpg', N'4.5', CAST(N'2022-10-11' AS Date), N'84', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (6, N'SHOPEE', N'Shopee là ứng dụng mua bán online giá rẻ với nhiều mặt hàng đa dạng, là sàn giao dịch thương mại điện tử có trụ sở đặt tại Singapore. Ứng dụng được phát hành miễn phí và tương thích với nhiều nền tảng và thiết bị.', N'https://play.google.com/store/apps/details?id=com.shopee.vn&hl=vi&gl=US', NULL, 12, N'BGAPP12.jpg', N'APP12.1.jpg', N'APP12.2.jpg', N'APP12.3.jpg', N'APP12.4.jpg', N'4.4', CAST(N'2022-10-13' AS Date), N'68', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (7, N'YOUTUBE', N'Youtube là một nền tảng chia sẻ video trực tuyến, là ứng dụng mạng xã hội video số một trên thế giới với số lượng video cực khủng và nhiều chủ đề khác nhau. Đây là ứng dụng hoàn toàn miễn phí được phát triển trên nhiều nền tảng và thiết bị khác nhau.', N'https://play.google.com/store/apps/details?id=com.google.android.youtube&hl=vi&gl=US', NULL, 13, N'BGAPP13.jpg', N'APP13.1.jpg', N'APP13.2.jpg', N'APP13.3.jpg', N'APP13.4.jpg', N'4.7', CAST(N'2022-10-14' AS Date), N'85', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (8, N'MICROSOFT WORD', N'Microsoft word là một chương trình soạn thảo văn bản, là ứng dụng tạo và chỉnh sửa tài liệu của hãng Microsoft, có thể giúp bạn soạn thảo theo bố cục đa dạng và chia sẻ dễ dàng. Ứng dụng được phát triển trên nhiều nền tảng, tương thích với hầu hết thiết bị.', N'https://microsoft-word.softonic.vn/', NULL, 3, N'BGAPP14.jpg', N'APP14.1.jpg', N'APP14.2.jpg', N'APP14.3.jpg', N'APP14.4.jpg', N'4.7', CAST(N'2022-10-12' AS Date), N'85', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (9, N'MICROSOFT EXCEL', N'Microsoft Excel là ứng dụng xử lý tác vụ văn phòng giúp tạo và chỉnh sửa trang tính excel phổ biến, chuyên nghiệp nhất hiện tại. Ứng dụng hỗ trợ chức năng thao tác bảng tính cơ bản và các biểu đồ dữ liệu, cùng bộ công cụ hỗ trợ làm công việc xử lý trở nên dễ dàng, tiện lợi hơn bao giờ hết.', N'https://microsoft-excel.softonic.vn/', NULL, 14, N'BGAPP15.jpg', N'APP15.1.jpg', N'APP15.2.jpg', N'APP15.3.jpg', N'APP15.4.jpg', N'4.7', CAST(N'2022-10-08' AS Date), N'90', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (10, N'MICROSOFT POWERPOINT', N' Microsoft Powerpoint là phần mềm tạo trang trình chiếu độc đáo, cùng với tính năng tương tác đa năng như viết tay, cảm biến và giọng nói. Ứng dụng đượcMicrosoft phát hành rộng rãi trên mọi nền tảng thiết bị.', N'https://microsoft-powerpoint-2010.softonic.vn/',NULL, 14, N'BGAPP16.jpg', N'APP16.1.jpg', N'APP16.2.jpg', N'APP16.3.jpg', N'APP16.4.jpg', N'4.3', CAST(N'2022-10-11' AS Date), N'93', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (11, N'DISCORD', N'Discord là một ứng dụng liên lạc dành cho các game thủ, mang các game thủ lại gần nhau hơn và cùng trải qua các trận game đỉnh cao. Ngoài ra cộng đồng game được kết nối với nhau rất đông đảo lên đến hàng triệu thành viên trên ứng dụng này.', N'https://discord.com/download',NULL, 15, N'BGAPP17.jpg', N'APP17.1.jpg', N'APP17.2.jpg', N'APP17.3.jpg', N'APP17.4.jpg', N'4.7', CAST(N'2022-10-12' AS Date), N'80', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (12, N'MICROSOFT PAINT ', N'Được xem là một phần mềm có những tính năng mang tính cách tân và đổi mới, Paint là phần mềm chỉnh sửa ảnh hoàn toàn miễn phí cho Windows. Cùng tìm hiểu bộ công cụ gọn nhẹ nhưng cực kỳ hiệu quả của Paint ngay sau đây nhé!', N'https://vi.downloadastro.com/apps/microsoft_paint/',NULL, 14, N'BGAPP20.jpg', N'APP20.1.jpg', N'APP20.2.jpg', N'APP20.3.jpg', N'APP20.4.jpg', N'4.5', CAST(N'2022-10-08' AS Date), N'49.8', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (13, N'ZALO', N'Zalo là ứng dụng liên lạc đảm bảo kết nối nhanh, ổn định, tiện lợi và riêng tư cho người dùng mọi lúc, mọi nơi, nhanh và ổn định', N'https://zalo.me/pc', NULL, 18, N'BGAPP21.jpg', N'APP21.1.jpg', N'APP21.2.jpg', N'APP21.3.jpg', N'APP21.4.jpg', N'4.5', CAST(N'2022-10-10' AS Date), N'250', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (14, N'ADOBE PHOTOSHOP', N'Adobe Photoshop là phần mềm thiết kế đồ họa, chỉnh sửa ảnh mạnh mẽ được nhiều người dùng ưa chuộng trên toàn thế giới. Adobe Photoshop có đầy đủ công cụ chỉnh sửa ảnh chuyên nghiệp, xoay cắt ghép ảnh dễ dàng, hỗ trợ bạn thỏa sức sáng tạo.', N'https://download.com.vn/download/adobe-photoshop-cs5-extended-22394', NULL, 4, N'BGAPP22.jpg', N'APP22.1.jpg', N'APP22.2.jpg', N'APP22.3.jpg', N'APP22.4.jpg', N'4.4', CAST(N'2022-10-13' AS Date), N'1536', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (15, N'ADOBE LIGHTROOM', N'Adobe Lightroom là phần mềm chỉnh sửa, xử lý ảnh RAW chuyên nghiệp được người dùng ưa chuộng sử dụng với công cụ chỉnh sửa ảnh mạnh mẽ, bạn dễ dàng loại bỏ mắt đó, chỉnh quang sai màu, chỉnh ảnh tự động nhanh chóng.', N'https://creativecloud.adobe.com/apps/download/lightroom',NULL, 4, N'BGAPP23.jpg', N'APP23.1.jpg', N'APP23.2.jpg', N'APP23.3.jpg', N'APP23.4.jpg', N'4.6', CAST(N'2022-10-09' AS Date), N'2304', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (16, N'ADOBE ILLUSTRATOR', N'Adobe Illustrator là trình chỉnh sửa đồ họa vector được phát triển bởi Adobe, phần mềm cho phép bạn thiết kế đồ họa 3D chuyên nghiệp, hình ảnh minh họa, đồ họa kĩ thuật số, nội dung trang web, video và nội dung,...', N'https://taimienphi.vn/download-adobe-illustrator-17074#showlink', 25, 4, N'BGAPP24.jpg', N'APP24.1.jpg', N'APP24.2.jpg', N'APP24.3.jpg', N'APP24.4.jpg', N'4.4', CAST(N'2022-10-07' AS Date), N'1024', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (17, N'ADOBE PREMIERE PRO', N'Adobe Premiere là phần mềm chỉnh sửa video phổ thông được mọi người tin dùng trên khắp thế giới. Phần mềm cung cấp cho người sử dụng tất cả công cụ và tính năng liên quan đến chỉnh sửa video.', N'https://www.adobe.com/products/premiere.html', NULL, 4, N'BGAPP25.jpg', N'APP25.1.jpg', N'APP25.2.jpg', N'APP25.3.jpg', N'APP25.4.jpg', N'4.6', CAST(N'2022-10-07' AS Date), N'9216', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (18, N'LAZADA', N'Lazada là một trong những website mua sắm trực tuyến lớn nhất tại Việt Nam hiện nay (ngoài ra còn có Shopee, META.vn, ZARA, Adayroi...). Đây cũng là một sàn giao dịch thương mại điện tử lớn và uy tín đã góp phần thúc đẩy các dịch vụ mua sắm online tại thị trường nội địa phát triển mạnh mẽ hơn trong những năm vừa qua.', N'https://taimienphi.vn/download-lazada-19510/cho-pc-phien-ban', NULL, 33, N'BGAPP42.jpg', N'APP42.1.jpg', N'APP42.2.jpg', N'APP42.3.jpg', N'APP43.4.jpg', N'4.6', CAST(N'2022-10-09' AS Date), N'80', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (19, N'VIEON', N'Siêu Ứng dụng Giải trí VieON là ứng dụng xem phim truyền hình (phim bộ), phim chiếu rạp (phim lẻ), tivi trực tuyến, show truyền hình thực tế và video giải trí. Phim mới mỗi ngày, show đỉnh độc quyền. Thể thao Ngoại Hạng Anh, La Liga, SerieA, Bundesliga, Ligue 1, V-League, Golf, Tennis.', N'https://taimienphi.vn/download-vieon-75862/taive', NULL, 34, N'BGAPP43.jpg', N'APP43.1.jpg', N'APP43.2.jpg', N'APP43.3.jpg', N'APP43.4.jpg', N'4.2', CAST(N'2022-10-11' AS Date), N'230', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (20, N'NETFLIX', N' Netflix là ứng dụng xem phim được ưa chuộng nhất hiện nay với kho phim chất lượng cao mang lại những giây phút giải trí tuyệt vời cho người dùng', N'https://en.softonic.com/downloads/netflix-for-windows',NULL, 35, N'BGAPP44.jpg', N'APP44.1.jpg', N'APP44.2.jpg', N'APP44.3.jpg', N'APP44.4.jpg', N'4.6', CAST(N'2022-10-08' AS Date), N'180', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (21, N'SPOTIFY', N'Spotify là ứng dụng nghe nhạc được sản xuất bởi Spotify AB tại Thụy Điển. Nó cho phép người sử dụng có quyền truy cập để nghe những ca khúc, bài hát, video,... của các nghệ sĩ trên thế giới. Ứng dụng này có đặc điểm tương tự những app khác như: Apple Music, Zing MP3,..., người dùng có thể nghe nhạc trực tiếp trên đó mà không bị yêu cầu phí bản quyền. Để làm được điều này, Spotify đã chia ra làm hai phiên bản là có phí và miễn phí. Dịch vụ miễn phí có thể nói là một trong những ưu điểm của Spotify so với App nghe nhạc khác.', N'https://spotify.en.softonic.com/', NULL, 36, N'BGAPP45.jpg', N'APP45.1.jpg', N'APP45.2.jpg', N'APP45.3.jpg', N'APP45.4.jpg', N'3.8', CAST(N'2022-10-13' AS Date), N'27', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (22, N'ZING MP3', N'Cùng thưởng thức âm nhạc đỉnh cao với ứng dụng nghe nhạc số 1 Việt Nam  Zing MP3 là ứng dụng nghe nhạc miễn phí hàng đầu Việt Nam. Với kho nhạc chất lượng cao đồ sộ từ Zing mp3 bạn sẽ có trải nghiệm âm nhạc tuyệt vời nhất trên thiết bị di động của mình. ', N'https://vn.ldplayer.net/apps/com-zing-mp3-on-pc.html', NULL, 11, N'BGAPP46.jpg', N'APP46.1.jpg', N'APP46.2.jpg', N'APP46.3.jpg', N'APP46.4.jpg', N'4.3', CAST(N'2022-10-13' AS Date), N'50', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (23, N'GIAOHANGTIETKIEM', N'Ứng dụng giao nhận dành cho các Shop bán hàng online của Giaohangtietkiem.vn  Đây là ứng dụng giao nhận mới dành cho các Shop bán hàng online chuyển phát hàng hóa, phục vụ lấy – giao tại 63 tỉnh thành toàn quốc. Ứng dụng cho phép các Shop bán hàng online tại 63 tỉnh thành trên toàn quốc đăng ký tài khoản, đăng nhập, kiểm tra trạng thái đơn hàng.  Với app, Shop bán hàng online gửi yêu cầu thẳng cho vận hành Giaohangtietkiem để được hỗ trợ nhanh chóng. Mọi phát sinh trong quá trình giao hàng sẽ được thông báo tức thời cho Shop qua ứng dụng, tạo kết nối chặt chẽ và dễ dàng giữa Shop và vận hành.', N'https://appsonwindows.com/apk/1175563/', NULL, 37, N'BGAPP47.jpg', N'APP47.1.jpg', N'APP47.2.jpg', N'APP47.3.jpg', N'APP47.4.jpg', N'4.6', CAST(N'2022-10-14' AS Date), N'91', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (24, N'BILIBILI', N'Cộng đồng xem anime, giải trí và thế giới 2D với bình luận trực tiếp', N'https://www.ldplayer.net/apps/bilibili-on-pc.html', NULL, 38, N'BGAPP48.jpg', N'APP48.1.jpg', N'APP48.2.jpg', N'APP48.3.jpg', N'APP48.4.jpg', N'3.4', CAST(N'2022-10-10' AS Date), N'55', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (25, N'MICROSOFT OUTLOOK', N'Microsoft Outlook là ứng dụng lưu trữ email miễn phí được phát triển và cung cấp bởi Microsoft, cho phép bạn gửi/ nhận email nhanh chóng mà không giới hạn không gian lưu trữ. Ứng dụng còn hỗ trợ việc gửi mail đính kèm tập tin có dung lượng lớn, sắp xếp email theo dung lượng, thời gian nhận, thời gian gửi và nhiều hơn thế nữa.', N'https://microsoft-outlook.softonic.vn/', NULL, 14, N'BGAPP49.jpg', N'APP49.1.jpg', N'APP49.2.jpg', N'APP49.3.jpg', N'APP49.4.jpg', N'4.2', CAST(N'2022-10-11' AS Date), N'120', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (26, N'TRAVELOKA', N'Đặt vé máy bay, khách sạn, vé vui chơi, giải trí, tour du lịch nội địa & quốc tế. Du lịch dễ dàng với Traveloka – người bạn đồng hành đáp ứng mọi nhu cầu du lịch, cùng bạn làm giàu trải nghiệm trong cuộc sống. Là một trong những Siêu ứng dụng du lịch và tiện ích sống hàng đầu tại Đông Nam Á, Traveloka mang đến cho bạn hơn 20 sản phẩm, dịch vụ du lịch cùng vô vàn tính năng tiện lợi', N'https://www.ldplayer.net/apps/traveloka-book-flight-hotel-on-pc.html', NULL, 1, N'BGAPP50.jpg', N'APP50.1.jpg', N'APP50.2.jpg', N'APP50.3.jpg', N'APP50.4.jpg', N'4.8', CAST(N'2022-10-11' AS Date), N'42', 6, 1)
INSERT [dbo].[APP] ([MaApp], [TenApp], [GioiThieu], [LinkTai], [MaTheLoaiApp], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (27, N'FACEBOOK', N'Facebook là một phương tiện truyền thông xã hội và dịch vụ mạng xã hội trực tuyến thành lập vào năm 2004 của Mỹ thuộc sở hữu của Meta Platforms có trụ sở tại Menlo Park, California. Nó được Mark Zuckerberg, cùng với các sinh viên Đại học Harvard và bạn cùng phòng là Eduardo Saverin, Andrew McCollum, Dustin Moskovitz, Chris Hughes sáng lập. Facebook là một mạng xã hội giúp cho chúng ta có thể kết nối với nhau qua một tài khoản ảo.  Trên Facebook chúng ta có thể đăng trạng thái, hình ảnh, video và chia sẻ tất cả những gì mà bạn muốn.  Không những vậy, chúng ta còn có thể kết bạn với những người dùng khác từ khắp nơi trên thế giới và tương tác với những họ qua các tương tác (reation) và bình luận (comment).  Với những người dùng Facebook chuyên nghiệp thì họ tận dụng Facebook để bán hàng, quảng cáo sản phẩm rất hiệu quả ', N'https://download.com.vn/facebook-cho-windows-10-98824', NULL, 3, N'BGAPP6.jpg', N'APP6.1.jpg', N'APP6.2.jpg', N'APP6.3.jpg', N'APP6.4.jpg', N'4.5', CAST(N'2022-10-22' AS Date), N'214', 6, 1)

SET IDENTITY_INSERT [dbo].[APP] OFF


-- Input values GAME
SET IDENTITY_INSERT [dbo].[GAME] ON 
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (1, N'SUPRALAND SIX INCHES UNDER', N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland. Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người. Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm. Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng). Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.', N'https://bluemediafiles.homes/url-generator.php?url=KH1TK0eBXmDmljELeo4C+FFvmgHJbc++7psPlN6tioiOAlqFJyJr1Da7TS+/2OydxBiEj9qrLmBRlalrpjeVwHAr6vqfd6J7bAs53bHlBmY=', 6, 25, N'BG1.jpg', N'Game1.1.jpg', N'Game1.2.jpg', N'Game1.3.jpg', N'Game1.4.jpg', N'4.8', CAST(N'2022-10-05' AS Date), N'6144', 1, 4)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (2, N'THE KING OF FIGHTERS XV', N'Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!', N'https://hadoantv.com/download?kind=old&url=https%3A%2F%2Fanotepad.com%2Fnotes%2Fx4asr7ek', 7, 3, N'BG2.jpg', N'Game2.1.jpg', N'Game2.2.jpg', N'Game2.3.jpg', N'Game2.4.jpg', N'4.2', CAST(N'2022-10-06' AS Date), N'8192', 1, 4)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (3, N'GENSHIN IMPACT', N'Trong trò chơi, bạn sẽ khám phá thế giới tuyệt vời của Tey Vat, và các bước của bạn sẽ đưa bạn qua bảy quốc gia để gặp gỡ các nhân vật từ mọi tầng lớp xã hội, những người sẽ đồng hành cùng bạn trong các cuộc chiến đấu và nhiệm vụ của bạn.', N'https://drive.google.com/file/d/1kmZ398KVMYMJws5Rc8dv5EH44XI3rnUw/view', 11, 5, N'BG4.jpg', N'Game4.1.jpg', N'Game4.2.jpg', N'Game4.3.jpg', N'Game4.4.jpg', N'4.7', CAST(N'2022-10-06' AS Date), N'118', 1, 8)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (4, N'FORTNITE', N'Fortnite: Cơn ác mộng bây giờ! DJ Lyka đang đợi bạn tại Tree of Reality để giúp bạn hóa thân thành một sinh vật có năng lực lupin. Săn đối thủ bằng Howler Claws, hoàn thành nhiệm vụ để nhận phần thưởng đặc biệt, đánh bại quái vật hình khối và vui chơi với các vật phẩm được giới thiệu lại. Giữ cho bữa tiệc diễn ra với sự kinh hoàng và thích thú trên những hòn đảo được thiết kế riêng. Khám phá một địa hình có khả năng phá hủy khổng lồ, nơi mỗi trò chơi là duy nhất. Lập nhóm với bạn bè của bạn để giành chiến thắng Royale. Chạy nước rút, leo lên và bắt đầu theo cách của bạn trong khi xây dựng trong Fortnite Battle Royale hoặc chỉ với vũ khí và vật phẩm của bạn trong Fortnite Zero Build. Khám phá thêm nhiều cách chơi với hàng nghìn trò chơi do người sáng tạo thiết kế ở nhiều thể loại: phiêu lưu, nhập vai, sinh tồn ... Hoặc, bạn cũng có thể tham gia lực lượng với tối đa ba người bạn để chống lại lũ quái vật trong Save the World .', N'https://fa.getpedia.net/data?q=3cDOyMTN4UTMyUjMxIDM4MjN8BjNwUTMxwXaz1mLlRXauRncvZWLw0CMtMTMtIXZsxWY0NnbJNWawV0LyIzLyEzLxIDMy8SZslmZvEGdhR2L', 13, 6, N'BG5.jpg', N'Game5.1.jpg', N'Game5.2.jpg', N'Game5.3.jpg', N'Game5.4.jpg', N'4.3', CAST(N'2022-10-07' AS Date), N'8192', 1, 16)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (5, N'FALL GUYS', N'Fall Guys là một trò chơi nhóm nhiều người chơi miễn phí, đa nền tảng, nơi bạn và các đối thủ của mình phải cạnh tranh trong các vòng vượt chướng ngại vật vô lý và hỗn loạn cho đến khi chỉ còn lại người chiến thắng.', N'https://www.fallguys.com/en-US/download', 14, 8, N'BG7.jpg', N'Game7.1.jpg', N'Game7.2.jpg', N'Game7.3.jpg', N'Game7.4.jpg', N'4.5', CAST(N'2022-10-09' AS Date), N'2048', 1, 4)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (6, N'DRAGON CITY', N'Dragon City là game xây dựng thành phố rồng thu hút hàng triệu người chơi trên thế giới. Dragon City đã được bổ sung sự kiện mới liên tục với rất nhiều thử thách hấp dẫn đang chờ đón bạn. Tham gia game luyện rồng “hot” nhất và thu thập rất nhiều loài rồng phun lửa đáng yêu! Đào tạo chúng như ý muốn của bạn, phát triển bộ sưu tập và chức minh sức mạnh của bản thân qua game Dragon Master nổi tiếng thế giới.', N'https://download.com.vn/dragon-city-124530', 13, 16, N'BG18.jpg', N'Game18.1.jpg', N'Game18.2.jpg', N'Game18.3.jpg', N'Game18.4.jpg', N'4.5', CAST(N'2022-10-14' AS Date), N'148', 1, 4)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (7, N'PUBG MOBILE', N'Game Battle Royale nguyên bản, đầu tiên và hay nhất! Game Battle Royale được hơn 1 tỷ người chơi trên toàn thế giới bình chọn.  Kiệt tác huyền thoại battle royale   Nhiều sự kiện đang chờ bạn khám phá   Đạt đến đỉnh cao trong PUBG MOBILE, thỏa sức bắn tùy thích. PUBG MOBILE là trò chơi battle royale nguyên bản trên di động, và là một trong những trò chơi bắn súng hay nhất.  PUBG Mobile - PLAYERUNKNOWN''S BATTLEGROUNDS MOBILE là game bắn súng sinh tồn được yêu thích trên toàn thế giới do Tencent & BlueHole nghiên cứu, phát triển và đã được phát hành chính thức tại Việt Nam, duy nhất bởi VNG.', N'https://download.com.vn/pubg-mobile-124873', 13, 17, N'BG19.jpg', N'Game19.1.jpg', N'Game19.2.jpg', N'Game19.3.jpg', N'Game19.4.jpg', N'4.0', CAST(N'2022-10-16' AS Date), N'689', 1, 4)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (8, N'SUBWAY SURFERS', N'Trong game, người chơi sẽ nhập vai vào những thanh thiếu niên đầy tinh nghịch hàng ngày sơn graffiti trộm lên các toa tàu, khi bị phát hiện, chúng chạy trên những đường ray để thoát khỏi sự truy đuổi của viên thanh tra và con chó của ông ấy. Khi chạy, người chơi có thể điều khiển nhân vật nhặt tiền vàng, chìa khóa, các vật phẩm tăng sức mạnh và các phần thưởng khác trên đường ray. Đồng thời giúp nhân vật tránh xa các chướng ngại vật trên đường đi, trò chơi chỉ kết thúc khi nhân vật bị bắt bởi viên thanh tra hoặc cả hai đều bị cán bởi toa tàu. Các sự kiện đặc biệt như Săn thưởng hàng tuần (Weekly Hunt) có thể giúp người chơi hoàn thành nhiệm vụ và nhận được nhiều phần quà hơn.', N'https://download.com.vn/game-subway-surfers-124415', 12, 19, N'BG26.jpg', N'Game26.1.jpg', N'Game26.2.jpg', N'Game26.3.jpg', N'Game26.4.jpg', N'4.4', CAST(N'2022-10-13' AS Date), N'101', 1, 2)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (9, N'AMONG US', N'Among Us là game nhập vai hành động nhiều người chơi có phong cách khá giống Werewolf Online. Game có chủ đề chính xoay quanh tinh thần đồng đội và sự phản bội dành cho 4-10 người chơi trong bối cảnh không gian.', NULL, 14, 20, N'BG27.jpg', N'Game27.1.jpg', N'Game27.2.jpg', N'Game27.3.jpg', N'Game27.4.jpg', N'4.5', CAST(N'2022-10-18' AS Date), N'80', 1, 4)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (10, N'LIÊN QUÂN MOBILE', N'Garena Liên Quân Mobile là tựa game chiến thuật đỉnh cao trên Android lẫn iOS. Tuy nhiên, bạn hoàn toàn có thể trải nghiệm trên máy tính thông qua bộ giả lập LDPlayer có gắn kèm game Liên Quân Mobile. Cho người chơi thỏa sức tham gia cuộc chiến 10vs10 nảy lửa trên mọi thiết bị, ở mọi lúc mọi nơi.', N'https://download.com.vn/garena-lien-quan-mobile-124385', 11, 21, N'BG28.jpg', N'Game28.1.jpg', N'Game28.2.jpg', N'Game28.3.jpg', N'Game28.4.jpg', N'3.5', CAST(N'2022-10-19' AS Date), N'148', 1, 1)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (11, N'PLANTS VS ZOMBIES 2', N'Plants vs Zombies 2 là sự trở lại đầy ngoạn mục của siêu phẩm thủ thành “Hoa quả nổi giận”. Mặc dù game chỉ có 2 phiên bản độc quyền dành cho di động nhưng nay bạn đã có thể chơi Plants vs Zombies 2 cho máy tính thông qua phần mềm giả lập BlueStacks.', N'https://download.com.vn/plants-vs-zombies-2-124458', 11, 22, N'BG29.jpg', N'Game29.1.jpg', N'Game29.2.jpg', N'Game29.3.jpg', N'Game29.4.jpg', N'4.1', CAST(N'2022-10-15' AS Date), N'775', 1, 1)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (12, N'CANDY CRUSH SAGA', N'Chắc hẳn ai cũng đã từng nghe đến Candy Crush Saga, tựa game xếp kẹo đình đám trên thiết bị di động và mạng xã hội. Giờ đây bạn đã có thể tải Candy Crush về máy tính của mình và thỏa sức giải trí với trò chơi thú vị này.', N'https://download.com.vn/candy-crush-saga-pc-85557', 11, 23, N'BG30.jpg', N'Game30.1.jpg', N'Game30.2.jpg', N'Game30.3.jpg', N'Game30.4.jpg', N'4.6', CAST(N'2022-10-14' AS Date), N'79', 1, 2)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (13, N'FARM HEROES SAGA', N'Thông qua giả lập Tencent Buddy, bạn có thể chơi game Farm Heroes Saga trên máy tính. Farm Heroes Saga PC là game xếp hình match-3 vô cùng thú vị trong thế giới nông trại và cỏ cây hoa lá siêu đáng yêu!', N'https://download.com.vn/farm-heroes-saga-pc-124697', 11, 23, N'BG31.jpg', N'Game31.1.jpg', N'Game31.2.jpg', N'Game31.3.jpg', N'Game31.4.jpg', N'4.6', CAST(N'2022-10-20' AS Date), N'82', 1, 1)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (14, N'MEGA ĐẠI CHIẾN', N'Mega Đại Chiến là một tựa game chiến thuật đấu Pet được xây dựng dựa trên bộ phim hoạt hình nổi tiếng Pokémon, đang được nhiều người yêu thích và chơi hiện nay. Trong trò chơi này, người chơi sẽ hóa thân thành một huấn luyện viên để chiêu mộ và huấn luyện Pet để chinh phục các đấu trường vô cùng khốc liệt. Khi tham gia vào tựa game này, bạn sẽ được đưa tới một thế giới Pokémon đa dạng, với sức mạnh, cấp độ tiến hóa khác nhau. Ngoài ra, ở game này còn có hiệu ứng thời tiết vô cùng ấn tượng, chúng ta sẽ được thấy những hiện tượng thời tiết như: nắng, mưa, bão tố, bão lửa, tia sét,...', N'https://vn.ldplayer.net/games/com-megagame-daichien-on-pc.html', 11, 24, N'BG32.jpg', N'Game32.1.jpg', N'Game32.2.jpg', N'Game32.3.jpg', N'Game32.4.jpg', N'3.7', CAST(N'2022-10-19' AS Date), N'483', 1, 2)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (15, N'HOMESCAPES', N'Chào mừng bạn đến với Homescapes, một trò chơi thực sự ấm lòng từ sê-ri Playrix Scapes ™!  Giải các câu đố match-3 để khôi phục một dinh thự tuyệt vời trên một con phố xanh tươi.  Cuộc phiêu lưu thú vị bắt đầu trước ngưỡng cửa!   Đánh bại các cấp độ trận đấu 3 đầy màu sắc để cải tạo và trang trí các phòng trong biệt thự, mở khóa nhiều chương hơn nữa trong câu chuyện gia đình thú vị trên đường đi!  Bạn còn chờ gì nữa?  Tự nhiên như ở nhà!', N'https://www.malavida.com/en/soft/homescapes/', 5, 25, N'BG33.jpg', N'Game33.1.jpg', N'Game33.2.jpg', N'Game33.3.jpg', N'Game33.4.jpg', N'4.3', CAST(N'2022-10-18' AS Date), N'141', 1, 2)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (16, N'KHU VƯỜN TRÊN MÂY', N'Khu vườn trên mây là game nông trại miễn phí do Zing Play phát hành trên di động. Để chơi Khu vườn trên mây bạn có thể cài đặt Khu vườn trên mây thông qua các phần mềm giả lập Android như BlueStacks, LDPlayer, vv. Tải game Khu vườn trên mây để sẵn sàng khám phá nông trại trên địa đàng độc đáo này. Tựa game Khu vườn trên mây chắc hẳn không còn mấy xa lạ với những ai yêu thích dòng game nông trại. Đến với Khu vườn trên mây bạn sẽ được trở thành một người nông dân đặc biệt để chăm sóc khu vườn trên mây với những điều vô cùng thú vị.', N'https://download.com.vn/khu-vuon-tren-may-124423', 10, 26, N'BG34.jpg', N'Game34.1.jpg', N'Game34.2.jpg', N'Game34.3.jpg', N'Game34.4.jpg', N'4.5', CAST(N'2022-10-22' AS Date), N'108', 1, 2)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (17, N'SAVE THE DOGE', N'Bạn có thích chơi game giải đố không? Save the Doge là một trò chơi trí tuệ vui nhộn, thách thức người chơi giải cứu chú chó khỏi bị ong đốt. Hãy tìm cách vẽ một đường duy nhất để cứu chú chó dễ thương này trong mỗi màn chơi nhé!', N'https://download.com.vn/save-the-doge-164981', 5, 27, N'BG35.jpg', N'Game35.1.jpg', N'Game35.2.jpg', N'Game35.3.jpg', N'Game35.4.jpg', N'3.2', CAST(N'2022-10-23' AS Date), N'35', 1, 1)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (18, N'MINI WORLD', N'Mini World: CREATA là tên gọi mới của Mini World: Block Art, game xây dựng thế giới mở có đồ họa dễ thương cùng lối chơi tự do khám phá hấp dẫn. Nếu bạn muốn tìm điều gì đó mới lạ ở thể loại game sandbox giống Minecraft, thì đừng ngại thử Mini World Block Art 0.58.0.', NULL, 12, 28, N'BG36.jpg', N'Game36.1.jpg', N'Game36.2.jpg', N'Game36.3.jpg', N'Game36.4.jpg', N'3.9', CAST(N'2022-10-24' AS Date), N'1024', 1, 2)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (19, N'BLOSSOM BLAST SAGA', N'Phát triển một khu vườn đầy màu sắc trong trận đấu 3 hoa trò chơi này! Liên kết nụ và làm cho họ nở!  Kết hợp theo cách của bạn thông qua một loạt các cấp độ vườn tự trị ong trong Blossom Blast Saga, một trò chơi liên kết thú vị từ các nhà sản xuất Candy Crush Saga và Farm Heroes Saga! Liên kết những nụ hoa cùng màu để làm cho những bông hoa xinh đẹp nở rộ, và dọn sạch những thảm hoa trước khi bạn hết động tác!  Ghép 3 hoặc nhiều nụ hoa để làm cho thế giới nở rộ thành những màu sắc ngoạn mục. Kết nối nhiều nụ hoa hơn để tạo ra một phản ứng dây chuyền vinh quang và xem điểm số của bạn tăng lên! Thu thập mọi bông hoa và thực hiện theo cách của bạn thông qua các cấp độ vườn tuyệt đẹp trong trò chơi phiêu lưu đầy màu sắc này!', NULL, 5, 23, N'BG37.jpg', N'Game37.1.jpg', N'Game37.2.jpg', N'Game37.3.jpg', N'Game37.4.jpg', N'4.3', CAST(N'2022-10-26' AS Date), N'73.91', 1, 1)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (20, N'MÈO & SÚP', N'Cats & Soup là game mô phỏng có lối chơi đơn giản và đồ họa cực kỳ đáng yêu, xoay quanh một nhóm mèo nấu những món súp ngon lành. Mục tiêu của bạn là thu thập các món ăn để đạt được thành tích, mở khóa công thức mới và những chú mèo mới. Ngay bây giờ bạn có thể chơi game trên các trình giả lập quen thuộc như MEmu hoặc NoxPlayer.', N'https://download.com.vn/cats-and-soup-159271', 11, 29, N'BG38.jpg', N'Game38.1.jpg', N'Game38.2.jpg', N'Game38.3.jpg', N'Game38.4.jpg', N'4.8', CAST(N'2022-10-28' AS Date), N'104', 1, 2)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (21, N'RISE OF KINGDOMS - GAMOTA', N'Rise of Kingdoms: Lost Crusade là một trò chơi chiến thuật được phát triển bởi LilithGames. Tải xuống Rise of Kingdoms: Lost Crusade trên PC với BlueStacks và trở thành người lãnh đạo nền văn minh của riêng bạn. Một trong những nền văn minh thế giới mang tính biểu tượng và có ảnh hưởng nhất đã có vũ khí. Ai Cập đã thức tỉnh, và cuộc chiến giành quyền thống trị hoàn toàn trở nên khốc liệt hơn. Chọn và dẫn dắt một trong 13 nền văn minh hùng mạnh trong lịch sử thế giới. Biến bộ tộc nhỏ của bạn thành một siêu cường toàn cầu không thể ngăn cản với chủ nghĩa thực dụng kinh tế và sức mạnh quân sự. Các quyết định, chiến lược, quan hệ đối tác kinh tế và liên minh quân sự của bạn sẽ quyết định số phận của quốc gia non trẻ của bạn. Không có hai nền văn minh nào giống nhau. Mỗi nền văn minh đều có kiến ​​trúc độc đáo, các đơn vị độc quyền, các kỹ năng và kỹ năng đặc biệt giúp phân biệt chúng với phần còn lại. Là nhà lãnh đạo, bạn phải học cách khai thác tốt nhất lợi thế của mình để đánh bại các đối thủ và củng cố vị thế cường quốc trên thế giới. Chiến đấu và dẫn đầu cùng với một số nhà lãnh đạo được trang hoàng và có ảnh hưởng nhất trong lịch sử, từ Thutmose III đến Cleopatra và hơn thế nữa! Xây dựng một quốc gia có thể đứng vững trước thử thách của thời gian và dẫn dắt dân tộc của bạn đến một thời kỳ hoàng kim thịnh vượng và ảnh hưởng sẽ kéo dài hàng thế kỷ!', N'https://www.bluestacks.com/apps/strategy/rise-of-kingdoms-on-pc.html', 12, 3, N'BG39.jpg', N'Game39.1.jpg', N'Game39.2.jpg', N'Game39.3.jpg', N'Game39.4.jpg', N'4.6', CAST(N'2022-10-27' AS Date), N'942', 1, 2)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (22, N'MY CITY - ENTERTAINMENT TYCOON', N'Xây dựng đường chân trời & trang trí thị trấn! Xin chúc mừng, thị trưởng! Bây giờ bạn đã chịu trách nhiệm về thành phố rất riêng của bạn! Sau khi ghi một chiến thắng vang dội, bây giờ công việc của bạn để đảm bảo rằng thành phố là một niềm vui và giải trí nơi để sinh sống. Tạo và thiết kế thành phố của mình! Xây dựng các tòa nhà thương mại và dân cư và xem thành phố của bạn phát triển từ một thị trấn nhỏ để số vốn giải trí! Đặt tên cho thành phố của bạn và tùy chỉnh hình thức của nó - chọn màu sắc và phong cách, đặt xuống công viên và đường giao thông và cung cấp cho thành phố của bạn một liên lạc của cá tính!', N'https://appsonwindows.com/apk/3522509/', 12, 31, N'BG40.jpg', N'Game40.1.jpg', N'Game40.2.jpg', N'Game40.3.jpg', N'Game40.4.jpg', N'4.6', CAST(N'2022-10-27' AS Date), N'100', 1, 2)
INSERT [dbo].[GAME] ([MaGame], [TenGame], [GioiThieu], [LinkTai], [MaTheLoaiGame], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu]) 
VALUES (23, N'FARMVILLE 2: COUNTRY ESCAPE', N'FarmVille 2: Country Escape là phiên bản mới trong loạt game nông trại nổi tiếng Farmville dành cho người dùng thiết bị di động và Facebook. Nay bạn đã có thể thỏa sức chăm sóc vườn tược, làm các công việc nông trại với phiên bản FarmVille Country Escape dành cho Windows 10.', N'https://download.com.vn/farmville-2-country-escape-85771', 14, 32, N'BG41.jpg', N'Game41.1.jpg', N'Game41.2.jpg', N'Game41.3.jpg', N'Game41.4.jpg', N'4.4', CAST(N'2022-10-23' AS Date), N'145', 1, 1)
SET IDENTITY_INSERT [dbo].[GAME] OFF






-- Input values SEARCHALL
SELECT * FROM SEARCHALL
SET IDENTITY_INSERT [dbo].[SEARCHALL] ON
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (1, N'ADOBE AUDITION CS5', N'Adobe Audition CS5.5 mang các tính năng tốt nhất từ các sản phẩm âm thanh của Adobe vào một gói đa nền tảng duy nhất. Nó tập trung vào hiệu suất cao trong quy trình hậu sản xuất. Một số tính năng trong phiên bản Windows của Adobe Audition 3.0 không khả dụng trong CS5.5. Nhóm phát hành đang tích cực thu thập phản hồi về những tính năng nào là ưu tiên hàng đầu của khách hàng thông qua một cuộc khảo sát công khai. Adobe cũng khuyến khích bạn gửi các yêu cầu tính năng bổ sung mà nhóm thường xuyên xem xét khi lập kế hoạch cho các phiên bản trong tương lai.', N'https://drive.google.com/uc?id=1NDElm5ikrTDcho-uAnBvUJHJuQV9r267&export=download', NULL, 4, N'BGAPP3.jpg', N'APP3.1.jpg', N'APP3.2.jpg', N'APP3.3.jpg', N'APP3.4.jpg', N'4.3', CAST(N'2022-10-21' AS Date), N'512', 6, 2)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (2, N'HAPPY COW', N'HappyCow là một dịch vụ trực tuyến liệt kê các nguồn thực phẩm thuần chay , ăn chay và tốt cho sức khỏe.', N'https://play.google.com/store/apps/details?id=com.hcceg.veg.compassionfree&referrer=utm_source%3Dhappycow%26utm_campaign%3Dmobile_page', NULL, 9, N'BGAPP8.jpg', N'APP8.1.jpg', N'APP8.2.jpg', N'APP8.3.jpg', N'APP8.4.jpg', N'4', CAST(N'2022-10-19' AS Date), N'100', 6, 2)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (3, N'INSTAGRAM', N'Đưa bạn đến gần hơn với những người và những điều bạn yêu thích Kết nối với bạn bè, chia sẻ những gì bạn đang làm hoặc xem những gì mới từ những người khác trên khắp thế giới. Khám phá cộng đồng của chúng tôi, nơi bạn có thể thoải mái là chính mình và chia sẻ mọi thứ, từ những khoảnh khắc hàng ngày đến những điểm nổi bật trong cuộc sống..', N'https://play.google.com/store/apps/details?id=com.instagram.android&hl=vi&gl=US', NULL, 10, N'BGAPP9.jpg', N'APP9.1.jpg', N'APP9.2.jpg', N'APP9.3.jpg', N'APP9.4.jpg', N'4.5', CAST(N'2022-10-18' AS Date), N'200', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (4, N'MESSENGER', N'Một dịch vụ và ứng dụng phần mềm tin nhắn tức thời chia sẻ giao tiếp bằng ký tự và giọng nói . Được tích hợp trên ứng dụng chat của Facebook và được xây dựng trên giao thức MQTT.', N'Mạng xã hội',NULL, 10, N'BGAPP10.jpg', N'APP10.1.jpg', N'APP10.2.jpg', N'APP10.3.jpg', N'APP10.4.jpg', N'4.5', CAST(N'2022-10-10' AS Date), N'200', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (5, N'TIKOK', N'TikTok là một trong những ứng dụng mạng xã hội video phổ biến nhất hiện nay. Ứng dụng hỗ trợ sáng tạo và chia sẻ clip ngắn bằng âm nhạc cực chất, thu hút hàng ngàn người xem và theo dõi. Được phát hành miễn phí trên nhiều nền tảng khác nhau.', N'https://play.google.com/store/apps/details?id=com.ss.android.ugc.trill&hl=vi&gl=US', NULL, 11, N'BGAPP11.jpg', N'APP11.1.jpg', N'APP11.2.jpg', N'APP11.3.jpg', N'APP11.4.jpg', N'4.5', CAST(N'2022-10-11' AS Date), N'84', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (6, N'SHOPEE', N'Shopee là ứng dụng mua bán online giá rẻ với nhiều mặt hàng đa dạng, là sàn giao dịch thương mại điện tử có trụ sở đặt tại Singapore. Ứng dụng được phát hành miễn phí và tương thích với nhiều nền tảng và thiết bị.', N'https://play.google.com/store/apps/details?id=com.shopee.vn&hl=vi&gl=US', NULL, 12, N'BGAPP12.jpg', N'APP12.1.jpg', N'APP12.2.jpg', N'APP12.3.jpg', N'APP12.4.jpg', N'4.4', CAST(N'2022-10-13' AS Date), N'68', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (7, N'YOUTUBE', N'Youtube là một nền tảng chia sẻ video trực tuyến, là ứng dụng mạng xã hội video số một trên thế giới với số lượng video cực khủng và nhiều chủ đề khác nhau. Đây là ứng dụng hoàn toàn miễn phí được phát triển trên nhiều nền tảng và thiết bị khác nhau.', N'https://play.google.com/store/apps/details?id=com.google.android.youtube&hl=vi&gl=US', NULL, 13, N'BGAPP13.jpg', N'APP13.1.jpg', N'APP13.2.jpg', N'APP13.3.jpg', N'APP13.4.jpg', N'4.7', CAST(N'2022-10-14' AS Date), N'85', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (8, N'MICROSOFT WORD', N'Microsoft word là một chương trình soạn thảo văn bản, là ứng dụng tạo và chỉnh sửa tài liệu của hãng Microsoft, có thể giúp bạn soạn thảo theo bố cục đa dạng và chia sẻ dễ dàng. Ứng dụng được phát triển trên nhiều nền tảng, tương thích với hầu hết thiết bị.', N'https://microsoft-word.softonic.vn/', NULL, 3, N'BGAPP14.jpg', N'APP14.1.jpg', N'APP14.2.jpg', N'APP14.3.jpg', N'APP14.4.jpg', N'4.7', CAST(N'2022-10-12' AS Date), N'85', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (9, N'MICROSOFT EXCEL', N'Microsoft Excel là ứng dụng xử lý tác vụ văn phòng giúp tạo và chỉnh sửa trang tính excel phổ biến, chuyên nghiệp nhất hiện tại. Ứng dụng hỗ trợ chức năng thao tác bảng tính cơ bản và các biểu đồ dữ liệu, cùng bộ công cụ hỗ trợ làm công việc xử lý trở nên dễ dàng, tiện lợi hơn bao giờ hết.', N'https://microsoft-excel.softonic.vn/', NULL, 14, N'BGAPP15.jpg', N'APP15.1.jpg', N'APP15.2.jpg', N'APP15.3.jpg', N'APP15.4.jpg', N'4.7', CAST(N'2022-10-08' AS Date), N'90', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (10, N'MICROSOFT POWERPOINT', N' Microsoft Powerpoint là phần mềm tạo trang trình chiếu độc đáo, cùng với tính năng tương tác đa năng như viết tay, cảm biến và giọng nói. Ứng dụng đượcMicrosoft phát hành rộng rãi trên mọi nền tảng thiết bị.', N'https://microsoft-powerpoint-2010.softonic.vn/',NULL, 14, N'BGAPP16.jpg', N'APP16.1.jpg', N'APP16.2.jpg', N'APP16.3.jpg', N'APP16.4.jpg', N'4.3', CAST(N'2022-10-11' AS Date), N'93', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (11, N'DISCORD', N'Discord là một ứng dụng liên lạc dành cho các game thủ, mang các game thủ lại gần nhau hơn và cùng trải qua các trận game đỉnh cao. Ngoài ra cộng đồng game được kết nối với nhau rất đông đảo lên đến hàng triệu thành viên trên ứng dụng này.', N'https://discord.com/download',NULL, 15, N'BGAPP17.jpg', N'APP17.1.jpg', N'APP17.2.jpg', N'APP17.3.jpg', N'APP17.4.jpg', N'4.7', CAST(N'2022-10-12' AS Date), N'80', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (12, N'MICROSOFT PAINT ', N'Được xem là một phần mềm có những tính năng mang tính cách tân và đổi mới, Paint là phần mềm chỉnh sửa ảnh hoàn toàn miễn phí cho Windows. Cùng tìm hiểu bộ công cụ gọn nhẹ nhưng cực kỳ hiệu quả của Paint ngay sau đây nhé!', N'https://vi.downloadastro.com/apps/microsoft_paint/',NULL, 14, N'BGAPP20.jpg', N'APP20.1.jpg', N'APP20.2.jpg', N'APP20.3.jpg', N'APP20.4.jpg', N'4.5', CAST(N'2022-10-08' AS Date), N'49.8', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (13, N'ZALO', N'Zalo là ứng dụng liên lạc đảm bảo kết nối nhanh, ổn định, tiện lợi và riêng tư cho người dùng mọi lúc, mọi nơi, nhanh và ổn định', N'https://zalo.me/pc', NULL, 18, N'BGAPP21.jpg', N'APP21.1.jpg', N'APP21.2.jpg', N'APP21.3.jpg', N'APP21.4.jpg', N'4.5', CAST(N'2022-10-10' AS Date), N'250', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (14, N'ADOBE PHOTOSHOP', N'Adobe Photoshop là phần mềm thiết kế đồ họa, chỉnh sửa ảnh mạnh mẽ được nhiều người dùng ưa chuộng trên toàn thế giới. Adobe Photoshop có đầy đủ công cụ chỉnh sửa ảnh chuyên nghiệp, xoay cắt ghép ảnh dễ dàng, hỗ trợ bạn thỏa sức sáng tạo.', N'https://download.com.vn/download/adobe-photoshop-cs5-extended-22394', NULL, 4, N'BGAPP22.jpg', N'APP22.1.jpg', N'APP22.2.jpg', N'APP22.3.jpg', N'APP22.4.jpg', N'4.4', CAST(N'2022-10-13' AS Date), N'1536', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (15, N'ADOBE LIGHTROOM', N'Adobe Lightroom là phần mềm chỉnh sửa, xử lý ảnh RAW chuyên nghiệp được người dùng ưa chuộng sử dụng với công cụ chỉnh sửa ảnh mạnh mẽ, bạn dễ dàng loại bỏ mắt đó, chỉnh quang sai màu, chỉnh ảnh tự động nhanh chóng.', N'https://creativecloud.adobe.com/apps/download/lightroom',NULL, 4, N'BGAPP23.jpg', N'APP23.1.jpg', N'APP23.2.jpg', N'APP23.3.jpg', N'APP23.4.jpg', N'4.6', CAST(N'2022-10-09' AS Date), N'2304', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (16, N'ADOBE ILLUSTRATOR', N'Adobe Illustrator là trình chỉnh sửa đồ họa vector được phát triển bởi Adobe, phần mềm cho phép bạn thiết kế đồ họa 3D chuyên nghiệp, hình ảnh minh họa, đồ họa kĩ thuật số, nội dung trang web, video và nội dung,...', N'https://taimienphi.vn/download-adobe-illustrator-17074#showlink', 25, 4, N'BGAPP24.jpg', N'APP24.1.jpg', N'APP24.2.jpg', N'APP24.3.jpg', N'APP24.4.jpg', N'4.4', CAST(N'2022-10-07' AS Date), N'1024', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (17, N'ADOBE PREMIERE PRO', N'Adobe Premiere là phần mềm chỉnh sửa video phổ thông được mọi người tin dùng trên khắp thế giới. Phần mềm cung cấp cho người sử dụng tất cả công cụ và tính năng liên quan đến chỉnh sửa video.', N'https://www.adobe.com/products/premiere.html', NULL, 4, N'BGAPP25.jpg', N'APP25.1.jpg', N'APP25.2.jpg', N'APP25.3.jpg', N'APP25.4.jpg', N'4.6', CAST(N'2022-10-07' AS Date), N'9216', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (18, N'LAZADA', N'Lazada là một trong những website mua sắm trực tuyến lớn nhất tại Việt Nam hiện nay (ngoài ra còn có Shopee, META.vn, ZARA, Adayroi...). Đây cũng là một sàn giao dịch thương mại điện tử lớn và uy tín đã góp phần thúc đẩy các dịch vụ mua sắm online tại thị trường nội địa phát triển mạnh mẽ hơn trong những năm vừa qua.', N'https://taimienphi.vn/download-lazada-19510/cho-pc-phien-ban', NULL, 33, N'BGAPP42.jpg', N'APP42.1.jpg', N'APP42.2.jpg', N'APP42.3.jpg', N'APP43.4.jpg', N'4.6', CAST(N'2022-10-09' AS Date), N'80', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (19, N'VIEON', N'Siêu Ứng dụng Giải trí VieON là ứng dụng xem phim truyền hình (phim bộ), phim chiếu rạp (phim lẻ), tivi trực tuyến, show truyền hình thực tế và video giải trí. Phim mới mỗi ngày, show đỉnh độc quyền. Thể thao Ngoại Hạng Anh, La Liga, SerieA, Bundesliga, Ligue 1, V-League, Golf, Tennis.', N'https://taimienphi.vn/download-vieon-75862/taive', NULL, 34, N'BGAPP43.jpg', N'APP43.1.jpg', N'APP43.2.jpg', N'APP43.3.jpg', N'APP43.4.jpg', N'4.2', CAST(N'2022-10-11' AS Date), N'230', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (20, N'NETFLIX', N' Netflix là ứng dụng xem phim được ưa chuộng nhất hiện nay với kho phim chất lượng cao mang lại những giây phút giải trí tuyệt vời cho người dùng', N'https://en.softonic.com/downloads/netflix-for-windows',NULL, 35, N'BGAPP44.jpg', N'APP44.1.jpg', N'APP44.2.jpg', N'APP44.3.jpg', N'APP44.4.jpg', N'4.6', CAST(N'2022-10-08' AS Date), N'180', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (21, N'SPOTIFY', N'Spotify là ứng dụng nghe nhạc được sản xuất bởi Spotify AB tại Thụy Điển. Nó cho phép người sử dụng có quyền truy cập để nghe những ca khúc, bài hát, video,... của các nghệ sĩ trên thế giới. Ứng dụng này có đặc điểm tương tự những app khác như: Apple Music, Zing MP3,..., người dùng có thể nghe nhạc trực tiếp trên đó mà không bị yêu cầu phí bản quyền. Để làm được điều này, Spotify đã chia ra làm hai phiên bản là có phí và miễn phí. Dịch vụ miễn phí có thể nói là một trong những ưu điểm của Spotify so với App nghe nhạc khác.', N'https://spotify.en.softonic.com/', NULL, 36, N'BGAPP45.jpg', N'APP45.1.jpg', N'APP45.2.jpg', N'APP45.3.jpg', N'APP45.4.jpg', N'3.8', CAST(N'2022-10-13' AS Date), N'27', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (22, N'ZING MP3', N'Cùng thưởng thức âm nhạc đỉnh cao với ứng dụng nghe nhạc số 1 Việt Nam  Zing MP3 là ứng dụng nghe nhạc miễn phí hàng đầu Việt Nam. Với kho nhạc chất lượng cao đồ sộ từ Zing mp3 bạn sẽ có trải nghiệm âm nhạc tuyệt vời nhất trên thiết bị di động của mình. ', N'https://vn.ldplayer.net/apps/com-zing-mp3-on-pc.html', NULL, 11, N'BGAPP46.jpg', N'APP46.1.jpg', N'APP46.2.jpg', N'APP46.3.jpg', N'APP46.4.jpg', N'4.3', CAST(N'2022-10-13' AS Date), N'50', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (23, N'GIAOHANGTIETKIEM', N'Ứng dụng giao nhận dành cho các Shop bán hàng online của Giaohangtietkiem.vn  Đây là ứng dụng giao nhận mới dành cho các Shop bán hàng online chuyển phát hàng hóa, phục vụ lấy – giao tại 63 tỉnh thành toàn quốc. Ứng dụng cho phép các Shop bán hàng online tại 63 tỉnh thành trên toàn quốc đăng ký tài khoản, đăng nhập, kiểm tra trạng thái đơn hàng.  Với app, Shop bán hàng online gửi yêu cầu thẳng cho vận hành Giaohangtietkiem để được hỗ trợ nhanh chóng. Mọi phát sinh trong quá trình giao hàng sẽ được thông báo tức thời cho Shop qua ứng dụng, tạo kết nối chặt chẽ và dễ dàng giữa Shop và vận hành.', N'https://appsonwindows.com/apk/1175563/', NULL, 37, N'BGAPP47.jpg', N'APP47.1.jpg', N'APP47.2.jpg', N'APP47.3.jpg', N'APP47.4.jpg', N'4.6', CAST(N'2022-10-14' AS Date), N'91', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (24, N'BILIBILI', N'Cộng đồng xem anime, giải trí và thế giới 2D với bình luận trực tiếp', N'https://www.ldplayer.net/apps/bilibili-on-pc.html', NULL, 38, N'BGAPP48.jpg', N'APP48.1.jpg', N'APP48.2.jpg', N'APP48.3.jpg', N'APP48.4.jpg', N'3.4', CAST(N'2022-10-10' AS Date), N'55', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (25, N'MICROSOFT OUTLOOK', N'Microsoft Outlook là ứng dụng lưu trữ email miễn phí được phát triển và cung cấp bởi Microsoft, cho phép bạn gửi/ nhận email nhanh chóng mà không giới hạn không gian lưu trữ. Ứng dụng còn hỗ trợ việc gửi mail đính kèm tập tin có dung lượng lớn, sắp xếp email theo dung lượng, thời gian nhận, thời gian gửi và nhiều hơn thế nữa.', N'https://microsoft-outlook.softonic.vn/', NULL, 14, N'BGAPP49.jpg', N'APP49.1.jpg', N'APP49.2.jpg', N'APP49.3.jpg', N'APP49.4.jpg', N'4.2', CAST(N'2022-10-11' AS Date), N'120', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (26, N'TRAVELOKA', N'Đặt vé máy bay, khách sạn, vé vui chơi, giải trí, tour du lịch nội địa & quốc tế. Du lịch dễ dàng với Traveloka – người bạn đồng hành đáp ứng mọi nhu cầu du lịch, cùng bạn làm giàu trải nghiệm trong cuộc sống. Là một trong những Siêu ứng dụng du lịch và tiện ích sống hàng đầu tại Đông Nam Á, Traveloka mang đến cho bạn hơn 20 sản phẩm, dịch vụ du lịch cùng vô vàn tính năng tiện lợi', N'https://www.ldplayer.net/apps/traveloka-book-flight-hotel-on-pc.html', NULL, 1, N'BGAPP50.jpg', N'APP50.1.jpg', N'APP50.2.jpg', N'APP50.3.jpg', N'APP50.4.jpg', N'4.8', CAST(N'2022-10-11' AS Date), N'42', 6, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (27, N'FACEBOOK', N'Facebook là một phương tiện truyền thông xã hội và dịch vụ mạng xã hội trực tuyến thành lập vào năm 2004 của Mỹ thuộc sở hữu của Meta Platforms có trụ sở tại Menlo Park, California. Nó được Mark Zuckerberg, cùng với các sinh viên Đại học Harvard và bạn cùng phòng là Eduardo Saverin, Andrew McCollum, Dustin Moskovitz, Chris Hughes sáng lập. Facebook là một mạng xã hội giúp cho chúng ta có thể kết nối với nhau qua một tài khoản ảo.  Trên Facebook chúng ta có thể đăng trạng thái, hình ảnh, video và chia sẻ tất cả những gì mà bạn muốn.  Không những vậy, chúng ta còn có thể kết bạn với những người dùng khác từ khắp nơi trên thế giới và tương tác với những họ qua các tương tác (reation) và bình luận (comment).  Với những người dùng Facebook chuyên nghiệp thì họ tận dụng Facebook để bán hàng, quảng cáo sản phẩm rất hiệu quả ', N'https://download.com.vn/facebook-cho-windows-10-98824', NULL, 3, N'BGAPP6.jpg', N'APP6.1.jpg', N'APP6.2.jpg', N'APP6.3.jpg', N'APP6.4.jpg', N'4.5', CAST(N'2022-10-22' AS Date), N'214', 6, 1)

INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (28, N'SUPRALAND SIX INCHES UNDER', N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland. Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người. Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm. Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng). Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.', N'https://bluemediafiles.homes/url-generator.php?url=KH1TK0eBXmDmljELeo4C+FFvmgHJbc++7psPlN6tioiOAlqFJyJr1Da7TS+/2OydxBiEj9qrLmBRlalrpjeVwHAr6vqfd6J7bAs53bHlBmY=', 6, 25, N'BG1.jpg', N'Game1.1.jpg', N'Game1.2.jpg', N'Game1.3.jpg', N'Game1.4.jpg', N'4.8', CAST(N'2022-10-05' AS Date), N'6144', 1, 4)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (29, N'THE KING OF FIGHTERS XV', N'Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!', N'https://hadoantv.com/download?kind=old&url=https%3A%2F%2Fanotepad.com%2Fnotes%2Fx4asr7ek', 7, 3, N'BG2.jpg', N'Game2.1.jpg', N'Game2.2.jpg', N'Game2.3.jpg', N'Game2.4.jpg', N'4.2', CAST(N'2022-10-06' AS Date), N'8192', 1, 4)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (30, N'GENSHIN IMPACT', N'Trong trò chơi, bạn sẽ khám phá thế giới tuyệt vời của Tey Vat, và các bước của bạn sẽ đưa bạn qua bảy quốc gia để gặp gỡ các nhân vật từ mọi tầng lớp xã hội, những người sẽ đồng hành cùng bạn trong các cuộc chiến đấu và nhiệm vụ của bạn.', N'https://drive.google.com/file/d/1kmZ398KVMYMJws5Rc8dv5EH44XI3rnUw/view', 11, 5, N'BG4.jpg', N'Game4.1.jpg', N'Game4.2.jpg', N'Game4.3.jpg', N'Game4.4.jpg', N'4.7', CAST(N'2022-10-06' AS Date), N'118', 1, 8)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (31, N'FORTNITE', N'Fortnite: Cơn ác mộng bây giờ! DJ Lyka đang đợi bạn tại Tree of Reality để giúp bạn hóa thân thành một sinh vật có năng lực lupin. Săn đối thủ bằng Howler Claws, hoàn thành nhiệm vụ để nhận phần thưởng đặc biệt, đánh bại quái vật hình khối và vui chơi với các vật phẩm được giới thiệu lại. Giữ cho bữa tiệc diễn ra với sự kinh hoàng và thích thú trên những hòn đảo được thiết kế riêng. Khám phá một địa hình có khả năng phá hủy khổng lồ, nơi mỗi trò chơi là duy nhất. Lập nhóm với bạn bè của bạn để giành chiến thắng Royale. Chạy nước rút, leo lên và bắt đầu theo cách của bạn trong khi xây dựng trong Fortnite Battle Royale hoặc chỉ với vũ khí và vật phẩm của bạn trong Fortnite Zero Build. Khám phá thêm nhiều cách chơi với hàng nghìn trò chơi do người sáng tạo thiết kế ở nhiều thể loại: phiêu lưu, nhập vai, sinh tồn ... Hoặc, bạn cũng có thể tham gia lực lượng với tối đa ba người bạn để chống lại lũ quái vật trong Save the World .', N'https://fa.getpedia.net/data?q=3cDOyMTN4UTMyUjMxIDM4MjN8BjNwUTMxwXaz1mLlRXauRncvZWLw0CMtMTMtIXZsxWY0NnbJNWawV0LyIzLyEzLxIDMy8SZslmZvEGdhR2L', 13, 6, N'BG5.jpg', N'Game5.1.jpg', N'Game5.2.jpg', N'Game5.3.jpg', N'Game5.4.jpg', N'4.3', CAST(N'2022-10-07' AS Date), N'8192', 1, 16)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (32, N'FALL GUYS', N'Fall Guys là một trò chơi nhóm nhiều người chơi miễn phí, đa nền tảng, nơi bạn và các đối thủ của mình phải cạnh tranh trong các vòng vượt chướng ngại vật vô lý và hỗn loạn cho đến khi chỉ còn lại người chiến thắng.', N'https://www.fallguys.com/en-US/download', 14, 8, N'BG7.jpg', N'Game7.1.jpg', N'Game7.2.jpg', N'Game7.3.jpg', N'Game7.4.jpg', N'4.5', CAST(N'2022-10-09' AS Date), N'2048', 1, 4)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (33, N'DRAGON CITY', N'Dragon City là game xây dựng thành phố rồng thu hút hàng triệu người chơi trên thế giới. Dragon City đã được bổ sung sự kiện mới liên tục với rất nhiều thử thách hấp dẫn đang chờ đón bạn. Tham gia game luyện rồng “hot” nhất và thu thập rất nhiều loài rồng phun lửa đáng yêu! Đào tạo chúng như ý muốn của bạn, phát triển bộ sưu tập và chức minh sức mạnh của bản thân qua game Dragon Master nổi tiếng thế giới.', N'https://download.com.vn/dragon-city-124530', 13, 16, N'BG18.jpg', N'Game18.1.jpg', N'Game18.2.jpg', N'Game18.3.jpg', N'Game18.4.jpg', N'4.5', CAST(N'2022-10-14' AS Date), N'148', 1, 4)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (34, N'PUBG MOBILE', N'Game Battle Royale nguyên bản, đầu tiên và hay nhất! Game Battle Royale được hơn 1 tỷ người chơi trên toàn thế giới bình chọn.  Kiệt tác huyền thoại battle royale   Nhiều sự kiện đang chờ bạn khám phá   Đạt đến đỉnh cao trong PUBG MOBILE, thỏa sức bắn tùy thích. PUBG MOBILE là trò chơi battle royale nguyên bản trên di động, và là một trong những trò chơi bắn súng hay nhất.  PUBG Mobile - PLAYERUNKNOWN''S BATTLEGROUNDS MOBILE là game bắn súng sinh tồn được yêu thích trên toàn thế giới do Tencent & BlueHole nghiên cứu, phát triển và đã được phát hành chính thức tại Việt Nam, duy nhất bởi VNG.', N'https://download.com.vn/pubg-mobile-124873', 13, 17, N'BG19.jpg', N'Game19.1.jpg', N'Game19.2.jpg', N'Game19.3.jpg', N'Game19.4.jpg', N'4.0', CAST(N'2022-10-16' AS Date), N'689', 1, 4)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (35, N'SUBWAY SURFERS', N'Trong game, người chơi sẽ nhập vai vào những thanh thiếu niên đầy tinh nghịch hàng ngày sơn graffiti trộm lên các toa tàu, khi bị phát hiện, chúng chạy trên những đường ray để thoát khỏi sự truy đuổi của viên thanh tra và con chó của ông ấy. Khi chạy, người chơi có thể điều khiển nhân vật nhặt tiền vàng, chìa khóa, các vật phẩm tăng sức mạnh và các phần thưởng khác trên đường ray. Đồng thời giúp nhân vật tránh xa các chướng ngại vật trên đường đi, trò chơi chỉ kết thúc khi nhân vật bị bắt bởi viên thanh tra hoặc cả hai đều bị cán bởi toa tàu. Các sự kiện đặc biệt như Săn thưởng hàng tuần (Weekly Hunt) có thể giúp người chơi hoàn thành nhiệm vụ và nhận được nhiều phần quà hơn.', N'https://download.com.vn/game-subway-surfers-124415', 12, 19, N'BG26.jpg', N'Game26.1.jpg', N'Game26.2.jpg', N'Game26.3.jpg', N'Game26.4.jpg', N'4.4', CAST(N'2022-10-13' AS Date), N'101', 1, 2)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (36, N'AMONG US', N'Among Us là game nhập vai hành động nhiều người chơi có phong cách khá giống Werewolf Online. Game có chủ đề chính xoay quanh tinh thần đồng đội và sự phản bội dành cho 4-10 người chơi trong bối cảnh không gian.', NULL, 14, 20, N'BG27.jpg', N'Game27.1.jpg', N'Game27.2.jpg', N'Game27.3.jpg', N'Game27.4.jpg', N'4.5', CAST(N'2022-10-18' AS Date), N'80', 1, 4)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (37, N'LIÊN QUÂN MOBILE', N'Garena Liên Quân Mobile là tựa game chiến thuật đỉnh cao trên Android lẫn iOS. Tuy nhiên, bạn hoàn toàn có thể trải nghiệm trên máy tính thông qua bộ giả lập LDPlayer có gắn kèm game Liên Quân Mobile. Cho người chơi thỏa sức tham gia cuộc chiến 10vs10 nảy lửa trên mọi thiết bị, ở mọi lúc mọi nơi.', N'https://download.com.vn/garena-lien-quan-mobile-124385', 11, 21, N'BG28.jpg', N'Game28.1.jpg', N'Game28.2.jpg', N'Game28.3.jpg', N'Game28.4.jpg', N'3.5', CAST(N'2022-10-19' AS Date), N'148', 1, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (38, N'PLANTS VS ZOMBIES 2', N'Plants vs Zombies 2 là sự trở lại đầy ngoạn mục của siêu phẩm thủ thành “Hoa quả nổi giận”. Mặc dù game chỉ có 2 phiên bản độc quyền dành cho di động nhưng nay bạn đã có thể chơi Plants vs Zombies 2 cho máy tính thông qua phần mềm giả lập BlueStacks.', N'https://download.com.vn/plants-vs-zombies-2-124458', 11, 22, N'BG29.jpg', N'Game29.1.jpg', N'Game29.2.jpg', N'Game29.3.jpg', N'Game29.4.jpg', N'4.1', CAST(N'2022-10-15' AS Date), N'775', 1, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (39, N'CANDY CRUSH SAGA', N'Chắc hẳn ai cũng đã từng nghe đến Candy Crush Saga, tựa game xếp kẹo đình đám trên thiết bị di động và mạng xã hội. Giờ đây bạn đã có thể tải Candy Crush về máy tính của mình và thỏa sức giải trí với trò chơi thú vị này.', N'https://download.com.vn/candy-crush-saga-pc-85557', 11, 23, N'BG30.jpg', N'Game30.1.jpg', N'Game30.2.jpg', N'Game30.3.jpg', N'Game30.4.jpg', N'4.6', CAST(N'2022-10-14' AS Date), N'79', 1, 2)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (40, N'FARM HEROES SAGA', N'Thông qua giả lập Tencent Buddy, bạn có thể chơi game Farm Heroes Saga trên máy tính. Farm Heroes Saga PC là game xếp hình match-3 vô cùng thú vị trong thế giới nông trại và cỏ cây hoa lá siêu đáng yêu!', N'https://download.com.vn/farm-heroes-saga-pc-124697', 11, 23, N'BG31.jpg', N'Game31.1.jpg', N'Game31.2.jpg', N'Game31.3.jpg', N'Game31.4.jpg', N'4.6', CAST(N'2022-10-20' AS Date), N'82', 1, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (41, N'MEGA ĐẠI CHIẾN', N'Mega Đại Chiến là một tựa game chiến thuật đấu Pet được xây dựng dựa trên bộ phim hoạt hình nổi tiếng Pokémon, đang được nhiều người yêu thích và chơi hiện nay. Trong trò chơi này, người chơi sẽ hóa thân thành một huấn luyện viên để chiêu mộ và huấn luyện Pet để chinh phục các đấu trường vô cùng khốc liệt. Khi tham gia vào tựa game này, bạn sẽ được đưa tới một thế giới Pokémon đa dạng, với sức mạnh, cấp độ tiến hóa khác nhau. Ngoài ra, ở game này còn có hiệu ứng thời tiết vô cùng ấn tượng, chúng ta sẽ được thấy những hiện tượng thời tiết như: nắng, mưa, bão tố, bão lửa, tia sét,...', N'https://vn.ldplayer.net/games/com-megagame-daichien-on-pc.html', 11, 24, N'BG32.jpg', N'Game32.1.jpg', N'Game32.2.jpg', N'Game32.3.jpg', N'Game32.4.jpg', N'3.7', CAST(N'2022-10-19' AS Date), N'483', 1, 2)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (42, N'HOMESCAPES', N'Chào mừng bạn đến với Homescapes, một trò chơi thực sự ấm lòng từ sê-ri Playrix Scapes ™!  Giải các câu đố match-3 để khôi phục một dinh thự tuyệt vời trên một con phố xanh tươi.  Cuộc phiêu lưu thú vị bắt đầu trước ngưỡng cửa!   Đánh bại các cấp độ trận đấu 3 đầy màu sắc để cải tạo và trang trí các phòng trong biệt thự, mở khóa nhiều chương hơn nữa trong câu chuyện gia đình thú vị trên đường đi!  Bạn còn chờ gì nữa?  Tự nhiên như ở nhà!', N'https://www.malavida.com/en/soft/homescapes/', 5, 25, N'BG33.jpg', N'Game33.1.jpg', N'Game33.2.jpg', N'Game33.3.jpg', N'Game33.4.jpg', N'4.3', CAST(N'2022-10-18' AS Date), N'141', 1, 2)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (43, N'KHU VƯỜN TRÊN MÂY', N'Khu vườn trên mây là game nông trại miễn phí do Zing Play phát hành trên di động. Để chơi Khu vườn trên mây bạn có thể cài đặt Khu vườn trên mây thông qua các phần mềm giả lập Android như BlueStacks, LDPlayer, vv. Tải game Khu vườn trên mây để sẵn sàng khám phá nông trại trên địa đàng độc đáo này. Tựa game Khu vườn trên mây chắc hẳn không còn mấy xa lạ với những ai yêu thích dòng game nông trại. Đến với Khu vườn trên mây bạn sẽ được trở thành một người nông dân đặc biệt để chăm sóc khu vườn trên mây với những điều vô cùng thú vị.', N'https://download.com.vn/khu-vuon-tren-may-124423', 10, 26, N'BG34.jpg', N'Game34.1.jpg', N'Game34.2.jpg', N'Game34.3.jpg', N'Game34.4.jpg', N'4.5', CAST(N'2022-10-22' AS Date), N'108', 1, 2)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (44, N'SAVE THE DOGE', N'Bạn có thích chơi game giải đố không? Save the Doge là một trò chơi trí tuệ vui nhộn, thách thức người chơi giải cứu chú chó khỏi bị ong đốt. Hãy tìm cách vẽ một đường duy nhất để cứu chú chó dễ thương này trong mỗi màn chơi nhé!', N'https://download.com.vn/save-the-doge-164981', 5, 27, N'BG35.jpg', N'Game35.1.jpg', N'Game35.2.jpg', N'Game35.3.jpg', N'Game35.4.jpg', N'3.2', CAST(N'2022-10-23' AS Date), N'35', 1, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (45, N'MINI WORLD', N'Mini World: CREATA là tên gọi mới của Mini World: Block Art, game xây dựng thế giới mở có đồ họa dễ thương cùng lối chơi tự do khám phá hấp dẫn. Nếu bạn muốn tìm điều gì đó mới lạ ở thể loại game sandbox giống Minecraft, thì đừng ngại thử Mini World Block Art 0.58.0.', NULL, 12, 28, N'BG36.jpg', N'Game36.1.jpg', N'Game36.2.jpg', N'Game36.3.jpg', N'Game36.4.jpg', N'3.9', CAST(N'2022-10-24' AS Date), N'1024', 1, 2)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (46, N'BLOSSOM BLAST SAGA', N'Phát triển một khu vườn đầy màu sắc trong trận đấu 3 hoa trò chơi này! Liên kết nụ và làm cho họ nở!  Kết hợp theo cách của bạn thông qua một loạt các cấp độ vườn tự trị ong trong Blossom Blast Saga, một trò chơi liên kết thú vị từ các nhà sản xuất Candy Crush Saga và Farm Heroes Saga! Liên kết những nụ hoa cùng màu để làm cho những bông hoa xinh đẹp nở rộ, và dọn sạch những thảm hoa trước khi bạn hết động tác!  Ghép 3 hoặc nhiều nụ hoa để làm cho thế giới nở rộ thành những màu sắc ngoạn mục. Kết nối nhiều nụ hoa hơn để tạo ra một phản ứng dây chuyền vinh quang và xem điểm số của bạn tăng lên! Thu thập mọi bông hoa và thực hiện theo cách của bạn thông qua các cấp độ vườn tuyệt đẹp trong trò chơi phiêu lưu đầy màu sắc này!', NULL, 5, 23, N'BG37.jpg', N'Game37.1.jpg', N'Game37.2.jpg', N'Game37.3.jpg', N'Game37.4.jpg', N'4.3', CAST(N'2022-10-26' AS Date), N'73.91', 1, 1)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (47, N'MÈO & SÚP', N'Cats & Soup là game mô phỏng có lối chơi đơn giản và đồ họa cực kỳ đáng yêu, xoay quanh một nhóm mèo nấu những món súp ngon lành. Mục tiêu của bạn là thu thập các món ăn để đạt được thành tích, mở khóa công thức mới và những chú mèo mới. Ngay bây giờ bạn có thể chơi game trên các trình giả lập quen thuộc như MEmu hoặc NoxPlayer.', N'https://download.com.vn/cats-and-soup-159271', 11, 29, N'BG38.jpg', N'Game38.1.jpg', N'Game38.2.jpg', N'Game38.3.jpg', N'Game38.4.jpg', N'4.8', CAST(N'2022-10-28' AS Date), N'104', 1, 2)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (48, N'RISE OF KINGDOMS - GAMOTA', N'Rise of Kingdoms: Lost Crusade là một trò chơi chiến thuật được phát triển bởi LilithGames. Tải xuống Rise of Kingdoms: Lost Crusade trên PC với BlueStacks và trở thành người lãnh đạo nền văn minh của riêng bạn. Một trong những nền văn minh thế giới mang tính biểu tượng và có ảnh hưởng nhất đã có vũ khí. Ai Cập đã thức tỉnh, và cuộc chiến giành quyền thống trị hoàn toàn trở nên khốc liệt hơn. Chọn và dẫn dắt một trong 13 nền văn minh hùng mạnh trong lịch sử thế giới. Biến bộ tộc nhỏ của bạn thành một siêu cường toàn cầu không thể ngăn cản với chủ nghĩa thực dụng kinh tế và sức mạnh quân sự. Các quyết định, chiến lược, quan hệ đối tác kinh tế và liên minh quân sự của bạn sẽ quyết định số phận của quốc gia non trẻ của bạn. Không có hai nền văn minh nào giống nhau. Mỗi nền văn minh đều có kiến ​​trúc độc đáo, các đơn vị độc quyền, các kỹ năng và kỹ năng đặc biệt giúp phân biệt chúng với phần còn lại. Là nhà lãnh đạo, bạn phải học cách khai thác tốt nhất lợi thế của mình để đánh bại các đối thủ và củng cố vị thế cường quốc trên thế giới. Chiến đấu và dẫn đầu cùng với một số nhà lãnh đạo được trang hoàng và có ảnh hưởng nhất trong lịch sử, từ Thutmose III đến Cleopatra và hơn thế nữa! Xây dựng một quốc gia có thể đứng vững trước thử thách của thời gian và dẫn dắt dân tộc của bạn đến một thời kỳ hoàng kim thịnh vượng và ảnh hưởng sẽ kéo dài hàng thế kỷ!', N'https://www.bluestacks.com/apps/strategy/rise-of-kingdoms-on-pc.html', 12, 3, N'BG39.jpg', N'Game39.1.jpg', N'Game39.2.jpg', N'Game39.3.jpg', N'Game39.4.jpg', N'4.6', CAST(N'2022-10-27' AS Date), N'942', 1, 2)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (49, N'MY CITY - ENTERTAINMENT TYCOON', N'Xây dựng đường chân trời & trang trí thị trấn! Xin chúc mừng, thị trưởng! Bây giờ bạn đã chịu trách nhiệm về thành phố rất riêng của bạn! Sau khi ghi một chiến thắng vang dội, bây giờ công việc của bạn để đảm bảo rằng thành phố là một niềm vui và giải trí nơi để sinh sống. Tạo và thiết kế thành phố của mình! Xây dựng các tòa nhà thương mại và dân cư và xem thành phố của bạn phát triển từ một thị trấn nhỏ để số vốn giải trí! Đặt tên cho thành phố của bạn và tùy chỉnh hình thức của nó - chọn màu sắc và phong cách, đặt xuống công viên và đường giao thông và cung cấp cho thành phố của bạn một liên lạc của cá tính!', N'https://appsonwindows.com/apk/3522509/', 12, 31, N'BG40.jpg', N'Game40.1.jpg', N'Game40.2.jpg', N'Game40.3.jpg', N'Game40.4.jpg', N'4.6', CAST(N'2022-10-27' AS Date), N'100', 1, 2)
INSERT [dbo].[SEARCHALL] ([MaSearch], [TenSearch], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (50, N'FARMVILLE 2: COUNTRY ESCAPE', N'FarmVille 2: Country Escape là phiên bản mới trong loạt game nông trại nổi tiếng Farmville dành cho người dùng thiết bị di động và Facebook. Nay bạn đã có thể thỏa sức chăm sóc vườn tược, làm các công việc nông trại với phiên bản FarmVille Country Escape dành cho Windows 10.', N'https://download.com.vn/farmville-2-country-escape-85771', 14, 32, N'BG41.jpg', N'Game41.1.jpg', N'Game41.2.jpg', N'Game41.3.jpg', N'Game41.4.jpg', N'4.4', CAST(N'2022-10-23' AS Date), N'145', 1, 1)
SET IDENTITY_INSERT [dbo].[SEARCHALL] OFF

select * from searchall
Update Searchall
set DonGia=300000
where MaSearch = 1
Update Searchall
set DonGia=2500000
where MaSearch = 2
Update Searchall
set DonGia=267250
where MaSearch = 3
Update Searchall
set DonGia=150000
where MaSearch = 4
Update Searchall
set DonGia=258500
where MaSearch = 5
Update Searchall
set DonGia=800000
where MaSearch = 6
Update Searchall
set DonGia=1000000
where MaSearch = 7
Update Searchall
set DonGia=250620
where MaSearch = 8
Update Searchall
set DonGia=1500000
where MaSearch = 9

select * from THELOAIAPP


select * from APP

Update APP
set MaTheLoaiApp=15
where MaApp = 1

Update APP
set MaTheLoaiApp=16
where MaApp = 2
Update APP
set MaTheLoaiApp=16
where MaApp = 3
Update APP
set MaTheLoaiApp=20
where MaApp = 4

Update APP
set MaTheLoaiApp=24
where MaApp = 5
Update APP
set MaTheLoaiApp=24
where MaApp = 6
Update APP
set MaTheLoaiApp=24
where MaApp = 7
Update APP
set MaTheLoaiApp=24
where MaApp = 8


SET IDENTITY_INSERT [dbo].[THELOAI] ON 

INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (1, N'Giải Đố')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (2, N'Phiêu Lưu')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (3, N'3D')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (4, N'Đối Kháng')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (5, N'Hành Động')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (6, N'Nhập Vai')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (7, N'Mở Rộng Thế Giới')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (8, N'Bắn Súng')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (9, N'Party')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (10, N'Chiến Thuật')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (11, N'Đấu Pet')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (12, N'Nông Trại')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (13, N'Giải Trí')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (14, N'Góc Nhìn Thứ Nhất')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (15, N'Marketing')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (16, N'Mạng Xã Hội')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (17, N'Dịch Vụ Đặt Đồ Ăn')

INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (18, N'Chỉnh Sửa Video')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (19, N'Sàn Giao Dịch Thương Mại Điện Tử')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (20, N'Dịch Vụ Lưu Trữ Video')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (21, N'Ứng Dụng Văn Phòng')

INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (22, N'Đồ Họa')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (23, N'Mô Phỏng')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (24, N'Âm Nhạc')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (25, N'Dịch Vụ Du Lịch')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (26, N'Dịch Vụ Giao Hàng')
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai]) 
VALUES (27, N'Tiện Ích')
SET IDENTITY_INSERT [dbo].[THELOAI] OFF



-- Input values SEARCHALL
SELECT * FROM OVERALL
SET IDENTITY_INSERT [dbo].[OVERALL] ON
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (1, N'ADOBE AUDITION CS5', N'Adobe Audition CS5.5 mang các tính năng tốt nhất từ các sản phẩm âm thanh của Adobe vào một gói đa nền tảng duy nhất. Nó tập trung vào hiệu suất cao trong quy trình hậu sản xuất. Một số tính năng trong phiên bản Windows của Adobe Audition 3.0 không khả dụng trong CS5.5. Nhóm phát hành đang tích cực thu thập phản hồi về những tính năng nào là ưu tiên hàng đầu của khách hàng thông qua một cuộc khảo sát công khai. Adobe cũng khuyến khích bạn gửi các yêu cầu tính năng bổ sung mà nhóm thường xuyên xem xét khi lập kế hoạch cho các phiên bản trong tương lai.', N'https://drive.google.com/uc?id=1NDElm5ikrTDcho-uAnBvUJHJuQV9r267&export=download', NULL, 4, N'BGAPP3.jpg', N'APP3.1.jpg', N'APP3.2.jpg', N'APP3.3.jpg', N'APP3.4.jpg', N'4.3', CAST(N'2022-10-21' AS Date), N'512', 6, 2)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (2, N'HAPPY COW', N'HappyCow là một dịch vụ trực tuyến liệt kê các nguồn thực phẩm thuần chay , ăn chay và tốt cho sức khỏe.', N'https://play.google.com/store/apps/details?id=com.hcceg.veg.compassionfree&referrer=utm_source%3Dhappycow%26utm_campaign%3Dmobile_page', NULL, 9, N'BGAPP8.jpg', N'APP8.1.jpg', N'APP8.2.jpg', N'APP8.3.jpg', N'APP8.4.jpg', N'4', CAST(N'2022-10-19' AS Date), N'100', 6, 2)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (3, N'INSTAGRAM', N'Đưa bạn đến gần hơn với những người và những điều bạn yêu thích Kết nối với bạn bè, chia sẻ những gì bạn đang làm hoặc xem những gì mới từ những người khác trên khắp thế giới. Khám phá cộng đồng của chúng tôi, nơi bạn có thể thoải mái là chính mình và chia sẻ mọi thứ, từ những khoảnh khắc hàng ngày đến những điểm nổi bật trong cuộc sống..', N'https://play.google.com/store/apps/details?id=com.instagram.android&hl=vi&gl=US', NULL, 10, N'BGAPP9.jpg', N'APP9.1.jpg', N'APP9.2.jpg', N'APP9.3.jpg', N'APP9.4.jpg', N'4.5', CAST(N'2022-10-18' AS Date), N'200', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (4, N'MESSENGER', N'Một dịch vụ và ứng dụng phần mềm tin nhắn tức thời chia sẻ giao tiếp bằng ký tự và giọng nói . Được tích hợp trên ứng dụng chat của Facebook và được xây dựng trên giao thức MQTT.', N'Mạng xã hội',NULL, 10, N'BGAPP10.jpg', N'APP10.1.jpg', N'APP10.2.jpg', N'APP10.3.jpg', N'APP10.4.jpg', N'4.5', CAST(N'2022-10-10' AS Date), N'200', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (5, N'TIKOK', N'TikTok là một trong những ứng dụng mạng xã hội video phổ biến nhất hiện nay. Ứng dụng hỗ trợ sáng tạo và chia sẻ clip ngắn bằng âm nhạc cực chất, thu hút hàng ngàn người xem và theo dõi. Được phát hành miễn phí trên nhiều nền tảng khác nhau.', N'https://play.google.com/store/apps/details?id=com.ss.android.ugc.trill&hl=vi&gl=US', NULL, 11, N'BGAPP11.jpg', N'APP11.1.jpg', N'APP11.2.jpg', N'APP11.3.jpg', N'APP11.4.jpg', N'4.5', CAST(N'2022-10-11' AS Date), N'84', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (6, N'SHOPEE', N'Shopee là ứng dụng mua bán online giá rẻ với nhiều mặt hàng đa dạng, là sàn giao dịch thương mại điện tử có trụ sở đặt tại Singapore. Ứng dụng được phát hành miễn phí và tương thích với nhiều nền tảng và thiết bị.', N'https://play.google.com/store/apps/details?id=com.shopee.vn&hl=vi&gl=US', NULL, 12, N'BGAPP12.jpg', N'APP12.1.jpg', N'APP12.2.jpg', N'APP12.3.jpg', N'APP12.4.jpg', N'4.4', CAST(N'2022-10-13' AS Date), N'68', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (7, N'YOUTUBE', N'Youtube là một nền tảng chia sẻ video trực tuyến, là ứng dụng mạng xã hội video số một trên thế giới với số lượng video cực khủng và nhiều chủ đề khác nhau. Đây là ứng dụng hoàn toàn miễn phí được phát triển trên nhiều nền tảng và thiết bị khác nhau.', N'https://play.google.com/store/apps/details?id=com.google.android.youtube&hl=vi&gl=US', NULL, 13, N'BGAPP13.jpg', N'APP13.1.jpg', N'APP13.2.jpg', N'APP13.3.jpg', N'APP13.4.jpg', N'4.7', CAST(N'2022-10-14' AS Date), N'85', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (8, N'MICROSOFT WORD', N'Microsoft word là một chương trình soạn thảo văn bản, là ứng dụng tạo và chỉnh sửa tài liệu của hãng Microsoft, có thể giúp bạn soạn thảo theo bố cục đa dạng và chia sẻ dễ dàng. Ứng dụng được phát triển trên nhiều nền tảng, tương thích với hầu hết thiết bị.', N'https://microsoft-word.softonic.vn/', NULL, 3, N'BGAPP14.jpg', N'APP14.1.jpg', N'APP14.2.jpg', N'APP14.3.jpg', N'APP14.4.jpg', N'4.7', CAST(N'2022-10-12' AS Date), N'85', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (9, N'MICROSOFT EXCEL', N'Microsoft Excel là ứng dụng xử lý tác vụ văn phòng giúp tạo và chỉnh sửa trang tính excel phổ biến, chuyên nghiệp nhất hiện tại. Ứng dụng hỗ trợ chức năng thao tác bảng tính cơ bản và các biểu đồ dữ liệu, cùng bộ công cụ hỗ trợ làm công việc xử lý trở nên dễ dàng, tiện lợi hơn bao giờ hết.', N'https://microsoft-excel.softonic.vn/', NULL, 14, N'BGAPP15.jpg', N'APP15.1.jpg', N'APP15.2.jpg', N'APP15.3.jpg', N'APP15.4.jpg', N'4.7', CAST(N'2022-10-08' AS Date), N'90', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (10, N'MICROSOFT POWERPOINT', N' Microsoft Powerpoint là phần mềm tạo trang trình chiếu độc đáo, cùng với tính năng tương tác đa năng như viết tay, cảm biến và giọng nói. Ứng dụng đượcMicrosoft phát hành rộng rãi trên mọi nền tảng thiết bị.', N'https://microsoft-powerpoint-2010.softonic.vn/',NULL, 14, N'BGAPP16.jpg', N'APP16.1.jpg', N'APP16.2.jpg', N'APP16.3.jpg', N'APP16.4.jpg', N'4.3', CAST(N'2022-10-11' AS Date), N'93', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (11, N'DISCORD', N'Discord là một ứng dụng liên lạc dành cho các game thủ, mang các game thủ lại gần nhau hơn và cùng trải qua các trận game đỉnh cao. Ngoài ra cộng đồng game được kết nối với nhau rất đông đảo lên đến hàng triệu thành viên trên ứng dụng này.', N'https://discord.com/download',NULL, 15, N'BGAPP17.jpg', N'APP17.1.jpg', N'APP17.2.jpg', N'APP17.3.jpg', N'APP17.4.jpg', N'4.7', CAST(N'2022-10-12' AS Date), N'80', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (12, N'MICROSOFT PAINT ', N'Được xem là một phần mềm có những tính năng mang tính cách tân và đổi mới, Paint là phần mềm chỉnh sửa ảnh hoàn toàn miễn phí cho Windows. Cùng tìm hiểu bộ công cụ gọn nhẹ nhưng cực kỳ hiệu quả của Paint ngay sau đây nhé!', N'https://vi.downloadastro.com/apps/microsoft_paint/',NULL, 14, N'BGAPP20.jpg', N'APP20.1.jpg', N'APP20.2.jpg', N'APP20.3.jpg', N'APP20.4.jpg', N'4.5', CAST(N'2022-10-08' AS Date), N'49.8', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (13, N'ZALO', N'Zalo là ứng dụng liên lạc đảm bảo kết nối nhanh, ổn định, tiện lợi và riêng tư cho người dùng mọi lúc, mọi nơi, nhanh và ổn định', N'https://zalo.me/pc', NULL, 18, N'BGAPP21.jpg', N'APP21.1.jpg', N'APP21.2.jpg', N'APP21.3.jpg', N'APP21.4.jpg', N'4.5', CAST(N'2022-10-10' AS Date), N'250', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (14, N'ADOBE PHOTOSHOP', N'Adobe Photoshop là phần mềm thiết kế đồ họa, chỉnh sửa ảnh mạnh mẽ được nhiều người dùng ưa chuộng trên toàn thế giới. Adobe Photoshop có đầy đủ công cụ chỉnh sửa ảnh chuyên nghiệp, xoay cắt ghép ảnh dễ dàng, hỗ trợ bạn thỏa sức sáng tạo.', N'https://download.com.vn/download/adobe-photoshop-cs5-extended-22394', NULL, 4, N'BGAPP22.jpg', N'APP22.1.jpg', N'APP22.2.jpg', N'APP22.3.jpg', N'APP22.4.jpg', N'4.4', CAST(N'2022-10-13' AS Date), N'1536', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (15, N'ADOBE LIGHTROOM', N'Adobe Lightroom là phần mềm chỉnh sửa, xử lý ảnh RAW chuyên nghiệp được người dùng ưa chuộng sử dụng với công cụ chỉnh sửa ảnh mạnh mẽ, bạn dễ dàng loại bỏ mắt đó, chỉnh quang sai màu, chỉnh ảnh tự động nhanh chóng.', N'https://creativecloud.adobe.com/apps/download/lightroom',NULL, 4, N'BGAPP23.jpg', N'APP23.1.jpg', N'APP23.2.jpg', N'APP23.3.jpg', N'APP23.4.jpg', N'4.6', CAST(N'2022-10-09' AS Date), N'2304', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (16, N'ADOBE ILLUSTRATOR', N'Adobe Illustrator là trình chỉnh sửa đồ họa vector được phát triển bởi Adobe, phần mềm cho phép bạn thiết kế đồ họa 3D chuyên nghiệp, hình ảnh minh họa, đồ họa kĩ thuật số, nội dung trang web, video và nội dung,...', N'https://taimienphi.vn/download-adobe-illustrator-17074#showlink', 25, 4, N'BGAPP24.jpg', N'APP24.1.jpg', N'APP24.2.jpg', N'APP24.3.jpg', N'APP24.4.jpg', N'4.4', CAST(N'2022-10-07' AS Date), N'1024', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (17, N'ADOBE PREMIERE PRO', N'Adobe Premiere là phần mềm chỉnh sửa video phổ thông được mọi người tin dùng trên khắp thế giới. Phần mềm cung cấp cho người sử dụng tất cả công cụ và tính năng liên quan đến chỉnh sửa video.', N'https://www.adobe.com/products/premiere.html', NULL, 4, N'BGAPP25.jpg', N'APP25.1.jpg', N'APP25.2.jpg', N'APP25.3.jpg', N'APP25.4.jpg', N'4.6', CAST(N'2022-10-07' AS Date), N'9216', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (18, N'LAZADA', N'Lazada là một trong những website mua sắm trực tuyến lớn nhất tại Việt Nam hiện nay (ngoài ra còn có Shopee, META.vn, ZARA, Adayroi...). Đây cũng là một sàn giao dịch thương mại điện tử lớn và uy tín đã góp phần thúc đẩy các dịch vụ mua sắm online tại thị trường nội địa phát triển mạnh mẽ hơn trong những năm vừa qua.', N'https://taimienphi.vn/download-lazada-19510/cho-pc-phien-ban', NULL, 33, N'BGAPP42.jpg', N'APP42.1.jpg', N'APP42.2.jpg', N'APP42.3.jpg', N'APP43.4.jpg', N'4.6', CAST(N'2022-10-09' AS Date), N'80', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (19, N'VIEON', N'Siêu Ứng dụng Giải trí VieON là ứng dụng xem phim truyền hình (phim bộ), phim chiếu rạp (phim lẻ), tivi trực tuyến, show truyền hình thực tế và video giải trí. Phim mới mỗi ngày, show đỉnh độc quyền. Thể thao Ngoại Hạng Anh, La Liga, SerieA, Bundesliga, Ligue 1, V-League, Golf, Tennis.', N'https://taimienphi.vn/download-vieon-75862/taive', NULL, 34, N'BGAPP43.jpg', N'APP43.1.jpg', N'APP43.2.jpg', N'APP43.3.jpg', N'APP43.4.jpg', N'4.2', CAST(N'2022-10-11' AS Date), N'230', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (20, N'NETFLIX', N' Netflix là ứng dụng xem phim được ưa chuộng nhất hiện nay với kho phim chất lượng cao mang lại những giây phút giải trí tuyệt vời cho người dùng', N'https://en.softonic.com/downloads/netflix-for-windows',NULL, 35, N'BGAPP44.jpg', N'APP44.1.jpg', N'APP44.2.jpg', N'APP44.3.jpg', N'APP44.4.jpg', N'4.6', CAST(N'2022-10-08' AS Date), N'180', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (21, N'SPOTIFY', N'Spotify là ứng dụng nghe nhạc được sản xuất bởi Spotify AB tại Thụy Điển. Nó cho phép người sử dụng có quyền truy cập để nghe những ca khúc, bài hát, video,... của các nghệ sĩ trên thế giới. Ứng dụng này có đặc điểm tương tự những app khác như: Apple Music, Zing MP3,..., người dùng có thể nghe nhạc trực tiếp trên đó mà không bị yêu cầu phí bản quyền. Để làm được điều này, Spotify đã chia ra làm hai phiên bản là có phí và miễn phí. Dịch vụ miễn phí có thể nói là một trong những ưu điểm của Spotify so với App nghe nhạc khác.', N'https://spotify.en.softonic.com/', NULL, 36, N'BGAPP45.jpg', N'APP45.1.jpg', N'APP45.2.jpg', N'APP45.3.jpg', N'APP45.4.jpg', N'3.8', CAST(N'2022-10-13' AS Date), N'27', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (22, N'ZING MP3', N'Cùng thưởng thức âm nhạc đỉnh cao với ứng dụng nghe nhạc số 1 Việt Nam  Zing MP3 là ứng dụng nghe nhạc miễn phí hàng đầu Việt Nam. Với kho nhạc chất lượng cao đồ sộ từ Zing mp3 bạn sẽ có trải nghiệm âm nhạc tuyệt vời nhất trên thiết bị di động của mình. ', N'https://vn.ldplayer.net/apps/com-zing-mp3-on-pc.html', NULL, 11, N'BGAPP46.jpg', N'APP46.1.jpg', N'APP46.2.jpg', N'APP46.3.jpg', N'APP46.4.jpg', N'4.3', CAST(N'2022-10-13' AS Date), N'50', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (23, N'GIAOHANGTIETKIEM', N'Ứng dụng giao nhận dành cho các Shop bán hàng online của Giaohangtietkiem.vn  Đây là ứng dụng giao nhận mới dành cho các Shop bán hàng online chuyển phát hàng hóa, phục vụ lấy – giao tại 63 tỉnh thành toàn quốc. Ứng dụng cho phép các Shop bán hàng online tại 63 tỉnh thành trên toàn quốc đăng ký tài khoản, đăng nhập, kiểm tra trạng thái đơn hàng.  Với app, Shop bán hàng online gửi yêu cầu thẳng cho vận hành Giaohangtietkiem để được hỗ trợ nhanh chóng. Mọi phát sinh trong quá trình giao hàng sẽ được thông báo tức thời cho Shop qua ứng dụng, tạo kết nối chặt chẽ và dễ dàng giữa Shop và vận hành.', N'https://appsonwindows.com/apk/1175563/', NULL, 37, N'BGAPP47.jpg', N'APP47.1.jpg', N'APP47.2.jpg', N'APP47.3.jpg', N'APP47.4.jpg', N'4.6', CAST(N'2022-10-14' AS Date), N'91', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (24, N'BILIBILI', N'Cộng đồng xem anime, giải trí và thế giới 2D với bình luận trực tiếp', N'https://www.ldplayer.net/apps/bilibili-on-pc.html', NULL, 38, N'BGAPP48.jpg', N'APP48.1.jpg', N'APP48.2.jpg', N'APP48.3.jpg', N'APP48.4.jpg', N'3.4', CAST(N'2022-10-10' AS Date), N'55', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (25, N'MICROSOFT OUTLOOK', N'Microsoft Outlook là ứng dụng lưu trữ email miễn phí được phát triển và cung cấp bởi Microsoft, cho phép bạn gửi/ nhận email nhanh chóng mà không giới hạn không gian lưu trữ. Ứng dụng còn hỗ trợ việc gửi mail đính kèm tập tin có dung lượng lớn, sắp xếp email theo dung lượng, thời gian nhận, thời gian gửi và nhiều hơn thế nữa.', N'https://microsoft-outlook.softonic.vn/', NULL, 14, N'BGAPP49.jpg', N'APP49.1.jpg', N'APP49.2.jpg', N'APP49.3.jpg', N'APP49.4.jpg', N'4.2', CAST(N'2022-10-11' AS Date), N'120', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (26, N'TRAVELOKA', N'Đặt vé máy bay, khách sạn, vé vui chơi, giải trí, tour du lịch nội địa & quốc tế. Du lịch dễ dàng với Traveloka – người bạn đồng hành đáp ứng mọi nhu cầu du lịch, cùng bạn làm giàu trải nghiệm trong cuộc sống. Là một trong những Siêu ứng dụng du lịch và tiện ích sống hàng đầu tại Đông Nam Á, Traveloka mang đến cho bạn hơn 20 sản phẩm, dịch vụ du lịch cùng vô vàn tính năng tiện lợi', N'https://www.ldplayer.net/apps/traveloka-book-flight-hotel-on-pc.html', NULL, 1, N'BGAPP50.jpg', N'APP50.1.jpg', N'APP50.2.jpg', N'APP50.3.jpg', N'APP50.4.jpg', N'4.8', CAST(N'2022-10-11' AS Date), N'42', 6, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (27, N'FACEBOOK', N'Facebook là một phương tiện truyền thông xã hội và dịch vụ mạng xã hội trực tuyến thành lập vào năm 2004 của Mỹ thuộc sở hữu của Meta Platforms có trụ sở tại Menlo Park, California. Nó được Mark Zuckerberg, cùng với các sinh viên Đại học Harvard và bạn cùng phòng là Eduardo Saverin, Andrew McCollum, Dustin Moskovitz, Chris Hughes sáng lập. Facebook là một mạng xã hội giúp cho chúng ta có thể kết nối với nhau qua một tài khoản ảo.  Trên Facebook chúng ta có thể đăng trạng thái, hình ảnh, video và chia sẻ tất cả những gì mà bạn muốn.  Không những vậy, chúng ta còn có thể kết bạn với những người dùng khác từ khắp nơi trên thế giới và tương tác với những họ qua các tương tác (reation) và bình luận (comment).  Với những người dùng Facebook chuyên nghiệp thì họ tận dụng Facebook để bán hàng, quảng cáo sản phẩm rất hiệu quả ', N'https://download.com.vn/facebook-cho-windows-10-98824', NULL, 3, N'BGAPP6.jpg', N'APP6.1.jpg', N'APP6.2.jpg', N'APP6.3.jpg', N'APP6.4.jpg', N'4.5', CAST(N'2022-10-22' AS Date), N'214', 6, 1)

INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (28, N'SUPRALAND SIX INCHES UNDER', N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland. Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người. Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm. Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng). Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.', N'https://bluemediafiles.homes/url-generator.php?url=KH1TK0eBXmDmljELeo4C+FFvmgHJbc++7psPlN6tioiOAlqFJyJr1Da7TS+/2OydxBiEj9qrLmBRlalrpjeVwHAr6vqfd6J7bAs53bHlBmY=', 6, 25, N'BG1.jpg', N'Game1.1.jpg', N'Game1.2.jpg', N'Game1.3.jpg', N'Game1.4.jpg', N'4.8', CAST(N'2022-10-05' AS Date), N'6144', 1, 4)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (29, N'THE KING OF FIGHTERS XV', N'Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!', N'https://hadoantv.com/download?kind=old&url=https%3A%2F%2Fanotepad.com%2Fnotes%2Fx4asr7ek', 7, 3, N'BG2.jpg', N'Game2.1.jpg', N'Game2.2.jpg', N'Game2.3.jpg', N'Game2.4.jpg', N'4.2', CAST(N'2022-10-06' AS Date), N'8192', 1, 4)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (30, N'GENSHIN IMPACT', N'Trong trò chơi, bạn sẽ khám phá thế giới tuyệt vời của Tey Vat, và các bước của bạn sẽ đưa bạn qua bảy quốc gia để gặp gỡ các nhân vật từ mọi tầng lớp xã hội, những người sẽ đồng hành cùng bạn trong các cuộc chiến đấu và nhiệm vụ của bạn.', N'https://drive.google.com/file/d/1kmZ398KVMYMJws5Rc8dv5EH44XI3rnUw/view', 11, 5, N'BG4.jpg', N'Game4.1.jpg', N'Game4.2.jpg', N'Game4.3.jpg', N'Game4.4.jpg', N'4.7', CAST(N'2022-10-06' AS Date), N'118', 1, 8)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (31, N'FORTNITE', N'Fortnite: Cơn ác mộng bây giờ! DJ Lyka đang đợi bạn tại Tree of Reality để giúp bạn hóa thân thành một sinh vật có năng lực lupin. Săn đối thủ bằng Howler Claws, hoàn thành nhiệm vụ để nhận phần thưởng đặc biệt, đánh bại quái vật hình khối và vui chơi với các vật phẩm được giới thiệu lại. Giữ cho bữa tiệc diễn ra với sự kinh hoàng và thích thú trên những hòn đảo được thiết kế riêng. Khám phá một địa hình có khả năng phá hủy khổng lồ, nơi mỗi trò chơi là duy nhất. Lập nhóm với bạn bè của bạn để giành chiến thắng Royale. Chạy nước rút, leo lên và bắt đầu theo cách của bạn trong khi xây dựng trong Fortnite Battle Royale hoặc chỉ với vũ khí và vật phẩm của bạn trong Fortnite Zero Build. Khám phá thêm nhiều cách chơi với hàng nghìn trò chơi do người sáng tạo thiết kế ở nhiều thể loại: phiêu lưu, nhập vai, sinh tồn ... Hoặc, bạn cũng có thể tham gia lực lượng với tối đa ba người bạn để chống lại lũ quái vật trong Save the World .', N'https://fa.getpedia.net/data?q=3cDOyMTN4UTMyUjMxIDM4MjN8BjNwUTMxwXaz1mLlRXauRncvZWLw0CMtMTMtIXZsxWY0NnbJNWawV0LyIzLyEzLxIDMy8SZslmZvEGdhR2L', 13, 6, N'BG5.jpg', N'Game5.1.jpg', N'Game5.2.jpg', N'Game5.3.jpg', N'Game5.4.jpg', N'4.3', CAST(N'2022-10-07' AS Date), N'8192', 1, 16)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (32, N'FALL GUYS', N'Fall Guys là một trò chơi nhóm nhiều người chơi miễn phí, đa nền tảng, nơi bạn và các đối thủ của mình phải cạnh tranh trong các vòng vượt chướng ngại vật vô lý và hỗn loạn cho đến khi chỉ còn lại người chiến thắng.', N'https://www.fallguys.com/en-US/download', 14, 8, N'BG7.jpg', N'Game7.1.jpg', N'Game7.2.jpg', N'Game7.3.jpg', N'Game7.4.jpg', N'4.5', CAST(N'2022-10-09' AS Date), N'2048', 1, 4)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (33, N'DRAGON CITY', N'Dragon City là game xây dựng thành phố rồng thu hút hàng triệu người chơi trên thế giới. Dragon City đã được bổ sung sự kiện mới liên tục với rất nhiều thử thách hấp dẫn đang chờ đón bạn. Tham gia game luyện rồng “hot” nhất và thu thập rất nhiều loài rồng phun lửa đáng yêu! Đào tạo chúng như ý muốn của bạn, phát triển bộ sưu tập và chức minh sức mạnh của bản thân qua game Dragon Master nổi tiếng thế giới.', N'https://download.com.vn/dragon-city-124530', 13, 16, N'BG18.jpg', N'Game18.1.jpg', N'Game18.2.jpg', N'Game18.3.jpg', N'Game18.4.jpg', N'4.5', CAST(N'2022-10-14' AS Date), N'148', 1, 4)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (34, N'PUBG MOBILE', N'Game Battle Royale nguyên bản, đầu tiên và hay nhất! Game Battle Royale được hơn 1 tỷ người chơi trên toàn thế giới bình chọn.  Kiệt tác huyền thoại battle royale   Nhiều sự kiện đang chờ bạn khám phá   Đạt đến đỉnh cao trong PUBG MOBILE, thỏa sức bắn tùy thích. PUBG MOBILE là trò chơi battle royale nguyên bản trên di động, và là một trong những trò chơi bắn súng hay nhất.  PUBG Mobile - PLAYERUNKNOWN''S BATTLEGROUNDS MOBILE là game bắn súng sinh tồn được yêu thích trên toàn thế giới do Tencent & BlueHole nghiên cứu, phát triển và đã được phát hành chính thức tại Việt Nam, duy nhất bởi VNG.', N'https://download.com.vn/pubg-mobile-124873', 13, 17, N'BG19.jpg', N'Game19.1.jpg', N'Game19.2.jpg', N'Game19.3.jpg', N'Game19.4.jpg', N'4.0', CAST(N'2022-10-16' AS Date), N'689', 1, 4)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (35, N'SUBWAY SURFERS', N'Trong game, người chơi sẽ nhập vai vào những thanh thiếu niên đầy tinh nghịch hàng ngày sơn graffiti trộm lên các toa tàu, khi bị phát hiện, chúng chạy trên những đường ray để thoát khỏi sự truy đuổi của viên thanh tra và con chó của ông ấy. Khi chạy, người chơi có thể điều khiển nhân vật nhặt tiền vàng, chìa khóa, các vật phẩm tăng sức mạnh và các phần thưởng khác trên đường ray. Đồng thời giúp nhân vật tránh xa các chướng ngại vật trên đường đi, trò chơi chỉ kết thúc khi nhân vật bị bắt bởi viên thanh tra hoặc cả hai đều bị cán bởi toa tàu. Các sự kiện đặc biệt như Săn thưởng hàng tuần (Weekly Hunt) có thể giúp người chơi hoàn thành nhiệm vụ và nhận được nhiều phần quà hơn.', N'https://download.com.vn/game-subway-surfers-124415', 12, 19, N'BG26.jpg', N'Game26.1.jpg', N'Game26.2.jpg', N'Game26.3.jpg', N'Game26.4.jpg', N'4.4', CAST(N'2022-10-13' AS Date), N'101', 1, 2)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (36, N'AMONG US', N'Among Us là game nhập vai hành động nhiều người chơi có phong cách khá giống Werewolf Online. Game có chủ đề chính xoay quanh tinh thần đồng đội và sự phản bội dành cho 4-10 người chơi trong bối cảnh không gian.', NULL, 14, 20, N'BG27.jpg', N'Game27.1.jpg', N'Game27.2.jpg', N'Game27.3.jpg', N'Game27.4.jpg', N'4.5', CAST(N'2022-10-18' AS Date), N'80', 1, 4)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (37, N'LIÊN QUÂN MOBILE', N'Garena Liên Quân Mobile là tựa game chiến thuật đỉnh cao trên Android lẫn iOS. Tuy nhiên, bạn hoàn toàn có thể trải nghiệm trên máy tính thông qua bộ giả lập LDPlayer có gắn kèm game Liên Quân Mobile. Cho người chơi thỏa sức tham gia cuộc chiến 10vs10 nảy lửa trên mọi thiết bị, ở mọi lúc mọi nơi.', N'https://download.com.vn/garena-lien-quan-mobile-124385', 11, 21, N'BG28.jpg', N'Game28.1.jpg', N'Game28.2.jpg', N'Game28.3.jpg', N'Game28.4.jpg', N'3.5', CAST(N'2022-10-19' AS Date), N'148', 1, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (38, N'PLANTS VS ZOMBIES 2', N'Plants vs Zombies 2 là sự trở lại đầy ngoạn mục của siêu phẩm thủ thành “Hoa quả nổi giận”. Mặc dù game chỉ có 2 phiên bản độc quyền dành cho di động nhưng nay bạn đã có thể chơi Plants vs Zombies 2 cho máy tính thông qua phần mềm giả lập BlueStacks.', N'https://download.com.vn/plants-vs-zombies-2-124458', 11, 22, N'BG29.jpg', N'Game29.1.jpg', N'Game29.2.jpg', N'Game29.3.jpg', N'Game29.4.jpg', N'4.1', CAST(N'2022-10-15' AS Date), N'775', 1, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (39, N'CANDY CRUSH SAGA', N'Chắc hẳn ai cũng đã từng nghe đến Candy Crush Saga, tựa game xếp kẹo đình đám trên thiết bị di động và mạng xã hội. Giờ đây bạn đã có thể tải Candy Crush về máy tính của mình và thỏa sức giải trí với trò chơi thú vị này.', N'https://download.com.vn/candy-crush-saga-pc-85557', 11, 23, N'BG30.jpg', N'Game30.1.jpg', N'Game30.2.jpg', N'Game30.3.jpg', N'Game30.4.jpg', N'4.6', CAST(N'2022-10-14' AS Date), N'79', 1, 2)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (40, N'FARM HEROES SAGA', N'Thông qua giả lập Tencent Buddy, bạn có thể chơi game Farm Heroes Saga trên máy tính. Farm Heroes Saga PC là game xếp hình match-3 vô cùng thú vị trong thế giới nông trại và cỏ cây hoa lá siêu đáng yêu!', N'https://download.com.vn/farm-heroes-saga-pc-124697', 11, 23, N'BG31.jpg', N'Game31.1.jpg', N'Game31.2.jpg', N'Game31.3.jpg', N'Game31.4.jpg', N'4.6', CAST(N'2022-10-20' AS Date), N'82', 1, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (41, N'MEGA ĐẠI CHIẾN', N'Mega Đại Chiến là một tựa game chiến thuật đấu Pet được xây dựng dựa trên bộ phim hoạt hình nổi tiếng Pokémon, đang được nhiều người yêu thích và chơi hiện nay. Trong trò chơi này, người chơi sẽ hóa thân thành một huấn luyện viên để chiêu mộ và huấn luyện Pet để chinh phục các đấu trường vô cùng khốc liệt. Khi tham gia vào tựa game này, bạn sẽ được đưa tới một thế giới Pokémon đa dạng, với sức mạnh, cấp độ tiến hóa khác nhau. Ngoài ra, ở game này còn có hiệu ứng thời tiết vô cùng ấn tượng, chúng ta sẽ được thấy những hiện tượng thời tiết như: nắng, mưa, bão tố, bão lửa, tia sét,...', N'https://vn.ldplayer.net/games/com-megagame-daichien-on-pc.html', 11, 24, N'BG32.jpg', N'Game32.1.jpg', N'Game32.2.jpg', N'Game32.3.jpg', N'Game32.4.jpg', N'3.7', CAST(N'2022-10-19' AS Date), N'483', 1, 2)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (42, N'HOMESCAPES', N'Chào mừng bạn đến với Homescapes, một trò chơi thực sự ấm lòng từ sê-ri Playrix Scapes ™!  Giải các câu đố match-3 để khôi phục một dinh thự tuyệt vời trên một con phố xanh tươi.  Cuộc phiêu lưu thú vị bắt đầu trước ngưỡng cửa!   Đánh bại các cấp độ trận đấu 3 đầy màu sắc để cải tạo và trang trí các phòng trong biệt thự, mở khóa nhiều chương hơn nữa trong câu chuyện gia đình thú vị trên đường đi!  Bạn còn chờ gì nữa?  Tự nhiên như ở nhà!', N'https://www.malavida.com/en/soft/homescapes/', 5, 25, N'BG33.jpg', N'Game33.1.jpg', N'Game33.2.jpg', N'Game33.3.jpg', N'Game33.4.jpg', N'4.3', CAST(N'2022-10-18' AS Date), N'141', 1, 2)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (43, N'KHU VƯỜN TRÊN MÂY', N'Khu vườn trên mây là game nông trại miễn phí do Zing Play phát hành trên di động. Để chơi Khu vườn trên mây bạn có thể cài đặt Khu vườn trên mây thông qua các phần mềm giả lập Android như BlueStacks, LDPlayer, vv. Tải game Khu vườn trên mây để sẵn sàng khám phá nông trại trên địa đàng độc đáo này. Tựa game Khu vườn trên mây chắc hẳn không còn mấy xa lạ với những ai yêu thích dòng game nông trại. Đến với Khu vườn trên mây bạn sẽ được trở thành một người nông dân đặc biệt để chăm sóc khu vườn trên mây với những điều vô cùng thú vị.', N'https://download.com.vn/khu-vuon-tren-may-124423', 10, 26, N'BG34.jpg', N'Game34.1.jpg', N'Game34.2.jpg', N'Game34.3.jpg', N'Game34.4.jpg', N'4.5', CAST(N'2022-10-22' AS Date), N'108', 1, 2)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (44, N'SAVE THE DOGE', N'Bạn có thích chơi game giải đố không? Save the Doge là một trò chơi trí tuệ vui nhộn, thách thức người chơi giải cứu chú chó khỏi bị ong đốt. Hãy tìm cách vẽ một đường duy nhất để cứu chú chó dễ thương này trong mỗi màn chơi nhé!', N'https://download.com.vn/save-the-doge-164981', 5, 27, N'BG35.jpg', N'Game35.1.jpg', N'Game35.2.jpg', N'Game35.3.jpg', N'Game35.4.jpg', N'3.2', CAST(N'2022-10-23' AS Date), N'35', 1, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (45, N'MINI WORLD', N'Mini World: CREATA là tên gọi mới của Mini World: Block Art, game xây dựng thế giới mở có đồ họa dễ thương cùng lối chơi tự do khám phá hấp dẫn. Nếu bạn muốn tìm điều gì đó mới lạ ở thể loại game sandbox giống Minecraft, thì đừng ngại thử Mini World Block Art 0.58.0.', NULL, 12, 28, N'BG36.jpg', N'Game36.1.jpg', N'Game36.2.jpg', N'Game36.3.jpg', N'Game36.4.jpg', N'3.9', CAST(N'2022-10-24' AS Date), N'1024', 1, 2)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (46, N'BLOSSOM BLAST SAGA', N'Phát triển một khu vườn đầy màu sắc trong trận đấu 3 hoa trò chơi này! Liên kết nụ và làm cho họ nở!  Kết hợp theo cách của bạn thông qua một loạt các cấp độ vườn tự trị ong trong Blossom Blast Saga, một trò chơi liên kết thú vị từ các nhà sản xuất Candy Crush Saga và Farm Heroes Saga! Liên kết những nụ hoa cùng màu để làm cho những bông hoa xinh đẹp nở rộ, và dọn sạch những thảm hoa trước khi bạn hết động tác!  Ghép 3 hoặc nhiều nụ hoa để làm cho thế giới nở rộ thành những màu sắc ngoạn mục. Kết nối nhiều nụ hoa hơn để tạo ra một phản ứng dây chuyền vinh quang và xem điểm số của bạn tăng lên! Thu thập mọi bông hoa và thực hiện theo cách của bạn thông qua các cấp độ vườn tuyệt đẹp trong trò chơi phiêu lưu đầy màu sắc này!', NULL, 5, 23, N'BG37.jpg', N'Game37.1.jpg', N'Game37.2.jpg', N'Game37.3.jpg', N'Game37.4.jpg', N'4.3', CAST(N'2022-10-26' AS Date), N'73.91', 1, 1)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (47, N'MÈO & SÚP', N'Cats & Soup là game mô phỏng có lối chơi đơn giản và đồ họa cực kỳ đáng yêu, xoay quanh một nhóm mèo nấu những món súp ngon lành. Mục tiêu của bạn là thu thập các món ăn để đạt được thành tích, mở khóa công thức mới và những chú mèo mới. Ngay bây giờ bạn có thể chơi game trên các trình giả lập quen thuộc như MEmu hoặc NoxPlayer.', N'https://download.com.vn/cats-and-soup-159271', 11, 29, N'BG38.jpg', N'Game38.1.jpg', N'Game38.2.jpg', N'Game38.3.jpg', N'Game38.4.jpg', N'4.8', CAST(N'2022-10-28' AS Date), N'104', 1, 2)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (48, N'RISE OF KINGDOMS - GAMOTA', N'Rise of Kingdoms: Lost Crusade là một trò chơi chiến thuật được phát triển bởi LilithGames. Tải xuống Rise of Kingdoms: Lost Crusade trên PC với BlueStacks và trở thành người lãnh đạo nền văn minh của riêng bạn. Một trong những nền văn minh thế giới mang tính biểu tượng và có ảnh hưởng nhất đã có vũ khí. Ai Cập đã thức tỉnh, và cuộc chiến giành quyền thống trị hoàn toàn trở nên khốc liệt hơn. Chọn và dẫn dắt một trong 13 nền văn minh hùng mạnh trong lịch sử thế giới. Biến bộ tộc nhỏ của bạn thành một siêu cường toàn cầu không thể ngăn cản với chủ nghĩa thực dụng kinh tế và sức mạnh quân sự. Các quyết định, chiến lược, quan hệ đối tác kinh tế và liên minh quân sự của bạn sẽ quyết định số phận của quốc gia non trẻ của bạn. Không có hai nền văn minh nào giống nhau. Mỗi nền văn minh đều có kiến ​​trúc độc đáo, các đơn vị độc quyền, các kỹ năng và kỹ năng đặc biệt giúp phân biệt chúng với phần còn lại. Là nhà lãnh đạo, bạn phải học cách khai thác tốt nhất lợi thế của mình để đánh bại các đối thủ và củng cố vị thế cường quốc trên thế giới. Chiến đấu và dẫn đầu cùng với một số nhà lãnh đạo được trang hoàng và có ảnh hưởng nhất trong lịch sử, từ Thutmose III đến Cleopatra và hơn thế nữa! Xây dựng một quốc gia có thể đứng vững trước thử thách của thời gian và dẫn dắt dân tộc của bạn đến một thời kỳ hoàng kim thịnh vượng và ảnh hưởng sẽ kéo dài hàng thế kỷ!', N'https://www.bluestacks.com/apps/strategy/rise-of-kingdoms-on-pc.html', 12, 3, N'BG39.jpg', N'Game39.1.jpg', N'Game39.2.jpg', N'Game39.3.jpg', N'Game39.4.jpg', N'4.6', CAST(N'2022-10-27' AS Date), N'942', 1, 2)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (49, N'MY CITY - ENTERTAINMENT TYCOON', N'Xây dựng đường chân trời & trang trí thị trấn! Xin chúc mừng, thị trưởng! Bây giờ bạn đã chịu trách nhiệm về thành phố rất riêng của bạn! Sau khi ghi một chiến thắng vang dội, bây giờ công việc của bạn để đảm bảo rằng thành phố là một niềm vui và giải trí nơi để sinh sống. Tạo và thiết kế thành phố của mình! Xây dựng các tòa nhà thương mại và dân cư và xem thành phố của bạn phát triển từ một thị trấn nhỏ để số vốn giải trí! Đặt tên cho thành phố của bạn và tùy chỉnh hình thức của nó - chọn màu sắc và phong cách, đặt xuống công viên và đường giao thông và cung cấp cho thành phố của bạn một liên lạc của cá tính!', N'https://appsonwindows.com/apk/3522509/', 12, 31, N'BG40.jpg', N'Game40.1.jpg', N'Game40.2.jpg', N'Game40.3.jpg', N'Game40.4.jpg', N'4.6', CAST(N'2022-10-27' AS Date), N'100', 1, 2)
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [LinkTai],[MaTheLoai], [MaNPH], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DanhGia], [NgayCapNhat], [DungLuong], [MaHDH], [MaNgonNgu])
VALUES (50, N'FARMVILLE 2: COUNTRY ESCAPE', N'FarmVille 2: Country Escape là phiên bản mới trong loạt game nông trại nổi tiếng Farmville dành cho người dùng thiết bị di động và Facebook. Nay bạn đã có thể thỏa sức chăm sóc vườn tược, làm các công việc nông trại với phiên bản FarmVille Country Escape dành cho Windows 10.', N'https://download.com.vn/farmville-2-country-escape-85771', 14, 32, N'BG41.jpg', N'Game41.1.jpg', N'Game41.2.jpg', N'Game41.3.jpg', N'Game41.4.jpg', N'4.4', CAST(N'2022-10-23' AS Date), N'145', 1, 1)
SET IDENTITY_INSERT [dbo].[OVERALL] OFF


select * from OVERALL
Update OVERALL
set DonGia=300000
where Ma = 1
Update OVERALL
set DonGia=2500000
where Ma = 2
Update OVERALL
set DonGia=267250
where Ma = 3
Update OVERALL
set DonGia=150000
where Ma = 4
Update OVERALL
set DonGia=258500
where Ma = 5
Update OVERALL
set DonGia=800000
where Ma = 6
Update OVERALL
set DonGia=1000000
where Ma= 7
Update OVERALL
set DonGia=250620
where Ma = 8
Update OVERALL
set DonGia=1500000
where Ma = 9

select * from OVERALL


SET IDENTITY_INSERT [dbo].[OVERALL] ON 


INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (1, N'ADOBE AUDITION CS5', N'Adobe Audition CS5.5 mang các tính năng tốt nhất từ các sản phẩm âm thanh của Adobe vào một gói đa nền tảng duy nhất. Nó tập trung vào hiệu suất cao trong quy trình hậu sản xuất. Một số tính năng trong phiên bản Windows của Adobe Audition 3.0 không khả dụng trong CS5.5. Nhóm phát hành đang tích cực thu thập phản hồi về những tính năng nào là ưu tiên hàng đầu của khách hàng thông qua một cuộc khảo sát công khai. Adobe cũng khuyến khích bạn gửi các yêu cầu tính năng bổ sung mà nhóm thường xuyên xem xét khi lập kế hoạch cho các phiên bản trong tương lai.', N'512', NULL, 18, 4, 6, 2, CAST(N'2022-10-21T00:00:00.000' AS DateTime), N'4.3', N'BGAPP3.jpg', N'APP3.1.jpg', N'APP3.2.jpg', N'APP3.3.jpg', N'APP3.4.jpg', CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (2, N'HAPPY COW', N'HappyCow là một dịch vụ trực tuyến liệt kê các nguồn thực phẩm thuần chay , ăn chay và tốt cho sức khỏe.', N'100', NULL, 17, 9, 6, 2, CAST(N'2022-10-19T00:00:00.000' AS DateTime), N'4', N'BGAPP8.jpg', N'APP8.1.jpg', N'APP8.2.jpg', N'APP8.3.jpg', N'APP8.4.jpg', CAST(247750.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (3, N'PHOTOPILLS', N'Một trong những ứng dụng được ưa chuộng nhất trong nhiếp ảnh thiên văn là PhotoPills sắp chính thức có bản cài trên hệ điều hành Android sau một năm người dùng chờ đợi kể từ khi giới thiệu trên iOS. PhotoPills có thể giúp nhiếp ảnh gia lên kế hoạch, tìm kiếm địa điểm đẹp, cho biết khi nào sẽ có bình minh, hoàng hôn hay đưa gợi ý thời điểm chụp cảnh sao đêm, cảnh cực quang, bầu trời... xét theo từng vị trí địa lý', N'400', NULL, 18, 12, 6, 2, CAST(N'2022-10-18T00:00:00.000' AS DateTime), N'4.5', N'BGAPP9.jpg', N'APP9.1.jpg', N'APP9.2.jpg', N'APP9.3.jpg', N'APP9.4.jpg', CAST(247750.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (4, N'SOLID EXPLORER FILE MANAGER', N'đây là ứng dụng dành riêng cho những người bận rộn với quá nhiều file tài liệu mà không thể nào quản lý nổi. Tuy nhiên, Solid Explorer File Manager còn hơn thế nữa khi cung cấp cho người dùng khả năng bảo mật và sử dụng đám mây của ứng dụng này.', N'68', NULL, 28, 11, 6, 1, CAST(N'2022-10-10T00:00:00.000' AS DateTime), N'4.5', N'BGAPP10.jpg', N'APP10.1.jpg', N'APP10.2.jpg', N'APP10.3.jpg', N'APP10.4.jpg', CAST(123875.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (5, N'PLANTSNAP', N'PlantSnap ứng dụng giúp bạn nhận diện xác định các loại cây bằng trí tuệ nhân tạo thông minh. Ngoài ra, bạn có thể tìm kiếm thông tin chi tiết về các loài hoa mà bạn muốn tìm hiểu. Và còn rất nhiều tính năng thú vị mà ứng dụng đem lại hãy cùng mình tìm hiểu trong bài viết này nhé.', N'85', NULL, 27, 25, 6, 2, CAST(N'2022-10-11T00:00:00.000' AS DateTime), N'4.5', N'BGAPP11.jpg', N'APP11.1.jpg', N'APP11.2.jpg', N'APP11.3.jpg', N'APP11.4.jpg', CAST(198200.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (6, N'SHOPEE', N'Shopee là ứng dụng mua bán online giá rẻ với nhiều mặt hàng đa dạng, là sàn giao dịch thương mại điện tử có trụ sở đặt tại Singapore. Ứng dụng được phát hành miễn phí và tương thích với nhiều nền tảng và thiết bị.', N'68', NULL, 19, 12, 6, 1, CAST(N'2022-10-13T00:00:00.000' AS DateTime), N'4.4', N'BGAPP12.jpg', N'APP12.1.jpg', N'APP12.2.jpg', N'APP12.3.jpg', N'APP12.4.jpg', CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (7, N'YOUTUBE', N'Youtube là một nền tảng chia sẻ video trực tuyến, là ứng dụng mạng xã hội video số một trên thế giới với số lượng video cực khủng và nhiều chủ đề khác nhau. Đây là ứng dụng hoàn toàn miễn phí được phát triển trên nhiều nền tảng và thiết bị khác nhau.', N'85', NULL, 16, 13, 6, 1, CAST(N'2022-10-14T00:00:00.000' AS DateTime), N'4.7', N'BGAPP13.jpg', N'APP13.1.jpg', N'APP13.2.jpg', N'APP13.3.jpg', N'APP13.4.jpg', CAST(700000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (8, N'MICROSOFT WORD', N'Microsoft word là một chương trình soạn thảo văn bản, là ứng dụng tạo và chỉnh sửa tài liệu của hãng Microsoft, có thể giúp bạn soạn thảo theo bố cục đa dạng và chia sẻ dễ dàng. Ứng dụng được phát triển trên nhiều nền tảng, tương thích với hầu hết thiết bị.', N'85', NULL, 21, 14, 6, 1, CAST(N'2022-10-12T00:00:00.000' AS DateTime), N'4.7', N'BGAPP14.jpg', N'APP14.1.jpg', N'APP14.2.jpg', N'APP14.3.jpg', N'APP14.4.jpg', CAST(173425.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (9, N'MICROSOFT EXCEL', N'Microsoft Excel là ứng dụng xử lý tác vụ văn phòng giúp tạo và chỉnh sửa trang tính excel phổ biến, chuyên nghiệp nhất hiện tại. Ứng dụng hỗ trợ chức năng thao tác bảng tính cơ bản và các biểu đồ dữ liệu, cùng bộ công cụ hỗ trợ làm công việc xử lý trở nên dễ dàng, tiện lợi hơn bao giờ hết.', N'90', NULL, 21, 14, 6, 1, CAST(N'2022-10-08T00:00:00.000' AS DateTime), N'4.7', N'BGAPP15.jpg', N'APP15.1.jpg', N'APP15.2.jpg', N'APP15.3.jpg', N'APP15.4.jpg', CAST(148650.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (10, N'MICROSOFT POWERPOINT', N' Microsoft Powerpoint là phần mềm tạo trang trình chiếu độc đáo, cùng với tính năng tương tác đa năng như viết tay, cảm biến và giọng nói. Ứng dụng đượcMicrosoft phát hành rộng rãi trên mọi nền tảng thiết bị.', N'93', NULL, 21, 14, 6, 1, CAST(N'2022-10-11T00:00:00.000' AS DateTime), N'4.3', N'BGAPP16.jpg', N'APP16.1.jpg', N'APP16.2.jpg', N'APP16.3.jpg', N'APP16.4.jpg', CAST(173425.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (11, N'DISCORD', N'Discord là một ứng dụng liên lạc dành cho các game thủ, mang các game thủ lại gần nhau hơn và cùng trải qua các trận game đỉnh cao. Ngoài ra cộng đồng game được kết nối với nhau rất đông đảo lên đến hàng triệu thành viên trên ứng dụng này.', N'80', NULL, 16, 15, 6, 1, CAST(N'2022-10-12T00:00:00.000' AS DateTime), N'4.7', N'BGAPP17.jpg', N'APP17.1.jpg', N'APP17.2.jpg', N'APP17.3.jpg', N'APP17.4.jpg', CAST(80000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (12, N'MICROSOFT PAINT ', N'Được xem là một phần mềm có những tính năng mang tính cách tân và đổi mới, Paint là phần mềm chỉnh sửa ảnh hoàn toàn miễn phí cho Windows. Cùng tìm hiểu bộ công cụ gọn nhẹ nhưng cực kỳ hiệu quả của Paint ngay sau đây nhé!', N'49.8', NULL, 21, 14, 6, 1, CAST(N'2022-10-08T00:00:00.000' AS DateTime), N'4.5', N'BGAPP20.jpg', N'APP20.1.jpg', N'APP20.2.jpg', N'APP20.3.jpg', N'APP20.4.jpg', CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (13, N'ZALO', N'Zalo là ứng dụng liên lạc đảm bảo kết nối nhanh, ổn định, tiện lợi và riêng tư cho người dùng mọi lúc, mọi nơi, nhanh và ổn định', N'250', NULL, 15, 18, 6, 1, CAST(N'2022-10-10T00:00:00.000' AS DateTime), N'4.5', N'BGAPP21.jpg', N'APP21.1.jpg', N'APP21.2.jpg', N'APP21.3.jpg', N'APP21.4.jpg', CAST(250000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (14, N'ADOBE PHOTOSHOP', N'Adobe Photoshop là phần mềm thiết kế đồ họa, chỉnh sửa ảnh mạnh mẽ được nhiều người dùng ưa chuộng trên toàn thế giới. Adobe Photoshop có đầy đủ công cụ chỉnh sửa ảnh chuyên nghiệp, xoay cắt ghép ảnh dễ dàng, hỗ trợ bạn thỏa sức sáng tạo.', N'1536', NULL, 27, 4, 6, 1, CAST(N'2022-10-13T00:00:00.000' AS DateTime), N'4.4', N'BGAPP22.jpg', N'APP22.1.jpg', N'APP22.2.jpg', N'APP22.3.jpg', N'APP22.4.jpg', CAST(250000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (15, N'ADOBE LIGHTROOM', N'Adobe Lightroom là phần mềm chỉnh sửa, xử lý ảnh RAW chuyên nghiệp được người dùng ưa chuộng sử dụng với công cụ chỉnh sửa ảnh mạnh mẽ, bạn dễ dàng loại bỏ mắt đó, chỉnh quang sai màu, chỉnh ảnh tự động nhanh chóng.', N'2304', NULL, 27, 4, 6, 1, CAST(N'2022-10-09T00:00:00.000' AS DateTime), N'4.6', N'BGAPP23.jpg', N'APP23.1.jpg', N'APP23.2.jpg', N'APP23.3.jpg', N'APP23.4.jpg', CAST(230000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (16, N'ADOBE ILLUSTRATOR', N'Adobe Illustrator là trình chỉnh sửa đồ họa vector được phát triển bởi Adobe, phần mềm cho phép bạn thiết kế đồ họa 3D chuyên nghiệp, hình ảnh minh họa, đồ họa kĩ thuật số, nội dung trang web, video và nội dung,...', N'1024', NULL, 22, 4, 6, 2, CAST(N'2022-10-07T00:00:00.000' AS DateTime), N'4.4', N'BGAPP24.jpg', N'APP24.1.jpg', N'APP24.2.jpg', N'APP24.3.jpg', N'APP24.4.jpg', CAST(250000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (17, N'ADOBE PREMIERE PRO', N'Adobe Premiere là phần mềm chỉnh sửa video phổ thông được mọi người tin dùng trên khắp thế giới. Phần mềm cung cấp cho người sử dụng tất cả công cụ và tính năng liên quan đến chỉnh sửa video.', N'9216', NULL, 18, 4, 6, 1, CAST(N'2022-10-07T00:00:00.000' AS DateTime), N'4.6', N'BGAPP25.jpg', N'APP25.1.jpg', N'APP25.2.jpg', N'APP25.3.jpg', N'APP25.4.jpg', CAST(240000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (18, N'LAZADA', N'Lazada là một trong những website mua sắm trực tuyến lớn nhất tại Việt Nam hiện nay (ngoài ra còn có Shopee, META.vn, ZARA, Adayroi...). Đây cũng là một sàn giao dịch thương mại điện tử lớn và uy tín đã góp phần thúc đẩy các dịch vụ mua sắm online tại thị trường nội địa phát triển mạnh mẽ hơn trong những năm vừa qua.', N'80', NULL, 15, 33, 6, 1, CAST(N'2022-10-09T00:00:00.000' AS DateTime), N'4.6', N'BGAPP42.jpg', N'APP42.1.jpg', N'APP42.2.jpg', N'APP42.3.jpg', N'APP43.4.jpg', CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (19, N'VIEON', N'Siêu Ứng dụng Giải trí VieON là ứng dụng xem phim truyền hình (phim bộ), phim chiếu rạp (phim lẻ), tivi trực tuyến, show truyền hình thực tế và video giải trí. Phim mới mỗi ngày, show đỉnh độc quyền. Thể thao Ngoại Hạng Anh, La Liga, SerieA, Bundesliga, Ligue 1, V-League, Golf, Tennis.', N'230', NULL, 27, 34, 6, 1, CAST(N'2022-10-11T00:00:00.000' AS DateTime), N'4.2', N'BGAPP43.jpg', N'APP43.1.jpg', N'APP43.2.jpg', N'APP43.3.jpg', N'APP43.4.jpg', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (20, N'NETFLIX', N' Netflix là ứng dụng xem phim được ưa chuộng nhất hiện nay với kho phim chất lượng cao mang lại những giây phút giải trí tuyệt vời cho người dùng', N'180', NULL, 27, 35, 6, 1, CAST(N'2022-10-08T00:00:00.000' AS DateTime), N'4.6', N'BGAPP44.jpg', N'APP44.1.jpg', N'APP44.2.jpg', N'APP44.3.jpg', N'APP44.4.jpg', CAST(700000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (21, N'SPOTIFY', N'Spotify là ứng dụng nghe nhạc được sản xuất bởi Spotify AB tại Thụy Điển. Nó cho phép người sử dụng có quyền truy cập để nghe những ca khúc, bài hát, video,... của các nghệ sĩ trên thế giới. Ứng dụng này có đặc điểm tương tự những app khác như: Apple Music, Zing MP3,..., người dùng có thể nghe nhạc trực tiếp trên đó mà không bị yêu cầu phí bản quyền. Để làm được điều này, Spotify đã chia ra làm hai phiên bản là có phí và miễn phí. Dịch vụ miễn phí có thể nói là một trong những ưu điểm của Spotify so với App nghe nhạc khác.', N'27', NULL, 15, 36, 6, 1, CAST(N'2022-10-13T00:00:00.000' AS DateTime), N'3.8', N'BGAPP45.jpg', N'APP45.1.jpg', N'APP45.2.jpg', N'APP45.3.jpg', N'APP45.4.jpg', CAST(140000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (22, N'ZING MP3', N'Cùng thưởng thức âm nhạc đỉnh cao với ứng dụng nghe nhạc số 1 Việt Nam  Zing MP3 là ứng dụng nghe nhạc miễn phí hàng đầu Việt Nam. Với kho nhạc chất lượng cao đồ sộ từ Zing mp3 bạn sẽ có trải nghiệm âm nhạc tuyệt vời nhất trên thiết bị di động của mình. ', N'50', NULL, 24, 11, 6, 1, CAST(N'2022-10-13T00:00:00.000' AS DateTime), N'4.3', N'BGAPP46.jpg', N'APP46.1.jpg', N'APP46.2.jpg', N'APP46.3.jpg', N'APP46.4.jpg', CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (23, N'GIAOHANGTIETKIEM', N'Ứng dụng giao nhận dành cho các Shop bán hàng online của Giaohangtietkiem.vn  Đây là ứng dụng giao nhận mới dành cho các Shop bán hàng online chuyển phát hàng hóa, phục vụ lấy – giao tại 63 tỉnh thành toàn quốc. Ứng dụng cho phép các Shop bán hàng online tại 63 tỉnh thành trên toàn quốc đăng ký tài khoản, đăng nhập, kiểm tra trạng thái đơn hàng.  Với app, Shop bán hàng online gửi yêu cầu thẳng cho vận hành Giaohangtietkiem để được hỗ trợ nhanh chóng. Mọi phát sinh trong quá trình giao hàng sẽ được thông báo tức thời cho Shop qua ứng dụng, tạo kết nối chặt chẽ và dễ dàng giữa Shop và vận hành.', N'91', NULL, 26, 37, 6, 1, CAST(N'2022-10-14T00:00:00.000' AS DateTime), N'4.6', N'BGAPP47.jpg', N'APP47.1.jpg', N'APP47.2.jpg', N'APP47.3.jpg', N'APP47.4.jpg', CAST(300000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (24, N'BILIBILI', N'Cộng đồng xem anime, giải trí và thế giới 2D với bình luận trực tiếp', N'55', NULL, 27, 38, 6, 1, CAST(N'2022-10-10T00:00:00.000' AS DateTime), N'3.4', N'BGAPP48.jpg', N'APP48.1.jpg', N'APP48.2.jpg', N'APP48.3.jpg', N'APP48.4.jpg', CAST(29000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (25, N'MICROSOFT OUTLOOK', N'Microsoft Outlook là ứng dụng lưu trữ email miễn phí được phát triển và cung cấp bởi Microsoft, cho phép bạn gửi/ nhận email nhanh chóng mà không giới hạn không gian lưu trữ. Ứng dụng còn hỗ trợ việc gửi mail đính kèm tập tin có dung lượng lớn, sắp xếp email theo dung lượng, thời gian nhận, thời gian gửi và nhiều hơn thế nữa.', N'120', NULL, 21, 14, 6, 1, CAST(N'2022-10-11T00:00:00.000' AS DateTime), N'4.2', N'BGAPP49.jpg', N'APP49.1.jpg', N'APP49.2.jpg', N'APP49.3.jpg', N'APP49.4.jpg', CAST(700000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (26, N'TRAVELOKA', N'Đặt vé máy bay, khách sạn, vé vui chơi, giải trí, tour du lịch nội địa & quốc tế. Du lịch dễ dàng với Traveloka – người bạn đồng hành đáp ứng mọi nhu cầu du lịch, cùng bạn làm giàu trải nghiệm trong cuộc sống. Là một trong những Siêu ứng dụng du lịch và tiện ích sống hàng đầu tại Đông Nam Á, Traveloka mang đến cho bạn hơn 20 sản phẩm, dịch vụ du lịch cùng vô vàn tính năng tiện lợi', N'42', NULL, 25, 1, 6, 1, CAST(N'2022-10-11T00:00:00.000' AS DateTime), N'4.8', N'BGAPP50.jpg', N'APP50.1.jpg', N'APP50.2.jpg', N'APP50.3.jpg', N'APP50.4.jpg', CAST(80000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia]) 
VALUES (27, N'FACEBOOK', N'Facebook là một phương tiện truyền thông xã hội và dịch vụ mạng xã hội trực tuyến thành lập vào năm 2004 của Mỹ thuộc sở hữu của Meta Platforms có trụ sở tại Menlo Park, California. Nó được Mark Zuckerberg, cùng với các sinh viên Đại học Harvard và bạn cùng phòng là Eduardo Saverin, Andrew McCollum, Dustin Moskovitz, Chris Hughes sáng lập. Facebook là một mạng xã hội giúp cho chúng ta có thể kết nối với nhau qua một tài khoản ảo.  Trên Facebook chúng ta có thể đăng trạng thái, hình ảnh, video và chia sẻ tất cả những gì mà bạn muốn.  Không những vậy, chúng ta còn có thể kết bạn với những người dùng khác từ khắp nơi trên thế giới và tương tác với những họ qua các tương tác (reation) và bình luận (comment).  Với những người dùng Facebook chuyên nghiệp thì họ tận dụng Facebook để bán hàng, quảng cáo sản phẩm rất hiệu quả ', N'214', NULL, 16, 3, 6, 1, CAST(N'2022-10-22T00:00:00.000' AS DateTime), N'4.5', N'BGAPP6.jpg', N'APP6.1.jpg', N'APP6.2.jpg', N'APP6.3.jpg', N'APP6.4.jpg', CAST(140000.00 AS Decimal(18, 2)))





INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (28, N'SUPRALAND SIX INCHES UNDER', N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland. Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người. Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm. Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng). Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.', N'6144', NULL, 6, 25, 6, 4, CAST(N'2022-10-05T00:00:00.000' AS DateTime), N'4.8', N'BG1.jpg', N'Game1.1.jpg', N'Game1.2.jpg', N'Game1.3.jpg', N'Game1.4.jpg', CAST(200000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (29, N'THE KING OF FIGHTERS XV', N'Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!', N'8192', NULL, 7, 3, 6, 4, CAST(N'2022-10-06T00:00:00.000' AS DateTime), N'4.2', N'BG2.jpg', N'Game2.1.jpg', N'Game2.2.jpg', N'Game2.3.jpg', N'Game2.4.jpg', CAST(350000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (30, N'GENSHIN IMPACT', N'Trong trò chơi, bạn sẽ khám phá thế giới tuyệt vời của Tey Vat, và các bước của bạn sẽ đưa bạn qua bảy quốc gia để gặp gỡ các nhân vật từ mọi tầng lớp xã hội, những người sẽ đồng hành cùng bạn trong các cuộc chiến đấu và nhiệm vụ của bạn.', N'118', NULL, 7, 5, 6, 8, CAST(N'2022-10-06T00:00:00.000' AS DateTime), N'4.7', N'BG4.jpg', N'Game4.1.jpg', N'Game4.2.jpg', N'Game4.3.jpg', N'Game4.4.jpg', CAST(250000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (31, N'FORTNITE', N'Fortnite: Cơn ác mộng bây giờ! DJ Lyka đang đợi bạn tại Tree of Reality để giúp bạn hóa thân thành một sinh vật có năng lực lupin. Săn đối thủ bằng Howler Claws, hoàn thành nhiệm vụ để nhận phần thưởng đặc biệt, đánh bại quái vật hình khối và vui chơi với các vật phẩm được giới thiệu lại. Giữ cho bữa tiệc diễn ra với sự kinh hoàng và thích thú trên những hòn đảo được thiết kế riêng. Khám phá một địa hình có khả năng phá hủy khổng lồ, nơi mỗi trò chơi là duy nhất. Lập nhóm với bạn bè của bạn để giành chiến thắng Royale. Chạy nước rút, leo lên và bắt đầu theo cách của bạn trong khi xây dựng trong Fortnite Battle Royale hoặc chỉ với vũ khí và vật phẩm của bạn trong Fortnite Zero Build. Khám phá thêm nhiều cách chơi với hàng nghìn trò chơi do người sáng tạo thiết kế ở nhiều thể loại: phiêu lưu, nhập vai, sinh tồn ... Hoặc, bạn cũng có thể tham gia lực lượng với tối đa ba người bạn để chống lại lũ quái vật trong Save the World .', N'8192', NULL, 13, 6, 6, 16, CAST(N'2022-10-07T00:00:00.000' AS DateTime), N'4.3', N'BG5.jpg', N'Game5.1.jpg', N'Game5.2.jpg', N'Game5.3.jpg', N'Game5.4.jpg', CAST(250000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (32, N'FALL GUYS', N'Fall Guys là một trò chơi nhóm nhiều người chơi miễn phí, đa nền tảng, nơi bạn và các đối thủ của mình phải cạnh tranh trong các vòng vượt chướng ngại vật vô lý và hỗn loạn cho đến khi chỉ còn lại người chiến thắng.', N'2048', NULL, 14, 8, 6, 4, CAST(N'2022-10-09T00:00:00.000' AS DateTime), N'4.5', N'BG7.jpg', N'Game7.1.jpg', N'Game7.2.jpg', N'Game7.3.jpg', N'Game7.4.jpg', CAST(300000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (33, N'DRAGON CITY', N'Dragon City là game xây dựng thành phố rồng thu hút hàng triệu người chơi trên thế giới. Dragon City đã được bổ sung sự kiện mới liên tục với rất nhiều thử thách hấp dẫn đang chờ đón bạn. Tham gia game luyện rồng “hot” nhất và thu thập rất nhiều loài rồng phun lửa đáng yêu! Đào tạo chúng như ý muốn của bạn, phát triển bộ sưu tập và chức minh sức mạnh của bản thân qua game Dragon Master nổi tiếng thế giới.', N'148', NULL, 13, 16, 6, 4, CAST(N'2022-10-14T00:00:00.000' AS DateTime), N'4.5', N'BG18.jpg', N'Game18.1.jpg', N'Game18.2.jpg', N'Game18.3.jpg', N'Game18.4.jpg', CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (34, N'PUBG MOBILE', N'Game Battle Royale nguyên bản, đầu tiên và hay nhất! Game Battle Royale được hơn 1 tỷ người chơi trên toàn thế giới bình chọn.  Kiệt tác huyền thoại battle royale   Nhiều sự kiện đang chờ bạn khám phá   Đạt đến đỉnh cao trong PUBG MOBILE, thỏa sức bắn tùy thích. PUBG MOBILE là trò chơi battle royale nguyên bản trên di động, và là một trong những trò chơi bắn súng hay nhất.  PUBG Mobile - PLAYERUNKNOWN''S BATTLEGROUNDS MOBILE là game bắn súng sinh tồn được yêu thích trên toàn thế giới do Tencent & BlueHole nghiên cứu, phát triển và đã được phát hành chính thức tại Việt Nam, duy nhất bởi VNG.', N'689', NULL, 13, 17, 6, 4, CAST(N'2022-10-16T00:00:00.000' AS DateTime), N'4.0', N'BG19.jpg', N'Game19.1.jpg', N'Game19.2.jpg', N'Game19.3.jpg', N'Game19.4.jpg', CAST(371625.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (35, N'SUBWAY SURFERS', N'Trong game, người chơi sẽ nhập vai vào những thanh thiếu niên đầy tinh nghịch hàng ngày sơn graffiti trộm lên các toa tàu, khi bị phát hiện, chúng chạy trên những đường ray để thoát khỏi sự truy đuổi của viên thanh tra và con chó của ông ấy. Khi chạy, người chơi có thể điều khiển nhân vật nhặt tiền vàng, chìa khóa, các vật phẩm tăng sức mạnh và các phần thưởng khác trên đường ray. Đồng thời giúp nhân vật tránh xa các chướng ngại vật trên đường đi, trò chơi chỉ kết thúc khi nhân vật bị bắt bởi viên thanh tra hoặc cả hai đều bị cán bởi toa tàu. Các sự kiện đặc biệt như Săn thưởng hàng tuần (Weekly Hunt) có thể giúp người chơi hoàn thành nhiệm vụ và nhận được nhiều phần quà hơn.', N'101', NULL, 12, 19, 6, 2, CAST(N'2022-10-13T00:00:00.000' AS DateTime), N'4.4', N'BG26.jpg', N'Game26.1.jpg', N'Game26.2.jpg', N'Game26.3.jpg', N'Game26.4.jpg', CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (36, N'AMONG US', N'Among Us là game nhập vai hành động nhiều người chơi có phong cách khá giống Werewolf Online. Game có chủ đề chính xoay quanh tinh thần đồng đội và sự phản bội dành cho 4-10 người chơi trong bối cảnh không gian.', N'80', NULL, 14, 20, 6, 4, CAST(N'2022-10-18T00:00:00.000' AS DateTime), N'4.5', N'BG27.jpg', N'Game27.1.jpg', N'Game27.2.jpg', N'Game27.3.jpg', N'Game27.4.jpg', CAST(9000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (37, N'LIÊN QUÂN MOBILE', N'Garena Liên Quân Mobile là tựa game chiến thuật đỉnh cao trên Android lẫn iOS. Tuy nhiên, bạn hoàn toàn có thể trải nghiệm trên máy tính thông qua bộ giả lập LDPlayer có gắn kèm game Liên Quân Mobile. Cho người chơi thỏa sức tham gia cuộc chiến 10vs10 nảy lửa trên mọi thiết bị, ở mọi lúc mọi nơi.', N'148', NULL, 11, 21, 6, 1, CAST(N'2022-10-19T00:00:00.000' AS DateTime), N'3.5', N'BG28.jpg', N'Game28.1.jpg', N'Game28.2.jpg', N'Game28.3.jpg', N'Game28.4.jpg', CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (38, N'PLANTS VS ZOMBIES 2', N'Plants vs Zombies 2 là sự trở lại đầy ngoạn mục của siêu phẩm thủ thành “Hoa quả nổi giận”. Mặc dù game chỉ có 2 phiên bản độc quyền dành cho di động nhưng nay bạn đã có thể chơi Plants vs Zombies 2 cho máy tính thông qua phần mềm giả lập BlueStacks.', N'775', NULL, 11, 22, 6, 1, CAST(N'2022-10-15T00:00:00.000' AS DateTime), N'4.1', N'BG29.jpg', N'Game29.1.jpg', N'Game29.2.jpg', N'Game29.3.jpg', N'Game29.4.jpg', CAST(75000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (39, N'CANDY CRUSH SAGA', N'Chắc hẳn ai cũng đã từng nghe đến Candy Crush Saga, tựa game xếp kẹo đình đám trên thiết bị di động và mạng xã hội. Giờ đây bạn đã có thể tải Candy Crush về máy tính của mình và thỏa sức giải trí với trò chơi thú vị này.', N'79', NULL, 1, 23, 6, 2, CAST(N'2022-10-14T00:00:00.000' AS DateTime), N'4.6', N'BG30.jpg', N'Game30.1.jpg', N'Game30.2.jpg', N'Game30.3.jpg', N'Game30.4.jpg', CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (40, N'FARM HEROES SAGA', N'Thông qua giả lập Tencent Buddy, bạn có thể chơi game Farm Heroes Saga trên máy tính. Farm Heroes Saga PC là game xếp hình match-3 vô cùng thú vị trong thế giới nông trại và cỏ cây hoa lá siêu đáng yêu!', N'82', NULL, 1, 23, 6, 1, CAST(N'2022-10-20T00:00:00.000' AS DateTime), N'4.6', N'BG31.jpg', N'Game31.1.jpg', N'Game31.2.jpg', N'Game31.3.jpg', N'Game31.4.jpg', CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (41, N'MEGA ĐẠI CHIẾN', N'Mega Đại Chiến là một tựa game chiến thuật đấu Pet được xây dựng dựa trên bộ phim hoạt hình nổi tiếng Pokémon, đang được nhiều người yêu thích và chơi hiện nay. Trong trò chơi này, người chơi sẽ hóa thân thành một huấn luyện viên để chiêu mộ và huấn luyện Pet để chinh phục các đấu trường vô cùng khốc liệt. Khi tham gia vào tựa game này, bạn sẽ được đưa tới một thế giới Pokémon đa dạng, với sức mạnh, cấp độ tiến hóa khác nhau. Ngoài ra, ở game này còn có hiệu ứng thời tiết vô cùng ấn tượng, chúng ta sẽ được thấy những hiện tượng thời tiết như: nắng, mưa, bão tố, bão lửa, tia sét,...', N'483', NULL, 11, 24, 6, 2, CAST(N'2022-10-19T00:00:00.000' AS DateTime), N'3.7', N'BG32.jpg', N'Game32.1.jpg', N'Game32.2.jpg', N'Game32.3.jpg', N'Game32.4.jpg', CAST(200000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (42, N'HOMESCAPES', N'Chào mừng bạn đến với Homescapes, một trò chơi thực sự ấm lòng từ sê-ri Playrix Scapes ™!  Giải các câu đố match-3 để khôi phục một dinh thự tuyệt vời trên một con phố xanh tươi.  Cuộc phiêu lưu thú vị bắt đầu trước ngưỡng cửa!   Đánh bại các cấp độ trận đấu 3 đầy màu sắc để cải tạo và trang trí các phòng trong biệt thự, mở khóa nhiều chương hơn nữa trong câu chuyện gia đình thú vị trên đường đi!  Bạn còn chờ gì nữa?  Tự nhiên như ở nhà!', N'141', NULL, 5, 25, 6, 2, CAST(N'2022-10-18T00:00:00.000' AS DateTime), N'4.3', N'BG33.jpg', N'Game33.1.jpg', N'Game33.2.jpg', N'Game33.3.jpg', N'Game33.4.jpg', CAST(65000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (43, N'KHU VƯỜN TRÊN MÂY', N'Khu vườn trên mây là game nông trại miễn phí do Zing Play phát hành trên di động. Để chơi Khu vườn trên mây bạn có thể cài đặt Khu vườn trên mây thông qua các phần mềm giả lập Android như BlueStacks, LDPlayer, vv. Tải game Khu vườn trên mây để sẵn sàng khám phá nông trại trên địa đàng độc đáo này. Tựa game Khu vườn trên mây chắc hẳn không còn mấy xa lạ với những ai yêu thích dòng game nông trại. Đến với Khu vườn trên mây bạn sẽ được trở thành một người nông dân đặc biệt để chăm sóc khu vườn trên mây với những điều vô cùng thú vị.', N'108', NULL, 10, 26, 6, 2, CAST(N'2022-10-22T00:00:00.000' AS DateTime), N'4.5', N'BG34.jpg', N'Game34.1.jpg', N'Game34.2.jpg', N'Game34.3.jpg', N'Game34.4.jpg', CAST(99000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (44, N'SAVE THE DOGE', N'Bạn có thích chơi game giải đố không? Save the Doge là một trò chơi trí tuệ vui nhộn, thách thức người chơi giải cứu chú chó khỏi bị ong đốt. Hãy tìm cách vẽ một đường duy nhất để cứu chú chó dễ thương này trong mỗi màn chơi nhé!', N'35', NULL, 1, 27, 6, 1, CAST(N'2022-10-23T00:00:00.000' AS DateTime), N'3.2', N'BG35.jpg', N'Game35.1.jpg', N'Game35.2.jpg', N'Game35.3.jpg', N'Game35.4.jpg', CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (45, N'MINI WORLD', N'Mini World: CREATA là tên gọi mới của Mini World: Block Art, game xây dựng thế giới mở có đồ họa dễ thương cùng lối chơi tự do khám phá hấp dẫn. Nếu bạn muốn tìm điều gì đó mới lạ ở thể loại game sandbox giống Minecraft, thì đừng ngại thử Mini World Block Art 0.58.0.', N'1024', NULL, 12, 28, 6, 2, CAST(N'2022-10-24T00:00:00.000' AS DateTime), N'3.9', N'BG36.jpg', N'Game36.1.jpg', N'Game36.2.jpg', N'Game36.3.jpg', N'Game36.4.jpg', CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (46, N'BLOSSOM BLAST SAGA', N'Phát triển một khu vườn đầy màu sắc trong trận đấu 3 hoa trò chơi này! Liên kết nụ và làm cho họ nở!  Kết hợp theo cách của bạn thông qua một loạt các cấp độ vườn tự trị ong trong Blossom Blast Saga, một trò chơi liên kết thú vị từ các nhà sản xuất Candy Crush Saga và Farm Heroes Saga! Liên kết những nụ hoa cùng màu để làm cho những bông hoa xinh đẹp nở rộ, và dọn sạch những thảm hoa trước khi bạn hết động tác!  Ghép 3 hoặc nhiều nụ hoa để làm cho thế giới nở rộ thành những màu sắc ngoạn mục. Kết nối nhiều nụ hoa hơn để tạo ra một phản ứng dây chuyền vinh quang và xem điểm số của bạn tăng lên! Thu thập mọi bông hoa và thực hiện theo cách của bạn thông qua các cấp độ vườn tuyệt đẹp trong trò chơi phiêu lưu đầy màu sắc này!', N'73.91', NULL, 1, 23, 6, 1, CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'4.3', N'BG37.jpg', N'Game37.1.jpg', N'Game37.2.jpg', N'Game37.3.jpg', N'Game37.4.jpg', CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (47, N'MÈO & SÚP', N'Cats & Soup là game mô phỏng có lối chơi đơn giản và đồ họa cực kỳ đáng yêu, xoay quanh một nhóm mèo nấu những món súp ngon lành. Mục tiêu của bạn là thu thập các món ăn để đạt được thành tích, mở khóa công thức mới và những chú mèo mới. Ngay bây giờ bạn có thể chơi game trên các trình giả lập quen thuộc như MEmu hoặc NoxPlayer.', N'104', NULL, 13, 29, 6, 2, CAST(N'2022-10-28T00:00:00.000' AS DateTime), N'4.8', N'BG38.jpg', N'Game38.1.jpg', N'Game38.2.jpg', N'Game38.3.jpg', N'Game38.4.jpg', CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (48, N'RISE OF KINGDOMS - GAMOTA', N'Rise of Kingdoms: Lost Crusade là một trò chơi chiến thuật được phát triển bởi LilithGames. Tải xuống Rise of Kingdoms: Lost Crusade trên PC với BlueStacks và trở thành người lãnh đạo nền văn minh của riêng bạn. Một trong những nền văn minh thế giới mang tính biểu tượng và có ảnh hưởng nhất đã có vũ khí. Ai Cập đã thức tỉnh, và cuộc chiến giành quyền thống trị hoàn toàn trở nên khốc liệt hơn. Chọn và dẫn dắt một trong 13 nền văn minh hùng mạnh trong lịch sử thế giới. Biến bộ tộc nhỏ của bạn thành một siêu cường toàn cầu không thể ngăn cản với chủ nghĩa thực dụng kinh tế và sức mạnh quân sự. Các quyết định, chiến lược, quan hệ đối tác kinh tế và liên minh quân sự của bạn sẽ quyết định số phận của quốc gia non trẻ của bạn. Không có hai nền văn minh nào giống nhau. Mỗi nền văn minh đều có kiến ​​trúc độc đáo, các đơn vị độc quyền, các kỹ năng và kỹ năng đặc biệt giúp phân biệt chúng với phần còn lại. Là nhà lãnh đạo, bạn phải học cách khai thác tốt nhất lợi thế của mình để đánh bại các đối thủ và củng cố vị thế cường quốc trên thế giới. Chiến đấu và dẫn đầu cùng với một số nhà lãnh đạo được trang hoàng và có ảnh hưởng nhất trong lịch sử, từ Thutmose III đến Cleopatra và hơn thế nữa! Xây dựng một quốc gia có thể đứng vững trước thử thách của thời gian và dẫn dắt dân tộc của bạn đến một thời kỳ hoàng kim thịnh vượng và ảnh hưởng sẽ kéo dài hàng thế kỷ!', N'942', NULL, 10, 3, 6, 2, CAST(N'2022-10-27T00:00:00.000' AS DateTime), N'4.6', N'BG39.jpg', N'Game39.1.jpg', N'Game39.2.jpg', N'Game39.3.jpg', N'Game39.4.jpg', CAST(345000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (49, N'MY CITY - ENTERTAINMENT TYCOON', N'Xây dựng đường chân trời & trang trí thị trấn! Xin chúc mừng, thị trưởng! Bây giờ bạn đã chịu trách nhiệm về thành phố rất riêng của bạn! Sau khi ghi một chiến thắng vang dội, bây giờ công việc của bạn để đảm bảo rằng thành phố là một niềm vui và giải trí nơi để sinh sống. Tạo và thiết kế thành phố của mình! Xây dựng các tòa nhà thương mại và dân cư và xem thành phố của bạn phát triển từ một thị trấn nhỏ để số vốn giải trí! Đặt tên cho thành phố của bạn và tùy chỉnh hình thức của nó - chọn màu sắc và phong cách, đặt xuống công viên và đường giao thông và cung cấp cho thành phố của bạn một liên lạc của cá tính!', N'100', NULL, 10, 31, 6, 2, CAST(N'2022-10-27T00:00:00.000' AS DateTime), N'4.6', N'BG40.jpg', N'Game40.1.jpg', N'Game40.2.jpg', N'Game40.3.jpg', N'Game40.4.jpg', CAST(236000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (50, N'FARMVILLE 2: COUNTRY ESCAPE', N'FarmVille 2: Country Escape là phiên bản mới trong loạt game nông trại nổi tiếng Farmville dành cho người dùng thiết bị di động và Facebook. Nay bạn đã có thể thỏa sức chăm sóc vườn tược, làm các công việc nông trại với phiên bản FarmVille Country Escape dành cho Windows 10.', N'145', NULL, 12, 32, 6, 1, CAST(N'2022-10-23T00:00:00.000' AS DateTime), N'4.4', N'BG41.jpg', N'Game41.1.jpg', N'Game41.2.jpg', N'Game41.3.jpg', N'Game41.4.jpg', CAST(75000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (51, N' Goat Simulator 3', N'Người hành hương trở về! Trải nghiệm Goat Simulator 3, trò chơi sandbox nhiều người chơi cuộc sống nông trại siêu thực tế mới nhất! Mua trước trò chơi ngay bây giờ và nhận udder của riêng bạn trong trò chơi!', N'257024', NULL, 2, 39, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,3', N'BG51.jpg', N'Game51.1.jpg', N'Game51.2.jpg', N'Game51.3.jpg', N'Game51.4.jpg', CAST(499916.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (52, N'Honkai Impact 3', N'Honkai Impact 3 là một game nhập vai hành động theo phong cách anime được cung cấp miễn phí trên nhiều nền tảng. Trong một thế giới bị hủy hoại bởi Honkai, những cô gái trẻ dũng cảm lãnh đạo cuộc kháng chiến. Dẫn dắt những người hầu này đến các thiết bị và chiến lược khác nhau và bảo vệ thế giới.', N'132096', NULL, 2, 40, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,4', N'BG52.jpg', N'Game52.1.jpg', N'Game52.2.jpg', N'Game52.3.jpg', N'Game52.4.jpg', CAST(357000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (53, N'Grand Theft Auto V', N'Grand Theft Auto V: Premium Edition bao gồm toàn bộ câu chuyện của GTA V, Grand Theft Auto Online, nội dung và cải tiến lối chơi hiện có. Bạn cũng sẽ nhận được Gói khởi động doanh nghiệp hình sự, cách nhanh nhất để khởi động đế chế tội phạm của bạn trong GTA Online.', N'31744', NULL, 2, 41, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,7', N'BG53.jpg', N'Game53.1.jpg', N'Game53.2.jpg', N'Game53.3.jpg', N'Game53.4.jpg', CAST(455500.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (54, N'Paragon: Overprime', N'Paragon: Overprime là một TPS MOBA hành động chơi miễn phí dựa trên nhóm. Chọn một trong nhiều anh hùng có sẵn, tất cả đều có kỹ năng độc đáo và cùng đồng đội của bạn chinh phục chiến trường Prime.', N'5120', NULL, 29, 42, 6, 5, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,3', N'BG54.jpg', N'Game54.1.jpg', N'Game54.2.jpg', N'Game54.3.jpg', N'Game54.4.jpg', CAST(499651.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (55, N'Bloons TD 6', N'Xây dựng hệ thống phòng thủ hoàn hảo của bạn bằng cách kết hợp siêu tháp khỉ, nâng cấp, anh hùng và các kỹ năng đã kích hoạt, sau đó đập tan các Bloons xâm lược đến người cuối cùng! Tham gia cùng hàng triệu người chơi khác, những người đang tận hưởng các tính năng tuyệt vời, liên tục phát triển, cung cấp nhiều giờ chơi liên tục với nội dung chiến lược tốt nhất hiện có.', N'8192', NULL, 10, 43, 6, 7, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,8', N'BG55.jpg', N'Game55.1.jpg', N'Game55.2.jpg', N'Game55.3.jpg', N'game55.4.jpg', CAST(199999.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (56, N'The Last Friend', N'Bạn mệt mỏi với những trò chơi chiến đấu hoặc phòng thủ không bẻ gãy ba chân của một con vịt? Vì vậy, hãy tham gia Alpha và T. Juan trong một cuộc phiêu lưu năng động, trong đó bạn phải đối mặt với đám kẻ xấu và ông chủ của chúng và cứu tất cả những con doggies!', N'2048', NULL, 10, 44, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,2', N'BG56.jpg', N'Game56.1.jpg', N'Game56.2.jpg', N'Game56.3.jpg', N'Game56.4.jpg', CAST(140000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (57, N'Cursed Treasure 2 Ultimate Edition - Tower Defense', N'Sử dụng sức mạnh của Orc, ác quỷ và xác sống, bạn sẽ xây dựng những tòa tháp độc đáo và mạnh mẽ dọc theo các con đường để tiêu diệt bất kỳ anh hùng nào dám tiếp cận chúng.', N'14336', NULL, 4, 45, 6, 16, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,5', N'BG57.jpg', N'Game57.1.jpg', N'Game57.2.jpg', N'Game57.3.jpg', N'Game57.4.jpg', CAST(148000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (58, N'Hunter Girls', N'Hunter Girls là một game platformer chạy 2D đầy hành động. Hoàng tử Alex đã bị bắt cóc, và bây giờ ba cô gái xinh đẹp lên đường giải cứu anh ta. Mỗi người có một lý do khác nhau để bắt đầu cuộc phiêu lưu này mà bạn sẽ khám phá ra khi gặp nhau; Agnes, Kim và Flora.', N'1024', NULL, 5, 46, 6, 10, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,5', N'BG58.jpg', N'Game58.1.jpg', N'Game58.2.jpg', N'Game58.3.jpg', N'Game58.4.jpg', CAST(23500.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (59, N'Cyber Hook', N'Chạy đua qua một thế giới hồi quy tuyệt vời bằng cách sử dụng kỹ năng parkour của bạn và móc vật lộn để leo và chạy lên tường trong trò chơi platformer 3D có nhịp độ nhanh này. Thao túng không-thời gian và bất chấp các định luật vật lý để tránh rơi xuống.', N'21504', NULL, 29, 47, 6, 10, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,3', N'BG59.jpg', N'Game59.1.jpg', N'Game59.2.jpg', N'Game59.3.jpg', N'Game59.4.jpg', CAST(105000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (60, N'Terror of Hemasaurus', N'Một thành phố cổ điển đập tan chúng bằng vật lý hủy diệt thỏa mãn. Vào vai một Quái vật khổng lồ gây ra nỗi kinh hoàng cho nhân loại trong trải nghiệm arcade hiện đại này với hành động được tăng lên đến mười một.', N'14336', NULL, 29, 48, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,3', N'BG60.jpg', N'Game60.1.jpg', N'Game60.2.jpg', N'Game60.3.jpg', N'Game60.4.jpg', CAST(121000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (61, N'The Legend of Heroes: Trails from Zero', N'Khi Lloyd Bannings được bổ nhiệm vào Bộ phận hỗ trợ đặc biệt của Crossbell, anh và các đồng nghiệp mới của mình phải chứng tỏ bản thân bằng cách đấu tranh chống lại sự bất công của một thành phố đang bị nạn tham nhũng hoành hành.', N'7168', NULL, 1, 49, 6, 8, CAST(N'2022-10-31T00:00:00.000' AS DateTime), N'4,8', N'BG61.jpg', N'Game61.1.jpg', N'Game61.2.jpg', N'Game62.3.jpg', N'Game62.4.jpg', CAST(733000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (62, N'Monster Harvest', N'Monster Harvest là một game nhập vai hành động thu thập và nuôi quái vật với một sự thay đổi! Phát triển, thu thập và biến đổi cây trồng của bạn sau đó đưa chúng vào trận chiến', N'25528', NULL, 4, 50, 6, 1, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,5', N'BG62.jpg', N'Game62.1.jpg', N'Game62.2.jpg', N'Game62.3.jpg', N'Game62.4.jpg', CAST(94800.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (63, N'McPixel 3', N'McPixel 3 là một cuộc phiêu lưu ngoạn mục, trong đó anh hùng mới chớm nở của chúng ta phải cứu thế giới và tránh một loạt thảm họa bằng cách sử dụng các phương pháp hỗn loạn và độc đáo, mặc dù tích cực hài hước.', N'16384', NULL, 2, 51, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,2', N'BG63.jpg', N'Game63.1.jpg', N'Game63.2.jpg', N'Game63.3.jpg', N'Game63.4.jpg', CAST(142000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (64, N'Somerville', N'Sau thảm họa, bạn phải tìm cách để khiến gia đình mình trở lại bình thường. Somerville là một cuộc phiêu lưu khoa học viễn tưởng dựa trên những hậu quả mật thiết của cuộc xung đột quy mô lớn.', N'10444.8', NULL, 2, 52, 6, 10, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,3', N'BG64.jpg', N'Game64.1.jpg', N'Game64.2.jpg', N'Game64.3.jpg', N'Game64.4.jpg', CAST(209700.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (65, N'SuchArt: Genius Artist Simulator', N'Một trò chơi mô phỏng nghệ thuật có một không hai với sự pha trộn sơn và vật lý chân thực, cùng với rất nhiều công cụ vẽ tranh. Nâng cấp và tùy chỉnh studio của bạn, hoàn thành nhiệm vụ, bán và trưng bày tranh của bạn, mua đồ dùng mới và trở thành một nghệ sĩ được công nhận!', N'817152', NULL, 4, 53, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,7', N'BG65.jpg', N'Game65.1.jpg', N'Game65.2.jpg', N'Game65.3.jpg', N'Game65.4.jpg', CAST(220000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (66, N'Nira', N'Khám phá những hòn đảo được tạo theo thủ tục trong cuộc phiêu lưu sinh tồn trong hộp cát, nhịp độ nhanh này với đầy đủ các công trình xây dựng, chế tạo, chiến đấu, trồng trọt và nhiệm vụ. Xây dựng căn cứ, săn bắn, nấu ăn, chiến đấu với yêu tinh, kết bạn với Totem bí ẩn, cưỡi alpaca, lái máy bay và làm bất cứ điều gì bạn cần', N'9216', NULL, 4, 54, 6, 16, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,1', N'BG66.jpg', N'Game66.1.jpg', N'Game66.2.jpg', N'Game66.3.jpg', N'Game66.4.jpg', CAST(6987500.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (67, N'Bite the Bullet', N'Chạy, Bắn và Ăn theo cách của bạn thông qua game bắn súng nhập vai roguelite này. Trong một thế giới mà mọi kẻ thù đều có thể ăn được, những gì bạn ăn và lượng bạn ăn sẽ ảnh hưởng đến mọi thứ, từ vòng eo của bạn đến việc phân nhánh cây kỹ năng cho đến chế tạo vũ khí. Bắn nhanh. Ăn lớn. Thỏa mãn cơn thèm hủy diệt của bạn.', N'5120', NULL, 5, 55, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,1', N'BG67.jpg', N'Game67.1.jpg', N'Game67.2.jpg', N'Game67.3.jpg', N'Game67.4.jpg', CAST(105000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (68, N'Dark Light', N'Một nền tảng hành động 2D trong vũ trụ khoa học viễn tưởng, phong cách metroidvania và với các yếu tố giống như linh hồn. Khám phá một thế giới cyberpunk khải huyền chứa đầy những sinh vật siêu nhiên, một số trong số đó chỉ hiển thị khi được chiếu sáng bởi máy bay không người lái của bạn. Giết, giành chiến thắng, tiến bộ, trở nên mạnh mẽ hơn trong thế giới đen tối này!', N'57344', NULL, 2, 56, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,6', N'BG68.jpg', N'Game68.1.jpg', N'Game68.2.jpg', N'Game68.3.jpg', N'Game68.4.jpg', CAST(123240.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (69, N'Rogue Legacy 2', N'Rogue Legacy 2 là một trò chơi nhập vai hành động platformer rogue-LITE, trong đó con cái của bạn kế vị bạn mỗi khi bạn chết. Mỗi đứa trẻ là duy nhất. Con gái của bạn có thể là một cung thủ mù màu, và con trai của bạn là một nhà lãnh đạo theo chủ nghĩa hòa bình.', N'47104', NULL, 4, 57, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,3', N'BG69.jpg', N'Game69.1.jpg', N'Game69.2.jpg', N'Game69.3.jpg', N'Game69.4.jpg', CAST(186400.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (70, N'Among Trees', N'Among Trees là một trò chơi sinh tồn hộp cát nhỏ năng động lấy bối cảnh trong một thế giới hoang dã đầy màu sắc tràn đầy sức sống. Khám phá một thế giới đầy màu sắc mang hơi thở cuộc sống. Từ những khu rừng rậm rạp đến những căn hầm tối tăm.', N'24576', NULL, 4, 58, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,4', N'BG70.jpg', N'Game70.1.jpg', N'Game70.2.jpg', N'Game70.3.jpg', N'Game70.4.jpg', CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (71, N'Marvel''s Spider-Man: Miles Morales', N'Miles Morales trẻ tuổi tìm thấy hướng đi của mình trong ngôi nhà mới bằng cách theo bước người cố vấn của mình, Peter Parker, với tư cách là Người Nhện mới. Khi một cuộc tranh giành quyền lực đe dọa phá hủy thị trấn của anh, Miles phải khoác lên mình bộ trang phục Người Nhện và chứng tỏ mình xứng đáng.', N'141824', NULL, 5, 59, 6, 5, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,9', N'BG71.jpg', N'game71.1.jpg', N'Game71.2.jpg', N'Game71.3.jpg', N'Game71.4.jpg', CAST(1150000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (72, N'Dead Space', N'Trò chơi kinh dị sinh tồn khoa học viễn tưởng trở lại, được thiết kế lại hoàn toàn để đưa bạn vào trải nghiệm nhập vai hơn bao giờ hết với những cải tiến về hình ảnh, âm thanh và lối chơi.', N'6553.6', NULL, 31, 60, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,7', N'BG72.jpg', N'Game72.1.jpg', N'Game72.2.jpg', N'Game72.3.jpg', N'Game72.4.jpg', CAST(990000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (73, N'Blossom Tales 2: The Minotaur Prince', N'Câu chuyện mới nhất của ông nội sẽ đưa bạn vào cuộc hành trình đến những khu rừng bị ma ám, bờ biển cướp biển và những vùng đất bí ẩn khác trong một thế giới mở rộng lớn! Những thị trấn quyến rũ, những kẻ thù khủng khiếp, những câu đố phức tạp và vũ khí mạnh mẽ đang chờ đón bạn.', N'2048', NULL, 2, 61, 6, 16, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'3,8', N'BG73.jpg', N'Game73.1.jpg', N'Game73.2.jpg', N'Game73.3.jpg', N'Game73.4.jpg', CAST(140000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (74, N'TERRACOTTA', N'Khám phá triều đại nhà Tần và vào lăng mộ của vị hoàng đế đầu tiên của Trung Quốc. Một thành viên của các Chiến binh đất nung trung thành của anh ấy, thống trị Đạo của bạn, phát triển kỹ năng của bạn và giải các câu đố và thử thách để cứu linh hồn của những nạn nhân của lời nguyền.', N'50176', NULL, 1, 1, 1, 10, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'3,9', N'BG74.jpg', N'Game74.1.jpg', N'Game74.2.jpg', N'Game74.3.jpg', N'Game74.4.jpg', CAST(148800.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (75, N'Beat Hazard 3', N'Bạn đã sẵn sàng để khám phá bộ sưu tập âm nhạc của mình được ánh xạ như một thiên hà kỳ diệu tuyệt đẹp chưa? Trải nghiệm bộ sưu tập nhạc của bạn hơn bao giờ hết với game bắn súng song sinh điều khiển âm nhạc mãnh liệt này. Mỗi bài hát của bạn sẽ có sự lên xuống độc đáo của riêng nó dựa trên âm nhạc.', N'24576', NULL, 5, 63, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,0', N'BG75.jpg', N'Game75.1.jpg', N'Game75.2.jpg', N'Game75.3.jpg', N'Game75.4.jpg', CAST(159300.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (76, N'Alba - A Wildlife Adventure', N'Ngay cả những người khiêm tốn nhất cũng có thể tạo nên sự khác biệt. Tham gia cùng Alba trong cuộc chiến của cô ấy để cứu động vật hoang dã trên hòn đảo xinh đẹp của cô ấy. Một cuộc cách mạng cũng có thể đang được tiến hành.', N'23552', NULL, 4, 64, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'3,6', N'BG76.jpg', N'Game76.1.jpg', N'Game76.2.jpg', N'Game76.3.jpg', N'Game76.4.jpg', CAST(158000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (77, N'UNCHARTED™: Legacy of Thieves Collection', N'Bạn đã sẵn sàng để tìm kiếm vận may của bạn? UNCHARTED: Legacy of Thieves Collection bao gồm hai cuộc phiêu lưu chơi đơn nổi tiếng từ UNCHARTED 4: A Thief''s End và UNCHARTED: The Lost Legacy.', N'954368', NULL, 2, 65, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,8', N'BG77.jpg', N'GAme77.1.jpg', N'Game77.2.jpg', N'Game77.3.jpg', N'Game77.4.jpg', CAST(1159000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (78, N'Shadow Tactics', N'Shadow Tactics là một trò chơi chiến thuật lén lút dữ dội lấy bối cảnh ở Nhật Bản trong thời kỳ Edo. Một tướng quân mới đã nắm quyền ở Nhật Bản và áp đặt hòa bình cho toàn bộ quốc gia. Anh ta thuê năm chuyên gia có tài năng đặc biệt về ám sát và gián điệp.', N'29696', NULL, 10, 66, 6, 5, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,7', N'BG78.jpg', N'Game78.1.jpg', N'Game78.2.jpg', N'Game78.3.jpg', N'Game78.4.jpg', CAST(300000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (79, N'Dark Deity', N'Bước vào thế giới của Terrazael và dẫn dắt những anh hùng sắp trở thành huyền thoại trong nhiệm vụ khôi phục một vùng đất bị chia cắt bởi những lời thề bị phá vỡ, những cuộc chiến liều lĩnh và ma thuật hoang dã. Chống trả trong các trận chiến theo lượt, quản lý các mối quan hệ của nhân vật, thu thập các hiện vật nguy hiểm và khôi phục thế giới.', N'467968', NULL, 2, 67, 6, 15, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,3', N'BG79.jpg', N'Game79.1.jpg', N'Game79.2.jpg', N'Game79.3.jpg', N'Game79.4.jpg', CAST(233000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (80, N' Rumbleverse', N'Nhảy vào cuộc chiến! Rumbleverse™ là trò chơi Brawler Royale miễn phí hoàn toàn mới, nơi 40 người chơi cạnh tranh để trở thành nhà vô địch.', N'68608', NULL, 5, 68, 6, 14, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,4', N'BG80.jpg', N'Game80.1.jpg', N'GAme80.2.jpg', N'Game80.3.jpg', N'Game80.4.jpg', CAST(367800.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (81, N'Destiny 2', N'Destiny 2 là một MMO hành động với một thế giới phát triển độc đáo mà bạn và bạn bè của mình có thể chơi miễn phí mọi lúc, mọi nơi.', N'73728', NULL, 5, 69, 6, 9, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'3,8', N'BG81.jpg', N'Game81.1.jpg', N'Game81.2.jpg', N'Game81.3.jpg', N'Game81.4.jpg', CAST(467000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (82, N'Roller Champions™', N'Trượt băng để đạt vinh quang trong Roller Champions™, trò chơi thể thao đồng đội PvP miễn phí độc đáo!', N'48128', NULL, 5, 70, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,3', N'BG82.jpg', N'Game82.1.jpg', N'Game82.2.jpg', N'Game82.3.jpg', N'Game82.4.jpg', CAST(730480.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (83, N'The Cycle: Frontier', N'The Cycle: Frontier là một game bắn súng PvP khai thác đầy hồi hộp và nguy hiểm. Đi tìm kiếm tài nguyên trên một hành tinh bị bỏ hoang, nơi sinh sống của những sinh vật hung ác và những người chơi thù địch khác.', N'80896', NULL, 5, 71, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,2', N'BG83.jpg', N'Game83.1.jpg', N'Game83.2.jpg', N'Game83.3.jpg', N'Game83.4.jpg', CAST(700000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (84, N'Pinball FX', N'Pinball FX là một máy bắn bi kỹ thuật số tiên tiến. Đạt điểm cao trên các bộ lấy cảm hứng từ các thương hiệu giải trí lớn nhất. Tham gia Quyền truy cập sớm và thường xuyên tận hưởng các tính năng mới và nội dung độc quyền!', N'75776', NULL, 29, 72, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,0', N'BG84.jpg', N'game84.1.jpg', N'Game84.2.jpg', N'Game84.3.jpg', N'Game84.4.jpg', CAST(754000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (85, N'Dauntless', N'Dauntless là game nhập vai hành động trực tuyến miễn phí của Phoenix Labs. Cập nhật thường xuyên, các sự kiện theo mùa, Behemoth mới và một thế giới phong phú và phát triển hơn đang chờ đón bạn.', N'47104', NULL, 5, 73, 6, 11, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,5', N'BG85.jpg', N'Game85.1.jpg', N'Game85.2.jpg', N'Game85.3.jpg', N'Game85.4.jpg', CAST(746000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (86, N'Paladins', N'Tham gia cùng 30 triệu người chơi trên Paladins, game bắn súng anh hùng miễn phí neo đậu trong một vũ trụ giả tưởng. Là nhà vô địch của Vương quốc, bạn sử dụng vũ khí cũng như phép thuật và bạn tùy chỉnh các kỹ năng của mình cho phù hợp với lối chơi của mình.', N'881664', NULL, 8, 74, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,4', N'BG86.jpg', N'Game86.1.jpg', N'Game86.2.jpg', N'Game86.3.jpg', N'Game86.4.jpg', CAST(419000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (87, N'Warframe', N'Thức tỉnh như một chiến binh không ngừng nghỉ và chiến đấu bên cạnh bạn bè của bạn trong trò chơi hành động trực tuyến miễn phí dựa trên cốt truyện gốc này.', N'49152', NULL, 5, 75, 1, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,6', N'BG87.jpg', N'Game87.1.jpg', N'Game87.2.jpg', N'Game87.3.jpg', N'Game87.4.jpg', CAST(234560.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (88, N'Warface', N'Một sự kết hợp bùng nổ giữa MMO và FPS, Warface có hàng triệu người hâm mộ trên toàn thế giới! Nó có các chế độ PvP khốc liệt, các nhiệm vụ PvE ly kỳ và các cuộc đột kích ly kỳ! Chọn từ năm lớp độc đáo và tự trang bị cho mình một kho vũ khí khổng lồ có thể tùy chỉnh!', N'49152', NULL, 8, 76, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,1', N'BG88.jpg', N'Game88.1.jpg', N'Game88.2.jpg', N'Game88.3.jpg', N'Game88.4.jpg', CAST(980000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (89, N' Demo of Hundred Days - Wine Simulation', N'Hundred Days đưa bạn vào một cuộc phiêu lưu khó quên trên khắp thế giới để khám phá những bí mật của việc sản xuất rượu vang. Tải xuống bản demo để thưởng thức trò chơi của chúng tôi, sau đó thêm nó vào danh sách yêu thích của bạn.', N'62464', NULL, 2, 77, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,8', N'BG89.jpg', N'Game89.1.jpg', N'Game89.2.jpg', N'Game89.3.jpg', N'Game89.4.jpg', CAST(784000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (90, N'Phantasy Star Online 2 New Genesis', N'Phantasy Star Online 2 New Genesis, chương mới nhất trong sê-ri Phantasy Star Online 2, cuối cùng cũng có mặt! Đã đến lúc nhảy vào những cuộc phiêu lưu ngoài sức tưởng tượng!', N'45568', NULL, 5, 78, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,3', N'BG90.jpg', N'Game90.1.jpg', N'Game90.2.jpg', N'Game90.3.jpg', N'Game90.4.jpg', CAST(452000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (91, N'Path of Exile', N'Bạn là một Exile đang cố gắng sống sót trên lục địa đen tối Wraeclast trong khi chiến đấu để giành thêm quyền lực và trả thù những kẻ đã đối xử tệ với bạn. Được tạo bởi những game thủ dày dạn kinh nghiệm, Path of Exile là một game nhập vai hành động lấy bối cảnh trong một thế giới giả tưởng đen tối.', N'64512', NULL, 5, 79, 6, 16, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,6', N'BG91.jpg', N'Game91.1.jpg', N'GAme91.2.jpg', N'Game91.3.jpg', N'Game91.4.jpg', CAST(840000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (92, N'Delores: A Thimbleweed Park mini-adventure', N'Delores đã trở về nhà và làm nhiếp ảnh gia cho tờ Nickel News. Công viên Thimbleweed đã không thay đổi một chút nào trong năm kể từ khi anh ấy rời đi. Mặc dù... Hãy xem công cụ trò chơi phiêu lưu mới của Ron Gilbert trong nguyên mẫu miễn phí này.', N'5120', NULL, 4, 80, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,1', N'BG92.jpg', N'Game92.1.jpg', N'Game92.2.jpg', N'Game92.3.jpg', N'Game92.4.jpg', CAST(600000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (93, N'Aeterna Noctis', N'Aeterna Noctis là một game platformer hành động 2D vẽ tay đòi hỏi khắt khe. Đó là một Metroidvania với những trận chiến khốc liệt sẽ khiến bạn phải kiễng chân và những pha đi trên nền tảng quỷ quyệt sẽ thử thách các kỹ năng của bạn.', N'52224', NULL, 5, 81, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,0', N'BG93.jpg', N'Game93.1.jpg', N'Game93.2.jpg', N'Game93.3.jpg', N'Game93.4.jpg', CAST(400000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (94, N'Demo', N'Tom Clancy''s Ghost Recon Breakpoint là một game bắn súng quân sự lấy bối cảnh trong một thế giới mở đa dạng, thù địch và bí ẩn mà bạn có thể chơi hoàn toàn một mình hoặc phối hợp tối đa bốn người chơi. Trải nghiệm một game bắn súng quân sự lấy bối cảnh trong một thế giới mở đa dạng và thù địch mà bạn có thể chơi một mình hoặc phối hợp tối đa bốn người chơi.', N'55296', NULL, 4, 82, 6, 17, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'3,8', N'BG94.jpg', N'Game94.1.jpg', N'game94.2.jpg', N'Game94.3.jpg', N'Game94.4.jpg', CAST(320000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (95, N'UnMetal Demo', N'Trong bản demo này, bạn vào vai Jesse Fox, một người hành động bị bắt vì tội mà anh ta không phạm phải. Sử dụng bất cứ thứ gì trên đường đi của bạn để đánh lạc hướng, thu hút, loại bỏ và trong một số trường hợp, tiêu diệt kẻ thù đứng giữa Jesse và sự tự do của anh ta.', N'47104', NULL, 5, 83, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,2', N'BG95.jpg', N'Game95.1jpg', N'Game95.2.jpg', N'Game95.3.jpg', N'Game95.4.jpg', CAST(302000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (96, N'Year 2070', N'Xây dựng xã hội tương lai của bạn, xâm chiếm các hòn đảo và tạo ra các siêu đô thị rộng lớn với vô số tòa nhà, phương tiện và tài nguyên để quản lý.', N'49152', NULL, 4, 84, 6, 15, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,4', N'BG96.jpg', N'Game96.1.jpg', N'Game96.2.jpg', N'Game96.3.jpg', N'Game96.4.jpg', CAST(123750.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (97, N'Brawlhalla', N'Brawlhalla là một trò chơi chiến đấu 2D hoành tráng, có thể chơi miễn phí. Tham gia các chế độ "Miễn phí cho tất cả", tham gia các trận đấu xếp hạng hoặc tạo các trò chơi tùy chỉnh với bạn bè của bạn. Hàng triệu người chơi. Cập nhật thường xuyên. Hơn năm mươi ký tự độc đáo. Hãy chiến đấu vì vinh quang trong hội trường Valhalla, nơi những người dũng cảm sống mãi mãi!', N'5120', NULL, 5, 85, 1, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'3,9', N'BG97.jpg', N'Game97.1.jpg', N'Game97.2.jpg', N'Game97.3.jpg', N'Game97.4.jpg', CAST(400000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (98, N'Knockout City™', N'Knockout City hoạt động miễn phí và mời tất cả các đấu sĩ tham gia vào các trận đấu căng thẳng đặc biệt. Thành lập một đội và chiến đấu với đám đông đối thủ trong TRÒ CHƠI BÓNG DODGE EPIC!', N'6144', NULL, 5, 86, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,1', N'BG98.jpg', N'Game98.1.jpg', N'Game98.2.jpg', N'Game98.3.jpg', N'Game98.4.jpg', CAST(606000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (99, N' Fire Commander', N'Hãy xem ý nghĩa của việc đối mặt với ngọn lửa. Chỉ huy một đơn vị chữa cháy trong một RTS chiến thuật thú vị. Cứu mạng sống và chăm sóc đội của bạn trong hơn 30 nhiệm vụ. Hãy là một anh hùng thực sự!', N'8192', NULL, 5, 87, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'3,8', N'BG99.jpg', N'Game99.1.jpg', N'Game99.2.jpg', N'Game99.3.jpg', N'Game99.4.jpg', CAST(140000.00 AS Decimal(18, 2)))
INSERT [dbo].[OVERALL] ([Ma], [Ten], [GioiThieu], [DungLuong], [LinkTai], [MaTheLoai], [MaNPH], [MaHDH], [MaNgonNgu], [NgayCapNhat], [DanhGia], [HinhNen], [HinhCT1], [HinhCT2], [HinhCT3], [HinhCT4], [DonGia])  VALUES (100, N'Startup Panic', N'Bỏ việc và bắt đầu một khởi nghiệp tuyệt vời! Sống sót trong bong bóng công nghệ, chiến đấu với các CEO cạnh tranh và mở rộng văn phòng của bạn để phát triển từ lập trình viên tự do thành bậc thầy phá hoại công nghiệp toàn cầu! Miễn là bạn không bị tấn công... hoặc bị bắt cóc...', N'5120', NULL, 4, 88, 6, 2, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'4,4', N'BG100.jpg', N'Game100.1.jpg', N'Game100.2.jpg', N'Game100.3.jpg', N'Game100.4.jpg', CAST(13000.00 AS Decimal(18, 2)))

SET IDENTITY_INSERT [dbo].[OVERALL] OFF