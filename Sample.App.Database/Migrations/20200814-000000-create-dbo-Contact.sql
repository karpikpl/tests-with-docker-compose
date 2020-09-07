CREATE TABLE [dbo].[Contact]
(
        ID INT IDENTITY NOT NULL,
        FIRSTNAME NVARCHAR(255) NOT NULL,
        LASTNAME NVARCHAR(255) NOT NULL,
        DOB DATE NOT NULL,
        GENDER CHAR(1) NULL,
        EYECOLOR NVARCHAR(150) NULL,
        EMAIL NVARCHAR(255) NULL,
        PHONENUMBER NVARCHAR(15) NULL,
        [CreatedAt] [datetime2] NOT NULL DEFAULT GETUTCDATE(),
        [UpdatedAt] [datetime2] NULL,
        [DeletedAt] [datetime2] NULL,
        [CreatedBy] [nvarchar](100) NULL,
        [UpdatedBy] [nvarchar](100) NULL,
        [DeletedBy] [nvarchar](100) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [Contact_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]