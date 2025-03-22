USE [TripAdvisor2]

CREATE TABLE dbo.Bookings (
	id int IDENTITY(1,1) NOT NULL,
	resort_id int NOT NULL,
	email nvarchar(100) NOT NULL,
	checkin datetime NOT NULL,
	checkout datetime NOT NULL,
	adults int NULL,
	kids int NULL,
	rooms int NULL,
	total_cost decimal(18, 0) NULL,
	creation_date datetime NOT NULL
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

