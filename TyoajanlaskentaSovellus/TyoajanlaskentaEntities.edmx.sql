
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/05/2018 15:43:54
-- Generated from EDMX file: C:\Users\sundv\Source\Repos\Point-PS\TyoajanlaskentaSovellus\TyoajanlaskentaSovellus\TyoajanlaskentaEntities.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ScrumDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Fk_Tunnit_Henkilot]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tunnit] DROP CONSTRAINT [Fk_Tunnit_Henkilot];
GO
IF OBJECT_ID(N'[dbo].[Fk_Tunnit_Tyot]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tunnit] DROP CONSTRAINT [Fk_Tunnit_Tyot];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Henkilot]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Henkilot];
GO
IF OBJECT_ID(N'[dbo].[Tunnit]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tunnit];
GO
IF OBJECT_ID(N'[dbo].[Tyot]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tyot];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Henkilot'
CREATE TABLE [dbo].[Henkilot] (
    [HenkiloId] int IDENTITY(1,1) NOT NULL,
    [Etunimi] varchar(50)  NULL,
    [Sukunimi] varchar(50)  NULL
);
GO

-- Creating table 'Tunnit'
CREATE TABLE [dbo].[Tunnit] (
    [TuntiId] int IDENTITY(1,1) NOT NULL,
    [HenkiloId] int  NOT NULL,
    [TyoId] int  NOT NULL,
    [Tuntimaara] time  NULL
);
GO

-- Creating table 'Tyot'
CREATE TABLE [dbo].[Tyot] (
    [TyoId] int IDENTITY(1,1) NOT NULL,
    [Tyotunniste] varchar(10)  NULL,
    [Kuvaus] varchar(255)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [HenkiloId] in table 'Henkilot'
ALTER TABLE [dbo].[Henkilot]
ADD CONSTRAINT [PK_Henkilot]
    PRIMARY KEY CLUSTERED ([HenkiloId] ASC);
GO

-- Creating primary key on [TuntiId] in table 'Tunnit'
ALTER TABLE [dbo].[Tunnit]
ADD CONSTRAINT [PK_Tunnit]
    PRIMARY KEY CLUSTERED ([TuntiId] ASC);
GO

-- Creating primary key on [TyoId] in table 'Tyot'
ALTER TABLE [dbo].[Tyot]
ADD CONSTRAINT [PK_Tyot]
    PRIMARY KEY CLUSTERED ([TyoId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [HenkiloId] in table 'Tunnit'
ALTER TABLE [dbo].[Tunnit]
ADD CONSTRAINT [Fk_Tunnit_Henkilot]
    FOREIGN KEY ([HenkiloId])
    REFERENCES [dbo].[Henkilot]
        ([HenkiloId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'Fk_Tunnit_Henkilot'
CREATE INDEX [IX_Fk_Tunnit_Henkilot]
ON [dbo].[Tunnit]
    ([HenkiloId]);
GO

-- Creating foreign key on [TyoId] in table 'Tunnit'
ALTER TABLE [dbo].[Tunnit]
ADD CONSTRAINT [Fk_Tunnit_Tyot]
    FOREIGN KEY ([TyoId])
    REFERENCES [dbo].[Tyot]
        ([TyoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'Fk_Tunnit_Tyot'
CREATE INDEX [IX_Fk_Tunnit_Tyot]
ON [dbo].[Tunnit]
    ([TyoId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------