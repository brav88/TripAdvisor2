USE [TripAdvisor2]
GO
/****** Object:  StoredProcedure [dbo].[GetResorts]    Script Date: 21/2/2025 19:04:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetResorts]
AS
BEGIN
	SELECT * FROM [TripAdvisor2].[dbo].[Resorts]
END
