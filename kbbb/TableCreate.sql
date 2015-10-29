USE [ClietBankStat]
GO

/****** Object:  Table [dbo].[PaymentCount]    Script Date: 29.10.2015 23:48:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PaymentCount](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[count] [bigint] NOT NULL,
	[countDate] [datetime] NOT NULL,
	[paymentstatus] [int] NOT NULL
) ON [PRIMARY]

GO


