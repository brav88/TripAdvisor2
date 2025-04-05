USE [TripAdvisor2]
GO
/****** Object:  StoredProcedure [dbo].[deleteBookings]    Script Date: 28/3/2025 20:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteBooking] 
	@id int
AS
BEGIN
	DELETE FROM [TripAdvisor2].[dbo].[Bookings]
	WHERE id = @id
END
