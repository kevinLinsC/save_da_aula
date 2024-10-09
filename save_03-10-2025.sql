USE spotifynew;

DESCRIBE spotifytop;

SELECT * FROM spotifytop;
SELECT nomeMusica, nomeArtista FROM spotifytop;

SELECT nomeMusica, nomeArtista FROM spotifytop 
WHERE nomeArtista = "juice WRLD";

SELECT count(nomeArtista) AS contagem FROM spotifytop
WHERE nomeArtista = "juice WRLD";

SELECT nomeMusica, top10Vezes FROM spotifytop
WHERE top10Vezes <> 0;

SELECT nomeMusica, maiorPosicao FROM spotifytop
WHERE maiorPosicao <= 10;

SELECT nomeArtista, nomeMusica, picoDeStreams FROM spotifytop
WHERE picoDeStreams > 7000000;

SELECT nomeArtista, nomeMusica, picoDeStreams FROM spotifytop
WHERE picoDeStreams NOT BETWEEN 6000000 AND 7000000;

SELECT nomeArtista, nomeMusica, picoDeStreams FROM spotifytop
WHERE nomeArtista IN ("Juice WRLD", "Kendrick Lamar", "XXXTENTACION");

SELECT nomeArtista, nomeMusica, picoDeStreams FROM spotifytop
WHERE nomeArtista NOT IN ("Juice WRLD", "Kendrick Lamar", "XXXTENTACION");

SELECT nomeArtista, nomeMusica, top10vezes from spotifytop
WHERE top10vezes IN(1, 2);

SELECT nomeArtista, nomeMusica FROM spotifytop
WHERE nomeArtista LIKE"Ju%";

SELECT nomeArtista, nomeMusica FROM spotifytop
WHERE nomeArtista LIKE"%scott";

SELECT nomeArtista, nomeMusica, totalStreams FROM spotifytop
WHERE totalStreams IS NULL;

SELECT nomeArtista, nomeMusica, totalStreams FROM spotifytop
WHERE totalStreams IS NOT NULL;

SELECT nomeArtista, nomeMusica, totalStreams FROM spotifytop
WHERE totalStreams > 100000 AND nomeArtista LIKE"%ed";

SELECT nomeArtista, nomeMusica, totalStreams FROM spotifytop
WHERE totalStreams > 100000 OR nomeArtista LIKE"%Jao";

SELECT nomeArtista, nomeMusica, picoDeStreams FROM spotifytop
WHERE nomeArtista = "Juice WRLD"
ORDER BY picoDeStreams;

SELECT nomeArtista, nomeMusica, picoDeStreams FROM spotifytop
WHERE nomeArtista = "Juice WRLD"
ORDER BY picoDeStreams DESC;

SELECT nomeArtista, nomeMusica, picoDeStreams, dias FROM spotifytop
WHERE nomeArtista = "Juice WRLD"
ORDER BY dias DESC;

SELECT avg(totalStreams) from spotifytop;

SELECT avg(totalStreams) as mediaStreams, count(nomeArtista) FROM spotifytop
WHERE nomeArtista = "Juice WRLD";

SELECT nomeArtista, nomeMusica, picoDeStreams FROM spotifytop
WHERE picoDeStreams = (SELECT max(picoDeStreams) FROM spotifytop);

SELECT nomeArtista, nomeMusica, picoDeStreams FROM spotifytop
WHERE picoDeStreams = (SELECT min(picoDeStreams) FROM spotifytop where picoDeStreams <> 0);

SELECT sum(totalStreams) as	totalGeral FROM spotifytop
WHERE nomeArtista = "Juice WRLD";

SELECT DISTINCT nomeArtista FROM spotifytop;

SELECT nomeArtista, count(nomeMusica) as qtdVezes FROM spotifytop
GROUP BY nomeArtista
ORDER BY qtdVezes DESC;

SELECT nomeArtista, count(nomeMusica) as qtdVezes FROM spotifytop
GROUP BY nomeArtista
HAVING qtdVezes > 100;

DELETE FROM spotifytop
WHERE nomeArtista = "Post Malone";