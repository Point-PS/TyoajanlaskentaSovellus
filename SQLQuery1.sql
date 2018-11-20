--DROP PROCEDURE uspEtunimijaSukunimiParametreina
--EXEC uspEtunimijaSukunimiParametreina @etunimipara = 'Paavo', @sukunimipara = 'Pesusieni'
CREATE PROCEDURE uspEtunimiJaSukunimiParametrina
	@etunimipara varchar(50), @sukunimipara varchar(50)
AS

	SET NOCOUNT ON;
	SELECT 'HENKILO ID: '+ CONVERT(nvarchar,H.HenkiloId)+' | NIMI: ' +H.Etunimi+' '+H.Sukunimi AS NIMITIEDOT, CONVERT(nvarchar(5),T.Tuntimaara) AS TYÖTUNNIT, CONVERT(nvarchar,T.Paivamaara, 104) AS PÄIVÄMÄÄRÄ, 'TYÖ ID: ' + CONVERT(nvarchar,P.TyoId)+' | TUNNISTE: '+ P.Tyotunniste+' | KUVAUS: '+P.Kuvaus AS TYÖTIEDOT
	FROM Henkilot AS H JOIN Tunnit AS T ON H.HenkiloId=T.HenkiloId JOIN Tyot AS P ON P.TyoId=T.TyoId
	WHERE H.Etunimi = @etunimipara AND H.Sukunimi = @sukunimipara ORDER BY T.HenkiloId ASC
	
GO

--EXEC uspHenkiloIdParametrina @henkiloidpara = '1002'
ALTER PROCEDURE uspHenkiloIdParametrina
	@henkiloidpara int
AS

	SET NOCOUNT ON;
	SELECT 'HENKILO ID: '+ CONVERT(nvarchar,H.HenkiloId)+' | NIMI: ' +H.Etunimi+' '+H.Sukunimi AS NIMITIEDOT, CONVERT(nvarchar(5),T.Tuntimaara) AS TYÖTUNNIT, CONVERT(nvarchar,T.Paivamaara, 104) AS PÄIVÄMÄÄRÄ, 'TYÖ ID: ' + CONVERT(nvarchar,P.TyoId)+' | TUNNISTE: '+ P.Tyotunniste+' | KUVAUS: '+P.Kuvaus AS TYÖTIEDOT
	FROM Henkilot AS H JOIN Tunnit AS T ON H.HenkiloId=T.HenkiloId JOIN Tyot AS P ON P.TyoId=T.TyoId
	WHERE T.HenkiloId = @henkiloidpara ORDER BY T.HenkiloId ASC
	
GO

--EXEC uspTyoIdParametrina @tyoidpara = '1003'
ALTER PROCEDURE uspTyoIdParametrina
	@tyoidpara int
AS

	SET NOCOUNT ON;
	SELECT 'HENKILO ID: '+ CONVERT(nvarchar,H.HenkiloId)+' | NIMI: ' +H.Etunimi+' '+H.Sukunimi AS NIMITIEDOT, CONVERT(nvarchar(5),T.Tuntimaara) AS TYÖTUNNIT, CONVERT(nvarchar,T.Paivamaara, 104) AS PÄIVÄMÄÄRÄ, 'TYÖ ID: ' + CONVERT(nvarchar,P.TyoId)+' | TUNNISTE: '+ P.Tyotunniste+' | KUVAUS: '+P.Kuvaus AS TYÖTIEDOT
	FROM Henkilot AS H JOIN Tunnit AS T ON H.HenkiloId=T.HenkiloId JOIN Tyot AS P ON P.TyoId=T.TyoId
	WHERE T.TyoId = @tyoidpara ORDER BY T.HenkiloId ASC
	
GO

--EXEC uspAlkuPvmJaLoppuPvmParametreina @alkuPvm = '2012-03-19', @loppuPvm = '2018-11-19'
ALTER PROCEDURE uspAlkuPvmJaLoppuPvmParametreina
    @alkuPvm datetime, @loppuPvm datetime
AS

    SELECT 'HENKILO ID: '+ CONVERT(nvarchar,H.HenkiloId)+' | NIMI: '+H.Etunimi+' '+H.Sukunimi AS NIMITIEDOT, CONVERT(nvarchar(5),T.Tuntimaara) AS TYÖTUNNIT, CONVERT(nvarchar,T.Paivamaara, 104) AS PÄIVÄMÄÄRÄ, 'TYÖ ID: ' + CONVERT(nvarchar,P.TyoId)+' | TUNNISTE: '+ P.Tyotunniste+' | KUVAUS: '+P.Kuvaus AS TYÖTIEDOT
    FROM Henkilot AS H JOIN Tunnit AS T ON H.HenkiloId=T.HenkiloId JOIN Tyot AS P ON P.TyoId=T.TyoId 
    WHERE T.Paivamaara BETWEEN @alkuPvm AND @loppuPvm ORDER BY T.HenkiloId ASC

GO

 

