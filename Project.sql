-- Tạo database
create database Project
Go
USE [Project]
GO

-- Tạo bảng CIRCUM(hoàn cảnh)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE CIRCUM (
    [circum_id] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [partner_id] [int] NOT NULL,
    [circum_name] [nvarchar] (255),
    [circum_type] [nvarchar] (50),
    [circum_content] [nvarchar] (max),
    [circum_image] [nvarchar] (1000), 
    [circum_des] [nvarchar] (300),
    [circum_donations] [int], -- luot quyen gop
    [circum_target] [bigint],
    [circum_raise] [bigint],
    [circum_time_end] [int],
    [circum_start_donate] varchar (10)
);

SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE PARTNER (
	[partner_id]  [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [partner_name]    [nvarchar] (50) ,
    [partner_slogan]  [nvarchar] (200) ,
    [partner_logo] [nvarchar] (255),
    [partner_banner] [nvarchar] (255),
    [partner_introduce]   [nvarchar] (4000),
    [partner_number_donate] [int],
    [partner_total_money] [bigint],
    [partner_content] [nvarchar] (max)
);
SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[circum]  ADD FOREIGN KEY([partner_id])
REFERENCES [dbo].[partner] ([partner_id])
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE news (
    [news_id] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [news_img_banner] [nvarchar] (255),
    [news_descritption] [nvarchar] (255), 
    [news_post_date] [nvarchar] (10),
    [news_content] [nvarchar] (max)
);

SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE  TABLE CIRCUM_ORDER(
    [circum_order_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [account_mail] [varchar](100),
    [circum_id] [int],
	[circum_order_date] [date],
    [circum_order_phone] [varchar] (20)
)

SET ANSI_PADDING OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE CIRCUM_ORDER_DETAILS (
    [circum_order_id] [int] ,
	[circum_id] [int] ,
	[donated_money] [bigint]
)
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE ACCOUNT (
    [account_id] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [account_role] [int] NOT NULL,
    [account_mail] [nvarchar] (255),
    [account_name] [nvarchar] (100),
    [account_phone] [nvarchar] (50),
    [total_donated] [bigint],
    [account_password] [nvarchar] (50)
)
SET ANSI_PADDING OFF
GO

create table CIRCUM_ORDER (
    circum_order_id [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
    circum_id [int] NOT NULL,
    circum_order_name [nvarchar] (255) NOT NULL,
    circum_order_mail [nvarchar] (255) NOT NULL,
    circum_order_phone [nvarchar] (50) NOT NULL,
    circum_order_bank [nvarchar] (20) NOT NULL, 
    circum_order_bankname [nvarchar] (20) NOT NULL,
    circum_order_address [nvarchar] (255) NOT NULL,
    circum_order_amount [int] NOT NULL,
    circum_order_date varchar (20) NOT NULL
);	
ALTER TABLE [dbo].[CIRCUM_ORDER] ADD  DEFAULT (getdate()) FOR [circum_order_date]
GO

ALTER TABLE [dbo].[CIRCUM]  ADD FOREIGN KEY([partner_id])
REFERENCES [dbo].[PARTNER] ([partner_id])
GO

ALTER TABLE [dbo].[CIRCUM_ORDER_DETAILS]  ADD FOREIGN KEY([circum_order_id])
REFERENCES [dbo].[CIRCUM_ORDER] ([circum_order_id])
GO

ALTER TABLE [dbo].[CIRCUM_ORDER_DETAILS]  ADD FOREIGN KEY([circum_id])
REFERENCES [dbo].[circum] ([circum_id])
GO

CREATE TABLE ACCOUNTDETAILS (
    [account_id] [int] NOT NULL PRIMARY KEY,
    account_firstName nvarchar (50),
    account_lastName nvarchar (50),
    account_image nvarchar (255),
	account_address nvarchar (255),
	account_birthday nvarchar (50),
	account_organization nvarchar (50),
	total_donated bigint
);
GO
    INSERT INTO PARTNER (
    [partner_name]
      ,[partner_slogan]
      ,[partner_logo]
      ,[partner_banner]
      ,[partner_introduce]
      ,[partner_number_donate]
      ,[partner_total_money]
       ,[partner_content]
) VALUES (
    N'Sức Mạnh 2000',
    N'Tiền lẻ mỗi ngày Xây ngay nghìn trường mới',
    'https://sucmanh2000.com/wp-content/uploads/2020/10/fl1-2-1.png',
    'https://static.mservice.io/img/momo-upload-api-211201181824-637739795046905657.jpg',
    N'Quỹ Sức mạnh 2000 thuộc hệ sinh thái Nuôi Em, được thành lập để nâng cao chất lượng Cơ sở vật chất cho các em nhỏ khó khăn vùng cao.
Mỗi người 2.000 đồng/ngày, chúng tôi đã xây dựng trong 10 năm qua',
    123,
    13,
    N'
    <div class="soju__prose small mt-5"><p>
	“Sức mạnh 2000 – Tiền lẻ mỗi ngày Triệu người chung tay Xây nghìn trường mới” được&nbsp;phát động ngày 27/02/2020 là dự án gây quỹ tiếp theo của Dự Án Ánh Sáng Núi Rừng ra đời năm 2009 dưới sự phối hợp, triển khai của Trung tâm tình nguyện Quốc gia.
</p><h4>Sứ&nbsp;mệnh "Sức mạnh 2000"</h4><p>
	Xuất phát từ ý tưởng tích tiểu thành đại, chương trình "Sức mạnh 2000" mang trên mình sứ mệnh cùng toàn xã hội thay những trường tạm tại Việt Nam, xây hàng trăm cây cầu &amp; nhà nhân ái tới năm 2025.
</p><h4>Thành quả "Sức mạnh 2000"</h4><p>
	Được triển khai từ tháng 02/2020, dự án "Sức mạnh 2000" với sự chung tay đóng góp của 18 doanh nghiệp và gần 2000 cá nhân đã khởi công xây dựng và được vào sử dụng:
</p><ul><li><strong>130+ Trường học</strong> được xây nên&nbsp;tại các tỉnh Điện Biên, Lai Châu, Thanh Hoá, Nghệ An thông qua dự án Ánh Sáng Núi Rừng</li><li><strong>31+ Công trình</strong>&nbsp;đã khởi công xây dựng &amp; đưa vào sử dụng</li><li><strong>100+ Công trình</strong> dự kiến trong năm 2021 gồm: điểm trường, nhà hạnh phúc, nhà nội trú, cây cầu mới đang và sẽ được hoàn thiện.</li><li><strong>40.000+ Học sinh</strong> có điều kiện học tập tốt hơn</li></ul><h4>Ai cũng có thể làm&nbsp;nên "Sức mạnh 2000"</h4><p>
	Chỉ với 2.000 đồng mỗi ngày&nbsp;thì mỗi năm&nbsp;với 100 nghìn giúp sức từ cộng đồng sẽ có 292 điểm trường được khởi công xây dựng. Với 2 triệu giúp sức từ cộng đồng sứ mệnh "Sức mạnh 2000" sẽ được hoàn thành.&nbsp;&nbsp;
</p><p>
	Để trẻ em vùng cao được tiếp cận giáo dục tốt hơn với hơn 144 công trình đã xây dựng và hơn thế nữa, hãy cùng MoMo và "Sức mạnh 2000" mang đến ý nghĩa phi thường từ 2.000 đồng.&nbsp;
</p><p>
	Dự án cũng mong muốn thay đổi được suy nghĩ "chỉ người giàu mới làm từ thiện" khi mở ra góc nhìn mới cho mọi người về giá trị và những thay đổi mà 2.000 đồng có thể mang lại.
</p><div class="jsx-df4f07e142feb149 mt-3 text-center"><button type="button" class="jsx-df4f07e142feb149 rounded-md py-1 px-3 font-semibold text-blue-500  hover:bg-blue-50">Thu gọn <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="jsx-df4f07e142feb149 relative inline-block h-5 w-5 rotate-180 transform"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" class="jsx-df4f07e142feb149"></path></svg> </button></div></div>
    '
)

INSERT INTO PARTNER (
    [partner_name]
      ,[partner_slogan]
      ,[partner_logo]
      ,[partner_banner]
      ,[partner_introduce]
      ,[partner_number_donate]
      ,[partner_total_money]
       ,[partner_content]
) VALUES (
    N'Quỹ Hy Vọng',
    N'Hỗ trợ các hoàn cảnh khó khăn',
    'https://quyhyvong.com/wp-content/themes/hope/assets/images/hope.svg',
    'https://static.mservice.io/img/momo-upload-api-211221160135-637756992950362040.jpg',
    N'Ra đời năm 2017, Quỹ Hy Vọng là một quỹ xã hội - từ thiện hoạt động vì cộng đồng, không vì lợi nhuận, được vận hành bởi Báo điện tử VnExpress và Công ty cổ phần FPT. Quỹ Hy vọng theo đuổi hai mục tiêu: hỗ trợ các hoàn cảnh khó khăn và tạo động lực phát triển.',
    25,
    2,
    N'
    <div class="soju__prose small mt-5"><p><strong>Việc chúng tôi làm:</strong></p><ul><li aria-level="1">Thực hiện các chương trình cứu trợ nhân đạo đến các đối tượng có nguy cơ rơi vào tình trạng cực đoan: những nạn nhân của thiên tai, người khuyết tật, các cộng đồng yếu thế…</li><li aria-level="1">Trang bị hạ tầng phục vụ cho phát triển tại các vùng khó khăn, gia tăng cơ hội tiếp cận với nguồn vốn.</li><li aria-level="1">Thúc đẩy ứng dụng công nghệ, các hoạt động khởi nghiệp và trang bị công cụ phát triển bền vững cho các cá nhân và cộng đồng, đặc biệt là trang bị tri thức thông qua giáo dục.</li></ul><p><strong>Việc bạn có thể làm:</strong></p><ul><li aria-level="1"><strong>Đóng góp tài chính:</strong> Tiền của bạn sẽ được sử dụng cho các sứ mệnh của Quỹ Hy vọng, được theo dõi và báo cáo minh bạch thường kỳ, đảm bảo chúng thực sự tác động lên đời sống của những người cần giúp đỡ.</li><li aria-level="1"><strong>Đóng góp các ý tưởng:</strong> Hãy đề xuất với chúng tôi bất kỳ dự án công nghệ hoặc hỗ trợ sinh kế nào có tính khả thi cao, giải quyết được một vấn đề cụ thể của xã hội.</li><li aria-level="1">Nếu bạn biết các trường hợp khẩn cấp cần hỗ trợ về tài chính hoặc sinh kế, hãy thông báo với Quỹ Hy vọng</li></ul></div>
    '
)

INSERT INTO PARTNER (
    [partner_name]
      ,[partner_slogan]
      ,[partner_logo]
      ,[partner_banner]
      ,[partner_introduce]
      ,[partner_number_donate]
      ,[partner_total_money]
       ,[partner_content]
) VALUES (
    N'Viện Nghiên cứu Quản lý Phát triển bền vững (MSD)',
    N'Bảo vệ các đối tượng có hoàn cảnh khó khăn',
    'https://gbvnet.org/Data/MemberLogos/LOGO%20MSD.png',
    'https://static.mservice.io/img/momo-upload-api-211221161521-637757001210853249.jpg',
    N'Là một tổ chức phi chính phủ Việt Nam, MSD nỗ lực hành động thúc đẩy việc thực hiện quyền của các nhóm cộng đồng bị lề hoá, dễ bị tổn thương. MSD cũng là tổ chức đáp ứng nhu cầu và bảo vệ các đối tượng có hoàn cảnh khó khăn, thông qua các dự án và hỗ trợ trẻ em, thanh thiếu niên, phụ nữ, người vô gia cư, người nhập cư và người khuyết tật tại Việt Nam.',
    20,
    2,
    N'
   <div class="soju__prose small mt-5">Là một tổ chức phi chính phủ Việt Nam,&nbsp;Viện Nghiên cứu Quản lý Phát triển bền vững&nbsp;(MSD) nỗ lực hành động vì một môi trường phát triển thuận lợi cho sự phát triển của khối các tổ chức xã hội và thúc đẩy việc thực hiện quyền của các nhóm cộng đồng bị lề hóa và dễ bị tổn thương, đặc biệt là nhóm trẻ em, thanh niên, phụ nữ và người khuyết tật. MSD được công nhận là một tổ chức hàng đầu trong phối hợp, hỗ trợ và cung cấp các dịch vụ nâng cao năng lực, đào tạo và tham vấn cho các tổ chức xã hội tại Việt Nam. Bên cạnh đó, MSD cũng là tổ chức chuyên nghiệp đáp ứng hiệu quả nhu cầu và bảo vệ các đối tượng có hoàn cảnh khó khăn, thông qua tổ chức các dự án và hỗ trợ trẻ em, thanh thiếu niên, phụ nữ, người vô gia cư, người nhập cư và người khuyết tật tại Việt Nam.</div>
    '
)

INSERT INTO PARTNER (
    [partner_name]
      ,[partner_slogan]
      ,[partner_logo]
      ,[partner_banner]
      ,[partner_introduce]
      ,[partner_number_donate]
      ,[partner_total_money]
       ,[partner_content]
) VALUES (
    N'Quỹ Từ Thiện Hoa Chia Sẻ',
    N'Hỗ trợ các hoàn cảnh khó khăn',
    'https://hoachiase.com/wp-content/uploads/2021/07/HCS-logo-2-180x47.png',
    'https://static.mservice.io/img/momo-upload-api-211202160536-637740579366714216.jpg',
    N'Quỹ xã hội – từ thiện được thành lập tự nguyện, không vì lợi nhuận, trên nguyên tắc tự tạo vốn. Quỹ hoạt động nhằm mục đích xã hội – từ thiện, ưu tiên giúp đỡ các gia đình khó khăn, có công với cách mạng và hỗ trợ, khuyến khích phát triển văn hóa, giáo dục, y tế, thể dục thể thao, khoa học và các mục đích phát triển cộng đồng phù hợp quy định của pháp luật.',
    35,
    3,
    N'
   <div class="soju__prose small mt-5"><p><span style="color: rgb(165, 0, 100);"><strong>Một số hoạt động thiện nguyện nổi bật trước khi hợp tác cùng Ví điện tử MoMo:</strong></span></p><ol><li aria-level="1">Chương trình Cháo chia sẻ tại Thị trấn Khe sanh tháng 5 năm 2018.</li><li aria-level="1">Chương trình Cơm chia sẻ vào tháng 10 năm 2018.</li><li aria-level="1">Chương trình Đông ấm vùng cao vào tháng 12 năm 2019.</li></ol><p><span style="color: rgb(165, 0, 100);"><strong>Một số hoạt động nổi bật khi hợp tác cùng Ví điện tử MoMo:</strong></span></p><p><strong>1. Chương trình đồng hành cùng bà con vùng lũ tại xã Sơn Thuỷ&nbsp; và xã An Thuỷ thuộc huyện Lệ Thuỷ và Tỉnh Quảng Trị vào tháng 11 năm 2020.</strong></p><p>
	+&nbsp; Quỹ Hoa Chia Sẻ đã hỗ trợ 665 suất quà với giá trị 500.000VND/ 1 suất (quy đổi từ tương đương 3.500.000 Heo Vàng)&nbsp; đến bà con vùng lũ nhằm giúp bà con vượt qua mùa lũ, sớm ổn định lại cuộc sống.&nbsp;
</p><p><strong>2. Tết Thiếu Nhi tháng 6 cùng Hoa Chia Sẻ - Vì một ngày trẻ em nào cũng có quà (Tháng 6/2021)&nbsp;</strong></p><ul><li aria-level="1">Mục đích của chương trình: Trao quà cho 20 em nhỏ có hoàn cảnh khó khăn thuộc xã Đông Thanh, tỉnh Quảng Trị tương ứng 1.000.000VND/ em vào ngày Tết thiếu nhi nhằm động viên, giúp đỡ các em vượt qua khó khăn để thực hiện sứ mệnh “Gieo mầm thiện nguyện” của quỹ Hoa Chia Sẻ.</li><li aria-level="1">Mục tiêu của chương trình: 20 triệu đồng.</li></ul><p><strong>3. Góp Heo Vàng hỗ trợ thực phẩm thiết yếu cho người dân nghèo tại các tỉnh thành phía Nam năm 2021.</strong></p><ul><li aria-level="1">Mục đích chương trình: Heo Đất MoMo phối hợp cùng Quỹ Hoa Chia Sẻ hỗ trợ 45 tấn lương thực, thực phẩm cho người dân của 3 tỉnh thành: Thành phố Hồ Chí Minh, Bình Dương, Đồng Nai. Với 2.250 suất quà mỗi suất trị giá khoảng 20 kg gạo sẽ góp phần hỗ trợ cho bà con vượt qua khó khăn.</li><li aria-level="1">Thời gian phát động quyên góp: Từ ngày 19/8/2021 đến 28/8/2021.</li><li aria-level="1">Mục tiêu của chương trình 2.500.000 Heo vàng MoMo.</li><li aria-level="1">Số lượt quyên góp: 458.151 lượt quyên góp.</li></ul><p>
	Ngoài những hoạt động từ thiện nhằm giúp đỡ những gia đình, trẻ em nghèo và những người lao động gặp khó khăn trong đại dịch, Quỹ từ thiện Hoa Chia Sẻ còn tổ chức những Khoá học online miễn phí, những cuộc thi để thay đổi nhận thức, suy nghĩ của cha mẹ cùng một số đối tượng khác gồm Khoá học “Dạy con nên người”, cuộc thi “Điều tử tế”,…
</p><p>
	Quỹ từ thiện Hoa Chia Sẻ có giấy phép thành lập vào ngày 12/03/2019 được UBND Quận Bình Thạnh cấp phép.
</p><ul><li aria-level="1">Địa chỉ trụ sở chính: 117/11 Nguyễn Hữu Cảnh, Phường 22, Quận Bình Thạnh, Tp. HCM.</li><li aria-level="1">Website: www.hoachiase.com&nbsp;&nbsp;&nbsp;&nbsp;</li><li aria-level="1">Fanpage: www.facebook.com/hoachiase/</li><li aria-level="1">Họ và tên người đại diện theo pháp luật: Ngô Ngọc Sơn - Chủ tịch Hội đồng Quản lý Quỹ Hoa Chia Sẻ. CMND số: 197333117 cấp ngày 18/08/2011. Nơi thường trú: 50/6 Lê Lợi, khu phố 2, phường 5, thành phố Đông Hà, tỉnh Quảng Trị</li></ul><div class="jsx-df4f07e142feb149 mt-3 text-center"><button type="button" class="jsx-df4f07e142feb149 rounded-md py-1 px-3 font-semibold text-blue-500  hover:bg-blue-50">Thu gọn <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="jsx-df4f07e142feb149 relative inline-block h-5 w-5 rotate-180 transform"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" class="jsx-df4f07e142feb149"></path></svg> </button></div></div>
    '
)

INSERT INTO PARTNER (
    [partner_name]
      ,[partner_slogan]
      ,[partner_logo]
      ,[partner_banner]
      ,[partner_introduce]
      ,[partner_number_donate]
      ,[partner_total_money]
       ,[partner_content]
) VALUES (
    N'VinaCapital Foundation',
    N'Thay đổi cuộc sống cho phụ nữ và trẻ em Việt Nam',
    'https://vinacapitalfoundation.org/wp-content/themes/vcf/assets/images/logo.svg',
    'https://static.mservice.io/img/momo-upload-api-220221175805-637810630851968677.jpg',
    N'Tổ chức VinaCapital Foundation (VCF) hoạt động với sứ mệnh trao quyền cho trẻ em và phụ nữ Việt Nam thông qua các chương trình y tế và giáo dục.
    ',
    62,
    3,
    N'
   <div class="soju__prose small mt-5"><p>
	Được thành lập năm 2006,<strong> VinaCapital Foundation (VCF)</strong> là một tổ chức phi lợi nhuận được cấp phép tại Mỹ và hoạt động tại Việt Nam. Sứ mệnh của VCF là tạo ra các giải pháp về sức khỏe, giáo dục nhằm thay đổi cuộc sống của trẻ em và phụ nữ tại Việt Nam có hoàn cảnh khó khăn. Các hoạt động của VCF giúp thay đổi cuộc sống của hàng triệu người Việt trên khắp 63 tỉnh thành mỗi năm.
</p><p>
	VCF tập trung vào 3 lĩnh vực hoạt động chính:<br>
	- Các chương trình<strong> Y tế thiết yếu </strong>gồm có: chương trình <em>Nhịp Tim Việt Nam</em> tài trợ chi phí mổ tim và chăm sóc tiền-hậu phẫu cho các em nhỏ mắc bệnh tim bẩm sinh; chương trình <em>Khám Sàng Lọc </em>khám bệnh miễn phí cho trẻ em tại các vùng sâu vùng xa; và các hỗ trợ thiết yếu khác cho trẻ em gặp nhiều vấn đề phức tạp về sức khỏe.<br>
	- Các chương trình <strong>Nâng cao Năng lực Y tế</strong> gồm có: chương trình <em>Nâng cao Năng lực Y tế</em> và<em> Nâng Niu Sự Sống </em>cung cấp đào tạo cho các nhân viên y tế và trang thiết bị cho cấp cứu và chăm sóc trẻ sơ sinh tại các bệnh viện ở vùng sâu vùng xa; chương trình Nước sạch lắp đặt hệ thống máy lọc nước để cung cấp nước uống đạt tiêu chuẩn cho các nhóm dân cư bị thiệt thòi; các chương trình <em>Cứu trợ khẩn cấp quốc gia</em> tổ chức và thực hiện cứu trợ thiên tai và đại dịch.<br>
	- Chương trình <strong>Giáo dục:</strong><em>Mở đường đến Tương Lai </em>– tạo cơ hội cho các nữ sinh dân tộc thiểu số trở thành những nhân tố thay đổi thông qua việc triển khai C<em>âu lạc bộ Nữ sinh</em> tại các trường trung học phổ thông, đem đến sự cố vấn cần thiết cũng như đào tạo kỹ năng mềm và trao học bổng toàn phần để các em nữ sinh hoàn tất chương trình học trung học và đại học.
</p><p>
	Tầm nhìn của VCF là một Việt Nam phát triển, nơi tất cả trẻ em và phụ nữ đều khỏe mạnh, được học tập và trao quyền để có thể hưởng lợi từ sự tăng trưởng kinh tế cũng như đóng góp cho sự phát triển của cộng đồng. Tất cả các chương trình của VCF đều thực hiện cam kết sâu sắc về quyền của trẻ em và phụ nữ, bình đẳng giới, cải thiện dinh dưỡng, bảo vệ môi trường và xóa đói giảm nghèo.
</p><p>
	Website: <a href="http://www.vinacapitalfoundation.org">www.vinacapitalfoundation.org</a></p><div class="jsx-df4f07e142feb149 mt-3 text-center"><button type="button" class="jsx-df4f07e142feb149 rounded-md py-1 px-3 font-semibold text-blue-500  hover:bg-blue-50">Thu gọn <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="jsx-df4f07e142feb149 relative inline-block h-5 w-5 rotate-180 transform"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" class="jsx-df4f07e142feb149"></path></svg> </button></div></div>
    '
)

INSERT INTO PARTNER (
    [partner_name]
      ,[partner_slogan]
      ,[partner_logo]
      ,[partner_banner]
      ,[partner_introduce]
      ,[partner_number_donate]
      ,[partner_total_money]
       ,[partner_content]
) VALUES (
    N'Quỹ Vì Tầm Vóc Việt',
    N'Vì tầm vóc Việt',
    'https://vitamvocviet.vn/Uploads/images/banner/Logo%20l%E1%BB%9Bn.png',
    'https://static.mservice.io/img/momo-upload-api-211202102246-637740373666808426.jpg',
    N'Quỹ Vì Tầm Vóc Việt là tổ chức phi lợi nhuận được thành lập với sứ mệnh đóng góp cho các Mục tiêu Phát triển Bền vững của Liên Hợp Quốc.
    ',
    10,
    433,
    N'
   <div class="soju__prose small mt-5"><p>
	Quỹ Vì Tầm Vóc Việt (VSF) là tổ chức phi lợi nhuận được thành lập theo Quyết định số 1288/QĐ-BNV ngày 6/12/2014 của Bộ Nội Vụ. VSF có sứ mệnh góp phần đạt được các Mục tiêu Phát triển Bền vững (SDGs) của Liên Hợp Quốc, đặc biệt là các mục tiêu về giáo dục, sức khỏe, công bằng và phát triển bền vững.
</p><p>
	Các giá trị cốt lõi của VSF bao gồm: Vì một tầm vóc Việt, Kết nối cộng đồng, Khơi dậy và nuôi dưỡng tính nhân văn.
</p><p>
	Các chương trình mục tiêu của VSF bao gồm: Dinh dưỡng học đường, Bảo vệ trẻ em, Ươm mầm tài năng, Hành động vì môi trường, Chăm sóc sức khỏe cho phụ nữ trong độ tuổi sinh sản, và các chương trình an sinh xã hội khác.
</p><p>
	“Một cánh én nhỏ chẳng làm nên mùa xuân - nhưng chúng ta, rất nhiều cánh én cùng nhiều đóng góp cho dù nhỏ bé - sẽ làm nên một mùa xuân để tầm vóc Việt thực sự được cải thiện và đạt đến một tầm cao mới” - Bà Thái Hương, Nhà sáng lập - Chủ tịch Hội đồng Quản lý VSF.
</p></div>
    '
)

INSERT INTO PARTNER (
    [partner_name]
      ,[partner_slogan]
      ,[partner_logo]
      ,[partner_banner]
      ,[partner_introduce]
      ,[partner_number_donate]
      ,[partner_total_money]
       ,[partner_content]
) VALUES (
    N'Saigon Children’s Charity',
    N'Vì tầm vóc Việt',
    'https://www.saigonchildren.com/wp-content/themes/scc/images/logoy2.png',
    'https://static.mservice.io/img/momo-upload-api-211202102951-637740377916610561.jpg',
    N'Saigon Children’s Charity (saigonchildren) hoạt động với sứ mệnh xóa bỏ rào cản đến với giáo dục cho trẻ em thiệt thòi trên khắp Việt Nam.
    ',
    3,
    175,
    N'
   <div class="soju__prose small mt-5"><p>
	Khởi nguồn từ một thầy giáo người Anh sang Việt Nam du lịch và ấn tượng với tinh thần hiếu học, ngay cả trong những điều kiện nghèo nàn, của trẻ em Việt Nam thập niên 80, Saigon Children’s Charity (saigonchildren) đã được thành lập vào năm 1992 để huy động các nguồn lực trong xã hội nhằm tạo dựng tương lai tươi sáng, bền vững cho trẻ em khó khăn thông qua giáo dục.
</p><p>
	Mặc dù được đăng ký tại Anh, tổ chức saigonchildren hoạt động hoàn toàn tại Việt Nam. Với sứ mệnh xóa bỏ rào cản đến với giáo dục cho trẻ em thiệt thòi, saigonchildren hoạt động thông qua bốn chương trình chính: xây trường ở vùng sâu vùng xa, trao học bổng cho trẻ em khó khăn, hỗ trợ thanh thiếu niên học nghề và kỹ năng, và giáo dục đặc biệt cho trẻ em khuyết tật.
</p><p>
	Năm 2018, saigonchildren được nhận bằng khen của Thủ tướng Chính phủ ghi nhận những đóng góp tích cực và bền bỉ cho các hoạt động xóa nghèo thông qua phát triển giáo dục, xóa bỏ rào cản trong giáo dục và phát triển bền vững tại Việt Nam.
</p><p>
	Báo cáo tài chính của saigonchildren được công bố minh bạch trên website của tổ chức tại <a href="https://www.saigonchildren.com/" target="_blank">www.saigonchildren.com </a>và của Ủy ban Từ thiện Vương quốc Anh tại <a href="https://www.gov.uk/government/organisations/circum-commission." target="_blank">https://www.gov.uk/government/organisations/circum-commission.</a></p></div>
    '
)

INSERT INTO PARTNER (
    [partner_name]
      ,[partner_slogan]
      ,[partner_logo]
      ,[partner_banner]
      ,[partner_introduce]
      ,[partner_number_donate]
      ,[partner_total_money]
       ,[partner_content]
) VALUES (
    N'SCDI – Mỗi Ngày Một Quả Trứng',
    N'Vì tầm vóc Việt',
    'https://scdi.org.vn/media/filer_public_thumbnails/filer_public/24/75/24756be1-de55-4457-a314-5c99a02cea82/logo.png__255x85_q85_subsampling-2.png',
    'https://static.mservice.io/img/momo-upload-api-211202095131-637740354910649027.jpg',
    N'Quỹ Mỗi Ngày Một Quả Trứng (MNMQT) là sáng kiến gây quỹ của Trung tâm Hỗ trợ Sáng kiến Phát triển Cộng đồng (SCDI) nhằm cứu trợ khẩn cấp, nâng cao khả năng hồi phục, thích ứng và cắt đứt vòng xoáy đói nghèo cho những người khó khăn nhất.
    ',
    4,
    345,
    N'
   <div class="soju__prose small mt-5"><p>
	Quỹ "Mỗi Ngày Một Quả Trứng" - do Bác sỹ Khuất Thị Hải Oanh, giám đốc Trung tâm SCDI khởi xướng năm 2017 với mục tiêu ban đầu hỗ trợ dinh dưỡng cho các học sinh nghèo tại xã Văn Xuôi, KonTum.
</p><p>
	Đầu năm 2021, để giải quyết những khó khăn chưa từng có do hậu quả dịch Covid-19, MNMQT mở rộng lĩnh vực và địa bàn hoạt động. MNMQT triển khai các chiến dịch và chương trình cứu trợ khẩn cấp, nâng cao khả năng thích ứng, giúp các cá nhân khó khăn nhất trong xã hội những hỗ trợ mang tính dài hạn phục hồi sinh kế, hỗ trợ đi học, giấy tờ tuỳ thân và bảo hiểm y tế,… nhằm cắt đứt vòng xoáy đói nghèo và đảm bảo phát triển bền vững.
</p><p>
	Đội ngũ của Mỗi Ngày Một Quả Trứng nỗ lực để các cá nhân có thể thay đổi vươn lên một cách bền vững với sứ mệnh "Để không ai bị bỏ lại phía sau".
</p></div>
    '
)

INSERT INTO PARTNER (
    [partner_name]
      ,[partner_slogan]
      ,[partner_logo]
      ,[partner_banner]
      ,[partner_introduce]
      ,[partner_number_donate]
      ,[partner_total_money]
       ,[partner_content]
) VALUES (
    N'Thiện Nhân & Friends',
    N'Phẫu thuật BPSD cho trẻ em',
    'https://static.mservice.io/img/momo-upload-api-211029135610-637711125708934050.png',
    'https://static.mservice.io/img/momo-upload-api-211202092528-637740339283757049.jpg',
    N'Chương trình “Thiện Nhân và những người bạn” phẫu thuật tái tạo bộ phận sinh dục cho trẻ em thuộc Quỹ Phòng chống Thương vong Châu Á.
    ',
    37,
    2,
    N'
   <div class="soju__prose small mt-5"><p>
	Năm 2006, câu chuyện thương tâm của bé Thiện Nhân, một bé trai đã bị bỏ rơi trong rừng từ khi lọt lòng tại Núi Thành (Quảng Nam) và đã bị động vật hoang dã ăn mất bộ phận sinh dục đã gây xúc động mạnh trong cộng đồng. Với lòng thương yêu vô hạn đối với trẻ em, ông Greig Craft, chủ tịch Quỹ AIP đã nhận làm cha đỡ đầu cho bé Thiện Nhân cùng với mẹ nuôi của bé là Nhà báo Trần Mai Anh nuôi dưỡng và chăm sóc bé Thiện Nhân từ đó. Sau đó, là những câu chuyện cảm động về hành trình nhiều năm thầm lặng và những nỗ lực tìm kiếm bác sĩ phẫu thuật của cha đỡ đầu và mẹ nuôi của Thiện Nhân, để trả lại cho em một cơ thể lành lặn, để tuổi thơ em có được những niềm vui như bao đứa trẻ khác.
</p><p>
	Câu chuyện không dừng lại ở đó, với mong muốn đầy tính nhân văn là mang lại cuộc sống bình thường cho những trẻ em không may bị khiếm khuyết bộ phận sinh dục giống như Thiện Nhân, ông Greig Craft và Nhà báo Trần Mai Anh, cùng với sự hỗ trợ nhiệt tình về mặt kỹ thuật của đội ngũ bác sĩ đến từ Ý, Mỹ tiêu biểu là bác sĩ Roberto DeCastro đã xây dựng nên chương trình “Thien Nhan &amp; Friends” - Phẫu thuật tái tạo bộ phận sinh dục cho trẻ em.
</p><p>
	Chương trình đã nhận được sự hỗ trợ và phối hợp từ những bác sĩ phẫu thuật hàng đầu như bác sĩ Roberto De Castro, bác sĩ Emilio Merlini, bác sĩ Aurelie Chiappinelli, bác sĩ Vincenzo Domenichelli, bác sĩ Simona Gerocarni Nappo, bác sĩ Gabriella Pelusi, Giáo sư Paolo Caione đến từ Ý, bác sĩ Anthony Caldamone, bác sĩ Đinh Tuệ từ Mỹ, bác sĩ Vitali Dubrov (Belarus) và bác sĩ Ilya Kagantsov (Nga). Tính đến nay, chương trình đã thực hiện được tổng cộng 500 ca phẫu thuật và thăm khám cho gần 1.700 bệnh nhân khiếm khuyết bộ phận sinh dục - tiết niệu do bẩm sinh và tổn thương nghiêm trọng như: ổ nhớp lộ ngoài, bàng quang lộ ngoài, lỗ tiểu thấp, dương vật nhỏ không phát triển, bộ phận sinh dục bất thường, dị tật tiết niệu, rối loạn phát triển giới tính, hội chứng kháng bán phần với kích thích tố nam androgen (bộ phận sinh dục ngoài là nữ nhưng nhiễm sắc thể là nam)… trong đó có 9 ca bệnh nặng tạo hình dương vật thành công và 21 ca bệnh khác cũng đã được điều trị thành công. Các em hiện tại đã có cuộc sống bình thường, tự tin đến trường và tham gia các hoạt động ngoại khóa ngoài cộng đồng. Nhiều em nhỏ được tiến hành 3, 4 và thậm chí là 6 cuộc phẫu thuật để có thể phục hồi hoàn toàn.
</p>
</div>
    '
)

INSERT INTO PARTNER (
    [partner_name]
      ,[partner_slogan]
      ,[partner_logo]
      ,[partner_banner]
      ,[partner_introduce]
      ,[partner_number_donate]
      ,[partner_total_money]
       ,[partner_content]
) VALUES (
    N'Trung tâm Tương Lai',
    N'Phòng chống xâm hại tình dục trẻ em',
    'https://tuonglaicentre.org/media/template/images/logo.png',
    'https://static.mservice.io/img/momo-upload-api-220224153051-637813134511738471.jpg',
    N'Trung tâm Tương Lai là tổ chức chuyên hoạt động để hỗ trợ giáo dục và bảo vệ trẻ em và thanh thiếu niên.
    ',
    21,
    690,
    N'
   <div class="soju__prose small mt-5"><p>
	Trung tâm Giáo dục Sức khỏe và Phát triển Cộng đồng Tương Lai (Trung tâm Tương Lai) thành lập năm 2011 là tổ chức xã hội với sứ mệnh hoạt động vì trẻ em và thanh thiếu niên có hoàn cảnh đặc biệt. Trung tâm Tương Lai không chỉ giúp đỡ về mặt tài chính mà còn quan tâm giúp đỡ trẻ em và thanh thiếu niên về hướng nghiệp, kỹ năng sống và vui chơi giải trí lành mạnh.<br><br>
	1. Các giá trị chúng tôi mang lại:<br>
	-&nbsp; Chuyên nghiệp: Chúng tôi không ngừng học hỏi và rèn luyện chuyên môn ngày càng thuần thục.<br>
	- Cam kết: Chúng tôi luôn tuân thủ và thực hiện đúng cam kết với nhà tài trợ cũng như người hưởng lợi.<br>
	- Tham gia: Tất cả các hoạt động luôn có sự tham gia của các bên có liên quan đặc biệt sự tham gia của người hưởng lợi.<br>
	- Phát triển bền vững: Chúng tôi luôn hướng đến các hoạt động đáp ứng nhu cầu hiện tại và cả tương lai cho người hưởng lợi.
</p><p>
	2. Chức năng, nhiệm vụ:<br>
	- Nghiên cứu, thực hiện các đề tài, dự án về cân bằng giới, quyền trẻ em, di cư, buôn bán phụ nữ trẻ em, chính sách công, HIV/AIDS, chăm sóc sức khỏe, xóa đói giảm nghèo và phát triển cộng đồng.<br>
	- Thực hiện các dịch vụ khoa học và công nghệ: tập huấn, đào tạo nâng cao năng lực, chuyển giao công nghệ, tư vấn, truyền thông, hội thảo hội nghị và các dịch vụ khoa học công nghệ khác liên quan đến lĩnh vực cân bằng giới, quyền trẻ em, di cư, buôn bán phụ nữ trẻ em, chính sách công, HIV/AIDS, chăm sóc sức khỏe, xóa đói giảm nghèo và phát triển cộng đồng.<br>
	- Hợp tác với các tổ chức, cá nhân trong và ngoài nước để thực hiện các hoạt động hỗ trợ người yếu thế và nâng cao chất lượng cuộc sống của họ
</p></div>
    '
)

INSERT INTO PARTNER (
    [partner_name]
      ,[partner_slogan]
      ,[partner_logo]
      ,[partner_banner]
      ,[partner_introduce]
      ,[partner_number_donate]
      ,[partner_total_money]
       ,[partner_content]
) VALUES (
    N'Quỹ Trăng Khuyết',
    N'Hỗ trợ người già & trẻ em',
    'https://quytrangkhuyet.com/wp-content/uploads/2021/08/logo.png',
    'https://static.mservice.io/img/momo-upload-api-220518142755-637884808750045770.jpg',
    N'Trăng Khuyết là tổ chức từ thiện nhân đạo, hoạt động độc lập, phi tôn giáo và phi lợi nhuận trên toàn lãnh thổ Việt Nam, nhằm kết nối cộng đồng và thực hiện các hoạt động cứu trợ trực tiếp liên quan đến: bữa ăn, chỗ ở, chăm sóc sức khỏe - tinh thần cho các cụ già không nơi nương tựa và trẻ em bị bỏ rơi.
    ',
    1500,
    5,
    N'
   <div class="soju__prose small mt-5"><p>
	Cuộc đời như một vầng trăng, rồi ai cũng có khi đầy, khi khuyết. Cũng như con trăng kia, khi mới sinh ra trăng sẽ khuyết bên trái, rồi khi già đi trăng lại khuyết dần bên phải. Chính những lúc khuyết ấy, là lúc ta cần lắm cái sự che chở và chăm sóc của những người thân bên mình. Sẽ thật không may cho ai đó, nếu lúc khuyết kia ta chỉ đơn bóng có một mình.
</p><p>
	Có những vầng trăng nhỏ thì thầm hỏi chúng tôi rằng: Đâu sẽ là nhà cho con khôn lớn? Đâu là mẹ để đút cho con ăn? Đâu là ba để dìu dắt con vào đời?
</p><p>
	Lại có những vầng trăng già ngậm ngùi khóc than với chúng tôi rằng: Đâu sẽ là nhà để ngả cái lưng già? Đâu sẽ là cơm để thành cái bữa qua ngày? Đâu sẽ là hậu sự lúc nhắm mắt, buông tay?
</p><p>
	Chúng tôi chỉ biết nắm lấy bàn tay ấy và cùng họ viết về một ước mơ tên là “Trăng Khuyết”. Trong ước mơ ấy, có hình bóng của một vầng trăng xanh đầy hy vọng, một bàn tay lớn nâng đỡ và che chở, một trái tim nhân ái cùng gắn kết và yêu thương!
</p><h4>Tầm nhìn</h4><p>
	Trăng Khuyết phấn đấu trở thành một tổ chức từ thiện Tập thể – Minh bạch – Đồng cảm – Chân thành – Truyền cảm hứng trong mảng từ thiện về nhân đạo và sự sống tại Việt Nam.
</p><h4>Sứ mệnh</h4><p>
	Trăng Khuyết cố gắng và nỗ lực hết mình với cam kết “hai không” trong một xã hội hiện đại:
</p><ol><li>Không có người già bị thiếu đói, thiếu chỗ ở, phải sinh sống và xin ăn trên đường phố;</li><li>Không có trẻ em bị thiếu đói, bị bỏ rơi hoặc phải tự mưu sinh khi chưa đến tuổi trưởng thành.</li></ol></div>
    '
)

INSERT INTO PARTNER (
    [partner_name]
      ,[partner_slogan]
      ,[partner_logo]
      ,[partner_banner]
      ,[partner_introduce]
      ,[partner_number_donate]
      ,[partner_total_money]
       ,[partner_content]
) VALUES (
    N'Operation Smile',
    N'Phẫu thuật nụ cười',
    'https://operationsmile.org.vn/wp-content/uploads/2019/10/OperationSmileLogo-White250px.png',
    'https://static.mservice.io/img/momo-upload-api-220224143339-637813100190041081.png',
    N'Operation Smile mang lại nụ cười và thay đổi cuộc sống của những trẻ em bị dị tật bẩm sinh trên khuôn mặt ở Việt Nam và khắp thế giới.
    ',
    36,
    3,
    N'
   <div class="soju__prose small mt-5"><p>
	Operation Smile (Phẫu Thuật Nụ Cười) là một tổ chức phi chính phủ quốc tế lâu đời chuyên cung cấp các ca phẫu thuật và chăm sóc y tế an toàn miễn phí nhằm nâng cao sức khoẻ và thay đổi cuộc đời cho hàng ngàn trẻ em và thanh thiếu niên bị các dị tật vùng hàm mặt tại hơn 60 quốc gia trên thế giới.
</p><p>
	Operation Smile lần đầu có mặt tại Việt Nam năm 1989. Thông qua việc kết nối và xây dựng mạng lưới những chuyên gia y tế tình nguyện thực hiện các chuyến công tác phẫu thuật với tiêu chuẩn toàn cầu tại nhiều địa điểm còn thiếu thốn và nghèo khó, sau hơn 32 năm, Operation Smile đã cung cấp hơn 62.000 ca phẫu thuật và chăm sóc y tế miễn phí cho người dân và trẻ em tại Việt Nam đồng thời đào tạo cho hàng ngàn các chuyên gia y tế tình nguyện trên khắp đất nước thông qua hàng chục chương trình tái tạo nụ cười thay đổi cuộc đời mỗi năm.
</p></div>
    '
)

     
INSERT INTO CIRCUM(
      
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    1,
    N'Gây quỹ trao 50 phần quà Tết cho trẻ em và gia đình có hoàn cảnh khó khăn tại Tp.HCM',
    N'Vì trẻ em',
    N'<article class="soju__prose small"><p>
	Tết là khoảng thời gian để gia đình sum vầy, là thời gian gợi lên sự sung túc, đầm ấm, yên vui. Tuy nhiên, mặc dù không khí Tết đang tràn về khắp các nẻo đường nhưng vì hoàn cảnh khó khăn, có những đứa trẻ chưa bao giờ được đón một mùa Tết trọn vẹn và đầy đủ như bao bạn bè cùng trang lứa. Với các em, việc có một cái Tết đủ đầy như bao người khác là một điều gì đó rất xa vời.
</p>

<p>
	Những bạn nhỏ mà MSD United Way Vietnam biết đến và đang hỗ trợ hầu hết là những bạn có hoàn cảnh gia đình rất khó khăn. Trong đó có không ít bạn còn không có được một tấm giấy khai sinh cho mình. Việc không có giấy khai sinh khiến cuộc sống vốn đã khó khăn càng trở nên vất vả hơn: không thể đến trường học, không được tham gia bảo hiểm y tế và được hưởng những quyền lợi cơ bản.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112141419-638091296598895503.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Không khí Tết đang về trên khắp nẻo đường nhưng nhiều hoàn cảnh khó khăn chưa bao giờ đón một mùa Tết trọn vẹn</em>
</p>

<p>
	Gia đình bốn chị em nhà họ Thạch mà MSD United Way Vietnam ghé thăm vào tháng 7.2022 vừa qua tại huyện Bình Chánh, Tp.HCM là một trường hợp rất đặc biệt. 20 em nhỏ trong đại gia đình này đều không có giấy khai sinh. Trong khuôn khổ dự án Trang Mới Cuộc Đời, MSD United Way Vietnam đã hỗ trợ làm giấy khai sinh cho 10 trẻ. Nhưng vẫn còn 10 trẻ nữa vẫn chưa hoàn thiện thủ tục để có được một tấm giấy khai sinh cho các em. Tuy vậy, các em vẫn rất mong muốn được đến trường và cũng mong cho các anh chị em khác trong gia đình ai cũng được đến trường đi học giống mình. Gia đình và hoàn cảnh khó khăn, cái Tết đủ đầy với các em và gia đình cũng giống như một mơ ước.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112141451-638091296915417474.jpg" style="width:100%">
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112141502-638091297028833486.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Nhiều em nhỏ khó khăn vẫn luôn mong muốn được tiếp tục đến trường như bao bạn bè trang lứa</em>
</p>

<p>
	Vì vậy, trước thềm năm mới Quý Mão 2023, MSD United Way Vietnam phối hợp với Trái im MoMo phát động dự án Trao quà Tết 2023 với mong muốn mang đến niềm vui ấm áp nho nhỏ ngày Tết cũng như nỗ lực để vì một Việt Nam không ai bị bỏ lại phía sau.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112141535-638091297353870426.jpg" style="width:100%">
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112141545-638091297456426979.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Chung tay cùng MSD mang đến Tết ấm áp hơn cho các em nhỏ nghèo khó khăn&nbsp;</em>
</p>

<p>
	Để hiện thực hóa dự án này, chúng tôi kêu gọi những tấm lòng nhân ái tham gia hỗ trợ và đóng góp 50.000.000 VND – tương đương 50 phần quà cho 50 trẻ em và gia đình có hoàn cảnh khó khăn tại TP.HCM. Phần quà bao gồm: quà Tết cho trẻ em, cùng thực phẩm (gạo, trứng, sữa, dầu ăn, bánh kẹo…) và đồ dùng thiết yếu. Những phần quà này sẽ là lời chúc mừng năm mới mà cộng đồng gửi đến các em, nhằm mang đến cho các em hy vọng tốt đẹp về một năm mới tươi sáng, hạnh phúc hơn và phần nào san sẻ gánh nặng với gia đình các em.
</p>

<p>
	<u><strong>Về Viện Nghiên cứu Quản lý Phát triển bền vững (MSD) – United Way Việt Nam:</strong></u><br>
	Là một tổ chức phi chính phủ Việt Nam, MSD – United Way Việt Nam nỗ lực hành động vì một môi trường phát triển thuận lợi cho sự phát triển của khối các tổ chức xã hội và thúc đẩy việc thực hiện quyền của các nhóm cộng đồng bị lề hoá và dễ bị tổn thương, đặc biệt là nhóm trẻ em, thanh niên, phụ nữ và người khuyết tật. Hiện nay, MSD – United Way Việt Nam được công nhận là một tổ chức hàng đầu trong việc phối hợp, hỗ trợ và cung cấp các dịch vụ nâng cao năng lực, đào tạo và tham vấn cho các tổ chức xã hội tại Việt Nam. Thêm vào đó, MSD – United Way Việt Nam cũng là một tổ chức chuyên nghiệp đáp ứng hiệu quả nhu cầu và bảo vệ quyền lợi của các đối tượng có hoàn cảnh khó khăn, thông qua tổ chức các dự án và hỗ trợ trẻ em, thanh thiếu niên, phụ nữ, người vô gia cư, người nhập cư và người khuyết tật tại Việt Nam.
</p>
</article>
	',
    'https://static.mservice.io/blogscontents/momo-upload-api-230112141333-638091296130777561.jpg ,
	https://static.mservice.io/blogscontents/momo-upload-api-230112141943-638091299837173100.jpg ,
	https://static.mservice.io/blogscontents/momo-upload-api-230112141959-638091299991815903.jpg ,
	https://static.mservice.io/blogscontents/momo-upload-api-230112142007-638091300070392049.jpg ,
	https://static.mservice.io/blogscontents/momo-upload-api-230112142018-638091300180814922.jpg
	',
    N' Cùng MSD United Way Vietnam chung tay gây quỹ trao tặng 50 phần quà Tết cho trẻ em và gia đình có hoàn cảnh khó khăn thuộc Trang mới cuộc đời – khu vực Tp.HCM',
    3237,
    25197130,
    50000000,
    23,
   '2023-01-11'
)


INSERT INTO CIRCUM(
      
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (
  
    1,
    N'Chương trình “Vaccine số – Phòng tránh rủi ro cho trẻ em trên môi trường Internet”',
    N'Vì trẻ em',
    N'<article class="soju__prose small"><p>
	Trong năm 2020-2021 vừa qua, do hệ quả của đại dịch COVID-19, việc trẻ em và thanh thiếu niên tham gia học trực tuyến rất nhiều đã khiến cho thời gian sử dụng Internet của các em tăng vọt. Theo các khảo sát ban đầu, thời gian sử dụng Internet của các em có thể tăng trung bình từ 2-3 giờ ngày lên tới ít nhất 5-6 giờ/ngày. Bên cạnh những ích lợi của Internet mang lại, việc sử sử dụng Internet quá mức có thể khiến các em gặp nhiều vấn đề về sức khoẻ hay gặp nhiều rủi ro trên môi trường mạng như bị lộ thông tin cá nhân, bị bạo lực mạng, bị quấy rối, lừa đảo,....
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112142406-638091302466876464.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Chương trình Vaccine số và công dân số toàn cầu sẽ thúc đẩy sự gắn kết và tương tác tích cực</em>
</p>

<p>
	Trước thực trạng đó, MSD United Way Vietnam đã phối hợp với các tổ chức xã hội thông qua chương trình tăng tốc dành cho tổ chức phi lợi nhuận toàn cầu (GNAP) của Tiktok thực hiện chương trình Vaccine số và công dân số toàn cầu. Chương trình mong muốn thúc đẩy sự gắn kết, tương tác tích cực giữa cha mẹ và con cái, đồng thời giúp cha mẹ và trẻ em sử dụng Internet một cách thông minh và an toàn.
</p>

<p>
	<strong>Mục tiêu của chương trình</strong> “Vaccine số – Phòng tránh rủi ro cho trẻ em trên môi trường Internet” nhằm giúp các bậc phụ huynh cũng như các em:
</p>

<ul>
	<li aria-level="1">Nhận biết các nguy cơ, rủi ro trên môi trường internet.</li>
	<li aria-level="1">Ứng phó với các rủi ro trên môi trường internet.</li>
	<li aria-level="1">Biết cách tìm kiếm sự trợ giúp và tự bảo vệ bản thân trước các rủi ro trên môi trường Internet.</li>
</ul>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112142445-638091302854632845.jpg" style="width:100%">
	<br>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112142505-638091303053473418.jpg" style="width:100%">
	<br>
	<br>
	<em>Thời gian sử dụng Internet của các em có thể tăng trung bình từ 2-3 giờ ngày lên tới ít nhất 5-6 giờ/ngày</em>
</p>

<p>
	<strong>Các hoạt động chính của chương trình:&nbsp;</strong>
</p>

<ul>
	<li aria-level="1">Chiến dịch truyền thông mạng xã hội: Xây dựng và đăng tải chuỗi video chủ đề #Công_dân_số_chuẩn</li>
	<li aria-level="1">Chuỗi hoạt động truyền thông tại trường học và trực tuyến (Talkshow, Livestream)</li>
	<li aria-level="1">Hội thảo/ toạ đàm các bên liên quan trong bảo vệ trẻ em trước các rủi ro trên môi trường mạng&nbsp;</li>
</ul>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112142533-638091303339860550.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Chương trình “Vaccine số – Phòng tránh rủi ro cho trẻ em trên môi trường Internet” sẽ tạo ra được những thay đổi tích cực</em>
</p>

<p>
	Để hiện thực hóa kế hoạch ấy, chúng tôi kêu gọi những tấm lòng nhân ái cùng quyên góp 2,000,000 Heo Vàng. Số Heo Vàng sẽ được quy đổi tương đương 400.000.000 đồng. MSD United Way Vietnam tin tưởng rằng với sự tham gia, đồng hành, lan tỏa từ mỗi cá nhân trong xã hội, chương trình “Vaccine số – Phòng tránh rủi ro cho trẻ em trên môi trường Internet” sẽ tạo ra được những thay đổi tích cực, giúp cho việc sử dụng Internet không còn là nỗi lo lắng mà sẽ trở thành những trải nghiệm bổ ích, lí thú, tạo nên những “công dân số chuẩn” tương lai của đất nước.&nbsp;
</p>

<p>
	<u><strong>Về Viện Nghiên cứu Quản lý Phát triển bền vững (MSD) – United Way Việt Nam:</strong></u><br>
	Là một tổ chức phi chính phủ Việt Nam, MSD nỗ lực hành động vì một môi trường phát triển thuận lợi cho sự phát triển của khối các tổ chức xã hội và thúc đẩy việc thực hiện quyền của các nhóm cộng đồng bị lề hoá và dễ bị tổn thương, đặc biệt là nhóm trẻ em, thanh niên, phụ nữ và người khuyết tật. Hiện nay, MSD được công nhận là một tổ chức hàng đầu trong việc phối hợp, hỗ trợ và cung cấp các dịch vụ nâng cao năng lực, đào tạo và tham vấn cho các tổ chức xã hội tại Việt Nam. Thêm vào đó, MSD cũng là một tổ chức chuyên nghiệp đáp ứng hiệu quả nhu cầu và bảo vệ quyền lợi của các đối tượng có hoàn cảnh khó khăn, thông qua tổ chức các dự án và hỗ trợ trẻ em, thanh thiếu niên, phụ nữ, người vô gia cư, người nhập cư và người khuyết tật tại Việt Nam.
</p>
</article>
	',
    'https://static.mservice.io/blogscontents/momo-upload-api-230112142315-638091301958616256.jpg ,
	https://static.mservice.io/blogscontents/momo-upload-api-230112142938-638091305782784026.jpg ,
    https://static.mservice.io/blogscontents/momo-upload-api-230112142952-638091305923405298.jpg ,
    https://static.mservice.io/blogscontents/momo-upload-api-230112143003-638091306033726897.jpg
	',
    N'Hưởng ứng chương trình “Vaccine số – Phòng tránh rủi ro cho trẻ em trên môi trường Internet” cùng MSD United Way Vietnam',
    31211,
    292550,
    2000000,
    23,
   '2023-01-11'
)



INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    2,
    N'Chung tay mang đến phép màu y tế cho em Lê Nhật Gia Hưng cùng Quỹ Nâng Bước Tuổi Thơ',
    N'Vì trẻ em',
    N'<article class="soju__prose small"><p>
	Mỗi ngày, hơn 4.000 em bé được chào đời. Các em sẽ lớn lên trong sự đùm bọc và chăm sóc của cha, của mẹ và rất nhiều người thân. Việc vui chơi hay đến trường là quyền lợi mà các em xứng đáng được hưởng. Nhưng lẻ loi đâu đó, vẫn có nhiều em nhỏ phải chật vật để có thể chạm đến những niềm vui bình thường như bạn bè cùng trang lứa.&nbsp;
</p>

<p>
	<strong>Được sinh từ người mẹ tâm thần</strong><br>
	Từ khi có nhận thức đến nay, cậu bé Lê Nhật Gia Hưng đã biết mình đang sống trong nhà tình thương. Sinh ra từ người mẹ bị tâm thần, còn cha thì em chưa từng biết đó là ai. Em chỉ còn biết nương tựa vào bà ngoại đã rất già yếu. Gia cảnh khó khăn khiến bà ngoại em thường vắng nhà đi làm kiếm thu nhập lo liệu cho cuộc sống, còn mẹ em thì cũng không có khả năng chăm sóc con cái.&nbsp;
</p>

<p>
	<strong>Tai nạn khiến bàn tay em co quắp và sống nơi mái ấm tình thương</strong>&nbsp;<br>
	Ngày Hưng còn ẵm ngửa, trong một lần sơ sẩy em đã bị ngã từ trên cao. Cú ngã gây tổn thương đến thần kinh làm cho đôi bàn tay của em bị co quắp, mất khả năng co duỗi và cầm nắm.
</p>

<p>
	Không đủ khả năng để chăm sóc cả con gái tâm thần lẫn cháu nhỏ, bà ngoại quyết định gửi em Hưng đến nhà tình thương, mong rằng cháu mình sẽ được chăm sóc tốt hơn. Ở nhà tình thương, em được các mẹ trong mái ấm nuôi dưỡng, cho ăn học đầy đủ.&nbsp;
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221227111101-638077362615490955.jpg" style="width:100%">
	<em>Lê Nhật Gia Hưng khi 12 tuổi với bàn tay co quắp</em>
</p>

<p>
	<strong>Chung tay gây quỹ giúp em Lê Nhật Gia Hưng được chữa trị phục hồi chức năng chức năng ngón cái phải - và sống một cuộc đời đáng sống</strong>
</p>

<p>
	Hiện nay Hưng đã 16 tuổi, tuy khiếm khuyết của đôi bàn tay gây trở ngại vô cùng lớn trong cuộc sống, nhưng em vẫn cố gắng phụ các mẹ chăm sóc các em trong nhà. Vì không thể cầm nắm như người bình thường, nên em dùng ngón tay để kẹp miếng rửa chén phụ việc nhà và kẹp bút để viết bài.
</p>

<p>
	Tháng 11/2022 vừa qua, Quỹ Nâng Bước Tuổi Thơ phối hợp cùng bệnh viện FV và bác sĩ Stephane Guero tiến hành phẫu thuật chuyển gân bàn tay phải cho em Hưng để ngón tay có thể co duỗi. Em cần thêm một đợt mổ phục hồi chức năng ngón cái phải để tiếp tục các bước chữa trị tiếp theo.&nbsp;
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221227111121-638077362818808779.jpg" style="width:100%">
	<em>Em Hưng tại đợt phẫu thuật gân bàn tay phải tháng 11.2022</em>
</p>

<p>
	Chúng tôi kêu gọi sự chung tay của cộng đồng từ thiện và các nhà hảo tâm quyên góp 60.000.000 đồng để san sẻ chi phí phẫu thuật, giúp em Hưng có một cuộc sống lành lặn và hạnh phúc. Hãy cùng góp một bàn tay với Quỹ Nâng Bước Tuổi Thơ để chắp cánh tương lai cho nhiều cuộc đời nhỏ. Mỗi một đóng góp đáng quý từ các nhà hảo tâm chính là những phép màu từ lòng tốt và sự sẻ chia để mang đến một đôi chân lành lặn, bàn tay linh hoạt, nụ cười hạnh phúc hay một cơ thể khỏe mạnh cho các em nhỏ kém may mắn.&nbsp;
</p>

<p>
	Quỹ Nâng Bước Tuổi Thơ luôn tâm niệm rằng: “Một đứa trẻ lành lặn chào đời là một phép màu. Nhưng một đứa trẻ khiếm khuyết được chữa lành còn hơn cả một điều kỳ diệu. Và điều kỳ diệu đó có thể bắt đầu từ trái tim." Xuyên suốt hành trình hơn 16 năm, Quỹ đã mang đến phép màu y tế cho hơn 600 trẻ em có hoàn cảnh khó khăn, mắc những dị tật bẩm sinh hoặc do tai nạn.&nbsp;
</p>

<p>
	<em>*Sau khi nhận đủ số tiền quyên góp từ cộng đồng, số tiền 60.000.000 đồng sẽ được chuyển tới Quỹ Nâng Bước Tuổi Thơ để tiến hành phẫu thuật mổ phục hồi chức năng ngón cái phải cho em Lê Nhật Gia Hưng. Thông tin cập nhật về chương trình sẽ được gửi đến các nhà hảo tâm trong thời gian sớm nhất.&nbsp;</em>
</p>

<p>
	<u><strong>Về Quỹ Nâng Bước Tuổi Thơ:</strong></u>&nbsp;<br>
	Quỹ Nâng Bước Tuổi Thơ là tổ chức từ thiện duy nhất tại Việt Nam cung cấp y tế đa khoa theo tiêu chuẩn quốc tế cho trẻ em khó khăn với danh sách bệnh lý:
</p>

<ul>
	<li aria-level="1">Bệnh mạch máu: các bệnh lý dị dạng mạch máu, u máu, u bạch mạch ở tay chân, thân, mình, mặt</li>
	<li aria-level="1">Chấn thương chỉnh hình: dị tật bẩm sinh ở bàn tay và bàn chân (khoèo tay, khoèo chân, thiếu ngón, thừa ngón, không có ngón, mất chức năng hoạt động), trật khớp háng hoặc tật bàn chân vẹo</li>
	<li aria-level="1">Đường tiết niệu: các vấn đề về bệnh bẩm sinh đường tiết niệu chẳng hạn như chứng hồi lưu bàng quang – niệu quản gây ra thận ứ nước hay tinh hoàn ẩn, dị tiểu lỗ tiểu lệch dưới</li>
	<li aria-level="1">Đường bụng và tiêu hóa: các bệnh lý vùng bụng và tiêu hóa như một số loại thoát vị, lồng ruột, hẹp hay bít hậu môn, hẹp hay bít thực quản.</li>
	<li aria-level="1">Hàm mặt: dị tật động mạch, dị tật tĩnh mạch, sứt môi – hở hàm ếch, tai dị dạng.</li>
	<li aria-level="1">Thần kinh: phẫu thuật thần kinh như não úng thủy</li>
	<li aria-level="1">Mắt: Các bé sơ sinh bị dị tật viêm, bong võng mạc bẩm sinh</li>
	<li aria-level="1">Trường hợp đặc biệt khác: khuyết tật do tai nạn hay bệnh tật như phỏng hay khuyết tật do bại liệt gây ra.</li>
</ul>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-221227111000-638077362005556704.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221227111430-638077364700805773.jpg
	',
    N'Góp một bàn tay mang đến phép màu y tế cho em Lê Nhật Gia Hưng được chữa trị phục hồi chức năng ngón cái phải.',
    352,
    12704555,
    60000000,
    2,
   '2022-12-26'
)
 

 

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    3,
    N'Mang 10 thư viện đến trẻ em ở vùng khó khăn phía Bắc gồm Hà Giang và Bắc Ninh',
    N'Vì trẻ em',
    N'<article class="soju__prose small"><p>
	<strong>Nỗ lực “trồng người” trên cao nguyên đá</strong>
</p>

<p>
	Ở Hà Giang hiện có 192 xã đồng bào vùng dân tộc, với trên 1.300 thôn bản đặc biệt khó khăn. Tỷ lệ hộ nghèo tới hơn 45%, thu nhập trung bình đầu người chỉ vỏn vẹn 25 triệu/ năm. Có trường có lớp học khang trang để con em trong gia đình có thể theo đuổi giấc mơ con chữ, vẫn là ước mong của đồng bào sinh sống tại vùng cao núi đá nơi đây.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112143625-638091309857279113.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Trường nằm vị trí địa hình hiểm trở, khó khăn trong việc đi lại và vận chuyển cơ sở vật chất&nbsp;</em>
</p>

<p>
	Hà Giang là một trong những địa phương khó khăn nhất của cả nước với đồng bào dân tộc thiểu số chiếm tỷ lệ cao. Không chỉ vậy điều kiện cơ sở vật chất, giao thông cũng còn nhiều vấn đề nan giải chưa thể khắc phục. Đây cũng chính là nguyên nhân chủ yếu gây cản trở sự phát triển giáo dục tại tỉnh Hà Giang.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112143702-638091310222174326.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Điểm trường thôn dành cho những em ở xa không có điều kiện đến điểm trường chính</em>&nbsp;
</p>

<p>
	Toàn tỉnh Hà Giang hiện có 820 cơ sở giáo dục, trong đó có 13 trường phổ thông dân tộc nội trú, 180 trường phổ thông dân tộc bán trú. Với hơn 18.000 cán bộ, giáo viên, hiện Hà Giang thiếu khoảng 1.700 giáo viên, phần lớn là ở bậc mầm non. Cơ sở vật chất trường lớp, trang thiết bị dạy học ở nhiều nơi thiếu thốn và xuống cấp.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112143727-638091310470572147.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Khu vực nội trú tại các điểm trường chính</em>
</p>

<p>
	Tuy nhiên, không vì thế mà các nhà trường không ngừng nỗ lực thực hiện kế hoạch giảng dạy tăng cường Tiếng Việt và đưa văn hoá truyền thống đến các em học sinh Tiểu học vùng dân tộc thiểu số. Tỷ lệ duy trì đến lớp và bỏ học không ngừng cải thiện qua từng năm.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112143746-638091310667890281.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Một góc Thư Viện đơn sơ của Trường Tiểu Học Nghĩa Thuận- Tỉnh Hà Giang</em>
</p>

<p>
	Thấu hiểu được những khó khăn, rào cản và tinh thần hiếu học của tập thể thầy trò tỉnh Hà Giang, dự án Thư Viện Ước Mơ mong muốn mang đến cho các em một thư viện sáng tạo được trang bị đầy đủ nội thất hiện đại và hàng ngàn đầu truyện hấp dẫn.
</p>

<p>
	Sách là một trong những yếu tố then chốt trong việc xây dựng và phát triển khả năng học tập ở trẻ ở những giai đoạn đầu. Những trang sách là những câu chuyện ước mơ, mang trẻ đến những vùng đất diệu kỳ mà ở đó các em không phải suy nghĩ về hoàn cảnh hiện tại. Thư viện Ước Mơ mong muốn mang đến một ngôi nhà thứ 2, để trẻ được tự do ước mơ và sáng tạo.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112143814-638091310947639339.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Rất nhiều em nhỏ đang tuổi đến trường chưa có cơ hội để tiếp cận với sách&nbsp;</em>
</p>

<p>
	<strong>Chung tay xây 10 thư viện cho các em nhỏ tại Hà Giang và Bắc Giang</strong>
</p>

<p>
	Thông qua kênh quyên góp MoMo, Dự án Thư Viện Ước Mơ đặt mục tiêu quyên góp 1.040.000.000 VNĐ. Chúng tôi kêu gọi các nhà hảo tâm và mạnh thường quân quyên góp thông qua Trái Tim MoMo với số tiền là 208.000.000 đồng. Ngoài ra, cộng đồng Heo Đất MoMo sẽ chung tay quyên góp Heo Vàng, tương ứng với 832.000.000 đồng. Số tiền này tương đương với việc xây dựng 10 thư viện cho các em học sinh tiểu học thuộc vùng sâu vùng xa, cực Bắc của tổ quốc, giúp các em dân tộc thiểu số có cơ hội được tiếp cận với sách - nguồn sáng tạo vô tận.&nbsp;
</p>

<p style="text-align:center">
	<em>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230112143846-638091311263295456.jpg" style="width:100%">
	</em>
</p>

<p style="text-align:center">
	<em>Chung tay góp Heo Vàng giúp các em nhỏ tiếp cận với sách - nguồn tri thức vô tận</em>
</p>

<p>
	Dự án Thư Viện Ước Mơ rất cần sự chung tay của cộng động MoMo để cùng xây dựng ước mơ mang tri thức đến với thế hệ Búp Măng Việt Nam. Để tiếp nối 10 năm, 20 năm nữa, thế hệ trẻ Việt Nam sẽ toàn những công dân sáng tạo toàn cầu với những phẩm chất ưu tú.&nbsp;
</p>

<p>
	<em>*Sau khi hoàn tất chiến dịch kêu gọi đóng góp, số tiền 208.000.000 đồng và sẽ được dự án Thư Viện Ước Mơ sử dụng để xây dựng 10 thư viện cho các em học sinh Tiểu Học thuộc tỉnh Hà Giang. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến Quý vị trong thời gian sớm nhất.</em>
</p>

<p>
	<u><strong>Về Thư Viện Ước Mơ:</strong></u><br>
	THƯ VIỆN ƯỚC MƠ - LIBRARY OF DREAMS - là một dự án THƯ VIỆN SÁNG TẠO dành cho trẻ em Việt Nam ở những vùng còn khó tiếp cận với sách và các hoạt động văn hóa, nghệ thuật, sáng tạo. Dự án do bà Nguyễn Phi Vân - Chủ tịch Hiệp Hội đầu tư thiên thần Đông Nam Á&nbsp; sáng lập năm 2014. Đến năm 2017, dự án được nâng cấp thành doanh nghiệp xã hội Thư viện Ước mơ. Thư viện sáng tạo là nơi nuôi dưỡng trí tưởng tượng, giúp các em tiếp cận với các nguồn tri thức khắp nơi trên thế giới và gieo mầm ước mơ cho các em trở thành những công dân toàn cầu thế kỷ 21.&nbsp;&nbsp;
</p>

<p>
	Tính đến tháng 11 năm 2022, dự án đã xây dựng được 107 thư viện ước mơ, tại hơn 17 tỉnh thành khắp Việt Nam: Tây Ninh, Bình Phước, Vũng tàu, Vĩnh Long, Bến Tre, Đồng Nai, Lâm Đồng, Cần giờ, Daklak, Dak Nông, Hoà Bình, Quảng Nam, Yên Bái, Sơn La, Thanh Hoá,... với số học sinh tiếp cận được sách &amp; các hoạt động nghệ thuật: hơn 46.000 học sinh.&nbsp;
</p>

<p>
	Mong ước xây dựng 1.000 Thư Viện tác động 1.000.0000 học sinh Việt vào 2030.
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-230113164436-638092250768028671.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230113164506-638092251062550074.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230112144326-638091314066040923.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230112144336-638091314165846669.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230112144349-638091314296857927.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230112144359-638091314390255367.jpg
	',
    N'Cùng chung tay mang 10 thư viện ước mơ đến với 4.000 trẻ em ở vùng khó khăn thuộc tỉnh Hà Giang và Bắc Ninh để các em có được không gian đọc sách tiện nghi, khơi nguồn sáng tạo và nghệ thuật.',
    2323,
    28093483,
    208000000,
    23,
   '2023-01-11'
)

 

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    4,
    N'Góp Heo Vàng xây dựng điểm trường bản Đông Liếng, tỉnh Điện Biên cùng KTO',
    N'Vì trẻ em',
    N'<article class="soju__prose small"><p>
	<strong>Trường lớp xuống cấp trầm trọng ở điểm trường bản Liếng</strong>
</p>

<p>
	Xã Mường Thín là một xã miền núi đặc biệt khó khăn nằm ở phía Tây Nam, huyện Tuần Giáo của tỉnh Điện Biên. Xã cách trung tâm thị trấn 16 km, có diện tích khoảng 60,96 km². Toàn xã có 576 hộ, gần 3.000 nhân khẩu, với 3 dân tộc Kinh, Thái, Mông sinh sống trong đó hơn 80% là đồng bào người Thái. Xã gồm 11 thôn trong đó có bản Liếng – là một xã thuộc diện đặc biệt khó khăn. Nằm khá xa khu trung tâm huyện và các trục đường lớn nên người dân trên địa bàn xã Mường Thín chủ yếu sống dựa vào sản xuất nông - lâm nghiệp và chăn nuôi. Các cây trồng chủ lực của xã là: Lúa nước, ngô, sắn, lạc, đậu tương, hoa màu, cao su, trồng rừng.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230117143756-638095630767255990.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Điểm trường bản Đông Liếng thuộc xã Mường Thín cách trung tâm xã khoảng 5km</em>
</p>

<p>
	Bản Liếng có 78 hộ dân với 366 nhân khẩu, chủ yếu là đồng bào người dân tộc H’Mông cùng nhau sinh sống. Do nằm ở vùng sâu xa, đi lại khó khăn vì thế người dân nơi đây chưa có nhiều cơ hội tiếp cận với nền giáo dục tiên tiến. Có lẽ đó cũng chính là lý do khiến trình độ dân trí của họ còn hạn chế. Người dân ở đây làm kinh tế chủ yếu bằng nghề nương rẫy, nhưng đất đồi núi cheo leo khó khai thác nên dù chịu khó làm ăn thì tỉ lệ hộ nghèo vẫn chiếm tới hơn 78%.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230117143830-638095631100011153.jpg" style="width:100%">
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230117143842-638095631228825158.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Điểm trường có 1 phòng lớp nhà trẻ là nhà khung sắt lắp ghép hiện đã xuống cấp trầm trọng</em>
</p>

<p>
	Xã Mường Thín với 3 trường học đóng trên địa bàn gồm có: 1 trường mầm non Mường Thín, 1 Trường Tiểu học Mường Thín, 1 trường THCS Mường Thín. Trong đó trường Mầm non có 1 trường chính và 3 điểm trưởng lẻ trong đó bao gồm điểm trường bản Liếng. Điểm trường bản Liếng hiện có 2 phòng học gồm 1 phòng học lớp mẫu giáo được xây dựng kiên cố, và 1 phòng lớp nhà trẻ là nhà khung sắt lắp ghép hiện đã xuống cấp trầm trọng. Điểm trường hiện nay có 43 trẻ đang theo học, bao gồm nhóm trẻ 13 cháu; lớp mẫu giáo gộp các bé 3, 4, và 5 tuổi có 30 cháu. Điểm trường dựng tạm bằng khung sắt thép đã trên 10 năm, hiện không còn đảm bảo kiên cố, an toàn để các bé có thể tiếp tục đến trường. Hơn nữa trong năm học mới, điểm trường sẽ có thêm nhiều em học sinh nhập học. Vì vậy việc sửa sang phòng học kiên cố hơn, và có thêm phòng học mới là rất cần thiết để giúp các em nhỏ - những mầm non tương lai của đất nước có thể được học tập trong môi trường tốt hơn.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230117143904-638095631446366265.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Cô giáo và các em học sinh của điểm trường bản Đông Liếng</em>
</p>

<p>
	<strong>Góp Heo Vàng xây lớp học mới cho các em nhỏ vùng cao</strong>
</p>

<p>
	Thấu hiểu những nỗi khó khăn vất vả của người dân và các em học sinh đang theo học tại điểm trường bản Đông Liếng, Ví MoMo kết hợp cùng Trung tâm Tình nguyện Quốc gia, Sức Mạnh 2000 kêu gọi cộng đồng Yêu Heo Đất cùng chung tay quyên góp 1.520.000 Heo Vàng. Số Heo Vàng này sẽ được Công ty TNHH vận tải KTO quy đổi tương ứng với 190.000.000 đồng để tiến hành xây thêm phòng học mới. Mỗi sự đóng góp dù lớn hay nhỏ của các nhà hảo tâm cũng sẽ giúp các em nhỏ đến gần hơn với ước mơ theo đuổi con chữ trong một lớp học an toàn và kiên cố hơn. Hy vọng rằng sự chung tay của cộng đồng sẽ tiếp thêm động lực để các bậc phụ huynh vươn lên trong đời sống kinh tế, các em học sinh vững bước trong con đường đi tới tương lai.
</p>
<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230117143937-638095631777971745.jpg" style="width:100%">
<p>
	<br>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230117143958-638095631988901835.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Góp Heo Vàng giúp các em nhỏ vùng cao được học tập trong môi trường khang trang và an toàn hơn</em>
</p>

<p>
	<em>*Sau khi hoàn tất chiến dịch kêu gọi đóng góp, toàn bộ số Heo Vàng sẽ được nhà tài trợ quy đổi thành 190.000.000 đồng để triển khai thực hiện xây điểm trường Nặm Nhì. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến Quý vị trong thời gian sớm nhất.</em>
</p>

<p>
	<u><strong>Về Công ty TNHH vận tải KTO:</strong></u><br>
	Công ty TNHH vận tải KTO được thành lập bởi các chuyên gia có trên mười năm kinh nghiệm và chuyên môn vững vàng trong lĩnh vực xuất nhập khẩu và giao nhận, vận tải hàng hóa Quốc tế. KTO chuyên cung cấp các dịch vụ và giải pháp về vận chuyển và giao nhận hàng hóa quốc tế bao gồm: Vận chuyển đường biển, đường bộ; kho bãi; đóng gói; vận chuyển hàng không; khai hải quan; hệ thống agent phủ khắp trên 30 quốc gia... Trong đó mạnh nhất là vận chuyển đường biển. Với đội ngũ nhân viên có nghiệp vụ vững vàng, giàu kinh nghiệm, cùng với tinh thần làm việc tận tâm và trách nhiệm.&nbsp;
</p>

<p>
	Với tầm nhìn trở thành trở thành một trong những doanh nghiệp hàng đầu trong ngành logistics tại VN, mang đến cho khách hàng các dịch vụ chuẩn mực quốc tế, , KTO tự tin có thể cung cấp dịch vụ nhanh chóng, chính xác và giá cả cạnh tranh nhất giúp khách hàng tối ưu hoá nhu cầu vận chuyển và các hoạt động về logistics, xây dựng và phát triển cộng đồng.
</p>

<p>
	<u><strong>Về Trung tâm Tình nguyện Quốc gia:</strong></u><br>
	Trung tâm Tình nguyện Quốc gia (VVC) do TW Đoàn TNCS Hồ Chí Minh thành lập, là tổ chức cấp Quốc gia nhằm mục tiêu thúc đẩy, hỗ trợ và điều phối hoạt động tình nguyện vì sự phát triển ở Việt Nam. VVC Cung cấp đầy đủ thông tin về mọi hoạt động tình nguyện, tập huấn, hội thảo, hội nghị, diễn đàn thanh niên về các vấn đề xã hội trong nước và quốc tế. Là cầu nối giữa những tổ chức xã hội và những người đam mê tình nguyện.
</p>

<p>
	<u><strong>Về dự án Sức mạnh 2000 - Ánh Sáng Núi Rừng:</strong></u><br>
	Là một dự án gây quỹ xây trường được khởi xướng và điều hành bởi anh Hoàng Hoa Trung - Forbes 30 Under 30 2020, Gương mặt trẻ Việt Nam Tiêu biểu 2019. Tính tới tháng 2/2021, dự án đã xây dựng thành công gần 130 điểm trường, nhà nội trú, nhà hạnh phúc, cầu dân sinh ở các tỉnh vùng cao, giúp hơn 7000 trẻ em được đến trường. Tìm hiểu về dự án thêm tại: <span style="color:#0066cc">http://sucmanh2000.com</span>
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-230117143701-638095630217240643.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230117144315-638095633958972928.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230117144323-638095634033620287.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230117144335-638095634157232517.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230117144355-638095634355558297.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230117144403-638095634436194765.jpg
	',
    N'Cùng góp Heo Vàng xây dựng điểm trường kiên cố hơn, an toàn hơn để các bé có phòng học khang trang, tiếp tục theo đuổi giấc mơ đến trường',
    32087,
    402922,
    1520000,
    28,
   '2023-01-16'
)
  

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    5,
    N'Cùng xây dựng điểm trường Mầm non thôn Nậm Siệu, Tân Lập - Bắc Quang - Hà Giang',
    N'Vì trẻ em',
    N'<article class="soju__prose small"><p>
	Điểm trường Mầm Non Nậm Siệu thuộc xã Tân Lập, huyện Bắc Quang, tỉnh Hà Giang, là điểm trường có số lượng học sinh lớn, nhu cầu học tập cao. Tuy nhiên điều kiện vật chất tại điểm trường chính không đáp ứng được yêu cầu cơ sở vật chất để giúp các em nhỏ tiếp cận được với nền giáo dục chất lượng.
</p>

<p>
	Thôn Nậm Siệu cách Ủy Ban Nhân Dân Xã Tân Lập khoảng 9km với 46 hộ gia đình, trong đó 70% hộ nghèo và cận nghèo. Người dân trong thôn chủ yếu là đồng bào người Dao và người Mông. Nghề nghiệp chủ yếu của các gia đình là làm nông, nên thu nhập của họ còn thấp. Vì thế dù chịu khó làm ăn nhưng kinh tế của họ chưa được cải thiện hoàn toàn. Người dân nơi đây vẫn luôn hiểu rằng đầu tư việc học cho con em là con đường cần thiết và đúng đắn nhất. Các em học sinh cũng không vì đường xa hay cơ sở vật chất thiếu thốn mà từ bỏ lớp học.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221227105600-638077353606819602.jpg" style="width: 100%;">
</p>

<p style="text-align: center;">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221227105625-638077353859551363.jpg" style="width: 100%;">
	<em>Điểm trường Mầm Non Nậm Siệu đang cần kêu gọi đầu tư bởi cơ sở vật chất đã xuống cấp nặng nề</em>
</p>

<p>
	Hiện tại điểm trường có trên 45 học sinh bao gồm cấp mầm non và cấp tiểu học, trong đó có 27 em học sinh mầm non. Điểm trường đã xây dựng trên 12 năm, trải qua điều kiện thời tiết và thời gian dài sử dụng, đến thời điểm này nhà đã bị hư hỏng hoàn toàn và không thể sử dụng. Vì thế điểm trường đã tiến hành tháo dỡ và các em đang phải học nhờ tại Hội trường thôn. Nhà lớp học tại Hội trường thôn được làm bằng loại nhà gỗ, tre nhưng cũng đã mọt mối, hư hỏng.&nbsp;
</p>

<p>
	Điểm trường mầm non Nậm Siệu là điểm trường nằm trong quy hoạch các điểm giáo dục cần kêu gọi đầu tư xây dựng trên địa bàn xã Tân Lập, trường đã được cấp mặt bằng tuy nhiên chưa vận động được nguồn kinh phí xây dựng. Hiểu rõ những khó khăn vất vả và mơ ước được tiếp tục đến trường học tập của thầy trò trường mầm non Nậm Siệu, Trung tâm Tình nguyện Quốc gia, Sức Mạnh và Anh chị nuôi Dự án Nuôi Em kết hợp cùng Ví MoMo kêu gọi cộng đồng Trái Tim MoMo chung tay quyên góp 150.000.000 đồng tiền mặt.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221227105650-638077354106031879.jpg" style="width: 100%;">
</p>

<p style="text-align: center;">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221227105700-638077354206055787.jpg" style="width: 100%;">
	<em>Chung tay mang đến phòng học khang trang và an toàn hơn cho các em học sinh tại điểm trường Nậm Siệu</em>
</p>

<p>
	Dự án dự kiến sẽ xây dựng nhà lớp học cấp IV gồm: 02 phòng học, 01 phòng công vụ với tổng diện tích 115 m2 và xây dựng 01 nhà vệ sinh. Chúng tôi hy vọng cộng đồng các nhà hảo tâm, các mạnh thường quân cùng chung tay để dự án xây trường có thể được tiến hành. Mỗi sự đóng góp dù lớn hay nhỏ của Quý vị cũng giúp các em nhỏ có phòng học kiên cố, khang trang và an toàn hơn.
</p>

<p>
	<u><strong>Về Trung tâm Tình nguyện Quốc gia:</strong></u><br>
	Trung tâm Tình nguyện Quốc gia (VVC) do TW Đoàn TNCS Hồ Chí Minh thành lập, là tổ chức cấp Quốc gia nhằm mục tiêu thúc đẩy, hỗ trợ và điều phối hoạt động tình nguyện vì sự phát triển ở Việt Nam. VVC Cung cấp đầy đủ thông tin về mọi hoạt động tình nguyện, tập huấn, hội thảo, hội nghị, diễn đàn thanh niên về các vấn đề xã hội trong nước và quốc tế. Là cầu nối giữa những tổ chức xã hội và những người đam mê tình nguyện.
</p>

<p>
	<u><strong>Về dự án Sức mạnh 2000 - Ánh Sáng Núi Rừng:</strong></u><br>
	Là một dự án gây quỹ xây trường được khởi xướng và điều hành bởi anh Hoàng Hoa Trung - Forbes 30 Under 30 2020, Gương mặt trẻ Việt Nam Tiêu biểu 2019. Tính tới tháng 2/2021, dự án đã xây dựng thành công gần 130 điểm trường, nhà nội trú, nhà hạnh phúc, cầu dân sinh ở các tỉnh vùng cao, giúp hơn 7000 trẻ em được đến trường. Tìm hiểu về dự án thêm tại: <span style="color: rgb(0, 102, 204);">http://sucmanh2000.com</span>
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-221227105457-638077352974758289.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221227110034-638077356347083568.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221227110047-638077356474826603.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221227110054-638077356547797258.jpg
	',
    N'Điểm trường có trên 45 học sinh bao gồm cấp mầm non và cấp tiểu học, trong đó có 27 em học sinh mầm non. Thế nhưng các em đang phải học tập trong phòng học dựng tạm và không còn an toàn.',
    34861,
    150032841,
    150000000,
    0,
   '2022-12-26'
)


INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    5,
    N'Cùng xây dựng điểm trường Mầm non thôn Nậm Siệu, Tân Lập - Bắc Quang - Hà Giang',
    N'Vì trẻ em',
    N'<article class="soju__prose small"><p>
	Điểm trường Mầm Non Nậm Siệu thuộc xã Tân Lập, huyện Bắc Quang, tỉnh Hà Giang, là điểm trường có số lượng học sinh lớn, nhu cầu học tập cao. Tuy nhiên điều kiện vật chất tại điểm trường chính không đáp ứng được yêu cầu cơ sở vật chất để giúp các em nhỏ tiếp cận được với nền giáo dục chất lượng.
</p>

<p>
	Thôn Nậm Siệu cách Ủy Ban Nhân Dân Xã Tân Lập khoảng 9km với 46 hộ gia đình, trong đó 70% hộ nghèo và cận nghèo. Người dân trong thôn chủ yếu là đồng bào người Dao và người Mông. Nghề nghiệp chủ yếu của các gia đình là làm nông, nên thu nhập của họ còn thấp. Vì thế dù chịu khó làm ăn nhưng kinh tế của họ chưa được cải thiện hoàn toàn. Người dân nơi đây vẫn luôn hiểu rằng đầu tư việc học cho con em là con đường cần thiết và đúng đắn nhất. Các em học sinh cũng không vì đường xa hay cơ sở vật chất thiếu thốn mà từ bỏ lớp học.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221227105600-638077353606819602.jpg" style="width: 100%;">
