--EXEC uspAlkuPvmJaLoppuPvmParametreina @alkuPvm = '2012-03-19', @loppuPvm = '2018-11-19'
ALTER PROCEDURE uspAlkuPvmJaLoppuPvmParametreina
    @alkuPvm datetime, @loppuPvm datetime
AS

    SELECT CONVERT(nvarchar,H.HenkiloId)+' | '+H.Etunimi+' '+H.Sukunimi AS NIMITIEDOT, CONVERT(nvarchar(5),T.Tuntimaara) AS TYÖTUNNIT, CONVERT(nvarchar,T.Paivamaara, 104) AS PÄIVÄMÄÄRÄ, CONVERT(nvarchar,P.TyoId)+' | '+ P.Tyotunniste+' | '+P.Kuvaus AS TYÖTIEDOT
    FROM Henkilot AS H JOIN Tunnit AS T ON H.HenkiloId=T.HenkiloId JOIN Tyot AS P ON P.TyoId=T.TyoId 
    WHERE T.Paivamaara BETWEEN @alkuPvm AND @loppuPvm ORDER BY T.HenkiloId ASC

GO