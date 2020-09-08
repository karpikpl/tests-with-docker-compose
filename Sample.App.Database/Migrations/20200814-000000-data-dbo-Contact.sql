/*
 WORD OF CAUTION - in production senarios, test data should not be kept together with schema.
 Ideally there are 2 seed projects. In prod deployments - only schema and ref data is deployed. For testing both schema and test data are deployed.
*/

SET IDENTITY_INSERT [dbo].[Contact]  ON
GO
INSERT [dbo].[Contact]
    ([ID], [FIRSTNAME], [LASTNAME], [DOB], [GENDER], [EYECOLOR], [EMAIL], [PHONENUMBER])
VALUES
    (1, 'John', 'Doe', '1947-01-01', 'M', NULL, 'JohnDoe@gmail.com', NULL)
INSERT [dbo].[Contact]
    ([ID], [FIRSTNAME], [LASTNAME], [DOB], [GENDER], [EYECOLOR], [EMAIL], [PHONENUMBER])
VALUES
    (2, 'John1', 'Doe', '1957-01-01', 'M', NULL, 'JohnDoe@gmail.com', NULL)
INSERT [dbo].[Contact]
    ([ID], [FIRSTNAME], [LASTNAME], [DOB], [GENDER], [EYECOLOR], [EMAIL], [PHONENUMBER])
VALUES
    (3, 'John2', 'Doe', '1967-01-01', 'M', NULL, 'JohnDoe@gmail.com', NULL)
INSERT [dbo].[Contact]
    ([ID], [FIRSTNAME], [LASTNAME], [DOB], [GENDER], [EYECOLOR], [EMAIL], [PHONENUMBER])
VALUES
    (4, 'John3', 'Doe', '1977-01-01', 'M', NULL, 'JohnDoe@gmail.com', NULL)
INSERT [dbo].[Contact]
    ([ID], [FIRSTNAME], [LASTNAME], [DOB], [GENDER], [EYECOLOR], [EMAIL], [PHONENUMBER])
VALUES
    (5, 'John4', 'Doe', '1987-01-01', 'M', NULL, 'JohnDoe@gmail.com', NULL)
INSERT [dbo].[Contact]
    ([ID], [FIRSTNAME], [LASTNAME], [DOB], [GENDER], [EYECOLOR], [EMAIL], [PHONENUMBER])
VALUES
    (6, 'John5', 'Doe', '1997-01-01', 'M', NULL, 'JohnDoe@gmail.com', NULL)
GO
SET IDENTITY_INSERT [dbo].[Contact]  OFF
GO