</p>

<p style="text-align: center;">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221227105625-638077353859551363.jpg" style="width: 100%;">
	<em>Điểm trường Mầm Non Nậm Siệu đang cần kêu gọi đầu tư bởi cơ sở vật chất đã xuống cấp nặng nề</em>
</p>

<p>
	Hiện tại điểm trường có trên 45 học sinh bao gồm cấp mầm non và cấp tiểu học, trong đó có 27 em học sinh mầm non. Điểm trường đã xây dựng trên 12 năm, trải qua điều kiện thời tiết và thời gian dài sử dụng, đến thời điểm này nhà đã bị hư hỏng hoàn toàn và không thể sử dụng. Vì thế điểm trường đã tiến hành tháo dỡ và các em đang phải học nhờ tại Hội trường thôn. Nhà lớp học tại Hội trường thôn được làm bằng loại nhà gỗ, tre nhưng cũng đã mọt mối, hư hỏng.&nbsp;
</p>

<p>
	Điểm trường mầm non Nậm Siệu là điểm trường nằm trong quy hoạch các điểm giáo dục cần kêu gọi đầu tư xây dựng trên địa bàn xã Tân Lập, trường đã được cấp mặt bằng tuy nhiên chưa vận động được nguồn kinh phí xây dựng. Hiểu rõ những khó khăn vất vả và mơ ước được tiếp tục đến trường học tập của thầy trò trường mầm non Nậm Siệu, Trung tâm Tình nguyện Quốc gia, Sức Mạnh và Anh chị nuôi Dự án Nuôi Em kết hợp cùng Ví MoMo kêu gọi cộng đồng Trái Tim MoMo chung tay quyên góp 150.000.000 đồng tiền mặt.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221227105650-638077354106031879.jpg" style="width: 100%;">
</p>

<p style="text-align: center;">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221227105700-638077354206055787.jpg" style="width: 100%;">
	<em>Chung tay mang đến phòng học khang trang và an toàn hơn cho các em học sinh tại điểm trường Nậm Siệu</em>
</p>

<p>
	Dự án dự kiến sẽ xây dựng nhà lớp học cấp IV gồm: 02 phòng học, 01 phòng công vụ với tổng diện tích 115 m2 và xây dựng 01 nhà vệ sinh. Chúng tôi hy vọng cộng đồng các nhà hảo tâm, các mạnh thường quân cùng chung tay để dự án xây trường có thể được tiến hành. Mỗi sự đóng góp dù lớn hay nhỏ của Quý vị cũng giúp các em nhỏ có phòng học kiên cố, khang trang và an toàn hơn.
</p>

<p>
	<u><strong>Về Trung tâm Tình nguyện Quốc gia:</strong></u><br>
	Trung tâm Tình nguyện Quốc gia (VVC) do TW Đoàn TNCS Hồ Chí Minh thành lập, là tổ chức cấp Quốc gia nhằm mục tiêu thúc đẩy, hỗ trợ và điều phối hoạt động tình nguyện vì sự phát triển ở Việt Nam. VVC Cung cấp đầy đủ thông tin về mọi hoạt động tình nguyện, tập huấn, hội thảo, hội nghị, diễn đàn thanh niên về các vấn đề xã hội trong nước và quốc tế. Là cầu nối giữa những tổ chức xã hội và những người đam mê tình nguyện.
</p>

<p>
	<u><strong>Về dự án Sức mạnh 2000 - Ánh Sáng Núi Rừng:</strong></u><br>
	Là một dự án gây quỹ xây trường được khởi xướng và điều hành bởi anh Hoàng Hoa Trung - Forbes 30 Under 30 2020, Gương mặt trẻ Việt Nam Tiêu biểu 2019. Tính tới tháng 2/2021, dự án đã xây dựng thành công gần 130 điểm trường, nhà nội trú, nhà hạnh phúc, cầu dân sinh ở các tỉnh vùng cao, giúp hơn 7000 trẻ em được đến trường. Tìm hiểu về dự án thêm tại: <span style="color: rgb(0, 102, 204);">http://sucmanh2000.com</span>
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-221227105457-638077352974758289.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221227110034-638077356347083568.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221227110047-638077356474826603.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221227110054-638077356547797258.jpg
	',
    N'Điểm trường có trên 45 học sinh bao gồm cấp mầm non và cấp tiểu học, trong đó có 27 em học sinh mầm non. Thế nhưng các em đang phải học tập trong phòng học dựng tạm và không còn an toàn.',
    34861,
    150032841,
    150000000,
    0,
   '2022-12-26'
)
   

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    5,
    N'Cùng chung tay giúp đỡ cô giáo cấp 1 từ bỏ nghề bởi di chứng sốt bại liệt',
    N'Người Già, Người Khuyết Tật',
    N'<article class="soju__prose small"><p>
	Cô Đặng Thị Tâm sinh năm 1950, từng là giáo viên dạy cấp 1. Giọng người Hà Nội dịu dàng, trầm ấm đã từng đọc biết bao bài văn, dạy biết bao điều tốt đẹp cho thế hệ học trò. Cô Tâm chẳng ngờ rằng, sẽ có ngày mình lại lâm vào tình cảnh trớ trêu khi đi khám ở bệnh viện.
</p>

<p>
	Cô Tâm từng bị sốt bại liệt khi còn nhỏ khiến hai chân cô đi lại bất tiện. Sau này, cô cũng vì nó mà ngừng sự nghiệp giảng dạy. Nỗi nhớ nghề khiến cô Tâm luôn đau đáu. Khi cô đi bệnh viện khám khối u ở ngực. Chân đi chập chững, ngực đau nhói nhưng không đau đớn bằng việc cô bị người khác chế giễu khi tập tễnh từng bước xếp hàng chờ khám.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118135604-638096469648456598.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Vì bại liệt mà cô Tâm phải ngừng sự nghiệp giảng dạy</em>
</p>

<p>
	Rời bục giảng, cô làm giúp việc để mưu sinh. Cô phải sống cô độc trong căn nhà trọ. Mọi gánh nặng đè lên đôi vai cô. Nhất là khi cô mắc thêm căn bệnh u vú, phải thăm khám và thuốc men thường xuyên. Tiền trọ hàng tháng, tiền ăn hàng ngày khiến cô không thể nào kham nổi.
</p>

<p>
	Cũng từ đó, cô Tâm bước vào mái ấm Sài Gòn Bao Dung sống những ngày tháng hạnh phúc nhất của đời mình.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118135635-638096469954354700.jpg" style="width:100%">
</p>
<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118135650-638096470106819748.jpg" style="width:100%">
<br>
&nbsp;
<p style="text-align:center">
	<em>Ở Quán trọ Trăng Khuyết, cô có thêm nhiều người bạn cùng đối thơ&nbsp;</em>
</p>

<p>
	Cô Tâm không nghĩ rằng cuối đời mình có thể sống được những ngày tháng tươi đẹp như vậy. Nơi này, cô có bạn bè tri kỷ cùng đối thơ, cùng đố nhau về hằng đẳng thức đáng nhớ. Cô từ một người tứ cố vô thân, đã có thêm những anh hai, chị hai, chị ba… cùng ăn, cùng nghỉ, cùng đi dạo mát… Niềm hạnh phúc to lớn ấy đã khiến cô phải thốt lên xúc động rằng: “Tôi nguyện ở đây cho tới chết!”
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118135707-638096470273986447.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Căn bệnh vẫn dày vò cô qua nhiều năm tháng</em>
</p>

<p>
	Tuy nhiên, để làm được điều này, Trăng Khuyết rất mong có thêm kinh phí để cho cô Tâm có thể duy trì sức khỏe vượt qua bệnh tật, để vui khỏe cùng những người bạn già nơi đây. Để tiếp thêm hy vọng cho cô Đặng Thị Tâm, Trăng Khuyết cùng Ví MoMo kêu gọi số tiền khám chữa bệnh tim cho cô là 30.000.000 VNĐ thông qua cộng đồng các nhà hảo tâm, các mạnh thường quân.&nbsp;
</p>

<p>
	Người hạnh phúc nhất chính là người có cơ hội được cho đi. Rất mong các mạnh thường quân, các nhà hảo tâm sẽ đồng hành cùng chương trình quyên góp lần này của MoMo và Trăng Khuyết hỗ trợ cho những số phận đơn chiếc. Dù đóng góp nào cũng đều đáng quý, cùng là tình yêu thương đong đầy của của cô chú, anh chị dành cho các cụ già neo đơn.
</p>

<p>
	<em>*Sau khi hoàn tất chiến dịch kêu gọi đóng góp, MoMo sẽ chuyển toàn bộ số tiền 30.000.000 đồng đã gây quỹ gửi đến Quỹ Từ Thiện &amp; BTXH Trăng Khuyết hỗ trợ chi phí khám chữa bệnh cho cô Tâm Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến Quý vị trong thời gian sớm nhất.&nbsp; &nbsp;</em>
</p>

<p>
	<u><strong>Về Quỹ Từ Thiện &amp; BTXH Trăng Khuyết:</strong></u><br>
	Trăng Khuyết là một tổ chức từ thiện về nhân đạo và sự sống, nhằm kết nối cộng đồng và thực hiện các hoạt động trợ giúp trực tiếp cho các cụ già không nơi nương tựa và trẻ em bị bỏ rơi. Thông qua các hoạt động: cứu trợ khẩn cấp, cung cấp bữa ăn, chỗ ở và cải thiện cuộc sống. Trăng Khuyết hoạt động độc lập, phi tôn giáo và phi lợi nhuận trên toàn lãnh thổ Việt Nam. Thông qua pháp nhân là Quỹ Từ Thiện &amp; BTXH Trăng Khuyết, một doanh nghiệp xã hội, hoạt động 100% vì cộng đồng.
</p>

<p>
	<em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <span style="color:#0066cc">donation@mservice.com.vn</span></em>
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-230118135520-638096469203857632.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230118140007-638096472074368419.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230118140025-638096472252628651.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230118140037-638096472374151501.jpg
	',
    N'Từng ước mơ và ấp ủ nhiều hoài bão, cô Tâm rời khỏi bục giảng bởi di chứng của sốt bại liệt. Cô Tâm rất cần sự giúp đỡ kinh phí khám chữa bệnh, thuốc men',
    293,
    9912010,
    30000000,
    29,
   '2023-01-18'
)


INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    5,
    N'Cùng chung tay giúp đỡ cô giáo cấp 1 từ bỏ nghề bởi di chứng sốt bại liệt',
    N'Người Già, Người Khuyết Tật',
    N'<article class="soju__prose small"><p>
	Cô Đặng Thị Tâm sinh năm 1950, từng là giáo viên dạy cấp 1. Giọng người Hà Nội dịu dàng, trầm ấm đã từng đọc biết bao bài văn, dạy biết bao điều tốt đẹp cho thế hệ học trò. Cô Tâm chẳng ngờ rằng, sẽ có ngày mình lại lâm vào tình cảnh trớ trêu khi đi khám ở bệnh viện.
</p>

<p>
	Cô Tâm từng bị sốt bại liệt khi còn nhỏ khiến hai chân cô đi lại bất tiện. Sau này, cô cũng vì nó mà ngừng sự nghiệp giảng dạy. Nỗi nhớ nghề khiến cô Tâm luôn đau đáu. Khi cô đi bệnh viện khám khối u ở ngực. Chân đi chập chững, ngực đau nhói nhưng không đau đớn bằng việc cô bị người khác chế giễu khi tập tễnh từng bước xếp hàng chờ khám.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118135604-638096469648456598.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Vì bại liệt mà cô Tâm phải ngừng sự nghiệp giảng dạy</em>
</p>

<p>
	Rời bục giảng, cô làm giúp việc để mưu sinh. Cô phải sống cô độc trong căn nhà trọ. Mọi gánh nặng đè lên đôi vai cô. Nhất là khi cô mắc thêm căn bệnh u vú, phải thăm khám và thuốc men thường xuyên. Tiền trọ hàng tháng, tiền ăn hàng ngày khiến cô không thể nào kham nổi.
</p>

<p>
	Cũng từ đó, cô Tâm bước vào mái ấm Sài Gòn Bao Dung sống những ngày tháng hạnh phúc nhất của đời mình.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118135635-638096469954354700.jpg" style="width:100%">
</p>
<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118135650-638096470106819748.jpg" style="width:100%">
<br>
&nbsp;
<p style="text-align:center">
	<em>Ở Quán trọ Trăng Khuyết, cô có thêm nhiều người bạn cùng đối thơ&nbsp;</em>
</p>

<p>
	Cô Tâm không nghĩ rằng cuối đời mình có thể sống được những ngày tháng tươi đẹp như vậy. Nơi này, cô có bạn bè tri kỷ cùng đối thơ, cùng đố nhau về hằng đẳng thức đáng nhớ. Cô từ một người tứ cố vô thân, đã có thêm những anh hai, chị hai, chị ba… cùng ăn, cùng nghỉ, cùng đi dạo mát… Niềm hạnh phúc to lớn ấy đã khiến cô phải thốt lên xúc động rằng: “Tôi nguyện ở đây cho tới chết!”
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118135707-638096470273986447.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Căn bệnh vẫn dày vò cô qua nhiều năm tháng</em>
</p>

<p>
	Tuy nhiên, để làm được điều này, Trăng Khuyết rất mong có thêm kinh phí để cho cô Tâm có thể duy trì sức khỏe vượt qua bệnh tật, để vui khỏe cùng những người bạn già nơi đây. Để tiếp thêm hy vọng cho cô Đặng Thị Tâm, Trăng Khuyết cùng Ví MoMo kêu gọi số tiền khám chữa bệnh tim cho cô là 30.000.000 VNĐ thông qua cộng đồng các nhà hảo tâm, các mạnh thường quân.&nbsp;
</p>

<p>
	Người hạnh phúc nhất chính là người có cơ hội được cho đi. Rất mong các mạnh thường quân, các nhà hảo tâm sẽ đồng hành cùng chương trình quyên góp lần này của MoMo và Trăng Khuyết hỗ trợ cho những số phận đơn chiếc. Dù đóng góp nào cũng đều đáng quý, cùng là tình yêu thương đong đầy của của cô chú, anh chị dành cho các cụ già neo đơn.
</p>

<p>
	<em>*Sau khi hoàn tất chiến dịch kêu gọi đóng góp, MoMo sẽ chuyển toàn bộ số tiền 30.000.000 đồng đã gây quỹ gửi đến Quỹ Từ Thiện &amp; BTXH Trăng Khuyết hỗ trợ chi phí khám chữa bệnh cho cô Tâm Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến Quý vị trong thời gian sớm nhất.&nbsp; &nbsp;</em>
</p>

<p>
	<u><strong>Về Quỹ Từ Thiện &amp; BTXH Trăng Khuyết:</strong></u><br>
	Trăng Khuyết là một tổ chức từ thiện về nhân đạo và sự sống, nhằm kết nối cộng đồng và thực hiện các hoạt động trợ giúp trực tiếp cho các cụ già không nơi nương tựa và trẻ em bị bỏ rơi. Thông qua các hoạt động: cứu trợ khẩn cấp, cung cấp bữa ăn, chỗ ở và cải thiện cuộc sống. Trăng Khuyết hoạt động độc lập, phi tôn giáo và phi lợi nhuận trên toàn lãnh thổ Việt Nam. Thông qua pháp nhân là Quỹ Từ Thiện &amp; BTXH Trăng Khuyết, một doanh nghiệp xã hội, hoạt động 100% vì cộng đồng.
</p>

<p>
	<em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <span style="color:#0066cc">donation@mservice.com.vn</span></em>
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-230118135520-638096469203857632.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230118140007-638096472074368419.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230118140025-638096472252628651.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230118140037-638096472374151501.jpg
	',
    N'Từng ước mơ và ấp ủ nhiều hoài bão, cô Tâm rời khỏi bục giảng bởi di chứng của sốt bại liệt. Cô Tâm rất cần sự giúp đỡ kinh phí khám chữa bệnh, thuốc men',
    293,
    9912010,
    30000000,
    29,
   '2023-01-18'
)
  

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    6,
    N'Chung tay giúp những ngày cuối đời của thầy giáo Lưu Mạc Phong giảm bớt nỗi lo từ bệnh tật',
    N'Người Già, Người Khuyết Tật',
    N'
    <article class="soju__prose small"><p>
	<strong>Cuộc sống ngặt nghèo của người thầy giáo</strong>
</p>

<p>
	Thầy Lưu Mạc Phong, sinh 1962, dọn về quán trọ Trăng Khuyết sau trận bệnh nặng, đột quỵ và viêm phổi. Trong lúc làm bảo vệ ở một cửa hàng thời trang, thầy Phong đột ngột ngưng thở, ngã khuỵu trước cửa hàng. Thầy được đưa vào bệnh viện 115 cấp cứu. Suốt 2 tuần nằm viện, tiền lương, tiền dành dụm bao năm qua của thầy đã chi trả cho đợt chữa trị đó.&nbsp;
</p>

<p>
	Sức khỏe không đủ, thầy nghỉ việc bảo vệ, nhà trọ cũng bị công ty lấy lại, không nhà, không tiền, không kế sinh nhai. Cuộc sống ngặt nghèo bủa vây. Trước đây, thầy từng lập gia đình nhưng hôn nhân đổ vỡ, con trai sống cùng mẹ. Một mình thầy lang bạt khắp nơi.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118134916-638096465567788324.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Sức khỏe khiến cho chú Phong phải chịu nhiều khó khăn trong sinh hoạt</em>
</p>

<p>
	Chẳng ai ngờ rằng người đàn ông gầy gò, xanh xao ấy từng là thầy giáo cấp 1. Đôi bàn tay gân guốc ấy từng ân cần dạy biết bao thế hệ học trò. Nét chữ mạnh mẽ, dứt khoát như nết người kiên cường, tận tụy của thầy Phong. Trong ánh mắt của thấy, vẫn còn ánh lên niềm vui và niềm tự hào khi nhắc về những tháng ngày đứng trên bục giảng.
</p>

<p>
	Đáng tiếc rằng thầy lại không thể nắn nót cuộc đời mình tươi đẹp hơn.
</p>

<p>
	<strong>Chung tay hỗ trợ chi phí khám chữa bệnh cho thầy Phong</strong>
</p>

<p>
	Sau cơn bạo bệnh, sức khỏe của thầy sa sút hẳn, di chứng để lại thầy không thể làm việc nặng, đi tới đi lui nhiều cũng khó thở bởi không đủ oxy cấp lên phổi. Thầy tiếp tục nhập viện mấy lần nhưng thầy chẳng có gì ngoài cơ thể suy nhược.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118134935-638096465756898500.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Mặc dù đã không còn đi dạy, nhưng ước mơ gieo con chữ của thầy Phong cho các em nhỏ vẫn còn tới hôm nay</em>
</p>

<p>
	Trăng Khuyết đã tìm tới thầy trong hoàn cảnh mà khi bệnh viện cho xuất viện, cũng không biết đưa thầy đi đâu về đâu. Ngày thầy vào Quán trọ Trăng Khuyết tại Quận 12, gương mặt hốc hác, thất thần. Nhưng sau những tháng ngày không có chốn đi về, thầy Phong dần hòa nhập và sống vui vẻ bên cạnh những người bạn già của mình. Thầy đọc sách, ngâm thơ, luyện chữ… và chia sẻ về tâm huyết làm nghề giáo của mình “Phạt học trò đau một, thầy cô lại đau tới mười!”
</p>

<p>
	Một người thầy đã từng nhiệt huyết với nghề giáo, giúp bao thế hệ sang sông, vẫn còn ưu tư những khi thăm khám, thuốc men đều đặn bởi di chứng để lại. Vì vậy Quỹ Trăng Khuyết kết hợp cùng Ví MoMo kêu gọi các mạnh thường quân chung tay quyên góp 30.000.000 đồng để góp thêm một phần chi phí giúp cho người thầy vượt qua những ngày khó khăn phía trước.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118135000-638096466001859604.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Chung tay giúp thầy Phong có thêm chi phí khám chữa bệnh trong những ngày tháng còn lại</em>
