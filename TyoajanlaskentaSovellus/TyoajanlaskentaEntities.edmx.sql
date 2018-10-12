
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/12/2018 19:55:00
-- Generated from EDMX file: C:\Users\ville\Source\Repos\Point-PS\TyoajanlaskentaSovellus\TyoajanlaskentaSovellus\TyoajanlaskentaEntities.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [scrumDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


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
IF OBJECT_ID(N'[scrumDatabaseModelStoreContainer].[database_firewall_rules]', 'U') IS NOT NULL
    DROP TABLE [scrumDatabaseModelStoreContainer].[database_firewall_rules];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Henkilot'
CREATE TABLE [dbo].[Henkilot] (
    [HenkiloId] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Tunnit'
CREATE TABLE [dbo].[Tunnit] (
    [TuntiId] int IDENTITY(1,1) NOT NULL,
    [HenkiloId] int  NOT NULL,
    [TyoId] int  NOT NULL
);
GO

-- Creating table 'Tyot'
CREATE TABLE [dbo].[Tyot] (
    [TyoId] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'database_firewall_rules'
CREATE TABLE [dbo].[database_firewall_rules] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(128)  NOT NULL,
    [start_ip_address] varchar(45)  NOT NULL,
    [end_ip_address] varchar(45)  NOT NULL,
    [create_date] datetime  NOT NULL,
    [modify_date] datetime  NOT NULL
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

-- Creating primary key on [id], [name], [start_ip_address], [end_ip_address], [create_date], [modify_date] in table 'database_firewall_rules'
ALTER TABLE [dbo].[database_firewall_rules]
ADD CONSTRAINT [PK_database_firewall_rules]
    PRIMARY KEY CLUSTERED ([id], [name], [start_ip_address], [end_ip_address], [create_date], [modify_date] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------