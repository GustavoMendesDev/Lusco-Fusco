 var database = require("../database/config")

 function enviarDiario(relato, link, nome, artista, idUser) {
        console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function enviarDiario():", relato, link, nome, artista);

    var instrucaoSql = `INSERT INTO musica (link, nome, artista) VALUES ('${link}','${nome}','${artista}');`; 

     return database.executar(instrucaoSql).then(function (resultadoMusica) {

        var idMusic = resultadoMusica.insertId;

    var instrucaoSql2 = `INSERT INTO diario (relato, fkuser, fkmusica) VALUES ('${relato}', ${idUser}, ${idMusic});`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql + instrucaoSql2);

        return database.executar(instrucaoSql2);
     });
 }

 module.exports = {
    enviarDiario
 }