</p>

<p>
	Cuộc sống muôn màu muôn vẻ, bên cạnh những người hạnh phúc thì không thiếu những người bi thương. Chính vì lí do đó mà cuộc sống cần phải có sự sẻ chia, tương trợ lẫn nhau. Rất mong các mạnh thường quân, các nhà hảo tâm sẽ đồng hành cùng chương trình quyên góp lần này của MoMo và Trăng Khuyết hỗ trợ cho những số phận đơn chiếc. Dù đóng góp nào cũng đều đáng quý, cùng là tình yêu thương đong đầy của của cô chú, anh chị dành cho các cụ già neo đơn.
</p>

<p>
	<em>*Sau khi hoàn tất chiến dịch kêu gọi đóng góp, MoMo sẽ chuyển toàn bộ số tiền 30.000.000 đồng đã gây quỹ gửi đến Quỹ Từ Thiện &amp; BTXH Trăng Khuyết hỗ trợ chi phí khám chữa bệnh cho thầy Phong. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến Quý vị trong thời gian sớm nhất.</em>
</p>

<p>
	<u>Về Quỹ Từ Thiện &amp; BTXH Trăng Khuyết:</u><br>
	Trăng Khuyết là một tổ chức từ thiện về nhân đạo và sự sống, nhằm kết nối cộng đồng và thực hiện các hoạt động trợ giúp trực tiếp cho các cụ già không nơi nương tựa và trẻ em bị bỏ rơi. Thông qua các hoạt động: cứu trợ khẩn cấp, cung cấp bữa ăn, chỗ ở và cải thiện cuộc sống. Trăng Khuyết hoạt động độc lập, phi tôn giáo và phi lợi nhuận trên toàn lãnh thổ Việt Nam. Thông qua pháp nhân là Quỹ Từ Thiện &amp; BTXH Trăng Khuyết, một doanh nghiệp xã hội, hoạt động 100% vì cộng đồng&nbsp;
</p>

<p>
	<em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <span style="color:#0066cc">donation@mservice.com.vn</span></em>
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-230118134838-638096465180404701.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230118135332-638096468122827736.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230118135343-638096468234002874.jpg
	',
    N'Từng là thầy giáo rèn chữ cho biết bao thế hệ, nhưng thầy Phong lại chẳng thể nắn nót cuộc đời mình trở nên đẹp đẽ hơn. Cùng chung tay hỗ trợ kinh phí khám chữa bệnh cho thầy Phong.',
    343,
    12361223,
    20000000,
    29,
   '2023-01-18'
)
   


INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    6,
    N'Chung tay giúp những ngày cuối đời của thầy giáo Lưu Mạc Phong giảm bớt nỗi lo từ bệnh tật',
    N'Người Già, Người Khuyết Tật',
    N'
    <article class="soju__prose small"><p>
	<strong>Cuộc sống ngặt nghèo của người thầy giáo</strong>
</p>

<p>
	Thầy Lưu Mạc Phong, sinh 1962, dọn về quán trọ Trăng Khuyết sau trận bệnh nặng, đột quỵ và viêm phổi. Trong lúc làm bảo vệ ở một cửa hàng thời trang, thầy Phong đột ngột ngưng thở, ngã khuỵu trước cửa hàng. Thầy được đưa vào bệnh viện 115 cấp cứu. Suốt 2 tuần nằm viện, tiền lương, tiền dành dụm bao năm qua của thầy đã chi trả cho đợt chữa trị đó.&nbsp;
</p>

<p>
	Sức khỏe không đủ, thầy nghỉ việc bảo vệ, nhà trọ cũng bị công ty lấy lại, không nhà, không tiền, không kế sinh nhai. Cuộc sống ngặt nghèo bủa vây. Trước đây, thầy từng lập gia đình nhưng hôn nhân đổ vỡ, con trai sống cùng mẹ. Một mình thầy lang bạt khắp nơi.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118134916-638096465567788324.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Sức khỏe khiến cho chú Phong phải chịu nhiều khó khăn trong sinh hoạt</em>
</p>

<p>
	Chẳng ai ngờ rằng người đàn ông gầy gò, xanh xao ấy từng là thầy giáo cấp 1. Đôi bàn tay gân guốc ấy từng ân cần dạy biết bao thế hệ học trò. Nét chữ mạnh mẽ, dứt khoát như nết người kiên cường, tận tụy của thầy Phong. Trong ánh mắt của thấy, vẫn còn ánh lên niềm vui và niềm tự hào khi nhắc về những tháng ngày đứng trên bục giảng.
</p>

<p>
	Đáng tiếc rằng thầy lại không thể nắn nót cuộc đời mình tươi đẹp hơn.
</p>

<p>
	<strong>Chung tay hỗ trợ chi phí khám chữa bệnh cho thầy Phong</strong>
</p>

<p>
	Sau cơn bạo bệnh, sức khỏe của thầy sa sút hẳn, di chứng để lại thầy không thể làm việc nặng, đi tới đi lui nhiều cũng khó thở bởi không đủ oxy cấp lên phổi. Thầy tiếp tục nhập viện mấy lần nhưng thầy chẳng có gì ngoài cơ thể suy nhược.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118134935-638096465756898500.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Mặc dù đã không còn đi dạy, nhưng ước mơ gieo con chữ của thầy Phong cho các em nhỏ vẫn còn tới hôm nay</em>
</p>

<p>
	Trăng Khuyết đã tìm tới thầy trong hoàn cảnh mà khi bệnh viện cho xuất viện, cũng không biết đưa thầy đi đâu về đâu. Ngày thầy vào Quán trọ Trăng Khuyết tại Quận 12, gương mặt hốc hác, thất thần. Nhưng sau những tháng ngày không có chốn đi về, thầy Phong dần hòa nhập và sống vui vẻ bên cạnh những người bạn già của mình. Thầy đọc sách, ngâm thơ, luyện chữ… và chia sẻ về tâm huyết làm nghề giáo của mình “Phạt học trò đau một, thầy cô lại đau tới mười!”
</p>

<p>
	Một người thầy đã từng nhiệt huyết với nghề giáo, giúp bao thế hệ sang sông, vẫn còn ưu tư những khi thăm khám, thuốc men đều đặn bởi di chứng để lại. Vì vậy Quỹ Trăng Khuyết kết hợp cùng Ví MoMo kêu gọi các mạnh thường quân chung tay quyên góp 30.000.000 đồng để góp thêm một phần chi phí giúp cho người thầy vượt qua những ngày khó khăn phía trước.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230118135000-638096466001859604.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Chung tay giúp thầy Phong có thêm chi phí khám chữa bệnh trong những ngày tháng còn lại</em>
</p>

<p>
	Cuộc sống muôn màu muôn vẻ, bên cạnh những người hạnh phúc thì không thiếu những người bi thương. Chính vì lí do đó mà cuộc sống cần phải có sự sẻ chia, tương trợ lẫn nhau. Rất mong các mạnh thường quân, các nhà hảo tâm sẽ đồng hành cùng chương trình quyên góp lần này của MoMo và Trăng Khuyết hỗ trợ cho những số phận đơn chiếc. Dù đóng góp nào cũng đều đáng quý, cùng là tình yêu thương đong đầy của của cô chú, anh chị dành cho các cụ già neo đơn.
</p>

<p>
	<em>*Sau khi hoàn tất chiến dịch kêu gọi đóng góp, MoMo sẽ chuyển toàn bộ số tiền 30.000.000 đồng đã gây quỹ gửi đến Quỹ Từ Thiện &amp; BTXH Trăng Khuyết hỗ trợ chi phí khám chữa bệnh cho thầy Phong. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến Quý vị trong thời gian sớm nhất.</em>
</p>

<p>
	<u>Về Quỹ Từ Thiện &amp; BTXH Trăng Khuyết:</u><br>
	Trăng Khuyết là một tổ chức từ thiện về nhân đạo và sự sống, nhằm kết nối cộng đồng và thực hiện các hoạt động trợ giúp trực tiếp cho các cụ già không nơi nương tựa và trẻ em bị bỏ rơi. Thông qua các hoạt động: cứu trợ khẩn cấp, cung cấp bữa ăn, chỗ ở và cải thiện cuộc sống. Trăng Khuyết hoạt động độc lập, phi tôn giáo và phi lợi nhuận trên toàn lãnh thổ Việt Nam. Thông qua pháp nhân là Quỹ Từ Thiện &amp; BTXH Trăng Khuyết, một doanh nghiệp xã hội, hoạt động 100% vì cộng đồng&nbsp;
</p>

<p>
	<em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <span style="color:#0066cc">donation@mservice.com.vn</span></em>
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-230118134838-638096465180404701.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230118135332-638096468122827736.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230118135343-638096468234002874.jpg
	',
    N'Từng là thầy giáo rèn chữ cho biết bao thế hệ, nhưng thầy Phong lại chẳng thể nắn nót cuộc đời mình trở nên đẹp đẽ hơn. Cùng chung tay hỗ trợ kinh phí khám chữa bệnh cho thầy Phong.',
    343,
    12361223,
    20000000,
    29,
   '2023-01-18'
)
   


INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    7,
    N'Chung tay giúp những cô gái mở tiệm giặt là người Điếc, giúp người Điếc/Khiếm thính có việc làm ổn định',
    N'Người Già, Người Khuyết Tật',
    N'
    <article class="soju__prose small"><p>
	<strong>Những khó khăn của cộng đồng người Điếc/Khiếm thính</strong>
</p>

<p>
	Cộng đồng người Điếc/Khiếm thính Việt Nam với hơn 2.5 triệu người, sử dụng ngôn ngữ khác biệt và gặp khó khăn trong giao tiếp dẫn đến thiếu tiếp cận thông tin khiến họ thụt lùi so với xã hội. Rất nhiều người không được sự tin tưởng từ gia đình để tạo lập một cuộc sống của riêng họ. Họ bị kỳ thị, giới hạn khả năng và tước đi quyền quyết định trong cuộc sống.&nbsp;
</p>

<p>
	Theo một nghiên cứu về tình trạng việc làm của người Điếc tại Hà Nội năm 2019, 85% số người được phỏng vấn có mức lương thấp hơn lương tối thiểu vùng của Hà Nội, hơn 90% gặp vấn đề khó khăn trong tiếng Việt… Người Điếc gặp khó khăn trong hầu hết các lĩnh vực của cuộc sống, đặc biệt là vấn đề hoà nhập trong môi trường làm việc để có thể cải thiện mức sống.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230109111159-638088595199783387.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Những người Điếc/Khiếm thính gặp phải khó khăn trong hầu hết mọi lĩnh vực của cuộc sống</em>
</p>

<p>
	<strong>Chung tay ủng hộ việc làm bền vững cho những người Điếc/Khiếm thính</strong>&nbsp;
</p>

<p>
	“Tiệm giặt là của người Điếc” là một dự án của SÁNG thành lập từ tháng 12.2020. Từ ý tưởng kinh doanh “Giặt Là Sáng” bắt đầu với một cơ sở nhỏ khiêm tốn tại đường bờ sông Sét Hà Nội, cho đến nay tiệm có 2 cơ sở tại Hà Nội phục vụ gần 3.000 khách hàng và đã đào tạo cho hơn 10 bạn người Điếc/khiếm thính tại Hà Nội.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230109111216-638088595364808176.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Tiệm giặt là Sáng giúp những người Điếc/Khiếm thính có cơ hội việc làm</em>
</p>

<p>
	Với ước mơ tiếp tục cống hiến giá trị của mình qua công việc giặt là của các cô gái người Điếc, họ tiếp tục sẽ dạy nghề giặt là cho những người Điếc/Khiếm thính tại Tp. Hồ Chí Minh. SÁNG kêu gọi sự chung tay ủng hộ để khởi sự cho mô hình tạo việc làm bền vững cho những người Điếc/Khiếm thính trong dự án “Tiệm giặt là của người Điếc” tại khu vực phía Nam. Và khởi đầu là tiệm giặt đầu tiên tại khu vực TP Hồ Chí Minh (Sài Gòn). Để làm được điều này, Ví MoMo kết hợp cùng Sáng kêu gọi các nhà hảo tâm, các mạnh thường quân cùng chung tay quyên góp 250.000.000 đồng để thực hiện dự án. Đó là cơ hội đưa ra dịch vụ bình đẳng, thông qua đó chứng minh nỗ lực của người Điếc/khiếm thính trong xã hội góp phần phát triển cộng đồng bền vững, xây dựng một xã hội văn minh.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230109111233-638088595533536393.jpg" style="width:100%">
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230109111245-638088595652053344.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Chung tay tạo việc làm bền vững cho cộng đồng người Điếc/Khiếm thính</em>
</p>

<p>
	Dự án đặt mục tiêu đào tạo nghề giặt là cho 07 người Điếc/Khiếm thính tại Sài Gòn với 1 cơ sở dịch vụ giặt là và 1 điểm nhận đồ giặt. Các hoạt động chính của dự án:
</p>

<ul>
	<li aria-level="1">Set up mô hình dịch vụ giặt là.</li>
	<li aria-level="1">Tuyển dụng, đào tạo nghề, chuyển giao quy trình 6 dịch vụ.</li>
	<li aria-level="1">Quản lý hệ thống vận hành, bán hàng và chăm sóc khách hàng.</li>
</ul>

<p>
	<em>*Sau khi hoàn tất chiến dịch kêu gọi đóng góp, số tiền 250.000.000 đồng sẽ được chuyển đến SÁNG để tiến hành dự án. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến Quý vị trong thời gian sớm nhất.</em>
</p>

<p>
	<u><strong>Về dự án “Tiệm giặt người Điếc Sài Gòn”</strong></u><br>
	Mục đích: Xây dựng mô hình kinh doanh tự chủ của người Điếc, lợi nhuận của Tiệm giặt người Điếc sẽ được dùng cho các lớp học kỹ năng sống, hỗ trợ người Điếc/khiếm thính hòa nhập xã hội.
</p>

<p>
	<u><strong>Về Sáng Group:</strong></u><br>
	Về SÁNG (Công ty CP nhượng quyền kinh doanh xã hội SÁNG Group): là một doanh nghiệp xã hội có trụ sở tại Hà Nội, tiền thân là nhóm SÁNG được thành lập từ tháng 4/2019 thực hiện dự án “Đào tạo kỹ năng cho người Điếc”. Thành viên sáng lập của nhóm là Lương Thị Kiều Thuý – một người khiếm thính, nhóm hoạt động với mục tiêu trao quyền cho những người Điếc/khiếm thính phát triển, hỗ trợ hòa nhập xã hội đồng thời giảm thiểu sự bất bình đẳng trong cuộc sống của người Điếc/khiếm thính nói riêng và người khuyết tật nói chung.
</p>

<p>
	<em><strong>Các dự án đã thực hiện của SÁNG:</strong></em>
</p>

<ul>
	<li aria-level="1">Nghiên cứu về tình trạng việc làm của người Điếc (2019)</li>
	<li aria-level="1">Dạy kỹ năng mềm cho người Điếc tại Hợp tác xã Vụn Art (2019)</li>
	<li aria-level="1">Dạy tiếng anh cho người Điếc/khiếm thính (2019)</li>
	<li aria-level="1">Tiệm giặt là của người Điếc (2020)</li>
	<li aria-level="1">Sáng kiến hoà nhập “Bánh Xe Vỗ Vai” (2021)</li>
</ul>

<p>
	<em><strong>Các giải thưởng đã đạt được của SÁNG:</strong></em>
</p>

<ul>
	<li aria-level="1">Cánh Én Vàng 2019 – Hội Liên Hiệp Phụ nữ Việt Nam trao tặng</li>
	<li aria-level="1">Best Performance (Youth co:lab) 2020 – Chương trình Phát triển Liên Hợp Quốc trao tặng</li>
	<li aria-level="1">Én Xanh xuất sắc 2021 – Trung tâm Hỗ trợ Sáng kiến Phục vụ Cộng đồng (CSIP) trao tặng</li>
	<li aria-level="1">Giải Nhì BGK bình chọn cho Mô hình tiếp cận cho người khuyết tật 2022 - Chương trình Phát triển Liên Hợp Quốc trao tặng.</li>
	<li aria-level="1">…</li>
</ul>

<p>
	<em><strong>Các tổ chức đã hợp tác tài trợ cho SÁNG:</strong></em>
</p>

<ul>
	<li aria-level="1">NICE Program – Mạng lưới Sáng kiến phát triển cộng đồng&nbsp;</li>
	<li aria-level="1">Abilis – Quỹ Phần Lan tại Việt Nam</li>
	<li aria-level="1">CSIP - Trung tâm Hỗ trợ Sáng kiến Phục vụ Cộng đồng</li>
	<li aria-level="1">UNDP - Chương trình Phát triển Liên Hợp Quốc</li>
	<li aria-level="1">...</li>
</ul>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-230109110937-638088593778096647.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230109111611-638088597713583110.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230109111620-638088597804290722.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230109111629-638088597899324260.jpg
	',
    N'Cùng khởi sự cho mô hình tạo việc làm bền vững cho những người Điếc/Khiếm thính trong dự án “Tiệm giặt là của người Điếc” tại khu vực phía Nam',
    4295,
    43102996,
    250000000,
    20,
   '2023-01-08'
)

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    7,
    N'Chung tay giúp những cô gái mở tiệm giặt là người Điếc, giúp người Điếc/Khiếm thính có việc làm ổn định',
    N'Người Già, Người Khuyết Tật',
    N'
    <article class="soju__prose small"><p>
	<strong>Những khó khăn của cộng đồng người Điếc/Khiếm thính</strong>
</p>

<p>
	Cộng đồng người Điếc/Khiếm thính Việt Nam với hơn 2.5 triệu người, sử dụng ngôn ngữ khác biệt và gặp khó khăn trong giao tiếp dẫn đến thiếu tiếp cận thông tin khiến họ thụt lùi so với xã hội. Rất nhiều người không được sự tin tưởng từ gia đình để tạo lập một cuộc sống của riêng họ. Họ bị kỳ thị, giới hạn khả năng và tước đi quyền quyết định trong cuộc sống.&nbsp;
</p>

<p>
	Theo một nghiên cứu về tình trạng việc làm của người Điếc tại Hà Nội năm 2019, 85% số người được phỏng vấn có mức lương thấp hơn lương tối thiểu vùng của Hà Nội, hơn 90% gặp vấn đề khó khăn trong tiếng Việt… Người Điếc gặp khó khăn trong hầu hết các lĩnh vực của cuộc sống, đặc biệt là vấn đề hoà nhập trong môi trường làm việc để có thể cải thiện mức sống.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230109111159-638088595199783387.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Những người Điếc/Khiếm thính gặp phải khó khăn trong hầu hết mọi lĩnh vực của cuộc sống</em>
</p>

<p>
	<strong>Chung tay ủng hộ việc làm bền vững cho những người Điếc/Khiếm thính</strong>&nbsp;
</p>

<p>
	“Tiệm giặt là của người Điếc” là một dự án của SÁNG thành lập từ tháng 12.2020. Từ ý tưởng kinh doanh “Giặt Là Sáng” bắt đầu với một cơ sở nhỏ khiêm tốn tại đường bờ sông Sét Hà Nội, cho đến nay tiệm có 2 cơ sở tại Hà Nội phục vụ gần 3.000 khách hàng và đã đào tạo cho hơn 10 bạn người Điếc/khiếm thính tại Hà Nội.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230109111216-638088595364808176.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Tiệm giặt là Sáng giúp những người Điếc/Khiếm thính có cơ hội việc làm</em>
</p>

<p>
	Với ước mơ tiếp tục cống hiến giá trị của mình qua công việc giặt là của các cô gái người Điếc, họ tiếp tục sẽ dạy nghề giặt là cho những người Điếc/Khiếm thính tại Tp. Hồ Chí Minh. SÁNG kêu gọi sự chung tay ủng hộ để khởi sự cho mô hình tạo việc làm bền vững cho những người Điếc/Khiếm thính trong dự án “Tiệm giặt là của người Điếc” tại khu vực phía Nam. Và khởi đầu là tiệm giặt đầu tiên tại khu vực TP Hồ Chí Minh (Sài Gòn). Để làm được điều này, Ví MoMo kết hợp cùng Sáng kêu gọi các nhà hảo tâm, các mạnh thường quân cùng chung tay quyên góp 250.000.000 đồng để thực hiện dự án. Đó là cơ hội đưa ra dịch vụ bình đẳng, thông qua đó chứng minh nỗ lực của người Điếc/khiếm thính trong xã hội góp phần phát triển cộng đồng bền vững, xây dựng một xã hội văn minh.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230109111233-638088595533536393.jpg" style="width:100%">
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-230109111245-638088595652053344.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Chung tay tạo việc làm bền vững cho cộng đồng người Điếc/Khiếm thính</em>
</p>

<p>
	Dự án đặt mục tiêu đào tạo nghề giặt là cho 07 người Điếc/Khiếm thính tại Sài Gòn với 1 cơ sở dịch vụ giặt là và 1 điểm nhận đồ giặt. Các hoạt động chính của dự án:
</p>

<ul>
	<li aria-level="1">Set up mô hình dịch vụ giặt là.</li>
	<li aria-level="1">Tuyển dụng, đào tạo nghề, chuyển giao quy trình 6 dịch vụ.</li>
	<li aria-level="1">Quản lý hệ thống vận hành, bán hàng và chăm sóc khách hàng.</li>
</ul>

<p>
	<em>*Sau khi hoàn tất chiến dịch kêu gọi đóng góp, số tiền 250.000.000 đồng sẽ được chuyển đến SÁNG để tiến hành dự án. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến Quý vị trong thời gian sớm nhất.</em>
</p>

<p>
	<u><strong>Về dự án “Tiệm giặt người Điếc Sài Gòn”</strong></u><br>
	Mục đích: Xây dựng mô hình kinh doanh tự chủ của người Điếc, lợi nhuận của Tiệm giặt người Điếc sẽ được dùng cho các lớp học kỹ năng sống, hỗ trợ người Điếc/khiếm thính hòa nhập xã hội.
</p>

<p>
	<u><strong>Về Sáng Group:</strong></u><br>
	Về SÁNG (Công ty CP nhượng quyền kinh doanh xã hội SÁNG Group): là một doanh nghiệp xã hội có trụ sở tại Hà Nội, tiền thân là nhóm SÁNG được thành lập từ tháng 4/2019 thực hiện dự án “Đào tạo kỹ năng cho người Điếc”. Thành viên sáng lập của nhóm là Lương Thị Kiều Thuý – một người khiếm thính, nhóm hoạt động với mục tiêu trao quyền cho những người Điếc/khiếm thính phát triển, hỗ trợ hòa nhập xã hội đồng thời giảm thiểu sự bất bình đẳng trong cuộc sống của người Điếc/khiếm thính nói riêng và người khuyết tật nói chung.
</p>

<p>
	<em><strong>Các dự án đã thực hiện của SÁNG:</strong></em>
</p>

<ul>
	<li aria-level="1">Nghiên cứu về tình trạng việc làm của người Điếc (2019)</li>
	<li aria-level="1">Dạy kỹ năng mềm cho người Điếc tại Hợp tác xã Vụn Art (2019)</li>
	<li aria-level="1">Dạy tiếng anh cho người Điếc/khiếm thính (2019)</li>
	<li aria-level="1">Tiệm giặt là của người Điếc (2020)</li>
	<li aria-level="1">Sáng kiến hoà nhập “Bánh Xe Vỗ Vai” (2021)</li>
</ul>

<p>
	<em><strong>Các giải thưởng đã đạt được của SÁNG:</strong></em>
</p>

<ul>
	<li aria-level="1">Cánh Én Vàng 2019 – Hội Liên Hiệp Phụ nữ Việt Nam trao tặng</li>
	<li aria-level="1">Best Performance (Youth co:lab) 2020 – Chương trình Phát triển Liên Hợp Quốc trao tặng</li>
	<li aria-level="1">Én Xanh xuất sắc 2021 – Trung tâm Hỗ trợ Sáng kiến Phục vụ Cộng đồng (CSIP) trao tặng</li>
	<li aria-level="1">Giải Nhì BGK bình chọn cho Mô hình tiếp cận cho người khuyết tật 2022 - Chương trình Phát triển Liên Hợp Quốc trao tặng.</li>
	<li aria-level="1">…</li>
</ul>

<p>
	<em><strong>Các tổ chức đã hợp tác tài trợ cho SÁNG:</strong></em>
</p>

<ul>
	<li aria-level="1">NICE Program – Mạng lưới Sáng kiến phát triển cộng đồng&nbsp;</li>
	<li aria-level="1">Abilis – Quỹ Phần Lan tại Việt Nam</li>
	<li aria-level="1">CSIP - Trung tâm Hỗ trợ Sáng kiến Phục vụ Cộng đồng</li>
	<li aria-level="1">UNDP - Chương trình Phát triển Liên Hợp Quốc</li>
	<li aria-level="1">...</li>
</ul>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-230109110937-638088593778096647.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230109111611-638088597713583110.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230109111620-638088597804290722.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-230109111629-638088597899324260.jpg
	',
    N'Cùng khởi sự cho mô hình tạo việc làm bền vững cho những người Điếc/Khiếm thính trong dự án “Tiệm giặt là của người Điếc” tại khu vực phía Nam',
    4295,
    43102996,
    250000000,
    20,
   '2023-01-08'
)
   

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    8,
    N'Trao điện thoại, đào tạo về chăm sóc trực tuyến, đào tạo kỹ năng số cho người khuyết tật và người chăm sóc tại Bình Định, Quảng Nam và Kon Tum
    ',
    N'Người Già, Người Khuyết Tật',
    N'
    <article class="soju__prose small"><p>
	Không được may mắn như những người khác, cuộc đời của những người khuyết tật (NKT) trải qua nhiều khó khăn và vất vả. Họ phải tự mình đối mặt và làm quen với mọi điều trong cuộc sống. Thế nhưng khi công nghệ ngày càng phát triển, mọi thông tin và kiến thức đều có thể sử dụng những thiết bị cầm tay như điện thoại di động để tra cứu thì thiệt thòi của NKT sẽ còn nhân lên nhiều lần hơn.&nbsp;
</p>

<p>
	<strong>Những khó khăn bất cập khi Người khuyết tật và Người chăm sóc không có thiết bị di động</strong>
</p>

<p>
	Cô Nguyễn Thị Thủy, NKT tại xã Hoài Thanh Tây, thị xã Hoài Nhơn, tỉnh Bình Định từng chia sẻ với chúng tôi: “Người khuyết tật như cô rất cần điện thoại để biết tra cứu lúc nào bão đến con à. Mấy ngày nay cô không biết thông tin nên khổ lắm, cô muốn biết lúc mưa gió, nơi nào giúp được cô không, với lại gọi người giúp đỡ nữa. Cô tự chăm sóc mình chứ không có ai chăm sóc cả, nên nếu có điện thoại, cô cũng có thể xem tập huấn chăm sóc ở nhà vì cô không tự đi được, rồi có gì có thể theo dõi thông tin từ trạm y tế, hiểu hơn, biết hơn về bệnh tật mình đang gặp phải. Cô đi đứng không được, nhiều khi gọi anh em qua giúp nhưng không có hình ảnh để họ hiểu tình trạng đang ra sao. Cô cũng đang nhận làm nhựa cho nhà máy, đang kết nối mấy người khuyết tật để cùng làm đây. Cô nghĩ điện thoại sẽ giúp cô nhiều lắm.”&nbsp;
</p>

<p>
	Không chỉ có cô Thủy, những người chăm sóc (NCS) người khuyết tật cũng gặp nhiều khó khăn khi không có thiết bị để tra cứu thông tin khi cần thiết. Cô Nguyễn Thị Nguyệt NCS của chú Huỳnh Bời, NKT tại xã Hoài Hảo cho biết: “Giá như gia đình cô có phương tiện để tìm hiểu, tìm kiếm trợ giúp về y tế, rồi tra cứu, tìm kiếm những thông tin, kiến thức về chăm sóc mọi thời điểm cần thiết. Đối với cô, đây là nhu cầu thiết thực, cần thiết vô cùng. Có hướng dẫn thì những lúc đau ốm mới biết xử lý sao. Rồi nhiều khi có bệnh tình, bối rối không biết có thể mô tả, chỉ lại cho mọi người sao, không biết ghi lại ở đâu để xem.”
</p>

<p>
	<strong>Chung tay thay đổi cuộc đời của nhiều Người khuyết tật tại Bình Định, Quảng Nam và Kon Tum</strong>
</p>

<p>
	Cô Thủy, cô Nguyệt là hai trong số nhiều NKT và NCS đã bày tỏ với Dự án “Hãy nắm tay tôi” nguyện vọng được có một thiết bị kết nối, lưu trữ hình ảnh và xem được hướng dẫn về chăm sóc tại nhà, để giúp họ xóa bỏ rào cản về khả năng đi lại trong việc học hỏi về chăm sóc và tìm kiếm kết nối xã hội, y tế. Đây là những chức năng mà một chiếc điện thoại thông minh có thể mang lại. Điện thoại thông minh – một thiết bị tưởng như không thể thiếu trong cuộc sống của mỗi người hiện nay, lại là ước mơ của những người khuyết tật tại các vùng quê ở Bình Định, Quảng Nam và Kon Tum – các tỉnh bị ảnh hưởng nặng bởi chất độc màu da cam.
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221122203238-638047459588990572.jpg" style="width:100%">
	<em>Ước mơ của nhiều Người khuyết tật là có chiếc điện thoại thông minh để tiếp cận với nhiều thông tin hơn</em>
</p>

<p>
	Trên thực tế, không chỉ cải thiện đáng kể về chăm sóc, nhiều trường hợp cuộc sống và sinh kế của NKT đã được cải thiện đáng kể nhờ việc có điện thoại thông minh và Internet. Có những trường hợp tiêu biểu như anh Nguyễn Chánh Tín tại Hoài Nhơn - Bình Định, chàng trai khuyết tật từ việc nằm liệt giường đến trở thành trụ cột kinh tế của gia đình và nguồn cảm hứng của hàng triệu người nhờ kinh doanh và chia sẻ câu chuyện của chính mình trên Internet. Anh Tín từng nói: “Tôi đã giam thân xác của mình trong bốn bức tường suốt 10 năm qua, nhưng tôi chưa hề giam tâm hồn, tinh thần. Tôi hướng ra thế giới bên ngoài bằng internet. Tôi kết nối với mọi người bằng Facebook, Zalo. Đối với tôi đằng sau mỗi rào cản của cuộc đời là mỗi một cách giải quyết thú vị”. Ở vùng địa bàn dự án, do ảnh hưởng thường xuyên của bão lũ, các thiết bị thông minh sẽ giúp người khuyết tật có thể chủ động tiếp cận thông tin phòng chống thiên tai, bão lũ, tránh được rất nhiều trường hợp đáng tiếc xảy ra, cũng như có thể tìm kiếm sự trợ giúp khi gặp khó khăn, khi cần hỗ trợ về y tế. Người không khuyết tật cần điện thoại một, người khuyết tật còn cần điện thoại gấp 10, 100 lần như thế.
</p>

<p>
	<strong>Chung tay hỗ trợ người khuyết tật có một cơ hội tiếp cận với đào tạo - tìm kiếm thông tin về chăm sóc, tìm kiếm trợ giúp về y tế và kết nối xã hội</strong>
</p>

<p>
	Tại Việt Nam, khoảng 6.2 triệu người trên hai tuổi sống với khuyết tật, trong đó 28,3% là trẻ em và gần 29% là người khuyết tật nặng và đặc biệt nặng. Người khuyết tật phải đối mặt với những thách thức như khó khăn trong tiếp cận y tế cơ bản và hạn chế trong kỹ năng chăm sóc bản thân. Đã có những quan sát và ghi nhận về chăm sóc không đạt tiêu chuẩn, chất lượng thấp, các hành vi không phù hợp hoặc lạm dụng. Các hậu quả hoặc biến chứng về sức khỏe như tai nạn, ngã, và đôi khi là các vụ tự tử đã được báo cáo.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221209110615-638061807759949568.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Phát dụng cụ trợ giúp cho NKT tại Hoài Nhơn - Bình Định</em>
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221209110642-638061808022078024.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Đào tạo cho NCS tại Hoài Nhơn - Bình Định</em>
</p>

<p>
	Dự án “Hãy nắm tay tôi” với mục tiêu chính là cải thiện cuộc sống NKT và NCS thông qua cải thiện về chăm sóc và kết nối xã hội cho NKT đã hỗ trợ cho 2600 NKT nặng ở các tỉnh bị ảnh hưởng bởi chất độc màu da cam (Bình Định, Quảng Nam, Kon Tum). Dự án xây dựng nền tảng đào tạo trực tuyến cho chăm sóc tại nhà (CSTN) và thực hành kết nối xã hội. Với nền tảng trực tuyến, nhiều NCS sẽ có cơ hội tiếp cận với đào tạo về chăm sóc hơn, xóa đi rào cản từ khả năng đi lại. Đồng thời, dự án cũng xây dựng hệ thống cộng tác viên chăm sóc tại nhà.&nbsp;
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221122203328-638047460082983488.jpg" style="width:100%">
	<em>Cùng dự án “Hãy nắm tay tôi” trao tặng điện thoại thông tin cho NKT và NCS tại Bình Định, Quảng Nam và Kon Tum</em>
</p>

<p>
	Tuy nhiên, đa số NKT và NCS đều thuộc diện kinh tế nghèo hoặc cận nghèo và rào cản về đi lại khiến họ không thể tham gia đào tạo về chăm sóc trực tiếp lẫn trực tuyến, cũng như gặp khó khăn trong việc kết nối với người chăm sóc và những người có thể giúp đỡ khi cần. Để mang đến cơ hội thay đổi cuộc sống cho NKT, dự án “Hãy nắm tay tôi” đưa ra chương trình trao tặng điện thoại thông minh cho khoảng 750 NKT và NCS tại Bình Định, Quảng Nam và Kon Tum. Dự án đã lựa chọn mẫu điện thoại với giá thành hợp lý nhất (khoảng hơn 2 triệu đồng/chiếc). Sau khi NKT và NCS được nhận điện thoại, dự án sẽ hỗ trợ kinh phí viễn thông và đào tạo 4 kỹ năng số cần thiết theo bộ tiêu chuẩn của UNESCO để đảm bảo NKT và NCS tận dụng được mọi chức năng của điện thoại thông minh để thay đổi cuộc sống. Ngoài ra, NKT sẽ được hỗ trợ cải thiện sinh kế và sống độc lập.&nbsp;
</p>

<p>
	Để làm được điều này, dự án mong muốn có thể gây quỹ thêm 125.000.000 đồng thông qua Trái Tim MoMo. Vì vậy, dự án mong muốn nhận được sự hỗ trợ từ các doanh nghiệp, cá nhân, thông qua việc ủng hộ kinh phí tài trợ thiết bị điện thoại thông minh với chức năng cơ bản cho người chăm sóc hoặc người khuyết tật.&nbsp;
</p>

