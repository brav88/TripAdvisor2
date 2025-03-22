USE [TripAdvisor2]
GO
/****** Object:  StoredProcedure [dbo].[saveBooking]    Script Date: 21/3/2025 18:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[saveBooking]
	@resort_id int,
	@email nvarchar(100),
	@checkin datetime,
	@checkout datetime,
	@adults int,
	@kids int,
	@rooms int,
	@total_cost decimal(18,0)
AS
BEGIN
	INSERT INTO [dbo].[Bookings]
           ([resort_id]
		   ,[email]
           ,[checkin]
           ,[checkout]
           ,[adults]
           ,[kids]
           ,[rooms]
           ,[total_cost]
           ,[creation_date])
     VALUES
           (@resort_id
		   ,@email
           ,@checkin
           ,@checkout
           ,@adults
           ,@kids
           ,@rooms
           ,@total_cost
           ,GETDATE())
END
