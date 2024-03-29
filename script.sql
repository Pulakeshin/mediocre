USE [13th Aug CLoud PT Immersive]
GO
/****** Object:  Schema [TeamC]    Script Date: 06-11-2019 09:40:20 ******/
CREATE SCHEMA [TeamC]
GO
/****** Object:  Table [TeamC].[Admin]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamC].[Admin](
	[AdminID] [uniqueidentifier] NOT NULL,
	[AdminName] [varchar](50) NOT NULL,
	[AdminEmail] [varchar](100) NOT NULL,
	[AdminPassword] [varchar](30) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Modifieddate] [datetime] NOT NULL,
 CONSTRAINT [PK_TeamC.Admin] PRIMARY KEY CLUSTERED 
(
	[AdminEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamC].[DistributorAddresses]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamC].[DistributorAddresses](
	[DistributorAddress_ID] [uniqueidentifier] NOT NULL,
	[Distributor_ID] [uniqueidentifier] NULL,
	[DistributorAddressLine1] [varchar](100) NOT NULL,
	[DistributorAddressLine2] [varchar](100) NOT NULL,
	[Distributor_City] [varchar](30) NOT NULL,
	[Distributor_State] [varchar](30) NOT NULL,
	[Distributor_Pincode] [char](6) NOT NULL,
 CONSTRAINT [DistributorAddressId_Pk] PRIMARY KEY CLUSTERED 
(
	[DistributorAddress_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamC].[Distributors]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamC].[Distributors](
	[Distributor_ID] [uniqueidentifier] NOT NULL,
	[Distributor_Name] [varchar](50) NOT NULL,
	[Distributor_Mobile] [char](10) NOT NULL,
	[Distributor_Email] [varchar](50) NOT NULL,
	[Distributor_Password] [varchar](15) NOT NULL,
	[Created_On] [datetime] NULL,
	[Last_Modified_On] [datetime] NULL,
 CONSTRAINT [DistributorId_Pk] PRIMARY KEY CLUSTERED 
(
	[Distributor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Distributor_Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Distributor_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamC].[ProductsInventory]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamC].[ProductsInventory](
	[ProductID] [uniqueidentifier] NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ProductType] [varchar](100) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[CreationTime] [datetime] NULL,
 CONSTRAINT [ProductID_pk] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamC].[ProductsOrder]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamC].[ProductsOrder](
	[ProductsOrderID] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ProductType] [varchar](100) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[ProductQuantity] [decimal](18, 0) NOT NULL,
	[Amount] [money] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
 CONSTRAINT [ProductsOrderID_pk] PRIMARY KEY CLUSTERED 
(
	[ProductsOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamC].[RawMaterial]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamC].[RawMaterial](
	[Name] [varchar](50) NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[MinQuantity] [decimal](18, 0) NOT NULL,
	[AvailableQuantity] [decimal](18, 0) NOT NULL,
	[ReqdQuantity] [decimal](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[RawMaterialId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [RawMaterialName_pk] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamC].[RawMaterialOrder]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TeamC].[RawMaterialOrder](
	[OrderInvoiceCode] [int] NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[TotalQuantity] [decimal](18, 0) NULL,
	[CreationTime] [datetime] NULL,
	[ModificationTime] [datetime] NULL,
	[SupplierID] [uniqueidentifier] NULL,
	[OrderID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [OrderID_pk] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [TeamC].[RawMaterialOrderDetail]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamC].[RawMaterialOrderDetail](
	[OrderID] [uniqueidentifier] NULL,
	[Name] [varchar](50) NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[Amount] [decimal](18, 0) NULL,
	[CreationTime] [datetime] NULL,
	[ModificationTime] [datetime] NULL,
	[OrderDetailID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [OrderDetailCode_pk] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamC].[supplierAddresses]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamC].[supplierAddresses](
	[SupplierAddressID] [uniqueidentifier] NOT NULL,
	[SupplierID] [uniqueidentifier] NULL,
	[supplierAddressLine1] [varchar](50) NOT NULL,
	[supplierAddressLine2] [varchar](50) NOT NULL,
	[supplierCity] [varchar](50) NOT NULL,
	[supplierState] [varchar](50) NOT NULL,
	[supplierPinCode] [char](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamC].[suppliers]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamC].[suppliers](
	[supplierID] [uniqueidentifier] NOT NULL,
	[supplierName] [varchar](50) NOT NULL,
	[supplierMobile] [char](10) NOT NULL,
	[supplierEmail] [varchar](50) NOT NULL,
	[supplierPassword] [varchar](15) NOT NULL,
	[creationDate] [datetime] NULL,
	[lastModified] [datetime] NULL,
 CONSTRAINT [SupplierId_Pk] PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[supplierEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[supplierName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[supplierMobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamC].[SystemUser]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamC].[SystemUser](
	[SystemUserID] [uniqueidentifier] NOT NULL,
	[SystemUserName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[CreationDateTime] [datetime] NOT NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TeamC.SystemUser] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamC].[Users]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamC].[Users](
	[UserID] [uniqueidentifier] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[UserPassword] [varchar](15) NOT NULL,
	[UserType] [varchar](15) NOT NULL,
 CONSTRAINT [UserID_PK] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Email_Unique_notNull] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [TeamC].[DistributorAddresses]  WITH CHECK ADD  CONSTRAINT [DistributorId_Fk] FOREIGN KEY([Distributor_ID])
REFERENCES [TeamC].[Distributors] ([Distributor_ID])
GO
ALTER TABLE [TeamC].[DistributorAddresses] CHECK CONSTRAINT [DistributorId_Fk]
GO
ALTER TABLE [TeamC].[ProductsOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProductsOrder_ProductID] FOREIGN KEY([ProductID])
REFERENCES [TeamC].[ProductsInventory] ([ProductID])
GO
ALTER TABLE [TeamC].[ProductsOrder] CHECK CONSTRAINT [FK_ProductsOrder_ProductID]
GO
ALTER TABLE [TeamC].[RawMaterialOrder]  WITH CHECK ADD  CONSTRAINT [SupplierName_FK] FOREIGN KEY([SupplierID])
REFERENCES [TeamC].[suppliers] ([supplierID])
GO
ALTER TABLE [TeamC].[RawMaterialOrder] CHECK CONSTRAINT [SupplierName_FK]
GO
ALTER TABLE [TeamC].[RawMaterialOrderDetail]  WITH CHECK ADD  CONSTRAINT [OrderID_fk] FOREIGN KEY([OrderID])
REFERENCES [TeamC].[RawMaterialOrder] ([OrderID])
GO
ALTER TABLE [TeamC].[RawMaterialOrderDetail] CHECK CONSTRAINT [OrderID_fk]
GO
ALTER TABLE [TeamC].[supplierAddresses]  WITH CHECK ADD  CONSTRAINT [Foreignkey_Fk] FOREIGN KEY([SupplierID])
REFERENCES [TeamC].[suppliers] ([supplierID])
GO
ALTER TABLE [TeamC].[supplierAddresses] CHECK CONSTRAINT [Foreignkey_Fk]
GO
/****** Object:  StoredProcedure [TeamC].[AddDistributor]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[AddDistributor](@distName varchar(40), @distMob char(10),@distEmail varchar(50) ,@distPass varchar(15))
as
begin
declare @distID uniqueidentifier
set @distID = newid()
declare @createdOn datetime
set @createdOn = SYSDATETIME()
declare @lastModifiedOn datetime
set @lastModifiedOn = sysdatetime()

if @distName IS NULL OR @distName=''
throw 50001,'Invalid Distributor name',2

if @distMob IS NULL OR @distMob=''
throw 50001,'Invalid Mobile number',3

if @distEmail IS NULL OR @distEmail=''
throw 50001,'Invalid Distributor Email',4

if @distPass IS NULL OR @distPass=''
throw 50001,'Invalid Distributor password',5

insert into TeamC.Distributors(Distributor_ID,Distributor_Name,Distributor_Mobile,Distributor_Email,Distributor_Password,Created_On,Last_Modified_On)
values (@distID,@distName,@distMob,@distEmail,@distPass,@createdOn,@lastModifiedOn)

end
GO
/****** Object:  StoredProcedure [TeamC].[AddDistributorAddress]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [TeamC].[AddDistributorAddress]( @disID uniqueidentifier, @AdLine1 varchar(50),@AdLine2 varchar(50) ,@city varchar(50),@state varchar(50),@pcode char(6) )
as 
begin
Declare @disAdID uniqueidentifier
set @disAdID=newid()
 


if @AdLine1 IS NULL OR @AdLine1=''
throw 50001,'Invalid Address line1',3
if @AdLine2 IS NULL OR @AdLine2=''
throw 50001,'Invalid Address line2',4

if @city IS NULL OR @city=''
throw 50001,'Invalid City name',5
if @State IS NULL OR @State=''
throw 50001,'Invalid State name',6
if @pcode IS NULL OR @pcode=''
throw 50001,'Invalid PinCode',7


insert into TeamC.DistributorAddresses(DistributorAddress_ID,Distributor_ID,DistributorAddressLine1,DistributorAddressLine2,Distributor_City,Distributor_State,Distributor_PinCode )
values (@disAdID,@disID,@AdLine1,@AdLine2,@city,@State,@pcode)
end


GO
/****** Object:  StoredProcedure [TeamC].[AddProduct]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamC].[AddProduct] ( @ProductName varchar(100) ,
@ProductType varchar(100) ,
@UnitPrice money, @CreationTime datetime)
as
begin
--Created by Sagar
--purpose: adding the products
declare @ProductID uniqueidentifier
set @ProductID= NEWID()



	if @ProductName=''
		throw 50000,'Empty product names are not allowed',1;
	if @UnitPrice <= 0.0
		throw 50000,'Empty and negative product price are not allowed',1;
	
	begin try
		insert into TeamC.ProductsInventory(ProductID,ProductName,ProductType,UnitPrice,CreationTime) 
		values(@ProductID,@ProductName,@ProductType, @UnitPrice, @CreationTime )
	end try
	begin catch
		throw;
	end catch
	return 9999;
end


GO
/****** Object:  StoredProcedure [TeamC].[AddProductsOrder]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  procedure [TeamC].[AddProductsOrder](

 
@productName varchar(50),
@productType varchar(50),
@quantity decimal, 
@unitPrice decimal,
@amount decimal,
@productID uniqueidentifier)
as 
begin

declare @ProductsOrderID uniqueidentifier
set @ProductsOrderID= NEWID()
declare @createdOn datetime
set @createdOn = SYSDATETIME()


	if @productName IS NULL or @productName=''
	throw 50001, 'Invalid Product Name', 2
	if @quantity IS NULL or @quantity <= 0
	throw 50001, 'Invalid Product Quantity', 3
	if @unitPrice IS NULL or @unitPrice <= 0
	throw 50001, 'Invalid Product Unit Price', 4
	if @amount IS NULL or @amount <= 0
	throw 50001, 'Invalid ProductAmount', 4

insert into TeamC.ProductsOrder( ProductsOrderID,ProductID, ProductName, ProductType, ProductQuantity, UnitPrice, Amount, CreationTime)
values(@productsOrderID,@productID, @productName,@productType,  @quantity, @unitPrice,@amount, @createdOn)

end



GO
/****** Object:  StoredProcedure [TeamC].[AddRawMaterial]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[AddRawMaterial](
@rawMaterialID uniqueidentifier,
@name varchar(50), 
@unitPrice decimal, 
@minQuantity decimal, 
@availableQuantity decimal,
@reqdQty decimal)
as 
begin
declare @createdOn datetime
set @createdOn = SYSDATETIME()
declare @modifiedOn datetime
set @modifiedOn = SYSDATETIME()

	if @name IS NULL or @name=''
	throw 50001, 'Invalid Raw Material Name', 2
	if @unitPrice IS NULL or @unitPrice <= 0
	throw 50001, 'Invalid Raw Material Unit Price', 3
	if @minQuantity IS NULL or @minQuantity <= 0
	throw 50001, 'Invalid Raw Material Min Quantity', 4
	if @availableQuantity IS NULL or @availableQuantity <= 0
	throw 50001, 'Invalid Raw Material Available Quantity', 5

	if(@minQuantity>@availableQuantity) set @reqdQty = @minQuantity-@availableQuantity
	else set @reqdQty=0
		
insert into TeamC.RawMaterial(RawMaterialID, Name, UnitPrice, MinQuantity, AvailableQuantity, ReqdQuantity, CreatedOn, ModifiedOn)
values(@rawMaterialID, @name, @unitPrice, @minQuantity, @availableQuantity, @reqdQty, @createdOn, @modifiedOn)

end
GO
/****** Object:  StoredProcedure [TeamC].[AddRawMaterialOrder]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[AddRawMaterialOrder](
@orderID uniqueidentifier,
@supplierID uniqueidentifier,
@totalAmount decimal,
@totalQuantity decimal)
as 
begin

declare @createdOn datetime
set @createdOn = SYSDATETIME()
declare @modifiedOn datetime
set @modifiedOn = SYSDATETIME()

	if @supplierID IS NULL
	throw 50001, 'Invalid Supplier', 2

insert into TeamC.RawMaterialOrder(OrderID, SupplierID, TotalAmount, TotalQuantity, CreationTime, ModificationTime)
values(@orderID, @supplierID, @totalAmount, @totalQuantity, @createdOn, @modifiedOn)

end
GO
/****** Object:  StoredProcedure [TeamC].[AddRawMaterialOrderDetail]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[AddRawMaterialOrderDetail](
@orderDetailID uniqueidentifier, 
@orderID uniqueidentifier, 
@rawMaterialName varchar(50),
@quantity decimal, 
@unitPrice decimal,
@amount decimal)
as 
begin

declare @createdOn datetime
set @createdOn = SYSDATETIME()
declare @modifiedOn datetime
set @modifiedOn = SYSDATETIME()

	if @rawMaterialName IS NULL or @rawMaterialName=''
	throw 50001, 'Invalid Raw Material Name', 2
	if @quantity IS NULL or @quantity <= 0
	throw 50001, 'Invalid Raw Material Quantity', 3
	if @unitPrice IS NULL or @unitPrice <= 0
	throw 50001, 'Invalid Raw Material Unit Price', 4

insert into TeamC.RawMaterialOrderDetail(OrderDetailID, OrderID, Name, Quantity, UnitPrice, Amount, CreationTime, ModificationTime)
values(@orderDetailID,@orderID, @rawMaterialName,  @quantity, @unitPrice,@amount, @createdOn, @modifiedOn)

end
GO
/****** Object:  StoredProcedure [TeamC].[AddSupplier]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[AddSupplier]( @supName varchar(50), @supMob char(10),@supEmail varchar(50) ,@supPass varchar(15))
as 
begin
Declare @supID uniqueidentifier
set @supID=newid()
DEclare @creatDate DateTime
set @creatDate = SYSDATETIME()
Declare @modifiedDate DateTime
set  @modifiedDate =sysdatetime()


if @supName IS NULL OR @supName=''
throw 50001,'Invalid Supplier name',2

if @supMob IS NULL OR @supMob=''
throw 50001,'Invalid Mobile number',3

if @supEmail IS NULL OR @supEmail=''
throw 50001,'Invalid Supplier Email',4

if @supPass IS NULL OR @supPass=''
throw 50001,'Invalid Supplier password',5

insert into TeamC.suppliers(supplierID,supplierName,supplierMobile,supplierEmail, supplierPassword,creationDate,lastModified)
values (@supID,@supName,@supMob,@supEmail,@supPass,sysdatetime(),sysdatetime())

 end
GO
/****** Object:  StoredProcedure [TeamC].[AddSupplierAddress]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[AddSupplierAddress]( @supID uniqueidentifier, @AdLine1 varchar(50),@AdLine2 varchar(50) ,@city varchar(50),@state varchar(50),@pcode char(6) )
as 
begin
Declare @supAdID uniqueidentifier
set @supAdID=newid()
 


if @AdLine1 IS NULL OR @AdLine1=''
throw 50001,'Invalid Adress line1',3
if @AdLine2 IS NULL OR @AdLine2=''
throw 50001,'Invalid Address line2',4

if @city IS NULL OR @city=''
throw 50001,'Invalid City name',5
if @State IS NULL OR @State=''
throw 50001,'Invalid State name',6
if @pcode IS NULL OR @pcode=''
throw 50001,'Invalid PinCode',7


insert into TeamC.supplierAddresses(SupplierAddressID,SupplierID,supplierAddressLine1,supplierAddressLine2,supplierCity,supplierState,supplierPinCode )
values (@supAdID,@supID,@AdLine1,@AdLine2,@city,@State,@pcode)
Select @@ROWCOUNT,@supAdID
end
GO
/****** Object:  StoredProcedure [TeamC].[AddSupplierPayment]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[AddSupplierPayment](@supTrans nchar(6),@supName varchar(50), @rawName char(50),@supAmt decimal(18,0),@supMethod varchar(20) ,@supStatus varchar(20))
as
begin
  Declare @supID uniqueidentifier
  set @supID=(select TOP 1 supplierID from TeamC.suppliers ORDER BY NEWID())
  Declare @InvoiceCode int
  set @InvoiceCode=(select TOP 1 OrderInvoiceCode from TeamC.RawMaterialOrders ORDER BY NEWID())
  Declare @orderDate DateTime
  set @orderDate = (select TOP 1 CreationTime from TeamC.RawMaterialOrders ORDER BY NEWID())
  Declare @payDate DateTime
  set  @payDate =sysdatetime()

  if @supName IS NULL OR @supName=''
  throw 50001,'Invalid Supplier name',2

  if @rawName IS NULL OR @rawName=''
  throw 50001,'Invalid Raw Material Name',3

  insert into TeamC.SupPayment(SupOrderInvoiceCode,SupplierID,SupName,RawName,SupAmount,SupChequeNoTransNo,RawOrderCreationDate,SupPaymentDate,SupMethod,SupStatus)
  values (@InvoiceCode,@supID,@supName,@rawName,@supAmt,@supTrans,@orderDate,@payDate,@supMethod,@supStatus)
  SELECT  @@ROWCOUNT,@supID;
end
GO
/****** Object:  StoredProcedure [TeamC].[AddSystemUser]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Stored Procedure to Add System User
Create procedure [TeamC].[AddSystemUser]( @sysName varchar(50),@sysEmail varchar(50) ,@sysPass varchar(15))
as
begin
Declare @sysID uniqueidentifier
set @sysID=newid()
DEclare @creatDate DateTime
set @creatDate = SYSDATETIME()
Declare @modifiedDate DateTime
set  @modifiedDate =sysdatetime()


if @sysName IS NULL OR @sysName=''
throw 50001,'Invalid SystemUser name',2

if @sysEmail IS NULL OR @sysEmail=''
throw 50001,'Invalid SystemUser Email',4

if @sysPass IS NULL OR @sysPass=''
throw 50001,'Invalid SystemUser password',5

insert into TeamC.SystemUser(SystemUserID,SystemUserName,Email,Password,CreationDateTime,LastModifiedDateTime)
values (@sysID,@sysName,@sysEmail,@sysPass,@creatDate,@modifiedDate)

    SELECT  @@ROWCOUNT,@sysID;
end

GO
/****** Object:  StoredProcedure [TeamC].[DeleteDistributor]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[DeleteDistributor](@distID uniqueidentifier)
as
begin
	begin try
		delete from TeamC.Distributors where Distributor_ID=@distID
	end try
	begin catch
		print @@error;
		throw 50001,'Invalid values fetched',3
		return 0
	end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[DeleteDistributorAddress]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [TeamC].[DeleteDistributorAddress](@disAdID uniqueidentifier)
as 
begin
	begin try
		DELETE FROM TeamC.DistributorAddresses where DistributorAddress_ID=@disAdID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',3
		return 0
    end catch
end


GO
/****** Object:  StoredProcedure [TeamC].[DeleteProduct]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[DeleteProduct](@productID uniqueidentifier)
as
begin
delete TeamC.ProductsInventory where ProductID = @productID
end

GO
/****** Object:  StoredProcedure [TeamC].[DeleteProductsOrder]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[DeleteProductsOrder](@productsOrderID uniqueidentifier)
as
begin
delete TeamC.ProductsOrder where ProductsOrderID = @productsOrderID
end


GO
/****** Object:  StoredProcedure [TeamC].[DeleteRawMaterial]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[DeleteRawMaterial](@rawMaterialID uniqueidentifier)
as 
begin
	begin try
		DELETE FROM TeamC.RawMaterial where RawMaterialID = @rawMaterialID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',3
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [TeamC].[DeleteRawMaterialOrder]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[DeleteRawMaterialOrder](@orderInvoiceCode int)
as 
begin
	begin try
		DELETE FROM TeamC.RawMaterialOrder where OrderInvoiceCode = @orderInvoiceCode
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',3
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[DeleteRawMaterialOrderDetail]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[DeleteRawMaterialOrderDetail](@orderDetailID uniqueidentifier)
as 
begin
	begin try
		DELETE FROM TeamC.RawMaterialOrderDetails where OrderDetailID = @orderDetailID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',3
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [TeamC].[DeleteSupplier]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[DeleteSupplier](@supID uniqueidentifier)
as 
begin
	begin try
		DELETE FROM TeamC.suppliers where supplierID=@supID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',3
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[DeleteSupplierAddress]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[DeleteSupplierAddress](@supAdID uniqueidentifier)
as 
begin
	begin try
		DELETE FROM TeamC.supplierAddresses where SupplierAddressID=@supAdID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',3
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [TeamC].[DeleteSystemUser]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Delete SystemUser Procedure
create procedure [TeamC].[DeleteSystemUser](@sysID uniqueidentifier)
as
begin
begin try
 DELETE FROM TeamC.SystemUser where SystemUserID=@sysID
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',3
 return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetAdminbyAdminEmailandPass]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Get Admin by Email & Password
create procedure [TeamC].[GetAdminbyAdminEmailandPass](@adminEmail varchar(50) ,@adminPass varchar(30))
as
begin
begin try
 SELECT* FROM TeamC.Admin where AdminEmail=@adminEmail and AdminPassword=@adminPass
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',6
 return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetAdminByAdminID]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Get Admin By Admin ID
Create procedure [TeamC].[GetAdminByAdminID]( @adminID uniqueIdentifier)
as
begin
begin try
 SELECT* FROM TeamC.Admin where AdminID=@adminID
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',6
 return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetAllDistributorAddress]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [TeamC].[GetAllDistributorAddress]
as 
begin 
	begin try 
	select*from TeamC.DistributorAddresses
	end try
	begin catch
		PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',2
		return 0
    end catch
end


GO
/****** Object:  StoredProcedure [TeamC].[GetAllDistributors]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetAllDistributors]
as
begin
	begin try
		select * from TeamC.Distributors
	end try
	begin catch
		print @@error;
		throw 50001,'Invalid values Fetched',2
		return 0
	end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetAllProductbyProductName]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetAllProductbyProductName] (@ProductName varchar(100))
as
begin
--get all products by name
--created by sagar
select *from TeamC.ProductsInventory
where ProductName= @ProductName
end

GO
/****** Object:  StoredProcedure [TeamC].[GetAllProductbyProductType]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetAllProductbyProductType] (@ProductType varchar(100))
as
begin
--get all products by type
--created by sagar
select *from ProductsInventory.Products
where ProductType= @ProductType
end

GO
/****** Object:  StoredProcedure [TeamC].[GetAllProducts]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetAllProducts]
as
begin
--get all products
--created by sagar
select *from TeamC.ProductsInventory
end

GO
/****** Object:  StoredProcedure [TeamC].[GetAllProductsOrder]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamC].[GetAllProductsOrder] 
as
begin
--get all productsOrder by id
--created by sagar
select *from TeamC.ProductsOrder
end
GO
/****** Object:  StoredProcedure [TeamC].[GetAllRawMaterialOrderDetails]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetAllRawMaterialOrderDetails]
as 
begin 
	begin try 
	select * from TeamC.RawMaterialOrderDetails
	end try
	begin catch
		PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',2
		return 0
    end catch
	select @@RowCount
end
GO
/****** Object:  StoredProcedure [TeamC].[GetAllRawMaterialOrders]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetAllRawMaterialOrders]
as 
begin 
	begin try 
	select*from TeamC.RawMaterialOrders
	end try
	begin catch
		PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',2
		return 0
    end catch
	select @@RowCount
end

GO
/****** Object:  StoredProcedure [TeamC].[GetAllRawMaterials]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetAllRawMaterials]
as 
begin 
	begin try 
	select*from TeamC.RawMaterial
	end try
	begin catch
		PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',2
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetAllSupplier]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetAllSupplier]
as 
begin 
	begin try 
	select*from TeamC.suppliers
	end try
	begin catch
		PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',2
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetAllSupplierAddress]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetAllSupplierAddress]
as 
begin 
	begin try 
	select*from TeamC.SupplierAddresses
	end try
	begin catch
		PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',2
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [TeamC].[GetAllSupplierPayment]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetAllSupplierPayment]
as
begin
	begin try
		select * from TeamC.SupPayment
	end try
	begin catch
		print @@error;
		throw 50001,'Invalid Values Fetched',2
		return 0
	end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetAllSystemUsers]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Get All System Users
create procedure [TeamC].[GetAllSystemUsers]
as
begin
begin try
select*from TeamC.SystemUser
end try
begin catch
 PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',2
 return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetDistributorAddressbyDistributorAddressID]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [TeamC].[GetDistributorAddressbyDistributorAddressID](@disAdID uniqueidentifier)
as 
begin
	begin try
		SELECT* FROM TeamC.DistributorAddresses where DistributorAddress_ID=@disAdID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetDistributorAddressByDistributorAddressLine1]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [TeamC].[GetDistributorAddressByDistributorAddressLine1](@AdLine1 varchar(50))
as 
begin
	begin try
		SELECT* FROM TeamC.DistributorAddresses where DistributorAddressLine1=@AdLine1
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [TeamC].[GetDistributorbyDistributorID]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetDistributorbyDistributorID](@distID uniqueidentifier)
as
begin
begin try
 SELECT* FROM TeamC.Distributors where Distributor_ID=@distID
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',6
 return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetDistributorbyEmail]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetDistributorbyEmail](@distEmail varchar(50))
as
begin
begin try
 SELECT* FROM TeamC.Distributors where Distributor_Email=@distEmail
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',7
 return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetDistributorByEmailAndPassword]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetDistributorByEmailAndPassword](@distEmail varchar(50),@distPass varchar(15))
as
begin
	begin try
		select * from TeamC.Distributors 
		where Distributor_Email=@distEmail
		and Distributor_Password=@distPass;
	end try
	begin catch
		print @@error;
		throw 50001, 'Invalid Values Fetched',6
		return 0
	end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetDistributorByName]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[GetDistributorByName](@distName varchar(50))
as
begin
	begin try
		select * from TeamC.Distributors where Distributor_Name=@distName;
	end try
	begin catch
		print @@error;
		throw 50001, 'Invalid Values Fetched',6
		return 0
	end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetOrderbyOrderID]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetOrderbyOrderID](@orderID uniqueidentifier)
as 
begin
	begin try
		SELECT* FROM TeamC.RawMaterialOrders where OrderID=@orderID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
	select @@RowCount
end

GO
/****** Object:  StoredProcedure [TeamC].[GetOrderbyOrderInvoiceCode]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetOrderbyOrderInvoiceCode](@orderInvoiceCode int)
as 
begin
	begin try
		SELECT* FROM TeamC.RawMaterialOrders where OrderInvoiceCode=@orderInvoiceCode
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
	select @@RowCount
end
GO
/****** Object:  StoredProcedure [TeamC].[GetOrderDetailbyOrderDetailID]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetOrderDetailbyOrderDetailID](@orderDetailID uniqueidentifier)
as 
begin
	begin try
		SELECT* FROM TeamC.RawMaterialOrderDetails where OrderDetailID=@orderDetailID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
	select @@RowCount
end
GO
/****** Object:  StoredProcedure [TeamC].[GetOrderDetailbyOrderInvoiceCode]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetOrderDetailbyOrderInvoiceCode](@orderInvoiceCode int)
as 
begin
	begin try
		SELECT* FROM TeamC.RawMaterialOrderDetails where OrderInvoiceCode=@orderInvoiceCode
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
	select @@RowCount
end
GO
/****** Object:  StoredProcedure [TeamC].[GetProductByProductID]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [TeamC].[GetProductByProductID] (@ProductID uniqueidentifier)
as
begin
--get all products by id
--created by sagar
select *from ProductInventory.Products
where ProductID= @ProductID
end

GO
/****** Object:  StoredProcedure [TeamC].[GetProductsOrderByOrderID]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamC].[GetProductsOrderByOrderID] (@ProductsOrderID uniqueidentifier)
as
begin
--get all productsOrder by id
--created by sagar
select *from TeamC.ProductsOrder
where ProductsOrderID= @ProductsOrderID
end


GO
/****** Object:  StoredProcedure [TeamC].[GetRawMaterialbyName]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetRawMaterialbyName](@rawmaterialName varchar(50))
as 
begin
	begin try
		SELECT* FROM TeamC.RawMaterialInventory where Name=@rawmaterialName
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetRawMaterialbyRawMaterialID]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [TeamC].[GetRawMaterialbyRawMaterialID](@rawmaterialID uniqueidentifier)
as 
begin
	begin try
		SELECT* FROM TeamC.RawMaterialInventory where RawMaterialId=@rawmaterialID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
	select @@RowCount
end
GO
/****** Object:  StoredProcedure [TeamC].[GetSupplierAddressbySupplierAddressID]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetSupplierAddressbySupplierAddressID](@supAdID uniqueidentifier)
as 
begin
	begin try
		SELECT* FROM TeamC.supplierAddresses where supplierAddressID=@supAdID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetSupplierAddressbysupplierAddressLine1]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetSupplierAddressbysupplierAddressLine1](@AdLine1 varchar(50))
as 
begin
	begin try
		SELECT* FROM TeamC.supplierAddresses where supplierAddressLine1=@AdLine1
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetSupplierbyEmail]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetSupplierbyEmail](@supEmail varchar(50))
as 
begin
	begin try
		SELECT* FROM TeamC.suppliers where supplierEmail=@supEmail
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',7
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetSupplierbySupplierEmailandPass]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetSupplierbySupplierEmailandPass](@supEmail varchar(50) ,@supPass varchar(15))
as 
begin
	begin try
		SELECT* FROM TeamC.suppliers where supplierEmail=@supEmail and supplierPassword=@supPass
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetSupplierbySupplierID]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[GetSupplierbySupplierID](@supID uniqueidentifier)
as 
begin
	begin try
		SELECT* FROM TeamC.suppliers where supplierID=@supID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetSupplierbySupplierName]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[GetSupplierbySupplierName]( @supName varchar(50))
as 
begin
	begin try
		SELECT* FROM TeamC.suppliers where supplierName=@supName
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',6
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetSystemUserBySystemUserEmail]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Get supplier by Name
Create procedure [TeamC].[GetSystemUserBySystemUserEmail]( @sysEmail varchar(50))
as
begin
begin try
 SELECT* FROM TeamC.SystemUser where Email=@sysEmail
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',6
 return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetSystemUserbySystemUserEmailandPass]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Get SystemUser by Email Password
create procedure [TeamC].[GetSystemUserbySystemUserEmailandPass](@sysEmail varchar(50) ,@sysPass varchar(30))
as
begin
begin try
 SELECT* FROM TeamC.SystemUser where Email=@sysEmail and Password=@sysPass
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',6
 return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetSystemUserBySystemUserID]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Get supplier by Name
Create procedure [TeamC].[GetSystemUserBySystemUserID]( @sysID uniqueIdentifier)
as
begin
begin try
 SELECT* FROM TeamC.SystemUser where SystemUserID=@sysID
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',6
 return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[GetSystemUserbySystemUserName]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Get System User by Name
Create procedure [TeamC].[GetSystemUserbySystemUserName](@sysName varchar(50))
as
begin
begin try
 SELECT* FROM TeamC.SystemUser where SystemUserName=@sysName
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',6
 return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[UpdateAdmin]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamC].[UpdateAdmin](@adminID uniqueidentifier,@adminEmail varchar(50),@adminName varchar(50))
as
begin
Declare @modifiedDate DateTime
set  @modifiedDate =sysdatetime()
begin try
 UPDATE TeamC.Admin
 SET AdminEmail=@adminEmail ,AdminName=@adminName
 WHERE AdminID=@adminID
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',4
 return 0
    end catch
Select @@RowCount
end
GO
/****** Object:  StoredProcedure [TeamC].[UpdateAdminPassword]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--update Admin Password Procedure
CREATE procedure [TeamC].[UpdateAdminPassword](@adminID uniqueidentifier,@adminPass varchar(30) )
as
begin
Declare @modifiedDate DateTime
set  @modifiedDate =sysDatetime()
begin try
 UPDATE TeamC.Admin
 SET AdminPassword=@adminPass
 WHERE AdminID=@adminID
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',4
 return 0
    end catch
Select @@RowCount
end
GO
/****** Object:  StoredProcedure [TeamC].[UpdateDistributor]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[UpdateDistributor](@distID uniqueidentifier, @distName varchar(50), @distMobile char(10), @distEmail varchar(50))
as
begin
declare @lastModifiedOn datetime
set @lastModifiedOn = sysdatetime()
	begin try
		update TeamC.Distributors
		set Distributor_Name = @distName, Distributor_Mobile = @distMobile, Distributor_Email = @distEmail
		where Distributor_ID = @distID
	end try
	begin catch
	Print @@error;
	throw 50001, 'Invalid Values Fetched',4
	return 0
	end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[UpdateDistributorAddress]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [TeamC].[UpdateDistributorAddress](@disAdID uniqueidentifier,@disID uniqueidentifier,@AdLine1 varchar(50),@AdLine2 varchar(50),@city varchar(50),@state varchar(50),@pcode char(6))
as 
begin
	begin try
		UPDATE TeamC.DistributorAddresses
		SET Distributor_ID=@disID, DistributorAddressLine1=@AdLine1,DistributorAddressLine2=@AdLine2,Distributor_City=@city,Distributor_State=@state,Distributor_Pincode=@pcode
		WHERE DistributorAddress_ID=@disAdID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',4
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [TeamC].[UpdateProduct]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[UpdateProduct] (@ProductID uniqueidentifier ,@ProductName varchar(100) ,
@ProductType varchar(100) ,
@UnitPrice money)
as
begin
--update product
--created by sagar
update TeamC.ProductsInventory set ProductName =@ProductName, ProductType = @ProductType , UnitPrice = @UnitPrice where ProductID = @ProductID
end


GO
/****** Object:  StoredProcedure [TeamC].[UpdateProductsOrder]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [TeamC].[UpdateProductsOrder] (@ProductsOrderID uniqueidentifier ,@ProductName varchar(100) ,
@ProductType varchar(100) ,@ProductQuantity decimal,
@UnitPrice money, @Amount money)
as
begin
--update product order
--created by sagar
update TeamC.ProductsOrder set ProductName =@ProductName, ProductType = @ProductType, ProductQuantity= @ProductQuantity, UnitPrice=@UnitPrice where ProductsOrderID = @ProductsOrderID
end



GO
/****** Object:  StoredProcedure [TeamC].[UpdateRawMaterial]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[UpdateRawMaterial](
@rawMaterialID uniqueidentifier,
@name varchar(50), 
@unitPrice decimal, 
@minQuantity decimal, 
@availableQuantity decimal,
@reqdQty decimal)
as 
begin
declare @modifiedOn datetime
set @modifiedOn = SYSDATETIME()

if(@minQuantity>@availableQuantity) set @reqdQty = @minQuantity-@availableQuantity
	else set @reqdQty=0

	begin try
		UPDATE TeamC.RawMaterial
		SET Name=@name, UnitPrice=@unitPrice, MinQuantity=@minQuantity, AvailableQuantity = @availableQuantity, ModifiedOn=@modifiedOn, ReqdQuantity=@reqdQty
		WHERE RawMaterialID=@rawMaterialID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',4
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[UpdateRawMaterialOrder]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[UpdateRawMaterialOrder](
@orderInvoiceCode int,
@supplierId uniqueidentifier,
@totalAmount decimal,
@totalQuantity decimal)
as 
begin
declare @modifiedOn datetime
set @modifiedOn = SYSDATETIME()

	begin try
		UPDATE TeamC.RawMaterialOrder
		SET SupplierID=@supplierId, ModificationTime=@modifiedOn, TotalAmount = @totalAmount, TotalQuantity=@totalQuantity
		WHERE OrderInvoiceCode =@orderInvoiceCode
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',4
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [TeamC].[UpdateRawMaterialOrderDetail]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[UpdateRawMaterialOrderDetail](
@orderDetailID uniqueidentifier,  
@rawMaterialName varchar(50),
@quantity decimal, 
@unitPrice decimal)
as 
begin
declare @modifiedOn datetime
set @modifiedOn = SYSDATETIME()
	begin try
		UPDATE TeamC.RawMaterialOrderDetails
		SET RawMaterialName=@rawMaterialName, UnitPrice=@unitPrice, Quantity=@quantity, ModificationTime=@modifiedOn
		WHERE OrderDetailID=@orderDetailID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',4
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[UpdateSupplier]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[UpdateSupplier](@supID uniqueidentifier, @supName varchar(50), @supMob char(10),@supEmail varchar(50) )
as 
begin
Declare @modifiedDate DateTime
set  @modifiedDate =sysdatetime()
	begin try
		UPDATE TeamC.suppliers
		SET supplierName=@supName ,supplierMobile=@supMob, supplierEmail=@supEmail
		WHERE supplierID=@supID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',4
		return 0
    end catch

end
GO
/****** Object:  StoredProcedure [TeamC].[UpdateSupplierAddress]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[UpdateSupplierAddress](@supAdID uniqueidentifier,@supID uniqueidentifier,@AdLine1 varchar(50),@AdLine2 varchar(50),@city varchar(50),@state varchar(50),@pcode char(6))
as 
begin
	begin try
		UPDATE TeamC.supplierAddresses
		SET SupplierID=@supID, supplierAddressLine1=@AdLine1,supplierAddressLine2=@AdLine2,supplierCity=@city,supplierState=@state,supplierPinCode=@pcode
		WHERE SupplierAddressID=@supAdID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',4
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[UpdateSupplierPass]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamC].[UpdateSupplierPass](@supID uniqueidentifier, @supName varchar(50),@supPass varchar(15))
as 
begin
	begin try
		UPDATE TeamC.suppliers
		SET supplierPassword=@supPass
		WHERE supplierID=@supID
	end try
	begin catch
	PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',4
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [TeamC].[UpdateSupplierPayment]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamC].[UpdateSupplierPayment](@supMethod varchar(20),@supStatus varchar(20),@supInvoice int,@paymentDate dateTime,@supAmt decimal(18,0))
as
begin
begin try
 UPDATE TeamC.SupPayment
 SET SupMethod = @supMethod, SupStatus = @supStatus, SupPaymentDate = @paymentDate, SupAmount = @supAmt
 WHERE SupOrderInvoiceCode = @supInvoice
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',4
 return 0
    end catch
Select @@RowCount
end

GO
/****** Object:  StoredProcedure [TeamC].[UpdateSystemUser]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--update System User Details Procedure
CREATE procedure [TeamC].[UpdateSystemUser](@sysID uniqueidentifier,@sysName varchar(50),@sysEmail varchar(50))
as
begin
Declare @modifiedDate DateTime
set  @modifiedDate =sysdatetime()
begin try
 UPDATE TeamC.SystemUser
 SET Email=@sysEmail,SystemUserName=@sysName
 WHERE SystemUserID=@sysID
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',4
 return 0
    end catch
Select @@RowCount
end
GO
/****** Object:  StoredProcedure [TeamC].[UpdateSystemUserPassword]    Script Date: 06-11-2019 09:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--update System User Password Procedure
Create procedure [TeamC].[UpdateSystemUserPassword](@sysID uniqueidentifier,@sysPass varchar(30) )
as
begin
Declare @modifiedDate DateTime
set  @modifiedDate =sysdatetime()
begin try
 UPDATE TeamC.SystemUser
 SET Password=@sysPass
 WHERE SystemUserID=@sysID
end try
begin catch
PRINT @@ERROR;
 throw 50001,'Invalid Values Fetched',4
 return 0
    end catch
Select @@RowCount
end
GO