<p>
	Dựa trên kinh nghiệm, dự án cam kết sử dụng tất cả kinh phí quyên góp cho việc mua thiết bị điện thoại, trao điện thoại. Tất cả điện thoại đã được trao tặng sẽ được công khai, minh bạch với mã số cụ thể và có thể tra cứu, mọi hoạt động của dự án sẽ được cập nhật cụ thể trên website. Thông tin người nhận cũng sẽ được công khai dưới sự đồng ý của mỗi người nhận cụ thể.
</p>

<p>
	<u><strong>Về Dự án “Hãy nắm tay tôi”</strong></u><br>
	Dự án Hãy nắm tay tôi (HMH), do Viện Dân số, Sức khỏe và Phát triển (PHAD) phối hợp với Sở Y tế Bình Định triển khai thực hiện đã phát triển một mô hình chăm sóc toàn diện nhằm giải quyết các nhu cầu về sức khỏe, dinh dưỡng, bảo vệ và hỗ trợ NKT, phát triển các kỹ năng sống độc lập của NKT bằng cách cải thiện khả năng tiếp cận nhà ở và thay đổi thái độ của gia đình đối với NKT với gần 3.500 người hưởng lợi. Từ năm 2019, HMH đã cung cấp dịch vụ chăm sóc cho hàng trăm NKT và đã góp phần đáng kể vào việc giảm bớt gánh nặng chăm sóc của các thành viên trong gia đình bằng cách nâng cao kỹ năng chăm sóc, từ đó cải thiện tác động và giảm giờ chăm sóc. HMH đã tạo lập được một nguồn lực người chăm sóc tại cộng đồng và các đơn vị nhà nước trong tỉnh, phát triển một chương trình đào tạo các kỹ năng chăm sóc tiêu chuẩn hiện đang được tiếp tục áp dụng tại các Dự án hỗ trợ NKT; và tiếp cận được gần hơn 2.500 NKT nặng tại các cơ sở cung cấp dịch vụ PHCN tại tỉnh Bình Định.
</p>

<p>
	Tiếp nối những kết quả và thành tích đạt được từ HMH trong giai đoạn I, dự án HMH giai đoạn II (HMH-II) tiếp tục mở rộng với mục tiêu cải thiện chất lượng cuộc sống cho NKT ở các tỉnh bị ảnh hưởng bởi chất độc màu da cam. Dự án HMH-II hướng tới cải thiện chất lượng cuộc sống của người khuyết tật thông qua việc tăng cường chăm sóc và trợ giúp xã hội cho NKT nặng tại các tỉnh Bình Định, Kon Tum và Quảng Nam. Dự án HMH-II sẽ phát triển lực lượng lao động bền vững cho các dịch vụ chăm sóc và hỗ trợ xã hội, nâng cao chất lượng dịch vụ chăm sóc, trợ giúp xã hội và cung cấp thiết bị trợ giúp cho NKT nặng, phát triển các mô hình tài trợ cho các dịch vụ chăm sóc để đa dạng hóa nguồn cung cấp cho các hệ thống chăm sóc, và tăng cường quản lý dịch vụ chăm sóc và trợ giúp xã hội bằng cách tiêu chuẩn hóa các gói đào tạo chăm sóc và các công cụ ICT.
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-221122203035-638047458356315738.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221122203843-638047463237522823.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221209110737-638061808578958931.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221209110747-638061808679992484.jpg
	',
    N'Cùng chung tay quyên góp kinh phí tài trợ điện thoại thông minh để thay đổi cuộc sống người khuyết tật và người chăm sóc tại Bình Định, Quảng Nam và Kon Tum, giúp người khuyết tật được chăm sóc tốt hơn, được kết nối, giảm gánh nặng cho người chăm sóc.',
    53191,
    125008130,
    125000000,
    0,
   '2022-11-21'
)
   
 
 
 

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    8,
    N'Trao điện thoại, đào tạo về chăm sóc trực tuyến, đào tạo kỹ năng số cho người khuyết tật và người chăm sóc tại Bình Định, Quảng Nam và Kon Tum
    ',
    N'Người Già, Người Khuyết Tật',
    N'
    <article class="soju__prose small"><p>
	Không được may mắn như những người khác, cuộc đời của những người khuyết tật (NKT) trải qua nhiều khó khăn và vất vả. Họ phải tự mình đối mặt và làm quen với mọi điều trong cuộc sống. Thế nhưng khi công nghệ ngày càng phát triển, mọi thông tin và kiến thức đều có thể sử dụng những thiết bị cầm tay như điện thoại di động để tra cứu thì thiệt thòi của NKT sẽ còn nhân lên nhiều lần hơn.&nbsp;
</p>

<p>
	<strong>Những khó khăn bất cập khi Người khuyết tật và Người chăm sóc không có thiết bị di động</strong>
</p>

<p>
	Cô Nguyễn Thị Thủy, NKT tại xã Hoài Thanh Tây, thị xã Hoài Nhơn, tỉnh Bình Định từng chia sẻ với chúng tôi: “Người khuyết tật như cô rất cần điện thoại để biết tra cứu lúc nào bão đến con à. Mấy ngày nay cô không biết thông tin nên khổ lắm, cô muốn biết lúc mưa gió, nơi nào giúp được cô không, với lại gọi người giúp đỡ nữa. Cô tự chăm sóc mình chứ không có ai chăm sóc cả, nên nếu có điện thoại, cô cũng có thể xem tập huấn chăm sóc ở nhà vì cô không tự đi được, rồi có gì có thể theo dõi thông tin từ trạm y tế, hiểu hơn, biết hơn về bệnh tật mình đang gặp phải. Cô đi đứng không được, nhiều khi gọi anh em qua giúp nhưng không có hình ảnh để họ hiểu tình trạng đang ra sao. Cô cũng đang nhận làm nhựa cho nhà máy, đang kết nối mấy người khuyết tật để cùng làm đây. Cô nghĩ điện thoại sẽ giúp cô nhiều lắm.”&nbsp;
</p>

<p>
	Không chỉ có cô Thủy, những người chăm sóc (NCS) người khuyết tật cũng gặp nhiều khó khăn khi không có thiết bị để tra cứu thông tin khi cần thiết. Cô Nguyễn Thị Nguyệt NCS của chú Huỳnh Bời, NKT tại xã Hoài Hảo cho biết: “Giá như gia đình cô có phương tiện để tìm hiểu, tìm kiếm trợ giúp về y tế, rồi tra cứu, tìm kiếm những thông tin, kiến thức về chăm sóc mọi thời điểm cần thiết. Đối với cô, đây là nhu cầu thiết thực, cần thiết vô cùng. Có hướng dẫn thì những lúc đau ốm mới biết xử lý sao. Rồi nhiều khi có bệnh tình, bối rối không biết có thể mô tả, chỉ lại cho mọi người sao, không biết ghi lại ở đâu để xem.”
</p>

<p>
	<strong>Chung tay thay đổi cuộc đời của nhiều Người khuyết tật tại Bình Định, Quảng Nam và Kon Tum</strong>
</p>

<p>
	Cô Thủy, cô Nguyệt là hai trong số nhiều NKT và NCS đã bày tỏ với Dự án “Hãy nắm tay tôi” nguyện vọng được có một thiết bị kết nối, lưu trữ hình ảnh và xem được hướng dẫn về chăm sóc tại nhà, để giúp họ xóa bỏ rào cản về khả năng đi lại trong việc học hỏi về chăm sóc và tìm kiếm kết nối xã hội, y tế. Đây là những chức năng mà một chiếc điện thoại thông minh có thể mang lại. Điện thoại thông minh – một thiết bị tưởng như không thể thiếu trong cuộc sống của mỗi người hiện nay, lại là ước mơ của những người khuyết tật tại các vùng quê ở Bình Định, Quảng Nam và Kon Tum – các tỉnh bị ảnh hưởng nặng bởi chất độc màu da cam.
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221122203238-638047459588990572.jpg" style="width:100%">
	<em>Ước mơ của nhiều Người khuyết tật là có chiếc điện thoại thông minh để tiếp cận với nhiều thông tin hơn</em>
</p>

<p>
	Trên thực tế, không chỉ cải thiện đáng kể về chăm sóc, nhiều trường hợp cuộc sống và sinh kế của NKT đã được cải thiện đáng kể nhờ việc có điện thoại thông minh và Internet. Có những trường hợp tiêu biểu như anh Nguyễn Chánh Tín tại Hoài Nhơn - Bình Định, chàng trai khuyết tật từ việc nằm liệt giường đến trở thành trụ cột kinh tế của gia đình và nguồn cảm hứng của hàng triệu người nhờ kinh doanh và chia sẻ câu chuyện của chính mình trên Internet. Anh Tín từng nói: “Tôi đã giam thân xác của mình trong bốn bức tường suốt 10 năm qua, nhưng tôi chưa hề giam tâm hồn, tinh thần. Tôi hướng ra thế giới bên ngoài bằng internet. Tôi kết nối với mọi người bằng Facebook, Zalo. Đối với tôi đằng sau mỗi rào cản của cuộc đời là mỗi một cách giải quyết thú vị”. Ở vùng địa bàn dự án, do ảnh hưởng thường xuyên của bão lũ, các thiết bị thông minh sẽ giúp người khuyết tật có thể chủ động tiếp cận thông tin phòng chống thiên tai, bão lũ, tránh được rất nhiều trường hợp đáng tiếc xảy ra, cũng như có thể tìm kiếm sự trợ giúp khi gặp khó khăn, khi cần hỗ trợ về y tế. Người không khuyết tật cần điện thoại một, người khuyết tật còn cần điện thoại gấp 10, 100 lần như thế.
</p>

<p>
	<strong>Chung tay hỗ trợ người khuyết tật có một cơ hội tiếp cận với đào tạo - tìm kiếm thông tin về chăm sóc, tìm kiếm trợ giúp về y tế và kết nối xã hội</strong>
</p>

<p>
	Tại Việt Nam, khoảng 6.2 triệu người trên hai tuổi sống với khuyết tật, trong đó 28,3% là trẻ em và gần 29% là người khuyết tật nặng và đặc biệt nặng. Người khuyết tật phải đối mặt với những thách thức như khó khăn trong tiếp cận y tế cơ bản và hạn chế trong kỹ năng chăm sóc bản thân. Đã có những quan sát và ghi nhận về chăm sóc không đạt tiêu chuẩn, chất lượng thấp, các hành vi không phù hợp hoặc lạm dụng. Các hậu quả hoặc biến chứng về sức khỏe như tai nạn, ngã, và đôi khi là các vụ tự tử đã được báo cáo.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221209110615-638061807759949568.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Phát dụng cụ trợ giúp cho NKT tại Hoài Nhơn - Bình Định</em>
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221209110642-638061808022078024.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Đào tạo cho NCS tại Hoài Nhơn - Bình Định</em>
</p>

<p>
	Dự án “Hãy nắm tay tôi” với mục tiêu chính là cải thiện cuộc sống NKT và NCS thông qua cải thiện về chăm sóc và kết nối xã hội cho NKT đã hỗ trợ cho 2600 NKT nặng ở các tỉnh bị ảnh hưởng bởi chất độc màu da cam (Bình Định, Quảng Nam, Kon Tum). Dự án xây dựng nền tảng đào tạo trực tuyến cho chăm sóc tại nhà (CSTN) và thực hành kết nối xã hội. Với nền tảng trực tuyến, nhiều NCS sẽ có cơ hội tiếp cận với đào tạo về chăm sóc hơn, xóa đi rào cản từ khả năng đi lại. Đồng thời, dự án cũng xây dựng hệ thống cộng tác viên chăm sóc tại nhà.&nbsp;
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221122203328-638047460082983488.jpg" style="width:100%">
	<em>Cùng dự án “Hãy nắm tay tôi” trao tặng điện thoại thông tin cho NKT và NCS tại Bình Định, Quảng Nam và Kon Tum</em>
</p>

<p>
	Tuy nhiên, đa số NKT và NCS đều thuộc diện kinh tế nghèo hoặc cận nghèo và rào cản về đi lại khiến họ không thể tham gia đào tạo về chăm sóc trực tiếp lẫn trực tuyến, cũng như gặp khó khăn trong việc kết nối với người chăm sóc và những người có thể giúp đỡ khi cần. Để mang đến cơ hội thay đổi cuộc sống cho NKT, dự án “Hãy nắm tay tôi” đưa ra chương trình trao tặng điện thoại thông minh cho khoảng 750 NKT và NCS tại Bình Định, Quảng Nam và Kon Tum. Dự án đã lựa chọn mẫu điện thoại với giá thành hợp lý nhất (khoảng hơn 2 triệu đồng/chiếc). Sau khi NKT và NCS được nhận điện thoại, dự án sẽ hỗ trợ kinh phí viễn thông và đào tạo 4 kỹ năng số cần thiết theo bộ tiêu chuẩn của UNESCO để đảm bảo NKT và NCS tận dụng được mọi chức năng của điện thoại thông minh để thay đổi cuộc sống. Ngoài ra, NKT sẽ được hỗ trợ cải thiện sinh kế và sống độc lập.&nbsp;
</p>

<p>
	Để làm được điều này, dự án mong muốn có thể gây quỹ thêm 125.000.000 đồng thông qua Trái Tim MoMo. Vì vậy, dự án mong muốn nhận được sự hỗ trợ từ các doanh nghiệp, cá nhân, thông qua việc ủng hộ kinh phí tài trợ thiết bị điện thoại thông minh với chức năng cơ bản cho người chăm sóc hoặc người khuyết tật.&nbsp;
</p>

<p>
	Dựa trên kinh nghiệm, dự án cam kết sử dụng tất cả kinh phí quyên góp cho việc mua thiết bị điện thoại, trao điện thoại. Tất cả điện thoại đã được trao tặng sẽ được công khai, minh bạch với mã số cụ thể và có thể tra cứu, mọi hoạt động của dự án sẽ được cập nhật cụ thể trên website. Thông tin người nhận cũng sẽ được công khai dưới sự đồng ý của mỗi người nhận cụ thể.
</p>

<p>
	<u><strong>Về Dự án “Hãy nắm tay tôi”</strong></u><br>
	Dự án Hãy nắm tay tôi (HMH), do Viện Dân số, Sức khỏe và Phát triển (PHAD) phối hợp với Sở Y tế Bình Định triển khai thực hiện đã phát triển một mô hình chăm sóc toàn diện nhằm giải quyết các nhu cầu về sức khỏe, dinh dưỡng, bảo vệ và hỗ trợ NKT, phát triển các kỹ năng sống độc lập của NKT bằng cách cải thiện khả năng tiếp cận nhà ở và thay đổi thái độ của gia đình đối với NKT với gần 3.500 người hưởng lợi. Từ năm 2019, HMH đã cung cấp dịch vụ chăm sóc cho hàng trăm NKT và đã góp phần đáng kể vào việc giảm bớt gánh nặng chăm sóc của các thành viên trong gia đình bằng cách nâng cao kỹ năng chăm sóc, từ đó cải thiện tác động và giảm giờ chăm sóc. HMH đã tạo lập được một nguồn lực người chăm sóc tại cộng đồng và các đơn vị nhà nước trong tỉnh, phát triển một chương trình đào tạo các kỹ năng chăm sóc tiêu chuẩn hiện đang được tiếp tục áp dụng tại các Dự án hỗ trợ NKT; và tiếp cận được gần hơn 2.500 NKT nặng tại các cơ sở cung cấp dịch vụ PHCN tại tỉnh Bình Định.
</p>

<p>
	Tiếp nối những kết quả và thành tích đạt được từ HMH trong giai đoạn I, dự án HMH giai đoạn II (HMH-II) tiếp tục mở rộng với mục tiêu cải thiện chất lượng cuộc sống cho NKT ở các tỉnh bị ảnh hưởng bởi chất độc màu da cam. Dự án HMH-II hướng tới cải thiện chất lượng cuộc sống của người khuyết tật thông qua việc tăng cường chăm sóc và trợ giúp xã hội cho NKT nặng tại các tỉnh Bình Định, Kon Tum và Quảng Nam. Dự án HMH-II sẽ phát triển lực lượng lao động bền vững cho các dịch vụ chăm sóc và hỗ trợ xã hội, nâng cao chất lượng dịch vụ chăm sóc, trợ giúp xã hội và cung cấp thiết bị trợ giúp cho NKT nặng, phát triển các mô hình tài trợ cho các dịch vụ chăm sóc để đa dạng hóa nguồn cung cấp cho các hệ thống chăm sóc, và tăng cường quản lý dịch vụ chăm sóc và trợ giúp xã hội bằng cách tiêu chuẩn hóa các gói đào tạo chăm sóc và các công cụ ICT.
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-221122203035-638047458356315738.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221122203843-638047463237522823.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221209110737-638061808578958931.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221209110747-638061808679992484.jpg
	',
    N'Cùng chung tay quyên góp kinh phí tài trợ điện thoại thông minh để thay đổi cuộc sống người khuyết tật và người chăm sóc tại Bình Định, Quảng Nam và Kon Tum, giúp người khuyết tật được chăm sóc tốt hơn, được kết nối, giảm gánh nặng cho người chăm sóc.',
    53191,
    125008130,
    125000000,
    0,
   '2022-11-21'
)
  


INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    9,
    N'“Giữ nhà” cho Voọc Chà Vá chân xám tại Tam Mỹ Tây, Núi Thành, Quảng Nam
    ',
    N'Đầu Tư Cơ Sở Vật Chất',
    N'
    <article class="soju__prose small"><p>
	Về Tam Mỹ Tây, Núi Thành, Quảng Nam, người ta không chỉ bị thu hút bởi thiên nhiên hữu tình mà còn bị “giữ chân” bởi câu chuyện giữ nhà cho Voọc của cộng đồng nơi đây. Với tất cả tình yêu như những người thân trong gia đình, họ đã canh giữ từng mảnh rừng để Voọc sinh sống, họ hiểu về tập tính, vùng sống và đặc điểm của từng gia đình Voọc ở cả 4 khu vực núi. Để từ đó mỗi khi có một du khách phương xa nào ghé thăm họ lại say sưa kể chuyện nhà Vọọc cũng như nhiệt tình dắt đi thăm nơi ở của chúng.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221208104602-638060931627324047.jpg" style="width:100%">
</p>

<p>
	Chưa dừng lại ở đó, câu chuyện giữ nhà cho Voọc còn được tô điểm bởi các cuộc hành trình ly kỳ của những người thực hiện công tác bảo tồn. Từ chuyện chiếc xe mất thắng (phanh) lao dốc trên đường tác nghiệp của anh cán bộ, đến chuyện cô nghiên cứu sinh trẻ tuổi với niềm đam mê nghiên cứu bị sảy chân trong chuyến đi Hòn Ông khảo sát Voọc, hay chuyện về con chiến mã thân thương không quản ngại gian khó cùng thành viên tổ tuần tra hoàn thành tốt các nhiệm vụ được giao. Bạn biết không, đối với nhiều cán bộ làm công tác bảo tồn thì hành trang cho chuyến đi là một gói cơm trắng cùng vài con cá kho mặn được gói ghém cẩn thận trong chiếc ba lô nhỏ. Chỉ thế đó bao năm nay họ vẫn tiếp tục đi tiếp chặng đường bảo vệ đàn con thơ giữa rừng già được bình yên.
</p>
<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221208104620-638060931804052357.jpg" style="width:100%">
<br>
&nbsp;
<p>
	Hành trình bảo tồn 69 cá thể Voọc chà vá chân xám ở Tam Mỹ Tây sẽ là một một cuộc hành trình dài, đầy cam go chính vì thế cần hơn nữa sự chung tay góp sức của cả cộng đồng để cùng mở rộng 30ha rừng tự nhiên làm NHÀ cho Voọc thông qua Chiến dịch gây quỹ “Vì một Việt Nam xanh”. Sự ủng hộ của các bạn là động lực thúc đẩy chiến dịch đi đến điểm đích nhanh hơn.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221208104648-638060932084626678.jpg" style="width:100%">
</p>

<p>
	Chiến dịch gây quỹ "Vì một Việt Nam Xanh", thuộc khuôn khổ dự án Quỹ Bảo tồn do GreenViet và GSI phối hợp thực hiện và Phái đoàn Liên minh châu&nbsp; u tại Việt Nam đồng tài trợ. Chiến dịch gây quỹ "Vì một Việt Nam Xanh" với mục tiêu gây quỹ 100.000.000 đồng. Với mục đích nhằm mở rộng 30ha diện tích rừng làm nơi ở cho quần thể Voọc Chà Vá Chân Xám tại xã Tam Mỹ Tây; trồng thêm 20.000 cây xanh tại các thành phố lớn nhằm hướng đến mục tiêu trong chương trình “Một triệu cây xanh đô thị - MTIC” và mang đến hành trình giáo dục trải nghiệm thiên nhiên Sơn Trà miễn phí cho 1.000 trẻ em yếu thế.&nbsp;
</p>

<p>
	<u><strong>Thông tin giới thiệu ngắn gọn về tổ chức Quỹ &amp; Nhà tài trợ:</strong></u><br>
	<strong>Tổ chức:</strong><br>
	GreenViet tên đầy đủ là Trung tâm Bảo tồn Đa dạng sinh học Nước Việt Xanh, thành lập vào năm 2012. Trung tâm hoạt động trong lĩnh vực Bảo tồn đa dạng sinh học tại&nbsp; khu vực miền Trung - Tây Nguyên. Theo đó, GreenViet với tầm nhìn dài hạn: Cộng đồng Người Việt chủ động tham gia bảo tồn đa dạng sinh học Việt Nam.
</p>

<p>
	<strong>Nhà tài trợ:</strong>&nbsp;<br>
	Dự án "Huy động nguồn tài chính cho các hoạt động bảo tồn đa dạng sinh học và bảo vệ môi trường bền vững tại thành phố Đà Nẵng, Việt Nam" – Gọi tắt là Dự án Quỹ Bảo tồn nhằm thiết lập một nguồn Quỹ bền vững để tài trợ cho các tổ chức xã hội địa phương (CSO) hoạt động trong lĩnh vực bảo tồn đa dạng sinh học và bảo vệ môi trường bền vững tại miền Trung và Tây Nguyên. Dự án được thực hiện chính bởi Trung tâm Bảo tồn Đa dạng Sinh học Nước Việt Xanh và viện Gustav-Stresemann-Institut e.V. (GSI), Đức thực hiện và Phái đoàn Liên minh Châu Âu tại Việt Nam đồng tài trợ.
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-221208104509-638060931095470412.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221208105004-638060934040174122.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221208105010-638060934103499747.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221208105021-638060934211155144.jpg
	',
    N'Cùng chung tay mở rộng 30 ha rừng tự nhiên làm nhà ở cho 69 cá thể Voọc Chà vá chân xám tại Tam Mỹ Tây đang bị chia cắt nơi ở, thiếu thức ăn, suy thoái nguồn gen do giao phối cận huyết và cả tác động từ con người.',
    71,
    1164267,
    100000000,
    54,
   '2022-12-07'
)
 
 

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) values (

    9,
    N'“Giữ nhà” cho Voọc Chà Vá chân xám tại Tam Mỹ Tây, Núi Thành, Quảng Nam
    ',
    N'Đầu Tư Cơ Sở Vật Chất',
    N'
    <article class="soju__prose small"><p>
	Về Tam Mỹ Tây, Núi Thành, Quảng Nam, người ta không chỉ bị thu hút bởi thiên nhiên hữu tình mà còn bị “giữ chân” bởi câu chuyện giữ nhà cho Voọc của cộng đồng nơi đây. Với tất cả tình yêu như những người thân trong gia đình, họ đã canh giữ từng mảnh rừng để Voọc sinh sống, họ hiểu về tập tính, vùng sống và đặc điểm của từng gia đình Voọc ở cả 4 khu vực núi. Để từ đó mỗi khi có một du khách phương xa nào ghé thăm họ lại say sưa kể chuyện nhà Vọọc cũng như nhiệt tình dắt đi thăm nơi ở của chúng.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221208104602-638060931627324047.jpg" style="width:100%">
</p>

<p>
	Chưa dừng lại ở đó, câu chuyện giữ nhà cho Voọc còn được tô điểm bởi các cuộc hành trình ly kỳ của những người thực hiện công tác bảo tồn. Từ chuyện chiếc xe mất thắng (phanh) lao dốc trên đường tác nghiệp của anh cán bộ, đến chuyện cô nghiên cứu sinh trẻ tuổi với niềm đam mê nghiên cứu bị sảy chân trong chuyến đi Hòn Ông khảo sát Voọc, hay chuyện về con chiến mã thân thương không quản ngại gian khó cùng thành viên tổ tuần tra hoàn thành tốt các nhiệm vụ được giao. Bạn biết không, đối với nhiều cán bộ làm công tác bảo tồn thì hành trang cho chuyến đi là một gói cơm trắng cùng vài con cá kho mặn được gói ghém cẩn thận trong chiếc ba lô nhỏ. Chỉ thế đó bao năm nay họ vẫn tiếp tục đi tiếp chặng đường bảo vệ đàn con thơ giữa rừng già được bình yên.
</p>
<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221208104620-638060931804052357.jpg" style="width:100%">
<br>
&nbsp;
<p>
	Hành trình bảo tồn 69 cá thể Voọc chà vá chân xám ở Tam Mỹ Tây sẽ là một một cuộc hành trình dài, đầy cam go chính vì thế cần hơn nữa sự chung tay góp sức của cả cộng đồng để cùng mở rộng 30ha rừng tự nhiên làm NHÀ cho Voọc thông qua Chiến dịch gây quỹ “Vì một Việt Nam xanh”. Sự ủng hộ của các bạn là động lực thúc đẩy chiến dịch đi đến điểm đích nhanh hơn.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221208104648-638060932084626678.jpg" style="width:100%">
</p>

<p>
	Chiến dịch gây quỹ "Vì một Việt Nam Xanh", thuộc khuôn khổ dự án Quỹ Bảo tồn do GreenViet và GSI phối hợp thực hiện và Phái đoàn Liên minh châu&nbsp; u tại Việt Nam đồng tài trợ. Chiến dịch gây quỹ "Vì một Việt Nam Xanh" với mục tiêu gây quỹ 100.000.000 đồng. Với mục đích nhằm mở rộng 30ha diện tích rừng làm nơi ở cho quần thể Voọc Chà Vá Chân Xám tại xã Tam Mỹ Tây; trồng thêm 20.000 cây xanh tại các thành phố lớn nhằm hướng đến mục tiêu trong chương trình “Một triệu cây xanh đô thị - MTIC” và mang đến hành trình giáo dục trải nghiệm thiên nhiên Sơn Trà miễn phí cho 1.000 trẻ em yếu thế.&nbsp;
</p>

<p>
	<u><strong>Thông tin giới thiệu ngắn gọn về tổ chức Quỹ &amp; Nhà tài trợ:</strong></u><br>
	<strong>Tổ chức:</strong><br>
	GreenViet tên đầy đủ là Trung tâm Bảo tồn Đa dạng sinh học Nước Việt Xanh, thành lập vào năm 2012. Trung tâm hoạt động trong lĩnh vực Bảo tồn đa dạng sinh học tại&nbsp; khu vực miền Trung - Tây Nguyên. Theo đó, GreenViet với tầm nhìn dài hạn: Cộng đồng Người Việt chủ động tham gia bảo tồn đa dạng sinh học Việt Nam.
</p>

<p>
	<strong>Nhà tài trợ:</strong>&nbsp;<br>
	Dự án "Huy động nguồn tài chính cho các hoạt động bảo tồn đa dạng sinh học và bảo vệ môi trường bền vững tại thành phố Đà Nẵng, Việt Nam" – Gọi tắt là Dự án Quỹ Bảo tồn nhằm thiết lập một nguồn Quỹ bền vững để tài trợ cho các tổ chức xã hội địa phương (CSO) hoạt động trong lĩnh vực bảo tồn đa dạng sinh học và bảo vệ môi trường bền vững tại miền Trung và Tây Nguyên. Dự án được thực hiện chính bởi Trung tâm Bảo tồn Đa dạng Sinh học Nước Việt Xanh và viện Gustav-Stresemann-Institut e.V. (GSI), Đức thực hiện và Phái đoàn Liên minh Châu Âu tại Việt Nam đồng tài trợ.
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-221208104509-638060931095470412.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221208105004-638060934040174122.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221208105010-638060934103499747.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221208105021-638060934211155144.jpg
	',
    N'Cùng chung tay mở rộng 30 ha rừng tự nhiên làm nhà ở cho 69 cá thể Voọc Chà vá chân xám tại Tam Mỹ Tây đang bị chia cắt nơi ở, thiếu thức ăn, suy thoái nguồn gen do giao phối cận huyết và cả tác động từ con người.',
    71,
    1164267,
    100000000,
    54,
   '2022-12-07'
)

 

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) 
values (

    9,
    N'Chung tay gây quỹ trồng 20.000 cây xanh đô thị chống biến đổi khí hậu và hạn chế ô nhiễm môi trường
    ',
    N'Đầu Tư Cơ Sở Vật Chất',
    N'
    <article class="soju__prose small"><p>
	Chương trình “Một triệu cây xanh Đô thị” (MTIC) ra đời từ thực trạng thiếu diện tích che phủ cây xanh trong 3 đô thị lớn ở Việt Nam là Hà Nội, Đà Nẵng và thành phố Hồ Chí Minh, kéo theo đó là những hệ quả tác động đến môi trường, xã hội, sức khỏe và chất lượng sống của con người. Chương trình được thực hiện trong thời gian 10 năm (từ 2020 đến 2030), đặt ra mục tiêu trồng một triệu cây xanh đô thị trên toàn quốc, trong đó Đà Nẵng, Hà Nội và TP. Hồ Chí Minh là các thành phố trọng điểm.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221208103915-638060927559388117.jpg" style="width:100%">
</p>

<p>
	Trung tâm bảo tồn đa dạng sinh học Nước Việt Xanh (GreenViet) kêu gọi cộng đồng chung tay trồng 20.000 cây xanh đô thị, hướng đến tăng mật độ cây xanh tại các công viên, trường học, ký túc xá, đường giao thông…của các thành phố lớn. Sự đóng góp của mỗi cá nhân sẽ mang lại những thay đổi tích cực cho môi trường đô thị, từ mảng xanh thành phố đến không khí sạch và chống biến đổi khí hậu.
</p>

<p>
	Dự án thuộc Chương trình “Một triệu cây xanh Đô thị” (MTIC), được GreenViet thực hiện trong thời gian 10 năm (từ 2020 đến 2030), đặt ra mục tiêu trồng một triệu cây xanh đô thị trên toàn quốc, trong đó Đà Nẵng, Hà Nội và TP. Hồ Chí Minh là các thành phố trọng điểm.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221208103937-638060927771072906.jpg" style="width:100%">
</p>

<p>
	Trong gần 3 năm qua thực hiện chương trình, với sự góp sức của cộng đồng và nhà tài trợ, GreenViet đã trồng hơn 32.000 cây xanh trên 72 điểm của các thành phố lớn. Với chương trình MTIC, trung tâm GreenViet đã lan tỏa thông điệp trồng cây xanh bảo vệ môi trường đến với cộng đồng, đoàn thể, doanh nghiệp... Song song với việc huy động nguồn lực trồng cây xanh, GreenViet đã phát triển dự án I-tree tại Việt Nam để quản lý, đánh giá lợi ích cây xanh và không gian xanh đô thị đối với các vấn đề môi trường, kinh tế và các tác động đến sức khỏe con người.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221208103950-638060927903104557.jpg" style="width:100%">
</p>

<p>
	Chương trình kêu gọi cộng đồng, các nhà hảo tâm cùng chung tay gây quỹ 200.000.000 đồng. Chiến dịch gây quỹ “Vì một Việt Nam Xanh” nhằm mở rộng 30ha diện tích rừng làm nơi ở cho quần thể Voọc Chà Vá Chân Xám tại xã Tam Mỹ Tây, trồng thêm 20.000 cây xanh tại các thành phố lớn nhằm hướng đến mục tiêu trong chương trình “Một triệu cây xanh đô thị - MTIC” và mang đến hành trình giáo dục trải nghiệm thiên nhiên Sơn Trà miễn phí cho 1.000 trẻ em yếu thế.
</p>

<p>
	Mọi sự đóng góp của bạn sẽ góp phần hoàn thành mục tiêu trồng 20.000 cây xanh để phủ xanh đô thị và chung tay hạn chế ô nhiễm môi trường.&nbsp;
</p>

<p>
	<u><strong>GreenViet</strong></u><br>
	GreenViet tên đầy đủ là Trung tâm Bảo tồn Đa dạng sinh học Nước Việt Xanh, thành lập vào năm 2012. Trung tâm hoạt động trong lĩnh vực Bảo tồn đa dạng sinh học tại&nbsp; khu vực miền Trung - Tây Nguyên. Theo đó, GreenViet với tầm nhìn dài hạn: Cộng đồng Người Việt chủ động tham gia bảo tồn đa dạng sinh học Việt Nam.
</p>

<p>
	<u><strong>Nhà tài trợ:</strong></u><br>
	Dự án “Huy động nguồn tài chính cho các hoạt động bảo tồn đa dạng sinh học và bảo vệ môi trường bền vững tại thành phố Đà Nẵng, Việt Nam”; – Gọi tắt là Dự án Quỹ Bảo tồn nhằm thiết lập một nguồn Quỹ bền vững để tài trợ cho các tổ chức xã hội địa phương (CSO) hoạt động trong lĩnh vực bảo tồn đa dạng sinh học và bảo vệ môi trường bền vững tại miền Trung và Tây Nguyên. Dự án được thực hiện chính bởi Trung tâm Bảo tồn Đa dạng Sinh học Nước Việt Xanh và viện Gustav-Stresemann-Institut e.V. (GSI), Đức thực hiện và Phái đoàn Liên minh Châu Âu tại Việt Nam đồng tài trợ.
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-221209135300-638061907809925301.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221208104314-638060929944694596.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221208104321-638060930015273951.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221209135316-638061907968237063.jpg
	',
    N'
    Mỗi người chỉ cần góp một cây xanh, chúng ta sẽ có thể phủ xanh đô thị và chung tay hạn chế ô nhiễm môi trường. Hãy đồng hành cùng GreenViet để trồng thêm 20.000 cây xanh.
    ',
    138,
    1604000,
    200000000,
    54,
   '2022-12-07'
)
  
 

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) 
values (

    9,
    N'Chung tay gây quỹ trồng 20.000 cây xanh đô thị chống biến đổi khí hậu và hạn chế ô nhiễm môi trường
    ',
    N'Đầu Tư Cơ Sở Vật Chất',
    N'
    <article class="soju__prose small"><p>
	Chương trình “Một triệu cây xanh Đô thị” (MTIC) ra đời từ thực trạng thiếu diện tích che phủ cây xanh trong 3 đô thị lớn ở Việt Nam là Hà Nội, Đà Nẵng và thành phố Hồ Chí Minh, kéo theo đó là những hệ quả tác động đến môi trường, xã hội, sức khỏe và chất lượng sống của con người. Chương trình được thực hiện trong thời gian 10 năm (từ 2020 đến 2030), đặt ra mục tiêu trồng một triệu cây xanh đô thị trên toàn quốc, trong đó Đà Nẵng, Hà Nội và TP. Hồ Chí Minh là các thành phố trọng điểm.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221208103915-638060927559388117.jpg" style="width:100%">
</p>

<p>
	Trung tâm bảo tồn đa dạng sinh học Nước Việt Xanh (GreenViet) kêu gọi cộng đồng chung tay trồng 20.000 cây xanh đô thị, hướng đến tăng mật độ cây xanh tại các công viên, trường học, ký túc xá, đường giao thông…của các thành phố lớn. Sự đóng góp của mỗi cá nhân sẽ mang lại những thay đổi tích cực cho môi trường đô thị, từ mảng xanh thành phố đến không khí sạch và chống biến đổi khí hậu.
</p>

<p>
	Dự án thuộc Chương trình “Một triệu cây xanh Đô thị” (MTIC), được GreenViet thực hiện trong thời gian 10 năm (từ 2020 đến 2030), đặt ra mục tiêu trồng một triệu cây xanh đô thị trên toàn quốc, trong đó Đà Nẵng, Hà Nội và TP. Hồ Chí Minh là các thành phố trọng điểm.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221208103937-638060927771072906.jpg" style="width:100%">
</p>

<p>
	Trong gần 3 năm qua thực hiện chương trình, với sự góp sức của cộng đồng và nhà tài trợ, GreenViet đã trồng hơn 32.000 cây xanh trên 72 điểm của các thành phố lớn. Với chương trình MTIC, trung tâm GreenViet đã lan tỏa thông điệp trồng cây xanh bảo vệ môi trường đến với cộng đồng, đoàn thể, doanh nghiệp... Song song với việc huy động nguồn lực trồng cây xanh, GreenViet đã phát triển dự án I-tree tại Việt Nam để quản lý, đánh giá lợi ích cây xanh và không gian xanh đô thị đối với các vấn đề môi trường, kinh tế và các tác động đến sức khỏe con người.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221208103950-638060927903104557.jpg" style="width:100%">
</p>

<p>
	Chương trình kêu gọi cộng đồng, các nhà hảo tâm cùng chung tay gây quỹ 200.000.000 đồng. Chiến dịch gây quỹ “Vì một Việt Nam Xanh” nhằm mở rộng 30ha diện tích rừng làm nơi ở cho quần thể Voọc Chà Vá Chân Xám tại xã Tam Mỹ Tây, trồng thêm 20.000 cây xanh tại các thành phố lớn nhằm hướng đến mục tiêu trong chương trình “Một triệu cây xanh đô thị - MTIC” và mang đến hành trình giáo dục trải nghiệm thiên nhiên Sơn Trà miễn phí cho 1.000 trẻ em yếu thế.
</p>

<p>
	Mọi sự đóng góp của bạn sẽ góp phần hoàn thành mục tiêu trồng 20.000 cây xanh để phủ xanh đô thị và chung tay hạn chế ô nhiễm môi trường.&nbsp;
</p>

<p>
	<u><strong>GreenViet</strong></u><br>
	GreenViet tên đầy đủ là Trung tâm Bảo tồn Đa dạng sinh học Nước Việt Xanh, thành lập vào năm 2012. Trung tâm hoạt động trong lĩnh vực Bảo tồn đa dạng sinh học tại&nbsp; khu vực miền Trung - Tây Nguyên. Theo đó, GreenViet với tầm nhìn dài hạn: Cộng đồng Người Việt chủ động tham gia bảo tồn đa dạng sinh học Việt Nam.
</p>

<p>
	<u><strong>Nhà tài trợ:</strong></u><br>
	Dự án “Huy động nguồn tài chính cho các hoạt động bảo tồn đa dạng sinh học và bảo vệ môi trường bền vững tại thành phố Đà Nẵng, Việt Nam”; – Gọi tắt là Dự án Quỹ Bảo tồn nhằm thiết lập một nguồn Quỹ bền vững để tài trợ cho các tổ chức xã hội địa phương (CSO) hoạt động trong lĩnh vực bảo tồn đa dạng sinh học và bảo vệ môi trường bền vững tại miền Trung và Tây Nguyên. Dự án được thực hiện chính bởi Trung tâm Bảo tồn Đa dạng Sinh học Nước Việt Xanh và viện Gustav-Stresemann-Institut e.V. (GSI), Đức thực hiện và Phái đoàn Liên minh Châu Âu tại Việt Nam đồng tài trợ.
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-221209135300-638061907809925301.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221208104314-638060929944694596.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221208104321-638060930015273951.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221209135316-638061907968237063.jpg
	',
    N'
    Mỗi người chỉ cần góp một cây xanh, chúng ta sẽ có thể phủ xanh đô thị và chung tay hạn chế ô nhiễm môi trường. Hãy đồng hành cùng GreenViet để trồng thêm 20.000 cây xanh.
    ',
    138,
    1604000,
    200000000,
    54,
   '2022-12-07'
)


INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) 
values (
	
    10,
    N'Chung tay quyên góp xây dựng nhà tình nghĩa cho gia đình em Lò Văn Ngoan có hoàn cảnh đặc biệt khó khăn tỉnh Sơn La
    ',
    N'Đầu Tư Cơ Sở Vật Chất',
    N'
    <article class="soju__prose small"><p>
	<strong>Hoàn cảnh tội nghiệp vô cùng của cậu bé 11 tuổi – Lò Văn Ngoan</strong>
</p>

<p>
	Ngoan sinh trong gia đình đặc biệt khó khăn. Do mồ côi cha mẹ từ nhỏ, em đã thiếu thốn tình yêu thương và sự chăm sóc mà đáng ra mỗi đứa trẻ đều có được. Hiện nay, Ngoan đang sống cùng bà ngoại đã hơn 90 tuổi, không còn khả năng lao động. Vì hoàn cảnh thiếu thốn, cả một ngày dài đều là bữa đói bữa no. Bữa ăn của hai bà cháu khi thì là gói mì tôm, khi lại là độc cơm trắng với rau và măng rừng.&nbsp;
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220404182109-637846932695387908.jpg" style="width:100%">
	<em>Hình ảnh bà ngoại và Ngoan trong căn nhà sàn tồi tàn duy nhất của gia đình.</em>
</p>

<p>
	Ngôi nhà sàn cũ kỹ của hai bà cháu đang ở được xây dựng tạm bợ từ những miếng gỗ nhỏ. Trải qua nhiều năm sử dụng, dưới tác động của mưa nắng, ngôi nhà đến nay đã trở nên hư hỏng, không còn an toàn. Trời mưa, trong nhà cũng thủng dột, ướt nhẹp như ngoài sân, hai bà cháu đành ôm nhau ngồi co ro ở một góc nhà. Trong nhà cũng không có nhiều vật dụng sinh hoạt gì, chỉ có cái bếp củi và vài ba cái xoong nồi cũ.&nbsp;
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220404182144-637846933042840043.jpg" style="width:100%">
	<em>Hình ảnh căn nhà sàn xiêu vẹo, cũ kĩ của em.</em>
</p>

<p>
	Đối với cậu học trò nhỏ Lò Văn Ngoan, ước mơ duy nhất lúc này là có đủ điều kiện để tiếp tục đến trường. Em mong muốn được học hành, có một cái nghề ổn định để có thu nhập chăm sóc bà ngoại cao tuổi. Vì lẽ đó, mỗi ngày em đều cố gắng học tập và rèn luyện chăm chỉ để có thể kiên cường vượt qua những khó khăn thử thách của cuộc sống: đường đến trường xa xôi quá, cơm ăn không đủ no, bà càng ngày càng già yếu,.... Thế nhưng, hoàn cảnh của gia đình chỉ có ngôi nhà không thể đơn sơ hơn của mình, có lẽ Ngoan chỉ ước ao có được một ngôi nhà kiên cố, một chiếc bàn học tử tế để yên tâm học tập.
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220404182226-637846933469409992.jpg" style="width:100%">
	<em style="text-align:center">Trong nhà không có tài sản gì giá trị, chỉ có lắt nhắt vài đồ dùng sinh hoạt nhỏ.</em>
</p>

<p>
	<strong>Chung tay quyên góp, cứu giúp mảnh đời khó khăn của Lò Văn Ngoan</strong>
</p>

<p>
	Thấu hiểu và mong muốn sẻ chia với hoàn cảnh khó khăn của Ngoan, Hội bảo trợ người tàn tật trẻ mồ côi huyện Quỳnh Nhai - tỉnh Sơn La kết hợp với ví điện tử MoMo mong muốn quyên góp, giúp đỡ trang trải kinh phí xây dựng “Ngôi nhà tình thương” cho em.&nbsp;
</p>

<p>
	Chúng tôi mong muốn kêu gọi quyên góp 85.000.000 VND từ cộng đồng để hoàn thành dự án này. Mỗi sự chung tay đóng góp từ các bạn đều góp phần đắp thêm những viên gạch cho “Ngôi nhà tình thương” cho Ngoan và bà ngoại, cũng là thêm những cầu nối cho giấc mơ học tập của em.&nbsp;
</p>

<p>
	Ngay lúc này đây, chúng tôi rất cần sự chung tay từ cộng đồng và các mạnh thường quân. Hãy cùng chúng tôi trao đi yêu thương, xây nên ước mơ cho trẻ nhỏ có hoàn cảnh khó khăn như Ngoan.&nbsp;
</p>

<p>
	<em>*Sau khi nhận đủ 85.000.000 VND từ cộng đồng, Hội Bảo trợ Người tàn tật và trẻ mồ côi huyện Quỳnh Nhai, tỉnh Sơn La sẽ sử dụng toàn bộ để triển khai dự án, trang trải chi phí xây dựng nhà cho em Lò Văn Ngoan. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến quý vị trong thời gian sớm nhất.&nbsp;</em>
</p>

<p>
	<u><strong>Về Hội Bảo trợ Người tàn tật và trẻ mồ côi (NTT&amp;TMC):</strong></u><br>
	Hội Bảo trợ Người tàn tật và trẻ mồ côi (NTT&amp;TMC) huyện Quỳnh Nhai được thành lập từ&nbsp; năm 1998. Là một tổ chức xã hội, hoạt động theo Điều lệ của TW Hội Bảo trợ NTT&amp;TMC Việt Nam, tuân thủ sự lãnh đạo của Đảng, sự quản lý của nhà nước mà trực tiếp là sự lãnh đạo của Huyện ủy, sự chỉ đạo, quản lý của UBND huyện Quỳnh Nhai.&nbsp;
</p>

<p>
	Chức năng nhiệm vụ của Hội: Tập hợp, đoàn kết. động viên NTT&amp;TMC khắc phục khó khăn để vươn lên hoà nhập cộng đồng, chấp hành tốt chủ trương, đường lối của Đảng, chính sách và pháp luật của Nhà nước; Tuyên truyền, kêu gọi, vận động các tổ chức, cá nhân ngoài xã hội quyên góp, ủng hộ, tài trợ; Tổ chức các hoạt động giúp NTT&amp;TMC trên địa bàn; Đề xuất kiến nghị với các cấp có thẩm quyền, các ngành chức năng ban hành, bổ sung, sửa đổi thực hiện cơ chế, chính sách liên quan đến quyền và lợi ích hợp pháp của NTT&amp;TMC;&nbsp; Mở rộng đối ngoại hợp tác trong tỉnh, trong Nước và hợp tác Quốc tế trong linh vực nhân đạo, từ thiện để hỗ trợ, giúp đỡ NTT&amp;TMC.
</p>

<p>
	<em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp;tạo nên một cộng đồng Việt Nam nhân ái nhé!&nbsp;<span style="color:#0066cc">donation@mservice.com.vn</span></em>
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-220404181805-637846930855290963.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220404182621-637846935817806351.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220404182632-637846935925054890.jpg
	',
    N'
    Chung tay xây dựng mái ấm tình thương, giúp em Lò Văn Ngoan Bản Lọng Ố - tỉnh Sơn La có cuộc sống bớt vất vả.
    ',
    1948,
    25567499,
    85000000,
    13,
   '2022-04-03'
)


INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) 
values (
	
    10,
    N'Chung tay quyên góp xây dựng nhà tình nghĩa cho gia đình em Lò Văn Ngoan có hoàn cảnh đặc biệt khó khăn tỉnh Sơn La
    ',
    N'Đầu Tư Cơ Sở Vật Chất',
    N'
    <article class="soju__prose small"><p>
	<strong>Hoàn cảnh tội nghiệp vô cùng của cậu bé 11 tuổi – Lò Văn Ngoan</strong>
</p>

<p>
	Ngoan sinh trong gia đình đặc biệt khó khăn. Do mồ côi cha mẹ từ nhỏ, em đã thiếu thốn tình yêu thương và sự chăm sóc mà đáng ra mỗi đứa trẻ đều có được. Hiện nay, Ngoan đang sống cùng bà ngoại đã hơn 90 tuổi, không còn khả năng lao động. Vì hoàn cảnh thiếu thốn, cả một ngày dài đều là bữa đói bữa no. Bữa ăn của hai bà cháu khi thì là gói mì tôm, khi lại là độc cơm trắng với rau và măng rừng.&nbsp;
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220404182109-637846932695387908.jpg" style="width:100%">
	<em>Hình ảnh bà ngoại và Ngoan trong căn nhà sàn tồi tàn duy nhất của gia đình.</em>
</p>

<p>
	Ngôi nhà sàn cũ kỹ của hai bà cháu đang ở được xây dựng tạm bợ từ những miếng gỗ nhỏ. Trải qua nhiều năm sử dụng, dưới tác động của mưa nắng, ngôi nhà đến nay đã trở nên hư hỏng, không còn an toàn. Trời mưa, trong nhà cũng thủng dột, ướt nhẹp như ngoài sân, hai bà cháu đành ôm nhau ngồi co ro ở một góc nhà. Trong nhà cũng không có nhiều vật dụng sinh hoạt gì, chỉ có cái bếp củi và vài ba cái xoong nồi cũ.&nbsp;
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220404182144-637846933042840043.jpg" style="width:100%">
	<em>Hình ảnh căn nhà sàn xiêu vẹo, cũ kĩ của em.</em>
</p>

<p>
	Đối với cậu học trò nhỏ Lò Văn Ngoan, ước mơ duy nhất lúc này là có đủ điều kiện để tiếp tục đến trường. Em mong muốn được học hành, có một cái nghề ổn định để có thu nhập chăm sóc bà ngoại cao tuổi. Vì lẽ đó, mỗi ngày em đều cố gắng học tập và rèn luyện chăm chỉ để có thể kiên cường vượt qua những khó khăn thử thách của cuộc sống: đường đến trường xa xôi quá, cơm ăn không đủ no, bà càng ngày càng già yếu,.... Thế nhưng, hoàn cảnh của gia đình chỉ có ngôi nhà không thể đơn sơ hơn của mình, có lẽ Ngoan chỉ ước ao có được một ngôi nhà kiên cố, một chiếc bàn học tử tế để yên tâm học tập.
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220404182226-637846933469409992.jpg" style="width:100%">
	<em style="text-align:center">Trong nhà không có tài sản gì giá trị, chỉ có lắt nhắt vài đồ dùng sinh hoạt nhỏ.</em>
</p>

<p>
	<strong>Chung tay quyên góp, cứu giúp mảnh đời khó khăn của Lò Văn Ngoan</strong>
</p>

<p>
	Thấu hiểu và mong muốn sẻ chia với hoàn cảnh khó khăn của Ngoan, Hội bảo trợ người tàn tật trẻ mồ côi huyện Quỳnh Nhai - tỉnh Sơn La kết hợp với ví điện tử MoMo mong muốn quyên góp, giúp đỡ trang trải kinh phí xây dựng “Ngôi nhà tình thương” cho em.&nbsp;
</p>

<p>
	Chúng tôi mong muốn kêu gọi quyên góp 85.000.000 VND từ cộng đồng để hoàn thành dự án này. Mỗi sự chung tay đóng góp từ các bạn đều góp phần đắp thêm những viên gạch cho “Ngôi nhà tình thương” cho Ngoan và bà ngoại, cũng là thêm những cầu nối cho giấc mơ học tập của em.&nbsp;
</p>

<p>
	Ngay lúc này đây, chúng tôi rất cần sự chung tay từ cộng đồng và các mạnh thường quân. Hãy cùng chúng tôi trao đi yêu thương, xây nên ước mơ cho trẻ nhỏ có hoàn cảnh khó khăn như Ngoan.&nbsp;
</p>

<p>
	<em>*Sau khi nhận đủ 85.000.000 VND từ cộng đồng, Hội Bảo trợ Người tàn tật và trẻ mồ côi huyện Quỳnh Nhai, tỉnh Sơn La sẽ sử dụng toàn bộ để triển khai dự án, trang trải chi phí xây dựng nhà cho em Lò Văn Ngoan. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến quý vị trong thời gian sớm nhất.&nbsp;</em>
</p>

<p>
	<u><strong>Về Hội Bảo trợ Người tàn tật và trẻ mồ côi (NTT&amp;TMC):</strong></u><br>
	Hội Bảo trợ Người tàn tật và trẻ mồ côi (NTT&amp;TMC) huyện Quỳnh Nhai được thành lập từ&nbsp; năm 1998. Là một tổ chức xã hội, hoạt động theo Điều lệ của TW Hội Bảo trợ NTT&amp;TMC Việt Nam, tuân thủ sự lãnh đạo của Đảng, sự quản lý của nhà nước mà trực tiếp là sự lãnh đạo của Huyện ủy, sự chỉ đạo, quản lý của UBND huyện Quỳnh Nhai.&nbsp;
</p>

<p>
	Chức năng nhiệm vụ của Hội: Tập hợp, đoàn kết. động viên NTT&amp;TMC khắc phục khó khăn để vươn lên hoà nhập cộng đồng, chấp hành tốt chủ trương, đường lối của Đảng, chính sách và pháp luật của Nhà nước; Tuyên truyền, kêu gọi, vận động các tổ chức, cá nhân ngoài xã hội quyên góp, ủng hộ, tài trợ; Tổ chức các hoạt động giúp NTT&amp;TMC trên địa bàn; Đề xuất kiến nghị với các cấp có thẩm quyền, các ngành chức năng ban hành, bổ sung, sửa đổi thực hiện cơ chế, chính sách liên quan đến quyền và lợi ích hợp pháp của NTT&amp;TMC;&nbsp; Mở rộng đối ngoại hợp tác trong tỉnh, trong Nước và hợp tác Quốc tế trong linh vực nhân đạo, từ thiện để hỗ trợ, giúp đỡ NTT&amp;TMC.
</p>

<p>
	<em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp;tạo nên một cộng đồng Việt Nam nhân ái nhé!&nbsp;<span style="color:#0066cc">donation@mservice.com.vn</span></em>
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-220404181805-637846930855290963.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220404182621-637846935817806351.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220404182632-637846935925054890.jpg
	',
    N'
    Chung tay xây dựng mái ấm tình thương, giúp em Lò Văn Ngoan Bản Lọng Ố - tỉnh Sơn La có cuộc sống bớt vất vả.
    ',
    1948,
    25567499,
    85000000,
    13,
   '2022-04-03'
)
  

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) 
values (
	
    11,
    N'Đại sứ Nước – Đem nước sạch về cho người dân Xóm Chiềng Cang, Tỉnh Hòa Bình
    ',
    N'Bảo Vệ Môi Trường',
    N'
    <article class="soju__prose small"><p>
	Từ bao đời nay, Nước luôn luôn là nguồn sống không thể thiếu của con người. Vậy nhưng, vẫn còn nhiều khu vực tại các khu vực miền núi, hoặc các vùng sâu vùng xa, thì nước sạch vẫn là một điều gì đó vô cùng xa xỉ. Và xóm Chiềng Cang, thuộc xã Mường Chiềng, huyện Đà Bắc, tỉnh Hoà Bình mà tổ chức MSD United Way Việt Nam và RIC muốn đem nước sạch về trong dự án Đại sứ nước lần này là một ví dụ điển hình.
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221229133927-638079179671384998.jpg" style="width:100%">
	<em>Ở nhiều vùng sâu vùng xa của đất nước, được sử dụng nước sạch đối với người dân là vô cùng khó khăn</em>
</p>

<p>
	Đây là một trong những xóm nghèo của xã Mường Chiềng, huyện Đà Bắc. Xóm có 106 hộ dân với 49 hộ nghèo (chiếm 46,2%) và 25 hộ cận nghèo (chiếm 23,5%). Nghề nghiệp chính của người dân trong thôn là nông lâm nghiệp kết hợp (trồng ngô và lúa là chủ yếu) nên việc sử dụng nước sạch càng cần thiết hơn. Ấy vậy mà hệ thống cung cấp nước sinh hoạt cho người dân xóm Chiềng Cang đã bị xuống cấp trầm trọng từ năm 2017 đến nay. Bể nước và đường ống dẫn nước đã không còn sử dụng được, nên người dân nơi đây phải sử dụng thau, chậu để đựng nước từ các mó nước đầu nguồn về để sử dụng.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221229134104-638079180640834111.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221229134125-638079180859179074.jpg" style="width:100%">
	<em>Hệ thống cung cấp nước sạch vừa sơ sài lại vừa bị hư hỏng nặng nề</em>
</p>

<p>
	Để có nước sinh hoạt, các gia đình phải đi bộ từ 2-3km đường núi để gánh nước từ suối về dùng. Đặc biệt vào mùa khô, người dân phải chia nhau từng xô nước đem về được. Nhưng chính nguồn nước này cũng tiềm ẩn nhiều nguy cơ về sức khỏe. Do địa hình gần các khu vực có đá vôi và các khu công nghiệp, nên nguồn nước cũng bị ô nhiễm và sẽ gây hại cho sức khỏe nếu sử dụng trong một thời gian dài. Cụ thể người dân tại xóm Chiềng Cang có tỷ lệ mắc các bệnh về đường ruột, vàng da, đau mắt,...cao hơn mặt bằng chung của địa phương.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221229134200-638079181206437670.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221229134217-638079181375876799.jpg" style="width:100%">
	<em>Nguồn nước không đảm bảo vệ sinh nên còn tiềm ẩn nhiều nguy cơ về sức khỏe</em>
</p>

<p>
	<strong>Cùng Đại sứ nước mang nước sạch về xóm Chiềng Cang</strong>
</p>

<p>
	Nhận thấy được tình hình này, MSD United Way Vietnam phối hợp cùng các đối tác triển khai chương trình “Đại sứ nước”để cùng chung tay với bà con xóm Chiềng Cang. Dự án sẽ nâng cấp và sửa chữa lại hệ thống cấp nước sinh hoạt tự chảy cho người dân nơi đây. Sau khi khảo sát địa điểm và cùng nhau ngồi lại tìm ra phương án thích hợp, công trình bao gồm những hạng mục sau:
</p>

<ol>
	<li aria-level="1">Tu sửa lại 01 bể bể đầu nguồn (dài 2,5m, rộng 2,5m, cao 1,5m).</li>
	<li aria-level="1">Lắp mới tuyến đường ống dẫn nước bị hỏng từ bai chứa nước đầu nguồn đến bể chia nước về bể chứa khu dân cư dài bằng ống nhựa HPDE Tiền Phong ph 50x 1500m.</li>
	<li aria-level="1">Xây dựng 01 bể chia nước bằng gạch chỉ đỏ, bê tông cốt thép (dài 3m, rộng 2,5m, cao 1,2m). Các hộ dân sẽ dẫn nước từ bể chứa này về nhà.</li>
	<li aria-level="1">Tu sửa 01 bể chứa nước cũ với việc thau rửa vệ sinh bể và thay mới các van vòi chia nước Các hộ gia đình sẽ dẫn nước từ bể chứa nước tập trung tại khu dân cư về các bể chứa của các hộ gia đình.</li>
</ol>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221229134251-638079181717209626.jpg" style="width:100%">
	<em>Chung tay mang đến nguồn nước sạch cho các em nhỏ và bà con vùng sâu vùng xa</em>
</p>

<p>
	<em>*Khi chương trình đã hoàn thành quyên góp, toàn bộ số tiền quyên góp được sẽ được Ví MoMo gửi tới Viện Nghiên cứu Quản lý Phát triển bền vững (MSD) và Trung tâm Nghiên cứu Sáng kiến Phát triển Cộng đồng (RIC) để triển khai chiến dịch xây dựng hệ thống nước sạch. Chúng tôi sẽ cập nhật thông tin về tiến độ dự án tới các bạn trong thời gian sớm nhất.</em>
</p>

<p>
	<u><strong>Về MSD United Way VietNam:</strong></u><br>
	Là một tổ chức phi chính phủ Việt Nam, MSD nỗ lực hành động vì một môi trường phát triển thuận lợi cho sự phát triển của khối các tổ chức xã hội và thúc đẩy việc thực hiện quyền của các nhóm cộng đồng bị lề hoá và dễ bị tổn thương, đặc biệt là nhóm trẻ em, thanh niên, phụ nữ và người khuyết tật. MSD được công nhận là một tổ chức hàng đầu trong phối hợp, hỗ trợ và cung cấp các dịch vụ nâng cao năng lực, đào tạo và tham vấn cho các tổ chức xã hội tại Việt Nam. Bên cạnh đó, MSD cũng là tổ chức chuyên nghiệp đáp ứng hiệu quả nhu cầu và bảo vệ các đối tượng có hoàn cảnh khó khăn, thông qua tổ chức các dự án và hỗ trợ trẻ em, thanh thiếu niên, phụ nữ, người vô gia cư, người nhập cư và người khuyết tật tại Việt Nam.
</p>

<p>
	<u><strong>Về Trung tâm RIC:</strong></u><br>
	RIC kết nối và thúc đẩy các sáng kiến trong việc nâng cao năng lực tự quản cho cộng đồng thiểu số thông qua huy động các nguồn viện trợ Quốc tế và trong nước để thực hiện các dự án phát triển, góp phần thúc đẩy phát triển bền vững cho các cộng đồng DTTS tại Việt Nam.&nbsp;RIC được công nhận là 1 tổ chức hàng đầu trong việc nâng cao năng lực tự quản cho cộng đồng để thực hiện việc xây dựng, duy tu, bảo dưỡng các công trình cơ sở hạ tầng tại các vùng đồng bào DTTS. Đặc biệt, hiện tại RIC là một tổ chức duy nhất có thể giúp các cộng đồng tiếp cận được với nguồn ngân sách nhà nước từ Chương trình 135 để thực hiện việc xây dựng, duy tu bảo dưỡng công trình cơ sở hạ tầng quy mô nhỏ tại vùng DTTS và miền núi.
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-221229133836-638079179168237393.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221229134626-638079183867960698.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221229134644-638079184048163348.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221229134708-638079184288868453.jpg
	',
    N'
    Chung tay cùng Đại sứ Nước – để xây dựng công trình nước sinh hoạt đem nước sạch về cho người dân Xóm Chiềng Cang, huyện Đà Bắc, Tỉnh Hòa Bình
    ',
    28897,
    98672632,
    200000000,
    9,
   '2022-12-28'
)
  
 

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) 
values (
	
    11,
    N'Đại sứ Nước – Đem nước sạch về cho người dân Xóm Chiềng Cang, Tỉnh Hòa Bình
    ',
    N'Bảo Vệ Môi Trường',
    N'
    <article class="soju__prose small"><p>
	Từ bao đời nay, Nước luôn luôn là nguồn sống không thể thiếu của con người. Vậy nhưng, vẫn còn nhiều khu vực tại các khu vực miền núi, hoặc các vùng sâu vùng xa, thì nước sạch vẫn là một điều gì đó vô cùng xa xỉ. Và xóm Chiềng Cang, thuộc xã Mường Chiềng, huyện Đà Bắc, tỉnh Hoà Bình mà tổ chức MSD United Way Việt Nam và RIC muốn đem nước sạch về trong dự án Đại sứ nước lần này là một ví dụ điển hình.
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221229133927-638079179671384998.jpg" style="width:100%">
	<em>Ở nhiều vùng sâu vùng xa của đất nước, được sử dụng nước sạch đối với người dân là vô cùng khó khăn</em>
</p>

<p>
	Đây là một trong những xóm nghèo của xã Mường Chiềng, huyện Đà Bắc. Xóm có 106 hộ dân với 49 hộ nghèo (chiếm 46,2%) và 25 hộ cận nghèo (chiếm 23,5%). Nghề nghiệp chính của người dân trong thôn là nông lâm nghiệp kết hợp (trồng ngô và lúa là chủ yếu) nên việc sử dụng nước sạch càng cần thiết hơn. Ấy vậy mà hệ thống cung cấp nước sinh hoạt cho người dân xóm Chiềng Cang đã bị xuống cấp trầm trọng từ năm 2017 đến nay. Bể nước và đường ống dẫn nước đã không còn sử dụng được, nên người dân nơi đây phải sử dụng thau, chậu để đựng nước từ các mó nước đầu nguồn về để sử dụng.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221229134104-638079180640834111.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221229134125-638079180859179074.jpg" style="width:100%">
	<em>Hệ thống cung cấp nước sạch vừa sơ sài lại vừa bị hư hỏng nặng nề</em>
</p>

<p>
	Để có nước sinh hoạt, các gia đình phải đi bộ từ 2-3km đường núi để gánh nước từ suối về dùng. Đặc biệt vào mùa khô, người dân phải chia nhau từng xô nước đem về được. Nhưng chính nguồn nước này cũng tiềm ẩn nhiều nguy cơ về sức khỏe. Do địa hình gần các khu vực có đá vôi và các khu công nghiệp, nên nguồn nước cũng bị ô nhiễm và sẽ gây hại cho sức khỏe nếu sử dụng trong một thời gian dài. Cụ thể người dân tại xóm Chiềng Cang có tỷ lệ mắc các bệnh về đường ruột, vàng da, đau mắt,...cao hơn mặt bằng chung của địa phương.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221229134200-638079181206437670.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221229134217-638079181375876799.jpg" style="width:100%">
	<em>Nguồn nước không đảm bảo vệ sinh nên còn tiềm ẩn nhiều nguy cơ về sức khỏe</em>
</p>

<p>
	<strong>Cùng Đại sứ nước mang nước sạch về xóm Chiềng Cang</strong>
</p>

<p>
	Nhận thấy được tình hình này, MSD United Way Vietnam phối hợp cùng các đối tác triển khai chương trình “Đại sứ nước”để cùng chung tay với bà con xóm Chiềng Cang. Dự án sẽ nâng cấp và sửa chữa lại hệ thống cấp nước sinh hoạt tự chảy cho người dân nơi đây. Sau khi khảo sát địa điểm và cùng nhau ngồi lại tìm ra phương án thích hợp, công trình bao gồm những hạng mục sau:
</p>

<ol>
	<li aria-level="1">Tu sửa lại 01 bể bể đầu nguồn (dài 2,5m, rộng 2,5m, cao 1,5m).</li>
	<li aria-level="1">Lắp mới tuyến đường ống dẫn nước bị hỏng từ bai chứa nước đầu nguồn đến bể chia nước về bể chứa khu dân cư dài bằng ống nhựa HPDE Tiền Phong ph 50x 1500m.</li>
	<li aria-level="1">Xây dựng 01 bể chia nước bằng gạch chỉ đỏ, bê tông cốt thép (dài 3m, rộng 2,5m, cao 1,2m). Các hộ dân sẽ dẫn nước từ bể chứa này về nhà.</li>
	<li aria-level="1">Tu sửa 01 bể chứa nước cũ với việc thau rửa vệ sinh bể và thay mới các van vòi chia nước Các hộ gia đình sẽ dẫn nước từ bể chứa nước tập trung tại khu dân cư về các bể chứa của các hộ gia đình.</li>
</ol>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-221229134251-638079181717209626.jpg" style="width:100%">
	<em>Chung tay mang đến nguồn nước sạch cho các em nhỏ và bà con vùng sâu vùng xa</em>
</p>

<p>
	<em>*Khi chương trình đã hoàn thành quyên góp, toàn bộ số tiền quyên góp được sẽ được Ví MoMo gửi tới Viện Nghiên cứu Quản lý Phát triển bền vững (MSD) và Trung tâm Nghiên cứu Sáng kiến Phát triển Cộng đồng (RIC) để triển khai chiến dịch xây dựng hệ thống nước sạch. Chúng tôi sẽ cập nhật thông tin về tiến độ dự án tới các bạn trong thời gian sớm nhất.</em>
</p>

<p>
	<u><strong>Về MSD United Way VietNam:</strong></u><br>
	Là một tổ chức phi chính phủ Việt Nam, MSD nỗ lực hành động vì một môi trường phát triển thuận lợi cho sự phát triển của khối các tổ chức xã hội và thúc đẩy việc thực hiện quyền của các nhóm cộng đồng bị lề hoá và dễ bị tổn thương, đặc biệt là nhóm trẻ em, thanh niên, phụ nữ và người khuyết tật. MSD được công nhận là một tổ chức hàng đầu trong phối hợp, hỗ trợ và cung cấp các dịch vụ nâng cao năng lực, đào tạo và tham vấn cho các tổ chức xã hội tại Việt Nam. Bên cạnh đó, MSD cũng là tổ chức chuyên nghiệp đáp ứng hiệu quả nhu cầu và bảo vệ các đối tượng có hoàn cảnh khó khăn, thông qua tổ chức các dự án và hỗ trợ trẻ em, thanh thiếu niên, phụ nữ, người vô gia cư, người nhập cư và người khuyết tật tại Việt Nam.
</p>

<p>
	<u><strong>Về Trung tâm RIC:</strong></u><br>
	RIC kết nối và thúc đẩy các sáng kiến trong việc nâng cao năng lực tự quản cho cộng đồng thiểu số thông qua huy động các nguồn viện trợ Quốc tế và trong nước để thực hiện các dự án phát triển, góp phần thúc đẩy phát triển bền vững cho các cộng đồng DTTS tại Việt Nam.&nbsp;RIC được công nhận là 1 tổ chức hàng đầu trong việc nâng cao năng lực tự quản cho cộng đồng để thực hiện việc xây dựng, duy tu, bảo dưỡng các công trình cơ sở hạ tầng tại các vùng đồng bào DTTS. Đặc biệt, hiện tại RIC là một tổ chức duy nhất có thể giúp các cộng đồng tiếp cận được với nguồn ngân sách nhà nước từ Chương trình 135 để thực hiện việc xây dựng, duy tu bảo dưỡng công trình cơ sở hạ tầng quy mô nhỏ tại vùng DTTS và miền núi.
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-221229133836-638079179168237393.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221229134626-638079183867960698.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221229134644-638079184048163348.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-221229134708-638079184288868453.jpg
	',
    N'
    Chung tay cùng Đại sứ Nước – để xây dựng công trình nước sinh hoạt đem nước sạch về cho người dân Xóm Chiềng Cang, huyện Đà Bắc, Tỉnh Hòa Bình
    ',
    28897,
    98672632,
    200000000,
    9,
   '2022-12-28'
)

 

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) 
values (
	
    12,
    N'Chung tay ủng hộ, phủ xanh đất trống đồi trọc tại huyện Cam Lộ - tỉnh Quảng Trị
    ',
    N'Bảo Vệ Môi Trường',
    N'
   <article class="soju__prose small"><p>
	<strong>Những ảnh hưởng đau thương do mất rừng tại Cam Lộ - Quảng Trị</strong>
</p>

<p>
	“Mưa lũ đến nhấn chìm khúc ruột<br>
	Thấy đau lòng ê buốt tim ta<br>
	Nước dâng lên ngập mái nhà<br>
	Phận người trong lũ xót xa khốn cùng.”
</p>

<p>
	Những câu thơ ấy của tác giả Anh Đại Võ đã miêu tả rất rõ cảnh ngập lụt ở Miền Trung trong thời gian gần đây. Ai trong chúng ta đều thấy rõ, mỗi mùa mưa lũ qua đi đều để lại cho người dân Quảng Trị nói riêng, người dân miền Trung nói chung những đau thương mất mát. Khúc ruột Miền Trung thân thương của chúng ta rất nhiều lần đã phải oằn mình hứng chịu cơn thịnh nộ khủng khiếp từ mẹ thiên nhiên.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220622124028-637914984289421946.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Hình ảnh mưa bão, lũ lụt tại đất tại miền Trung, gây ra nhiều mất mát về người và của.</em>
</p>

<p>
	Năm 2020, đợt mưa lũ lịch sử tại miền Trung đã gây thiệt hại nặng nề về người và tài sản. Hơn 249 người chết và mất tích, 1.531 nhà sập, 239.341 nhà bị hư hại, tốc mái, nhiều công trình phòng, chống thiên tai, cơ sở hạ tầng, dân sinh bị hư hỏng, sạt lở.&nbsp;Hình ảnh người dân phải mất nhà cửa, mất cơ nghiệp cả đời, thậm chí mất đi cả gia đình do lũ lụt không khỏi khiến chúng ta cảm thấy xót xa và quặn thắt.&nbsp;
</p>

<p>
	Khi thiên tai xảy ra, các phương pháp phòng chống và giảm thiểu thiệt hại là vô cùng quan trọng. Một trong những giải pháp hữu hiệu để giảm thiểu ảnh hưởng từ lũ lụt chính là trồng nhiều cây xanh, phủ kín đồi trọc, tạo nên vành đai xanh điều hòa khí hậu. Tạo vành đai xanh sẽ giúp bảo vệ môi trường sinh thái, bảo đảm cho sự phát triển bền vững và toàn diện của xã hội. Đây là việc làm không chỉ có ý nghĩa và tầm quan trọng lớn cho ngày hôm nay mà còn cho cả mai sau.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220622124058-637914984581866854.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Trồng rừng giúp tạo nên vành đai xanh, điều hòa khí hậu.</em>
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220622124127-637914984875473212.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Trồng rừng không chỉ có ý nghĩa và tầm quan trọng lớn cho ngày hôm nay mà còn cho cả mai sau.</em>
</p>

<p>
	<strong>Chung tay trồng rừng, phủ xanh đồi trọc để phòng chống thiên tai tại Cam Lộ - Quảng Trị</strong>
</p>

<p>
	Hiểu rõ được tầm quan trọng của việc trồng cây xanh - phủ kín đồi trọc, Quỹ Hoa Chia Sẻ phối hợp với Trái Tim MoMo phát động chương trình “Phủ xanh đất trống đồi trọc”. Đây là chiến dịch nhằm phục hồi mảng xanh, xây dựng hệ sinh thái bền vững nhằm hạn chế các tác động từ biến đổi khí hậu. Dự án hướng đến trồng rừng và đi đôi với bảo vệ rừng.&nbsp;
</p>

<p>
	Chúng tôi mong muốn có thể kêu gọi từ cộng đồng 200.000.000 VND thông qua Trái Tim MoMo để cùng chung tay trồng rừng, phủ xanh gần 2 ha đất trống, tiếp tục chặng đường chống lại biến đổi khí hậu. Qũy Hoa Chia Sẻ rất mong nhận được sự ủng hộ nhiệt tình của các vị mạnh thường quân.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220622124202-637914985226168740.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Hãy cùng Quỹ Hoa Chia Sẻ chung tay quyên góp trồng rừng tại Quảng Trị để phòng chống thiên tai lũ lụt miền Trung.</em>
</p>

<p>
	Mỗi đóng góp của quý vị sẽ góp phần giúp cho cuộc sống trở nên bình ổn với bầu không khí trong lành, giảm bớt thiệt hại từ thiên tai, cũng là góp sức xây dựng cho một tương lai bền vững của chính chúng ta sau này!
</p>

<p>
	<em>*Sau khi nhận đủ số tiền quyên góp từ cộng đồng, Trái Tim MoMo sẽ chuyển toàn bộ 200 triệu VND đến Quỹ Hoa Chia Sẻ để triển khai dự án. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến quý vị trong thời gian sớm nhất.&nbsp;</em>
</p>

<p>
	<u><strong>Về Quỹ Hoa Chia Sẻ:</strong></u><br>
	Về Quỹ Hoa Chia Sẻ là một tổ chức từ thiện với 6 cơ sở trên toàn quốc, được thành lập với sứ mệnh “Thúc đẩy nền tảng chia sẻ xã hội”. Quỹ xã hội – từ thiện được thành lập hoàn toàn tự nguyện, và Quỹ hoạt động không vì lợi nhuận, trên nguyên tắc tự tạo vốn, hoạt động nhằm mục đích xã hội – từ thiện, trong đó ưu tiên giúp đỡ các gia đình khó khăn, gia đình có công với cách mạng và hỗ trợ, khuyến khích phát triển văn hóa, giáo dục, y tế, thể dục thể thao, khoa học và các mục đích phát triển cộng đồng phù hợp quy định của pháp luật.
</p>

<p>
	<em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ tạo nên một cộng đồng Việt Nam nhân ái nhé! <span style="color:#0066cc">donation@mservice.com.vn</span></em>
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-220622123830-637914983101383143.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220622124802-637914988823673735.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220622124823-637914989032557956.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220622124835-637914989150177765.jpg
	',
    N'
    Cùng chung tay khắc phục bảo vệ mảng xanh nhằm hạn chế biến đổi khí hậu và suy thoái môi trường, giảm thiểu thiên tai và hạn hán đối với các vùng đồng bào.
    ',
    28897,
    98672632,
    200000000,
    9,
   '2022-06-21'
)

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) 
values (
	
    12,
    N'Chung tay ủng hộ, phủ xanh đất trống đồi trọc tại huyện Cam Lộ - tỉnh Quảng Trị
    ',
    N'Bảo Vệ Môi Trường',
    N'
   <article class="soju__prose small"><p>
	<strong>Những ảnh hưởng đau thương do mất rừng tại Cam Lộ - Quảng Trị</strong>
</p>

<p>
	“Mưa lũ đến nhấn chìm khúc ruột<br>
	Thấy đau lòng ê buốt tim ta<br>
	Nước dâng lên ngập mái nhà<br>
	Phận người trong lũ xót xa khốn cùng.”
</p>

<p>
	Những câu thơ ấy của tác giả Anh Đại Võ đã miêu tả rất rõ cảnh ngập lụt ở Miền Trung trong thời gian gần đây. Ai trong chúng ta đều thấy rõ, mỗi mùa mưa lũ qua đi đều để lại cho người dân Quảng Trị nói riêng, người dân miền Trung nói chung những đau thương mất mát. Khúc ruột Miền Trung thân thương của chúng ta rất nhiều lần đã phải oằn mình hứng chịu cơn thịnh nộ khủng khiếp từ mẹ thiên nhiên.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220622124028-637914984289421946.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Hình ảnh mưa bão, lũ lụt tại đất tại miền Trung, gây ra nhiều mất mát về người và của.</em>
</p>

<p>
	Năm 2020, đợt mưa lũ lịch sử tại miền Trung đã gây thiệt hại nặng nề về người và tài sản. Hơn 249 người chết và mất tích, 1.531 nhà sập, 239.341 nhà bị hư hại, tốc mái, nhiều công trình phòng, chống thiên tai, cơ sở hạ tầng, dân sinh bị hư hỏng, sạt lở.&nbsp;Hình ảnh người dân phải mất nhà cửa, mất cơ nghiệp cả đời, thậm chí mất đi cả gia đình do lũ lụt không khỏi khiến chúng ta cảm thấy xót xa và quặn thắt.&nbsp;
</p>

<p>
	Khi thiên tai xảy ra, các phương pháp phòng chống và giảm thiểu thiệt hại là vô cùng quan trọng. Một trong những giải pháp hữu hiệu để giảm thiểu ảnh hưởng từ lũ lụt chính là trồng nhiều cây xanh, phủ kín đồi trọc, tạo nên vành đai xanh điều hòa khí hậu. Tạo vành đai xanh sẽ giúp bảo vệ môi trường sinh thái, bảo đảm cho sự phát triển bền vững và toàn diện của xã hội. Đây là việc làm không chỉ có ý nghĩa và tầm quan trọng lớn cho ngày hôm nay mà còn cho cả mai sau.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220622124058-637914984581866854.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Trồng rừng giúp tạo nên vành đai xanh, điều hòa khí hậu.</em>
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220622124127-637914984875473212.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Trồng rừng không chỉ có ý nghĩa và tầm quan trọng lớn cho ngày hôm nay mà còn cho cả mai sau.</em>
</p>

<p>
	<strong>Chung tay trồng rừng, phủ xanh đồi trọc để phòng chống thiên tai tại Cam Lộ - Quảng Trị</strong>
</p>

<p>
	Hiểu rõ được tầm quan trọng của việc trồng cây xanh - phủ kín đồi trọc, Quỹ Hoa Chia Sẻ phối hợp với Trái Tim MoMo phát động chương trình “Phủ xanh đất trống đồi trọc”. Đây là chiến dịch nhằm phục hồi mảng xanh, xây dựng hệ sinh thái bền vững nhằm hạn chế các tác động từ biến đổi khí hậu. Dự án hướng đến trồng rừng và đi đôi với bảo vệ rừng.&nbsp;
</p>

<p>
	Chúng tôi mong muốn có thể kêu gọi từ cộng đồng 200.000.000 VND thông qua Trái Tim MoMo để cùng chung tay trồng rừng, phủ xanh gần 2 ha đất trống, tiếp tục chặng đường chống lại biến đổi khí hậu. Qũy Hoa Chia Sẻ rất mong nhận được sự ủng hộ nhiệt tình của các vị mạnh thường quân.&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220622124202-637914985226168740.jpg" style="width:100%">
</p>

<p style="text-align:center">
	<em>Hãy cùng Quỹ Hoa Chia Sẻ chung tay quyên góp trồng rừng tại Quảng Trị để phòng chống thiên tai lũ lụt miền Trung.</em>
</p>

<p>
	Mỗi đóng góp của quý vị sẽ góp phần giúp cho cuộc sống trở nên bình ổn với bầu không khí trong lành, giảm bớt thiệt hại từ thiên tai, cũng là góp sức xây dựng cho một tương lai bền vững của chính chúng ta sau này!
</p>

<p>
	<em>*Sau khi nhận đủ số tiền quyên góp từ cộng đồng, Trái Tim MoMo sẽ chuyển toàn bộ 200 triệu VND đến Quỹ Hoa Chia Sẻ để triển khai dự án. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến quý vị trong thời gian sớm nhất.&nbsp;</em>
</p>

<p>
	<u><strong>Về Quỹ Hoa Chia Sẻ:</strong></u><br>
	Về Quỹ Hoa Chia Sẻ là một tổ chức từ thiện với 6 cơ sở trên toàn quốc, được thành lập với sứ mệnh “Thúc đẩy nền tảng chia sẻ xã hội”. Quỹ xã hội – từ thiện được thành lập hoàn toàn tự nguyện, và Quỹ hoạt động không vì lợi nhuận, trên nguyên tắc tự tạo vốn, hoạt động nhằm mục đích xã hội – từ thiện, trong đó ưu tiên giúp đỡ các gia đình khó khăn, gia đình có công với cách mạng và hỗ trợ, khuyến khích phát triển văn hóa, giáo dục, y tế, thể dục thể thao, khoa học và các mục đích phát triển cộng đồng phù hợp quy định của pháp luật.
</p>

<p>
	<em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ tạo nên một cộng đồng Việt Nam nhân ái nhé! <span style="color:#0066cc">donation@mservice.com.vn</span></em>
</p>
</article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-220622123830-637914983101383143.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220622124802-637914988823673735.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220622124823-637914989032557956.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220622124835-637914989150177765.jpg
	',
    N'
    Cùng chung tay khắc phục bảo vệ mảng xanh nhằm hạn chế biến đổi khí hậu và suy thoái môi trường, giảm thiểu thiên tai và hạn hán đối với các vùng đồng bào.
    ',
    28897,
    98672632,
    200000000,
    9,
   '2022-06-21'
)

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) 
values (
	
    12,
    N'Cùng chung tay xây dựng “Đảo sinh thái” tại Thành phố Huế
    ',
    N'Bảo Vệ Môi Trường',
    N'
   <article class="soju__prose small"><p>
	<strong>Quá trình đô thị hóa và sự suy thoái môi trường</strong>
</p>

<p>
	Sự phát triển của một thành phố tác động trực tiếp đến đa dạng sinh học của đô thị. Trong đó sự gia tăng dân số, đô thị hóa nhanh, thay đổi phương thức sử dụng đất, ô nhiễm môi trường và tác động của biến đổi khí hậu đã làm giảm đáng kể diện tích sinh cảnh, gia tăng sự chia cắt của các hệ sinh thái đô thị. Không gian công cộng với những đặc thù rất thích hợp là nơi hình thành các mô hình phục hồi và bảo tồn đa dạng sinh học đô thị, góp phần cải tạo không gian một cách bền vững cũng như nâng cao nhận thức của người dân đô thị về vai trò của môi trường và đa dạng sinh học.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220609142120-637903812803072441.jpg" style="width: 100%;">
</p>

<p style="text-align: center;">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220609142129-637903812899525820.jpg" style="width: 100%;">
	<em>Những bãi đất bỏ hoang cần được cải tạo thành không gian công cộng đa dạng sinh học đồng thời phục vụ cho các hoạt động cộng đồng</em>
</p>

<p>
	Hiện nay, Thành phố Huế, đặc biệt là vùng ven đang trong quá trình đô thị hóa nhanh chóng dẫn đến suy thoái môi trường (bê tông hóa đất, chuyển đất nông nghiệp sang phi nông nghiệp, thu hẹp đầm, ao, …) và suy giảm đa dạng sinh học (giảm mật độ cây xanh, giống loài, …).&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220609142202-637903813224684272.jpg" style="width: 100%;">
</p>

<p style="text-align: center;">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220609142210-637903813305277706.jpg" style="width: 100%;">
	<em>Mô hình “Đảo sinh thái” là mô hình trong đó các không gian công cộng được cải tạo theo hướng phục hồi đa dạng sinh thái, qua đó góp phần giảm thiểu tình trạng suy thoái môi trường đô thị</em>
</p>

<p>
	Think Playgrounds cùng Trung tâm Nghiên cứu và Phát triển Cộng đồng (CCRD) phối hợp cùng cộng đồng và chính quyền cơ sở tại phường Phú Hậu, xã Hương Phong và phường Hương Vinh tại thành phố Huế để thí điểm mô hình “Đảo sinh thái” bền vững.&nbsp;
</p>

<p style="text-align: center;">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220609142236-637903813567343392.jpg" style="width: 100%;">
	<em>Một phối cảnh thiết kế tại Vân Quật Đông _ Thừa Thiên Huế.</em>
</p>

<p>
	“Đảo sinh thái” là mô hình trong đó các không gian công cộng được cải tạo theo hướng tăng cường đa dạng sinh học như vườn rừng, vườn hữu cơ cộng đồng, công viên, sân chơi thân thiện với môi trường nhằm tạo ra và duy trì các hệ sinh thái vi mô bền vững cho đô thị, điều hòa không khí, tăng môi trường sống cho côn trùng và thực vật, giảm phát thải khí nhà kính... Nó cũng khuyến khích các hoạt động thể chất và sáng tạo cho trẻ em, phụ nữ; giáo dục cộng đồng về thiên nhiên và đa dạng sinh học.&nbsp;
</p>

<p>
	<strong>Chung tay xây dựng “Đảo sinh thái” tại Thành phố Huế</strong>
</p>

<p>
	Để cải tạo các không gian công cộng tại ba địa bàn trên theo mô hình “Đảo sinh thái” Think Playgrounds và CCRD gây quỹ 500.000.000 đồng từ quỹ Bảo tồn thiên nhiên Việt Nam do GreenViet (Việt Nam) và Viện Gustav-Stresemann (GSI, Đức) hợp tác thực hiện và Phái đoàn Liên minh Châu Âu tại Việt Nam đồng tài trợ.
</p>

<p>
	Dự kiến phần kinh phí này sẽ được sử dụng vào các hoạt động của dự án bao gồm khảo sát, thiết kế cùng cộng đồng, thi công giai đoạn I tại ba không gian công cộng và các hoạt động nâng cao nhận thức cộng đồng.
</p>

<p>
	Để có thể xây dựng hoàn thiện các không gian này, Think Playgrounds và các đối tác mong muốn gây quỹ thêm 200.000.000 đồng từ các mạnh thường quân thông qua Trái Tim MoMo. Nguồn kinh phí này sẽ được sử dụng vào việc xây dựng các hạng mục tại không gian công cộng bao gồm các hạng mục sân chơi thân thiện và bảng biển thông tin. Cộng đồng dân cư sẽ huy động đóng góp cây cối (cây bóng mát, cây bụi, thảm cỏ…) tại các không gian công cộng này.&nbsp;
</p>

<p>
	Ba không gian “Đảo sinh thái” đầu tiên tại Huế sẽ góp phần cải thiện môi trường sống cho các cộng đồng dân cư trong đô thị đồng thời thúc đẩy các sáng kiến và hành động phát triển các không gian công cộng sinh thái, bền vững tại đô thị với sự tham gia của cộng đồng và các bên liên quan.&nbsp;
</p>

<p>
	<em>*Sau khi hoàn thành chiến dịch kêu gọi quyên góp, Trái Tim MoMo sẽ tiến hành gửi toàn bộ số tiền 200 triệu đồng đến để tiến hành dự án. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến quý vị trong thời gian sớm nhất.</em>
</p>

<p>
	<u><strong>Về Think Playgrounds:&nbsp;</strong></u><br>
	TPG là một doanh nghiệp xã hội được thành lập với sứ mệnh vận động cho “Quyền được chơi” của trẻ em thông qua việc chung tay cải tạo các không gian công cộng xanh sinh thái thân thiện với trẻ em và với môi trường (sân chơi tái chế, vườn cộng đồng, công viên nhỏ….)&nbsp; Cho đến cuối năm 2021, TPG cùng các đối tác đã xây dựng hơn 200 sân chơi công cộng và vườn cộng đồng trên cả nước, thử nghiệm mô hình sân chơi phiêu lưu đầu tiên ở VN, tổ chức hơn 30 sự kiện chơi trên phố, ngày vui chơi, chơi tái chế... ở Hà Nội và TP HCM. Trong mảng kinh doanh, TPG đã thực hiện gần 100 sân chơi cho các trường học tư nhân, trang trại giáo dục và các khu đô thị mới. 50% lợi nhuận trong mảng kinh doanh được sử dụng để duy trì các sân chơi công cộng trong thành phố.
</p>

<p>
	<u><strong>Về Trung tâm Nghiên cứu và Phát triển Cộng đồng:&nbsp;</strong></u><br>
	Là một tổ chức xã hội dân sự hoạt động phi lợi nhuận, vì sự phát triển của cộng đồng, bảo tồn tài nguyên thiên nhiên và đa dạng sinh học. Sứ mệnh của trung tâm là hỗ trợ phát triển cộng đồng bền vững. Nhiệm vụ của Trung tâm là hỗ trợ xây dựng năng lực tổ chức cộng đồng, thực hiện các hoạt động nghiên cứu, chuyển giao và tư vấn kỹ thuật, và thực hiện các dự án phát triển cộng đồng, sinh thái, cảnh quan, phát triển sinh kế, quản lý tài nguyên thiên nhiên. Ngoài ra trung tâm còn có nhiệm vụ tìm kiếm và huy động các nguồn lực khác nhau để hỗ trợ phát triển cộng đồng.
</p>
<em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ tạo nên một cộng đồng Việt Nam nhân ái nhé!&nbsp;<span style="color: rgb(0, 102, 204);">donation@mservice.com.vn</span></em></article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-220609142026-637903812260942862.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220609142649-637903816096329158.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220609142705-637903816255394060.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220609142712-637903816322248278.jpg
	',
    N'
    Think Playgrounds, CCRD và cộng đồng cùng chung tay cải tạo 3 không gian công cộng theo mô hình “Đảo sinh thái” tại Thành phố Huế.
    ',
    105639,
    200103451,
    200000000,
    0,
   '2022-06-08'
)
  

