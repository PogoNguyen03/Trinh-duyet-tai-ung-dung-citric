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


Create table APP
(
	MaApp int Identity(1,1),
	TenApp nvarchar(100) not null,
	GioiThieu ntext,
	KichThuocRam nvarchar(10),
	NgonNgu nvarchar(50),
	HeDieuHanh nvarchar(50),
	LinkTai ntext,
	MaTheLoai int,
	MaNPH int,
	NgayCapNhat datetime,
	DanhGia nvarchar(5),
	HinhNen nvarchar(30),
	HinhCT1 nvarchar(30),
	HinhCT2 nvarchar(30),
	HinhCT3 nvarchar(30),
	HinhCT4 nvarchar(30),
	constraint PK_APP primary key (MaApp)
)

Create table GAME
(
	MaGame int Identity(1,1),
	TenGame nvarchar(100) not null,
	GioiThieu ntext,
	KichThuocRam nvarchar(10),
	NgonNgu nvarchar(50),
	HeDieuHanh nvarchar(50),
	LinkTai ntext,
	MaTheLoai int,
	MaNPH int,
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
 Alter table APP add constraint FK_APP_THELOAI
					 foreign key (MaTheLoai)
					 references THELOAI (MaTheLoai) 
 Alter table GAME add constraint FK_GAME_NHAPHATHANH
					 foreign key (MaNPH)
					 references NHAPHATHANH (MaNPH) 
 Alter table GAME add constraint FK_GAME_THELOAI
					 foreign key (MaTheLoai)
					 references THELOAI (MaTheLoai) 
 Alter table APP add constraint FK_APP_NGONNGU
					 foreign key (MaNgonNgu)
					 references NGONNGU (MaNgonNgu) 
 Alter table APP add constraint FK_APP_HEDIEUHANH
					 foreign key (MaHDH)
					 references HEDIEUHANH (MaHDH) 
 Alter table GAME add constraint FK_GAME_NGONNGU
					 foreign key (MaNgonNgu)
					 references NGONNGU (MaNgonNgu) 
 Alter table GAME add constraint FK_GAME_HEDIEUHANH
					 foreign key (MaHDH)
					 references HEDIEUHANH (MaHDH) 


-- TẠO CỘT TRONG BẢNG
alter table KHACHHANG
add GioiTinh nvarchar(10)

-- XOÁ DÒNG TRON BẢNG
delete from UNGDUNG
where MaUngDung = 1

-- XOÁ CỘT TRONG BẢNG
alter table KHACHHANG
drop column Gioitinh

-- NHẬP DỮ LIỆU
Set identity_insert [dbo].[KHACHHANG] on
Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (1,N'SUPRALAND SIX INCHES UNDER',
		N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland.
Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người.
Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm.
Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng).
Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://bluemediafiles.homes/url-generator.php?url=KH1TK0eBXmDmljELeo4C+FFvmgHJbc++7psPlN6tioiOAlqFJyJr1Da7TS+/2OydxBiEj9qrLmBRlalrpjeVwHAr6vqfd6J7bAs53bHlBmY=',1,1,31/10/2022,N'BgGame1.jpg')

Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (2,N'THE KING OF FIGHTERS XV',
		N'“Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://hadoantv.com/download?kind=old&url=https%3A%2F%2Fanotepad.com%2Fnotes%2Fx4asr7ek',1,1,30/10/2022,N'Game1.jpg')
Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (3,N'SUPRALAND SIX INCHES UNDER',
		N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland.
Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người.
Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm.
Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng).
Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://bluemediafiles.homes/url-generator.php?url=KH1TK0eBXmDmljELeo4C+FFvmgHJbc++7psPlN6tioiOAlqFJyJr1Da7TS+/2OydxBiEj9qrLmBRlalrpjeVwHAr6vqfd6J7bAs53bHlBmY=',1,1,31/10/2022,N'BgGame1.jpg')

Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (4,N'THE KING OF FIGHTERS XV',
		N'“Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://hadoantv.com/download?kind=old&url=https%3A%2F%2Fanotepad.com%2Fnotes%2Fx4asr7ek',1,1,30/10/2022,N'Game1.jpg')
		Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (5,N'SUPRALAND SIX INCHES UNDER',
		N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland.
Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người.
Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm.
Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng).
Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://bluemediafiles.homes/url-generator.php?url=KH1TK0eBXmDmljELeo4C+FFvmgHJbc++7psPlN6tioiOAlqFJyJr1Da7TS+/2OydxBiEj9qrLmBRlalrpjeVwHAr6vqfd6J7bAs53bHlBmY=',1,1,31/10/2022,N'BgGame1.jpg')

Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (6,N'THE KING OF FIGHTERS XV',
		N'“Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://hadoantv.com/download?kind=old&url=https%3A%2F%2Fanotepad.com%2Fnotes%2Fx4asr7ek',1,1,30/10/2022,N'Game1.jpg')
		Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (7,N'SUPRALAND SIX INCHES UNDER',
		N'“Six Inches Under” là một dự án phụ nhỏ được tạo ra để giới thiệu các thành viên nhóm phát triển mới với các công cụ và quy trình làm việc của chúng tôi. Về cơ bản đó là sự chuẩn bị của chúng tôi cho phần tiếp theo của Supraland.
Trong khi David Münnich thực hiện trò chơi Supraland đầu tiên một mình khá nhiều, anh ấy có một vai trò nhỏ hơn trong trò chơi này. Nhóm nòng cốt cho việc này có 6 người.
Khá nhiều người trong nhóm đã xây dựng 1 hoặc 2 khu vực của thế giới trò chơi, và theo nghĩa đó, nó rất thử nghiệm.
Nó được cho là một DLC nhỏ cho Supraland, nhưng nó hơi khó chịu và ngày càng phức tạp hơn. Thay vì 3 tháng, chúng tôi mất 27 tháng để làm việc này (Supraland 1 đã được phát triển trong 16 tháng).
Nó có thể được coi là “Supraland 1.5” vì nó vẫn còn rất nhiều thứ từ trò chơi đầu tiên, nhưng đồng thời đó là một thế giới mới với một loạt các cơ chế mới.
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://bluemediafiles.homes/url-generator.php?url=KH1TK0eBXmDmljELeo4C+FFvmgHJbc++7psPlN6tioiOAlqFJyJr1Da7TS+/2OydxBiEj9qrLmBRlalrpjeVwHAr6vqfd6J7bAs53bHlBmY=',1,1,31/10/2022,N'BgGame1.jpg')

Insert [dbo].[GAME]([MaGame],[TenGame],[GioiThieu],[KichThuocRam],[HeDieuHanh],[NgonNgu],[LinkTai],[MaTheLoai],[MaNPH],[NgayCapNhat],[HinhNen])
values (8,N'THE KING OF FIGHTERS XV',
		N'“Kể từ lần đầu tiên ra mắt vào năm 1994, dòng game đối kháng KOF đã đưa thế giới lên một tầm cao mới của sự phấn khích với các nhân vật hấp dẫn và hệ thống trò chơi độc đáo. Sáu năm đã trôi qua kể từ tựa game cuối cùng trong sê-ri, và giờ đây KOF XV vượt qua tất cả những người tiền nhiệm về đồ họa, hệ thống và trải nghiệm trực tuyến!
',
		N'8GB', N'Windows', N'Tiếng Anh',N'https://hadoantv.com/download?kind=old&url=https%3A%2F%2Fanotepad.com%2Fnotes%2Fx4asr7ek',1,1,30/10/2022,N'Game1.jpg')

Set identity_insert [dbo].[GAME] off

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

Select * from game

alter table GAME
drop column NgonNgu

alter table GAME
add MaNgonNgu int

update Game
set MaNgonNgu = 1
where MaGame = 1

