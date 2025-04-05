USE [TripAdvisor2]
GO
/****** Object:  StoredProcedure [dbo].[getBookings]    Script Date: 28/3/2025 20:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[getBookings] 
	@email nvarchar(100)
AS
BEGIN
	SELECT * FROM [TripAdvisor2].[dbo].[Bookings]
	INNER JOIN [Resorts] ON [Bookings].resort_id = [Resorts].id
	WHERE email = @email
END
