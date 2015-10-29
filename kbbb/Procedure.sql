USE [ClietBankStat]
GO

/****** Object:  StoredProcedure [dbo].[AddPaymentInStatus]    Script Date: 29.10.2015 23:49:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddPaymentInStatus] 
@count BIGINT,
@payst INT
AS
BEGIN
  INSERT INTO  PaymentCount
  ([count],[countDate],[paymentstatus]) 
  VALUES ( @count, GETDATE(),@payst)
END


GO


