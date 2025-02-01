USE [TripAdvisor2]

CREATE TABLE [dbo].[Resorts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](200) NULL,
	[price] [decimal](18, 0) NULL,
	[photo] [nvarchar](500) NULL,
 CONSTRAINT [PK_Resorts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) ON [PRIMARY]
GO