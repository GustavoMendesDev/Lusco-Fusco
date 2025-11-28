var database = require("../database/config")

function ArtistaTop(idUser) {
    var instrucaoSql = `
SELECT 
usuario.nome AS User,
musica.artista AS Artista,
COUNT(diario.idDiario) AS Quantidade
FROM diario
JOIN musica ON diario.fkMusic = musica.idMusic AND musica.artista IS NOT NULL
JOIN usuario ON diario.fkuser = usuario.idUser
WHERE usuario.idUser = ${idUser}
GROUP BY usuario.nome, musica.artista
ORDER BY Quantidade DESC
LIMIT 10;`;
    console.log("Executando a instrução do SQL: \n " + instrucaoSql);
    return database.executar(instrucaoSql);
}

function MusicaTop(idUser) {
    var instrucaoSql = `
SELECT 
usuario.nome AS User,
musica.nome AS Musica,
COUNT(diario.idDiario) AS Quantidade
FROM diario
JOIN musica ON diario.fkMusic = musica.idMusic AND musica.nome IS NOT NULL
JOIN usuario ON diario.fkuser = usuario.idUser
WHERE usuario.idUser = ${idUser}
GROUP BY usuario.nome, musica.nome
ORDER BY Quantidade DESC
LIMIT 10;`;
    console.log("Executando a instrução do SQL: \n " + instrucaoSql);
    return database.executar(instrucaoSql);
}

function UserDiario(idUser) {

    var instrucaoSql = `SELECT idDiario, dataD FROM diario
JOIN usuario on diario.fkuser = usuario.idUser 
where idUser = ${idUser};`

    console.log("Executando a instrução do SQL: \n " + instrucaoSql);
    return database.executar(instrucaoSql);
}




module.exports = {
    ArtistaTop,
    MusicaTop,
    UserDiario

}