INSERT INTO CIRCUM(
	  
    [partner_id],
    [circum_name],
    [circum_type] ,
    [circum_content] ,
    [circum_image] , 
    [circum_des] ,
    [circum_donations] , 
    [circum_target] ,
    [circum_raise] ,
    [circum_time_end] ,
    [circum_start_donate] 
) 
values (
	
    12,
    N'Cùng chung tay xây dựng “Đảo sinh thái” tại Thành phố Huế
    ',
    N'Bảo Vệ Môi Trường',
    N'
   <article class="soju__prose small"><p>
	<strong>Quá trình đô thị hóa và sự suy thoái môi trường</strong>
</p>

<p>
	Sự phát triển của một thành phố tác động trực tiếp đến đa dạng sinh học của đô thị. Trong đó sự gia tăng dân số, đô thị hóa nhanh, thay đổi phương thức sử dụng đất, ô nhiễm môi trường và tác động của biến đổi khí hậu đã làm giảm đáng kể diện tích sinh cảnh, gia tăng sự chia cắt của các hệ sinh thái đô thị. Không gian công cộng với những đặc thù rất thích hợp là nơi hình thành các mô hình phục hồi và bảo tồn đa dạng sinh học đô thị, góp phần cải tạo không gian một cách bền vững cũng như nâng cao nhận thức của người dân đô thị về vai trò của môi trường và đa dạng sinh học.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220609142120-637903812803072441.jpg" style="width: 100%;">
</p>

<p style="text-align: center;">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220609142129-637903812899525820.jpg" style="width: 100%;">
	<em>Những bãi đất bỏ hoang cần được cải tạo thành không gian công cộng đa dạng sinh học đồng thời phục vụ cho các hoạt động cộng đồng</em>
</p>

<p>
	Hiện nay, Thành phố Huế, đặc biệt là vùng ven đang trong quá trình đô thị hóa nhanh chóng dẫn đến suy thoái môi trường (bê tông hóa đất, chuyển đất nông nghiệp sang phi nông nghiệp, thu hẹp đầm, ao, …) và suy giảm đa dạng sinh học (giảm mật độ cây xanh, giống loài, …).&nbsp;
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220609142202-637903813224684272.jpg" style="width: 100%;">
</p>

<p style="text-align: center;">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220609142210-637903813305277706.jpg" style="width: 100%;">
	<em>Mô hình “Đảo sinh thái” là mô hình trong đó các không gian công cộng được cải tạo theo hướng phục hồi đa dạng sinh thái, qua đó góp phần giảm thiểu tình trạng suy thoái môi trường đô thị</em>
</p>

<p>
	Think Playgrounds cùng Trung tâm Nghiên cứu và Phát triển Cộng đồng (CCRD) phối hợp cùng cộng đồng và chính quyền cơ sở tại phường Phú Hậu, xã Hương Phong và phường Hương Vinh tại thành phố Huế để thí điểm mô hình “Đảo sinh thái” bền vững.&nbsp;
</p>

<p style="text-align: center;">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220609142236-637903813567343392.jpg" style="width: 100%;">
	<em>Một phối cảnh thiết kế tại Vân Quật Đông _ Thừa Thiên Huế.</em>
</p>

<p>
	“Đảo sinh thái” là mô hình trong đó các không gian công cộng được cải tạo theo hướng tăng cường đa dạng sinh học như vườn rừng, vườn hữu cơ cộng đồng, công viên, sân chơi thân thiện với môi trường nhằm tạo ra và duy trì các hệ sinh thái vi mô bền vững cho đô thị, điều hòa không khí, tăng môi trường sống cho côn trùng và thực vật, giảm phát thải khí nhà kính... Nó cũng khuyến khích các hoạt động thể chất và sáng tạo cho trẻ em, phụ nữ; giáo dục cộng đồng về thiên nhiên và đa dạng sinh học.&nbsp;
</p>

<p>
	<strong>Chung tay xây dựng “Đảo sinh thái” tại Thành phố Huế</strong>
</p>

<p>
	Để cải tạo các không gian công cộng tại ba địa bàn trên theo mô hình “Đảo sinh thái” Think Playgrounds và CCRD gây quỹ 500.000.000 đồng từ quỹ Bảo tồn thiên nhiên Việt Nam do GreenViet (Việt Nam) và Viện Gustav-Stresemann (GSI, Đức) hợp tác thực hiện và Phái đoàn Liên minh Châu Âu tại Việt Nam đồng tài trợ.
</p>

<p>
	Dự kiến phần kinh phí này sẽ được sử dụng vào các hoạt động của dự án bao gồm khảo sát, thiết kế cùng cộng đồng, thi công giai đoạn I tại ba không gian công cộng và các hoạt động nâng cao nhận thức cộng đồng.
</p>

<p>
	Để có thể xây dựng hoàn thiện các không gian này, Think Playgrounds và các đối tác mong muốn gây quỹ thêm 200.000.000 đồng từ các mạnh thường quân thông qua Trái Tim MoMo. Nguồn kinh phí này sẽ được sử dụng vào việc xây dựng các hạng mục tại không gian công cộng bao gồm các hạng mục sân chơi thân thiện và bảng biển thông tin. Cộng đồng dân cư sẽ huy động đóng góp cây cối (cây bóng mát, cây bụi, thảm cỏ…) tại các không gian công cộng này.&nbsp;
</p>

<p>
	Ba không gian “Đảo sinh thái” đầu tiên tại Huế sẽ góp phần cải thiện môi trường sống cho các cộng đồng dân cư trong đô thị đồng thời thúc đẩy các sáng kiến và hành động phát triển các không gian công cộng sinh thái, bền vững tại đô thị với sự tham gia của cộng đồng và các bên liên quan.&nbsp;
</p>

<p>
	<em>*Sau khi hoàn thành chiến dịch kêu gọi quyên góp, Trái Tim MoMo sẽ tiến hành gửi toàn bộ số tiền 200 triệu đồng đến để tiến hành dự án. Chúng tôi sẽ cập nhật thêm thông tin về tiến độ dự án đến quý vị trong thời gian sớm nhất.</em>
</p>

<p>
	<u><strong>Về Think Playgrounds:&nbsp;</strong></u><br>
	TPG là một doanh nghiệp xã hội được thành lập với sứ mệnh vận động cho “Quyền được chơi” của trẻ em thông qua việc chung tay cải tạo các không gian công cộng xanh sinh thái thân thiện với trẻ em và với môi trường (sân chơi tái chế, vườn cộng đồng, công viên nhỏ….)&nbsp; Cho đến cuối năm 2021, TPG cùng các đối tác đã xây dựng hơn 200 sân chơi công cộng và vườn cộng đồng trên cả nước, thử nghiệm mô hình sân chơi phiêu lưu đầu tiên ở VN, tổ chức hơn 30 sự kiện chơi trên phố, ngày vui chơi, chơi tái chế... ở Hà Nội và TP HCM. Trong mảng kinh doanh, TPG đã thực hiện gần 100 sân chơi cho các trường học tư nhân, trang trại giáo dục và các khu đô thị mới. 50% lợi nhuận trong mảng kinh doanh được sử dụng để duy trì các sân chơi công cộng trong thành phố.
</p>

<p>
	<u><strong>Về Trung tâm Nghiên cứu và Phát triển Cộng đồng:&nbsp;</strong></u><br>
	Là một tổ chức xã hội dân sự hoạt động phi lợi nhuận, vì sự phát triển của cộng đồng, bảo tồn tài nguyên thiên nhiên và đa dạng sinh học. Sứ mệnh của trung tâm là hỗ trợ phát triển cộng đồng bền vững. Nhiệm vụ của Trung tâm là hỗ trợ xây dựng năng lực tổ chức cộng đồng, thực hiện các hoạt động nghiên cứu, chuyển giao và tư vấn kỹ thuật, và thực hiện các dự án phát triển cộng đồng, sinh thái, cảnh quan, phát triển sinh kế, quản lý tài nguyên thiên nhiên. Ngoài ra trung tâm còn có nhiệm vụ tìm kiếm và huy động các nguồn lực khác nhau để hỗ trợ phát triển cộng đồng.
</p>
<em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ tạo nên một cộng đồng Việt Nam nhân ái nhé!&nbsp;<span style="color: rgb(0, 102, 204);">donation@mservice.com.vn</span></em></article>
    ',
    'https://static.mservice.io/blogscontents/momo-upload-api-220609142026-637903812260942862.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220609142649-637903816096329158.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220609142705-637903816255394060.jpg,
    https://static.mservice.io/blogscontents/momo-upload-api-220609142712-637903816322248278.jpg
	',
    N'
    Think Playgrounds, CCRD và cộng đồng cùng chung tay cải tạo 3 không gian công cộng theo mô hình “Đảo sinh thái” tại Thành phố Huế.
    ',
    105639,
    200103451,
    200000000,
    0,
   '2022-06-08'
)



    --Thêm dữ liệu bảng news

INSERT INTO news (
    [news_img_banner]
    ,[news_descritption]
    ,[news_post_date]
    ,[news_content]
) VALUES (
    'https://static.mservice.io/blogscontents/momo-upload-api-230208141839-638114627191413340.jpg',
    N'Các em nhỏ vùng cao đã thực hiện được ước mơ trường mới',
    '18/10/2021',
    N'
    <div class="mx-auto leading-normal md:leading-relaxed lg:mx-0 lg:w-full lg:max-w-full"><p><strong>Hoàn thành dự án: <span style="color: rgb(165, 0, 100);">Cùng Anh Chị Nuôi Dự án Nuôi Em góp Heo Vàng xây điểm trường Nậm Tiến 1, tỉnh Lai Châu</span></strong></p><p><strong>Số Heo Vàng đã gây quỹ thành công:</strong> 800.138
</p><p><strong>Đơn vị triển khai:</strong> Nuôi Em
</p><p><strong>Thời gian gây quỹ:</strong> 18/10/2021
</p><p><strong>Địa điểm hỗ trợ: </strong>Lai Châu
</p><p>
	Điểm trường bản Nậm Tiến 1 thuộc trường PTDTBT Tiểu Học tọa lạc tại xã Pa Tần, Huyện Mường Tè của Tỉnh Lai Châu. Trường cách trung tâm huyện 72km và xã 12km đường đất. Vào những ngày mưa lầy, nắng gắt sẽ khiến 14 học sinh đi học rất vất vả. Ngoài ra, cơ sở vật chất phục vụ cho thầy trò còn thiếu thốn, phải học bằng các phòng học tạm, xuống cấp. Chính vì vậy, việc duy trì sĩ số là vấn đề được lo lắng và quan tâm của nhà trường.
</p><p>
	Hiện tại, điểm trường có 2 lớp học đang giảng dạy cho 14 em học sinh dân tộc Mông. Từ cánh cổng trường yếu ớt lấp ló một ngôi trường nhỏ ‌được‌ ‌dựng‌ ‌lên‌ ‌bằng‌ ‌gỗ‌ ‌lụp‌ ‌xụp.‌ ‌Các lớp‌ ‌học được lợp tôn che và ghép‌ gỗ ‌thành‌ ‌tường‌ ‌có‌ ‌nhiều‌ gai ‌mọt. Mùa‌ ‌hè‌ ‌ngồi‌ ‌trong‌ ‌phòng‌ ‌học‌ ‌thì‌ ‌nóng‌ ‌như‌ ‌đổ‌ ‌lửa,‌ ‌mùa‌ ‌đông‌ ‌thì‌ ‌ngồi‌ ‌đón‌ ‌gió‌ ‌lùa‌ ‌gió‌ ‌rít. Những ngày mưa bão ghé thăm, từng cơn gió xen qua kẽ hở của tường gỗ khiến thầy trò lạnh buốt. Dẫu ngồi học trong lớp mà như ngồi ngoài trời, gây ảnh hưởng tới các em học sinh học hành.
</p><p>
	Với mong muốn các em học sinh và các thầy cô có một mái trường kiên cố để tránh mưa gió, đảm bảo an toàn để yên tâm học hành, Heo Đất MoMo phối hợp cùng Trung tâm Tình nguyện Quốc Gia, dự án Sức mạnh 2000 và Anh Chị Nuôi Dự án Nuôi Em đã gây quỹ thành công hơn 800.000 Heo Vàng. Số Heo Vàng này được nhà tài trợ quy đổi thành 200 triệu đồng và xây dựng 01 phòng học kiên cố cùng 01 phòng công vụ.
</p><p>
	Nhờ đóng góp của các bạn đã góp phần giúp các em nhỏ thực hiện được ước mơ trường mới, khang trang, sạch đẹp.
</p><em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <a href="mailto:donation@mservice.com.vn">donation@mservice.com.vn</a></em></div>
    '
)

INSERT INTO news (
    [news_img_banner]
    ,[news_descritption]
    ,[news_post_date]
    ,[news_content]
) VALUES (
    'https://static.mservice.io/blogscontents/momo-upload-api-230130110723-638106736430230025.jpg',
    N'Tặng lớp học mới kiên cố cho các bé tiểu học Huổi Só, Lai Châu',
    '27/02/2022',
    N'
    <div class="jsx-9785e16a0278564b soju__prose small mt-5"><p class="jsx-9785e16a0278564b article-desc">Trường tiểu học Huổi Só thuộc xã Nậm Chà, huyện Nậm Nhùn, tỉnh Lai Châu đã khánh thành vào ngày 24/8 vừa rồi đón các thầy trò vào dạy và học.</p><div class="mx-auto leading-normal md:leading-relaxed lg:mx-0 lg:w-full lg:max-w-full"><p><strong>Hoàn thành dự án: <span style="color: rgb(165, 0, 100);">Chung tay góp Heo Vàng xây dựng thêm cơ sở vật chất điểm trường Tiểu học Huổi Só - tỉnh Lai Châu</span></strong></p><p><strong>Số Heo Vàng đã gây quỹ thành công:</strong> 800.505
</p><p><strong>Đơn vị triển khai:</strong><a href="https://momo.vn/song-tot/suc-manh-2000"> Sức Mạnh 2000</a></p><p><strong>Thời gian gây quỹ:</strong> 27/02/2022
</p><p><strong>Địa điểm hỗ trợ:</strong> Lai Châu
</p><p><strong>Nhà tài trợ: </strong>Her25 và Soul Concept
</p><p>
	Trường tiểu học Huổi Só thuộc xã Nậm Chà, huyện Nậm Nhùn, tỉnh Lai Châu đã khánh thành vào ngày 24/8 vừa rồi. Đây là một niềm hạnh phúc vô cùng lớn đối với người dân địa phương nói chúng và với thầy trò điểm trường nói riêng.
</p><p>
	Nhờ cộng đồng chủ trại Heo Đất đã chăm chỉ nuôi Heo, thực hiện sống tốt tích cực quyên góp và thành quả đã quyên góp thành công 800.000 Heo Vàng cho điểm trường. Ngay sau đó nhà tài trợ là Her 25 và Soul Concept đã quy đổi tất cả Heo Vàng thành 240.000.000VND gửi tới Dự án Sức mạnh 2000 trực thuộc Trung tâm Tình nguyện Quốc gia, phối hợp cùng đơn vị chịu trách nhiệm chính tại địa phương thực hiện xây dựng trường mới. Quy mô xây dựng bao gồm: 01 phòng học, 01 nhà vệ sinh, 01 bếp nấu ăn, 01 phòng công vụ và 01 bể nước nguồn sạch.
</p><em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <a href="mailto:donation@mservice.com.vn">donation@mservice.com.vn</a></em></div><div class="lg-react-element "></div></div>
    '
)

