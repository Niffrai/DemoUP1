
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/28/2024 10:54:30
-- Generated from EDMX file: C:\Users\Ноябрь21\Source\Repos\WindowsFormsApp1\WindowsFormsApp1\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [C:\USERS\НОЯБРЬ21\DOCUMENTS\LR6DB.MDF];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Login] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Role] nvarchar(max)  NOT NULL,
    [Student_Id] int  NULL
);
GO

-- Creating table 'ProfessorSet'
CREATE TABLE [dbo].[ProfessorSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Position] nvarchar(max)  NOT NULL,
    [PersonalData] nvarchar(max)  NOT NULL,
    [Photo] nvarchar(max)  NOT NULL,
    [User_Id] int  NOT NULL,
    [Student_Id] int  NULL
);
GO

-- Creating table 'ThesisSet'
CREATE TABLE [dbo].[ThesisSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Annotation] nvarchar(max)  NOT NULL,
    [ProfessorId] int  NOT NULL
);
GO

-- Creating table 'StudentSet'
CREATE TABLE [dbo].[StudentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [NumberGroup] nvarchar(max)  NOT NULL,
    [PersonalData] nvarchar(max)  NOT NULL,
    [Photo] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProfessorSet'
ALTER TABLE [dbo].[ProfessorSet]
ADD CONSTRAINT [PK_ProfessorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ThesisSet'
ALTER TABLE [dbo].[ThesisSet]
ADD CONSTRAINT [PK_ThesisSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StudentSet'
ALTER TABLE [dbo].[StudentSet]
ADD CONSTRAINT [PK_StudentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Student_Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [FK_StudentUser]
    FOREIGN KEY ([Student_Id])
    REFERENCES [dbo].[StudentSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentUser'
CREATE INDEX [IX_FK_StudentUser]
ON [dbo].[UserSet]
    ([Student_Id]);
GO

-- Creating foreign key on [User_Id] in table 'ProfessorSet'
ALTER TABLE [dbo].[ProfessorSet]
ADD CONSTRAINT [FK_UserProfessor]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserProfessor'
CREATE INDEX [IX_FK_UserProfessor]
ON [dbo].[ProfessorSet]
    ([User_Id]);
GO

-- Creating foreign key on [ProfessorId] in table 'ThesisSet'
ALTER TABLE [dbo].[ThesisSet]
ADD CONSTRAINT [FK_ProfessorThesis]
    FOREIGN KEY ([ProfessorId])
    REFERENCES [dbo].[ProfessorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProfessorThesis'
CREATE INDEX [IX_FK_ProfessorThesis]
ON [dbo].[ThesisSet]
    ([ProfessorId]);
GO

-- Creating foreign key on [Student_Id] in table 'ProfessorSet'
ALTER TABLE [dbo].[ProfessorSet]
ADD CONSTRAINT [FK_StudentProfessor]
    FOREIGN KEY ([Student_Id])
    REFERENCES [dbo].[StudentSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentProfessor'
CREATE INDEX [IX_FK_StudentProfessor]
ON [dbo].[ProfessorSet]
    ([Student_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------