INSERT INTO news (
    [news_img_banner]
    ,[news_descritption]
    ,[news_post_date]
    ,[news_content]
) VALUES (
    'https://static.mservice.io/blogscontents/momo-upload-api-230119105430-638097224707069182.jpg',
    N'Mang đến một mùa đông ấm áp hơn cho các em nhỏ còn nhiều thiếu thốn tại Quảng Trị',
    '15/12/2022',
    N'
    <div class="mx-auto leading-normal md:leading-relaxed lg:mx-0 lg:w-full lg:max-w-full"><p><strong>Dự án: <span style="color: rgb(165, 0, 100);">Cùng chiến dịch “Áo Ấm Cho Em” – mang đến “Mùa đông không lạnh cho trẻ em nghèo” tỉnh Quảng Trị</span></strong></p><p><strong>Số tiền mặt đã gây quỹ thành công:</strong> 56.912.863đ
</p><p><strong>Đơn vị triển khai:</strong><a href="https://momo.vn/song-tot/hoa-chia-se"> Hoa Chia Sẻ</a></p><p><strong>Thời gian gây quỹ:</strong> 15/12/2022
</p><p><strong>Địa điểm hỗ trợ:</strong> Quảng Trị
</p><p>
	Mỗi mùa đông về, những trẻ em may mắn có một mái nhà ấm áp hạnh phúc, sẽ được gia đình ủ ấm bằng áo bông, áo len khi trời chỉ vừa chớm lạnh. Thế nhưng với các hộ nghèo khó khăn tại tỉnh Quảng Trị,&nbsp; thì các em nhỏ lại phải oằn mình vượt qua giá rét với đôi chân trần đỏ ửng, với chiếc áo rách thậm chí còn không đủ để che thân. Nhìn các em nhỏ nơi đây với ánh mắt hồn nhiên, ngây thơ run lên vì cái lạnh khắc nghiệt thật sự khiến chúng ta phải lặng mình suy ngẫm.
</p><p>
	Với mong muốn phần nào làm dịu bớt cái lạnh mùa đông cho trẻ em nghèo khó khăn tỉnh Quảng Trị, Quỹ Từ Thiện Hoa Chia Sẻ kết hợp cùng MoMo triển khai chương trình “Áo ấm cho em”. Dự án này của Hoa Chia Sẻ và MoMo kêu gọi các nhà hảo tâm, các tấm lòng vàng cùng nhau hướng về lợi ích cộng đồng, cùng gây quỹ để mua áo ấm tặng cho trẻ em gặp hoàn cảnh khó khăn ở Quảng Trị. Chiến dịch này dự kiến được phát động trong 2 tháng, với mục tiêu quyên góp được 500.000.000 VNĐ. Mỗi chiếc áo ấm sẽ có trị giá 50.000 VNĐ, tương đương quyên góp 10.000 chiếc áo ấm, giúp ích được cho 10.000 trẻ em.&nbsp;
</p><p>
	Đợt 1 này, Hoa Chia Sẻ đã kịp trích ra một khoản để kịp mua đợt áo ấm đầu tiên tặng cho các em. Với khoản huy động còn lại chưa đạt được, rất mong sẽ nhận được thật nhiều đóng góp dù lớn, dù nhỏ, của người dùng MoMo để có thể mua thêm thật nhiều áo ấm quyên tặng cho các em nhỏ đang phải gồng mình chống chịu giá rét.&nbsp;
</p><em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <a href="mailto:donation@mservice.com.vn">donation@mservice.com.vn</a></em></div>
    '
)

INSERT INTO news (
    [news_img_banner]
    ,[news_descritption]
    ,[news_post_date]
    ,[news_content]
) VALUES (
    'https://static.mservice.io/blogscontents/momo-upload-api-230113164017-638092248172977003.jpg',
    N'Khát khao về một mái trường vững chãi đã được hiện thực hóa',
    '29/05/2022',
    N'
    <div class="jsx-9785e16a0278564b soju__prose small mt-5"><p class="jsx-9785e16a0278564b article-desc">Ngay sau khi quyên góp thành công cho điểm trường mầm non bản Na Ngua (Điện Biên), tất cả số Heo Vàng đã được nhà tài trợ là Dự án Nuôi em và quỹ cộng đồng qua Trái tim MoMo quy đổi thành 350.000.000VND gửi tới Dự án Sức mạnh 2000 trực thuộc Trung tâm tình nguyện Quốc gia để phối hợp cùng địa phương thực hiện xây dựng điểm trường theo kế hoạch.</p><div class="mx-auto leading-normal md:leading-relaxed lg:mx-0 lg:w-full lg:max-w-full"><p><strong>Hoàn thành dự án: <span style="color: rgb(165, 0, 100);">Cùng Anh Chị Nuôi Dự án Nuôi Em góp Heo Vàng xây dựng thêm phòng học điểm trường bản Na Ngua, tỉnh Điện Biên</span></strong></p><p><strong>Số Heo Vàng đã gây quỹ thành công:</strong> 1.297.966
</p><p><strong>Đơn vị triển khai:</strong> Nuôi Em
</p><p><strong>Thời gian gây quỹ:</strong> 29/05/2022
</p><p><strong>Địa điểm hỗ trợ:</strong> Điện Biên
</p><p>
	Trường Mầm non Luân Giói thuộc xã Luân Giói là đơn vị trường thuộc xã vùng cao của huyện Điện Biên Đông. Được thành lập và đi vào hoạt động từ năm 2006, đến nay đã qua hơn 1 thập kỷ xây dựng và củng cố, nhưng điều kiện vật chất của trường vẫn chưa được ổn định. Không lớp học khang trang, không phòng học kiên cố, chưa được học tập trong môi trường có điều kiện ổn định hơn nhưng thầy cô và các bạn nhỏ điểm trường Na Ngua, tỉnh Điện Biên vẫn luôn nỗ lực trên hành trình gieo trồng và tiếp nhận tri thức. Dù cố gắng là thế, nhưng những bạn nhỏ nơi đây vẫn khao khát và thực sự xứng đáng được dạy dỗ trong một môi trường ổn định hơn. Đó chỉ là mong ước nhỏ nhoi mà học sinh trường mầm non tại bản Na Ngua đang chờ đợi được hiện thực hóa.
</p><p>
	Và nhờ có các bác chủ trại đã chăm chỉ nuôi Heo Đất, đi bộ, thực hiện sống tốt tích cực quyên góp và thành quả hơn 1.250.000 Heo Vàng được quyên góp thành công cho điểm trường. Ngay sau khi quyên góp thành công, tất cả số Heo Vàng trên đã được nhà tài trợ là Dự án Nuôi em và quỹ cộng đồng qua Trái tim MoMo quy đổi thành 350.000.000VND gửi tới Dự án Sức mạnh 2000 trực thuộc Trung tâm tình nguyện Quốc gia để phối hợp cùng địa phương thực hiện xây dựng điểm trường theo kế hoạch.
</p><p>
	Từ nay các em nhỏ tại bản đã có 03 phòng học mới, sạch, đẹp, một môi trường học tập thật tốt dành tặng riêng các em.
</p><em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <a href="mailto:donation@mservice.com.vn">donation@mservice.com.vn</a></em></div><div class="lg-react-element "></div></div>
    '
)

INSERT INTO news (
    [news_img_banner]
    ,[news_descritption]
    ,[news_post_date]
    ,[news_content]
) VALUES (
    'https://static.mservice.io/blogscontents/momo-upload-api-230208141839-638114627191413340.jpg',
    N'Các em nhỏ vùng cao đã thực hiện được ước mơ trường mới',
    '18/10/2021',
    N'
    <div class="mx-auto leading-normal md:leading-relaxed lg:mx-0 lg:w-full lg:max-w-full"><p><strong>Hoàn thành dự án: <span style="color: rgb(165, 0, 100);">Cùng Anh Chị Nuôi Dự án Nuôi Em góp Heo Vàng xây điểm trường Nậm Tiến 1, tỉnh Lai Châu</span></strong></p><p><strong>Số Heo Vàng đã gây quỹ thành công:</strong> 800.138
</p><p><strong>Đơn vị triển khai:</strong> Nuôi Em
</p><p><strong>Thời gian gây quỹ:</strong> 18/10/2021
</p><p><strong>Địa điểm hỗ trợ: </strong>Lai Châu
</p><p>
	Điểm trường bản Nậm Tiến 1 thuộc trường PTDTBT Tiểu Học tọa lạc tại xã Pa Tần, Huyện Mường Tè của Tỉnh Lai Châu. Trường cách trung tâm huyện 72km và xã 12km đường đất. Vào những ngày mưa lầy, nắng gắt sẽ khiến 14 học sinh đi học rất vất vả. Ngoài ra, cơ sở vật chất phục vụ cho thầy trò còn thiếu thốn, phải học bằng các phòng học tạm, xuống cấp. Chính vì vậy, việc duy trì sĩ số là vấn đề được lo lắng và quan tâm của nhà trường.
</p><p>
	Hiện tại, điểm trường có 2 lớp học đang giảng dạy cho 14 em học sinh dân tộc Mông. Từ cánh cổng trường yếu ớt lấp ló một ngôi trường nhỏ ‌được‌ ‌dựng‌ ‌lên‌ ‌bằng‌ ‌gỗ‌ ‌lụp‌ ‌xụp.‌ ‌Các lớp‌ ‌học được lợp tôn che và ghép‌ gỗ ‌thành‌ ‌tường‌ ‌có‌ ‌nhiều‌ gai ‌mọt. Mùa‌ ‌hè‌ ‌ngồi‌ ‌trong‌ ‌phòng‌ ‌học‌ ‌thì‌ ‌nóng‌ ‌như‌ ‌đổ‌ ‌lửa,‌ ‌mùa‌ ‌đông‌ ‌thì‌ ‌ngồi‌ ‌đón‌ ‌gió‌ ‌lùa‌ ‌gió‌ ‌rít. Những ngày mưa bão ghé thăm, từng cơn gió xen qua kẽ hở của tường gỗ khiến thầy trò lạnh buốt. Dẫu ngồi học trong lớp mà như ngồi ngoài trời, gây ảnh hưởng tới các em học sinh học hành.
</p><p>
	Với mong muốn các em học sinh và các thầy cô có một mái trường kiên cố để tránh mưa gió, đảm bảo an toàn để yên tâm học hành, Heo Đất MoMo phối hợp cùng Trung tâm Tình nguyện Quốc Gia, dự án Sức mạnh 2000 và Anh Chị Nuôi Dự án Nuôi Em đã gây quỹ thành công hơn 800.000 Heo Vàng. Số Heo Vàng này được nhà tài trợ quy đổi thành 200 triệu đồng và xây dựng 01 phòng học kiên cố cùng 01 phòng công vụ.
</p><p>
	Nhờ đóng góp của các bạn đã góp phần giúp các em nhỏ thực hiện được ước mơ trường mới, khang trang, sạch đẹp.
</p><em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <a href="mailto:donation@mservice.com.vn">donation@mservice.com.vn</a></em></div>
    '
)

INSERT INTO news (
    [news_img_banner]
    ,[news_descritption]
    ,[news_post_date]
    ,[news_content]
) VALUES (
    'https://static.mservice.io/blogscontents/momo-upload-api-230130110723-638106736430230025.jpg',
    N'Tặng lớp học mới kiên cố cho các bé tiểu học Huổi Só, Lai Châu',
    '27/02/2022',
    N'
    <div class="jsx-9785e16a0278564b soju__prose small mt-5"><p class="jsx-9785e16a0278564b article-desc">Trường tiểu học Huổi Só thuộc xã Nậm Chà, huyện Nậm Nhùn, tỉnh Lai Châu đã khánh thành vào ngày 24/8 vừa rồi đón các thầy trò vào dạy và học.</p><div class="mx-auto leading-normal md:leading-relaxed lg:mx-0 lg:w-full lg:max-w-full"><p><strong>Hoàn thành dự án: <span style="color: rgb(165, 0, 100);">Chung tay góp Heo Vàng xây dựng thêm cơ sở vật chất điểm trường Tiểu học Huổi Só - tỉnh Lai Châu</span></strong></p><p><strong>Số Heo Vàng đã gây quỹ thành công:</strong> 800.505
</p><p><strong>Đơn vị triển khai:</strong><a href="https://momo.vn/song-tot/suc-manh-2000"> Sức Mạnh 2000</a></p><p><strong>Thời gian gây quỹ:</strong> 27/02/2022
</p><p><strong>Địa điểm hỗ trợ:</strong> Lai Châu
</p><p><strong>Nhà tài trợ: </strong>Her25 và Soul Concept
</p><p>
	Trường tiểu học Huổi Só thuộc xã Nậm Chà, huyện Nậm Nhùn, tỉnh Lai Châu đã khánh thành vào ngày 24/8 vừa rồi. Đây là một niềm hạnh phúc vô cùng lớn đối với người dân địa phương nói chúng và với thầy trò điểm trường nói riêng.
</p><p>
	Nhờ cộng đồng chủ trại Heo Đất đã chăm chỉ nuôi Heo, thực hiện sống tốt tích cực quyên góp và thành quả đã quyên góp thành công 800.000 Heo Vàng cho điểm trường. Ngay sau đó nhà tài trợ là Her 25 và Soul Concept đã quy đổi tất cả Heo Vàng thành 240.000.000VND gửi tới Dự án Sức mạnh 2000 trực thuộc Trung tâm Tình nguyện Quốc gia, phối hợp cùng đơn vị chịu trách nhiệm chính tại địa phương thực hiện xây dựng trường mới. Quy mô xây dựng bao gồm: 01 phòng học, 01 nhà vệ sinh, 01 bếp nấu ăn, 01 phòng công vụ và 01 bể nước nguồn sạch.
</p><em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <a href="mailto:donation@mservice.com.vn">donation@mservice.com.vn</a></em></div><div class="lg-react-element "></div></div>
    '
)

INSERT INTO news (
    [news_img_banner]
    ,[news_descritption]
    ,[news_post_date]
    ,[news_content]
) VALUES (
    'https://static.mservice.io/blogscontents/momo-upload-api-230119105430-638097224707069182.jpg',
    N'Mang đến một mùa đông ấm áp hơn cho các em nhỏ còn nhiều thiếu thốn tại Quảng Trị',
    '15/12/2022',
    N'
    <div class="mx-auto leading-normal md:leading-relaxed lg:mx-0 lg:w-full lg:max-w-full"><p><strong>Dự án: <span style="color: rgb(165, 0, 100);">Cùng chiến dịch “Áo Ấm Cho Em” – mang đến “Mùa đông không lạnh cho trẻ em nghèo” tỉnh Quảng Trị</span></strong></p><p><strong>Số tiền mặt đã gây quỹ thành công:</strong> 56.912.863đ
</p><p><strong>Đơn vị triển khai:</strong><a href="https://momo.vn/song-tot/hoa-chia-se"> Hoa Chia Sẻ</a></p><p><strong>Thời gian gây quỹ:</strong> 15/12/2022
</p><p><strong>Địa điểm hỗ trợ:</strong> Quảng Trị
</p><p>
	Mỗi mùa đông về, những trẻ em may mắn có một mái nhà ấm áp hạnh phúc, sẽ được gia đình ủ ấm bằng áo bông, áo len khi trời chỉ vừa chớm lạnh. Thế nhưng với các hộ nghèo khó khăn tại tỉnh Quảng Trị,&nbsp; thì các em nhỏ lại phải oằn mình vượt qua giá rét với đôi chân trần đỏ ửng, với chiếc áo rách thậm chí còn không đủ để che thân. Nhìn các em nhỏ nơi đây với ánh mắt hồn nhiên, ngây thơ run lên vì cái lạnh khắc nghiệt thật sự khiến chúng ta phải lặng mình suy ngẫm.
</p><p>
	Với mong muốn phần nào làm dịu bớt cái lạnh mùa đông cho trẻ em nghèo khó khăn tỉnh Quảng Trị, Quỹ Từ Thiện Hoa Chia Sẻ kết hợp cùng MoMo triển khai chương trình “Áo ấm cho em”. Dự án này của Hoa Chia Sẻ và MoMo kêu gọi các nhà hảo tâm, các tấm lòng vàng cùng nhau hướng về lợi ích cộng đồng, cùng gây quỹ để mua áo ấm tặng cho trẻ em gặp hoàn cảnh khó khăn ở Quảng Trị. Chiến dịch này dự kiến được phát động trong 2 tháng, với mục tiêu quyên góp được 500.000.000 VNĐ. Mỗi chiếc áo ấm sẽ có trị giá 50.000 VNĐ, tương đương quyên góp 10.000 chiếc áo ấm, giúp ích được cho 10.000 trẻ em.&nbsp;
</p><p>
	Đợt 1 này, Hoa Chia Sẻ đã kịp trích ra một khoản để kịp mua đợt áo ấm đầu tiên tặng cho các em. Với khoản huy động còn lại chưa đạt được, rất mong sẽ nhận được thật nhiều đóng góp dù lớn, dù nhỏ, của người dùng MoMo để có thể mua thêm thật nhiều áo ấm quyên tặng cho các em nhỏ đang phải gồng mình chống chịu giá rét.&nbsp;
</p><em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <a href="mailto:donation@mservice.com.vn">donation@mservice.com.vn</a></em></div>
    '
)

INSERT INTO news (
    [news_img_banner]
    ,[news_descritption]
    ,[news_post_date]
    ,[news_content]
) VALUES (
    'https://static.mservice.io/blogscontents/momo-upload-api-230113164017-638092248172977003.jpg',
    N'Khát khao về một mái trường vững chãi đã được hiện thực hóa',
    '29/05/2022',
    N'
    <div class="jsx-9785e16a0278564b soju__prose small mt-5"><p class="jsx-9785e16a0278564b article-desc">Ngay sau khi quyên góp thành công cho điểm trường mầm non bản Na Ngua (Điện Biên), tất cả số Heo Vàng đã được nhà tài trợ là Dự án Nuôi em và quỹ cộng đồng qua Trái tim MoMo quy đổi thành 350.000.000VND gửi tới Dự án Sức mạnh 2000 trực thuộc Trung tâm tình nguyện Quốc gia để phối hợp cùng địa phương thực hiện xây dựng điểm trường theo kế hoạch.</p><div class="mx-auto leading-normal md:leading-relaxed lg:mx-0 lg:w-full lg:max-w-full"><p><strong>Hoàn thành dự án: <span style="color: rgb(165, 0, 100);">Cùng Anh Chị Nuôi Dự án Nuôi Em góp Heo Vàng xây dựng thêm phòng học điểm trường bản Na Ngua, tỉnh Điện Biên</span></strong></p><p><strong>Số Heo Vàng đã gây quỹ thành công:</strong> 1.297.966
</p><p><strong>Đơn vị triển khai:</strong> Nuôi Em
</p><p><strong>Thời gian gây quỹ:</strong> 29/05/2022
</p><p><strong>Địa điểm hỗ trợ:</strong> Điện Biên
</p><p>
	Trường Mầm non Luân Giói thuộc xã Luân Giói là đơn vị trường thuộc xã vùng cao của huyện Điện Biên Đông. Được thành lập và đi vào hoạt động từ năm 2006, đến nay đã qua hơn 1 thập kỷ xây dựng và củng cố, nhưng điều kiện vật chất của trường vẫn chưa được ổn định. Không lớp học khang trang, không phòng học kiên cố, chưa được học tập trong môi trường có điều kiện ổn định hơn nhưng thầy cô và các bạn nhỏ điểm trường Na Ngua, tỉnh Điện Biên vẫn luôn nỗ lực trên hành trình gieo trồng và tiếp nhận tri thức. Dù cố gắng là thế, nhưng những bạn nhỏ nơi đây vẫn khao khát và thực sự xứng đáng được dạy dỗ trong một môi trường ổn định hơn. Đó chỉ là mong ước nhỏ nhoi mà học sinh trường mầm non tại bản Na Ngua đang chờ đợi được hiện thực hóa.
</p><p>
	Và nhờ có các bác chủ trại đã chăm chỉ nuôi Heo Đất, đi bộ, thực hiện sống tốt tích cực quyên góp và thành quả hơn 1.250.000 Heo Vàng được quyên góp thành công cho điểm trường. Ngay sau khi quyên góp thành công, tất cả số Heo Vàng trên đã được nhà tài trợ là Dự án Nuôi em và quỹ cộng đồng qua Trái tim MoMo quy đổi thành 350.000.000VND gửi tới Dự án Sức mạnh 2000 trực thuộc Trung tâm tình nguyện Quốc gia để phối hợp cùng địa phương thực hiện xây dựng điểm trường theo kế hoạch.
</p><p>
	Từ nay các em nhỏ tại bản đã có 03 phòng học mới, sạch, đẹp, một môi trường học tập thật tốt dành tặng riêng các em.
</p><em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <a href="mailto:donation@mservice.com.vn">donation@mservice.com.vn</a></em></div><div class="lg-react-element "></div></div>
    '
)

INSERT INTO news (
    [news_img_banner]
    ,[news_descritption]
    ,[news_post_date]
    ,[news_content]
) VALUES (
    'https://static.mservice.io/blogscontents/momo-upload-api-230208141839-638114627191413340.jpg',
    N'Các em nhỏ vùng cao đã thực hiện được ước mơ trường mới',
    '18/10/2021',
    N'
    <div class="mx-auto leading-normal md:leading-relaxed lg:mx-0 lg:w-full lg:max-w-full"><p><strong>Hoàn thành dự án: <span style="color: rgb(165, 0, 100);">Cùng Anh Chị Nuôi Dự án Nuôi Em góp Heo Vàng xây điểm trường Nậm Tiến 1, tỉnh Lai Châu</span></strong></p><p><strong>Số Heo Vàng đã gây quỹ thành công:</strong> 800.138
</p><p><strong>Đơn vị triển khai:</strong> Nuôi Em
</p><p><strong>Thời gian gây quỹ:</strong> 18/10/2021
</p><p><strong>Địa điểm hỗ trợ: </strong>Lai Châu
</p><p>
	Điểm trường bản Nậm Tiến 1 thuộc trường PTDTBT Tiểu Học tọa lạc tại xã Pa Tần, Huyện Mường Tè của Tỉnh Lai Châu. Trường cách trung tâm huyện 72km và xã 12km đường đất. Vào những ngày mưa lầy, nắng gắt sẽ khiến 14 học sinh đi học rất vất vả. Ngoài ra, cơ sở vật chất phục vụ cho thầy trò còn thiếu thốn, phải học bằng các phòng học tạm, xuống cấp. Chính vì vậy, việc duy trì sĩ số là vấn đề được lo lắng và quan tâm của nhà trường.
</p><p>
	Hiện tại, điểm trường có 2 lớp học đang giảng dạy cho 14 em học sinh dân tộc Mông. Từ cánh cổng trường yếu ớt lấp ló một ngôi trường nhỏ ‌được‌ ‌dựng‌ ‌lên‌ ‌bằng‌ ‌gỗ‌ ‌lụp‌ ‌xụp.‌ ‌Các lớp‌ ‌học được lợp tôn che và ghép‌ gỗ ‌thành‌ ‌tường‌ ‌có‌ ‌nhiều‌ gai ‌mọt. Mùa‌ ‌hè‌ ‌ngồi‌ ‌trong‌ ‌phòng‌ ‌học‌ ‌thì‌ ‌nóng‌ ‌như‌ ‌đổ‌ ‌lửa,‌ ‌mùa‌ ‌đông‌ ‌thì‌ ‌ngồi‌ ‌đón‌ ‌gió‌ ‌lùa‌ ‌gió‌ ‌rít. Những ngày mưa bão ghé thăm, từng cơn gió xen qua kẽ hở của tường gỗ khiến thầy trò lạnh buốt. Dẫu ngồi học trong lớp mà như ngồi ngoài trời, gây ảnh hưởng tới các em học sinh học hành.
</p><p>
	Với mong muốn các em học sinh và các thầy cô có một mái trường kiên cố để tránh mưa gió, đảm bảo an toàn để yên tâm học hành, Heo Đất MoMo phối hợp cùng Trung tâm Tình nguyện Quốc Gia, dự án Sức mạnh 2000 và Anh Chị Nuôi Dự án Nuôi Em đã gây quỹ thành công hơn 800.000 Heo Vàng. Số Heo Vàng này được nhà tài trợ quy đổi thành 200 triệu đồng và xây dựng 01 phòng học kiên cố cùng 01 phòng công vụ.
</p><p>
	Nhờ đóng góp của các bạn đã góp phần giúp các em nhỏ thực hiện được ước mơ trường mới, khang trang, sạch đẹp.
</p><em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <a href="mailto:donation@mservice.com.vn">donation@mservice.com.vn</a></em></div>
    '
)

INSERT INTO news (
    [news_img_banner]
    ,[news_descritption]
    ,[news_post_date]
    ,[news_content]
) VALUES (
    'https://static.mservice.io/blogscontents/momo-upload-api-230130110723-638106736430230025.jpg',
    N'Tặng lớp học mới kiên cố cho các bé tiểu học Huổi Só, Lai Châu',
    '27/02/2022',
    N'
    <div class="jsx-9785e16a0278564b soju__prose small mt-5"><p class="jsx-9785e16a0278564b article-desc">Trường tiểu học Huổi Só thuộc xã Nậm Chà, huyện Nậm Nhùn, tỉnh Lai Châu đã khánh thành vào ngày 24/8 vừa rồi đón các thầy trò vào dạy và học.</p><div class="mx-auto leading-normal md:leading-relaxed lg:mx-0 lg:w-full lg:max-w-full"><p><strong>Hoàn thành dự án: <span style="color: rgb(165, 0, 100);">Chung tay góp Heo Vàng xây dựng thêm cơ sở vật chất điểm trường Tiểu học Huổi Só - tỉnh Lai Châu</span></strong></p><p><strong>Số Heo Vàng đã gây quỹ thành công:</strong> 800.505
</p><p><strong>Đơn vị triển khai:</strong><a href="https://momo.vn/song-tot/suc-manh-2000"> Sức Mạnh 2000</a></p><p><strong>Thời gian gây quỹ:</strong> 27/02/2022
</p><p><strong>Địa điểm hỗ trợ:</strong> Lai Châu
</p><p><strong>Nhà tài trợ: </strong>Her25 và Soul Concept
</p><p>
	Trường tiểu học Huổi Só thuộc xã Nậm Chà, huyện Nậm Nhùn, tỉnh Lai Châu đã khánh thành vào ngày 24/8 vừa rồi. Đây là một niềm hạnh phúc vô cùng lớn đối với người dân địa phương nói chúng và với thầy trò điểm trường nói riêng.
</p><p>
	Nhờ cộng đồng chủ trại Heo Đất đã chăm chỉ nuôi Heo, thực hiện sống tốt tích cực quyên góp và thành quả đã quyên góp thành công 800.000 Heo Vàng cho điểm trường. Ngay sau đó nhà tài trợ là Her 25 và Soul Concept đã quy đổi tất cả Heo Vàng thành 240.000.000VND gửi tới Dự án Sức mạnh 2000 trực thuộc Trung tâm Tình nguyện Quốc gia, phối hợp cùng đơn vị chịu trách nhiệm chính tại địa phương thực hiện xây dựng trường mới. Quy mô xây dựng bao gồm: 01 phòng học, 01 nhà vệ sinh, 01 bếp nấu ăn, 01 phòng công vụ và 01 bể nước nguồn sạch.
</p><em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <a href="mailto:donation@mservice.com.vn">donation@mservice.com.vn</a></em></div><div class="lg-react-element "></div></div>
    '
)

INSERT INTO news (
    [news_img_banner]
    ,[news_descritption]
    ,[news_post_date]
    ,[news_content]
) VALUES (
    'https://static.mservice.io/blogscontents/momo-upload-api-230119105430-638097224707069182.jpg',
    N'Mang đến một mùa đông ấm áp hơn cho các em nhỏ còn nhiều thiếu thốn tại Quảng Trị',
    '15/12/2022',
    N'
    <div class="mx-auto leading-normal md:leading-relaxed lg:mx-0 lg:w-full lg:max-w-full"><p><strong>Dự án: <span style="color: rgb(165, 0, 100);">Cùng chiến dịch “Áo Ấm Cho Em” – mang đến “Mùa đông không lạnh cho trẻ em nghèo” tỉnh Quảng Trị</span></strong></p><p><strong>Số tiền mặt đã gây quỹ thành công:</strong> 56.912.863đ
</p><p><strong>Đơn vị triển khai:</strong><a href="https://momo.vn/song-tot/hoa-chia-se"> Hoa Chia Sẻ</a></p><p><strong>Thời gian gây quỹ:</strong> 15/12/2022
</p><p><strong>Địa điểm hỗ trợ:</strong> Quảng Trị
</p><p>
	Mỗi mùa đông về, những trẻ em may mắn có một mái nhà ấm áp hạnh phúc, sẽ được gia đình ủ ấm bằng áo bông, áo len khi trời chỉ vừa chớm lạnh. Thế nhưng với các hộ nghèo khó khăn tại tỉnh Quảng Trị,&nbsp; thì các em nhỏ lại phải oằn mình vượt qua giá rét với đôi chân trần đỏ ửng, với chiếc áo rách thậm chí còn không đủ để che thân. Nhìn các em nhỏ nơi đây với ánh mắt hồn nhiên, ngây thơ run lên vì cái lạnh khắc nghiệt thật sự khiến chúng ta phải lặng mình suy ngẫm.
</p><p>
	Với mong muốn phần nào làm dịu bớt cái lạnh mùa đông cho trẻ em nghèo khó khăn tỉnh Quảng Trị, Quỹ Từ Thiện Hoa Chia Sẻ kết hợp cùng MoMo triển khai chương trình “Áo ấm cho em”. Dự án này của Hoa Chia Sẻ và MoMo kêu gọi các nhà hảo tâm, các tấm lòng vàng cùng nhau hướng về lợi ích cộng đồng, cùng gây quỹ để mua áo ấm tặng cho trẻ em gặp hoàn cảnh khó khăn ở Quảng Trị. Chiến dịch này dự kiến được phát động trong 2 tháng, với mục tiêu quyên góp được 500.000.000 VNĐ. Mỗi chiếc áo ấm sẽ có trị giá 50.000 VNĐ, tương đương quyên góp 10.000 chiếc áo ấm, giúp ích được cho 10.000 trẻ em.&nbsp;
</p><p>
	Đợt 1 này, Hoa Chia Sẻ đã kịp trích ra một khoản để kịp mua đợt áo ấm đầu tiên tặng cho các em. Với khoản huy động còn lại chưa đạt được, rất mong sẽ nhận được thật nhiều đóng góp dù lớn, dù nhỏ, của người dùng MoMo để có thể mua thêm thật nhiều áo ấm quyên tặng cho các em nhỏ đang phải gồng mình chống chịu giá rét.&nbsp;
</p><em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <a href="mailto:donation@mservice.com.vn">donation@mservice.com.vn</a></em></div>
    '
)

INSERT INTO news (
    [news_img_banner]
    ,[news_descritption]
    ,[news_post_date]
    ,[news_content]
) VALUES (
    'https://static.mservice.io/blogscontents/momo-upload-api-230113164017-638092248172977003.jpg',
    N'Khát khao về một mái trường vững chãi đã được hiện thực hóa',
    '29/05/2022',
    N'
    <div class="jsx-9785e16a0278564b soju__prose small mt-5"><p class="jsx-9785e16a0278564b article-desc">Ngay sau khi quyên góp thành công cho điểm trường mầm non bản Na Ngua (Điện Biên), tất cả số Heo Vàng đã được nhà tài trợ là Dự án Nuôi em và quỹ cộng đồng qua Trái tim MoMo quy đổi thành 350.000.000VND gửi tới Dự án Sức mạnh 2000 trực thuộc Trung tâm tình nguyện Quốc gia để phối hợp cùng địa phương thực hiện xây dựng điểm trường theo kế hoạch.</p><div class="mx-auto leading-normal md:leading-relaxed lg:mx-0 lg:w-full lg:max-w-full"><p><strong>Hoàn thành dự án: <span style="color: rgb(165, 0, 100);">Cùng Anh Chị Nuôi Dự án Nuôi Em góp Heo Vàng xây dựng thêm phòng học điểm trường bản Na Ngua, tỉnh Điện Biên</span></strong></p><p><strong>Số Heo Vàng đã gây quỹ thành công:</strong> 1.297.966
</p><p><strong>Đơn vị triển khai:</strong> Nuôi Em
</p><p><strong>Thời gian gây quỹ:</strong> 29/05/2022
</p><p><strong>Địa điểm hỗ trợ:</strong> Điện Biên
</p><p>
	Trường Mầm non Luân Giói thuộc xã Luân Giói là đơn vị trường thuộc xã vùng cao của huyện Điện Biên Đông. Được thành lập và đi vào hoạt động từ năm 2006, đến nay đã qua hơn 1 thập kỷ xây dựng và củng cố, nhưng điều kiện vật chất của trường vẫn chưa được ổn định. Không lớp học khang trang, không phòng học kiên cố, chưa được học tập trong môi trường có điều kiện ổn định hơn nhưng thầy cô và các bạn nhỏ điểm trường Na Ngua, tỉnh Điện Biên vẫn luôn nỗ lực trên hành trình gieo trồng và tiếp nhận tri thức. Dù cố gắng là thế, nhưng những bạn nhỏ nơi đây vẫn khao khát và thực sự xứng đáng được dạy dỗ trong một môi trường ổn định hơn. Đó chỉ là mong ước nhỏ nhoi mà học sinh trường mầm non tại bản Na Ngua đang chờ đợi được hiện thực hóa.
</p><p>
	Và nhờ có các bác chủ trại đã chăm chỉ nuôi Heo Đất, đi bộ, thực hiện sống tốt tích cực quyên góp và thành quả hơn 1.250.000 Heo Vàng được quyên góp thành công cho điểm trường. Ngay sau khi quyên góp thành công, tất cả số Heo Vàng trên đã được nhà tài trợ là Dự án Nuôi em và quỹ cộng đồng qua Trái tim MoMo quy đổi thành 350.000.000VND gửi tới Dự án Sức mạnh 2000 trực thuộc Trung tâm tình nguyện Quốc gia để phối hợp cùng địa phương thực hiện xây dựng điểm trường theo kế hoạch.
</p><p>
	Từ nay các em nhỏ tại bản đã có 03 phòng học mới, sạch, đẹp, một môi trường học tập thật tốt dành tặng riêng các em.
</p><em>*MoMo biết rằng còn rất nhiều hoàn cảnh khó khăn trên khắp đất nước của chúng ta cần được bảo trợ. Bạn hay các công ty hãy liên hệ với chúng tôi để cùng tài trợ, giúp đỡ&nbsp; tạo nên một cộng đồng Việt Nam nhân ái nhé! <a href="mailto:donation@mservice.com.vn">donation@mservice.com.vn</a></em></div><div class="lg-react-element "></div></div>
    '
)

    --Thêm dữ liệu bảng Account

INSERT INTO Account([account_role],[account_mail],[account_name],[account_phone],[total_donated],[account_password]) 
VALUES (0, 'son17102@funix.edu.vn', N'Hoàng Thanh Sơn', '0123456789', 0,'123');

INSERT INTO Account([account_role],[account_mail],[account_name],[account_phone],[total_donated],[account_password]) 
VALUES (1, 'phong123@funix.edu.vn', N'Trần Phong', '1231231234', 0,'123');

