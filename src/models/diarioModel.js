var database = require("../database/config")

function enviarDiario(relato, imagem, link, nome, artista, idUser) {
  console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function enviarDiario():", relato, imagem, link, nome, artista, idUser);

  var valorImagem = imagem ? `${imagem}` : 'NULL';

  var instrucaoSql = `INSERT INTO diario (relato, imagem, fkuser) VALUES ('${relato}','${valorImagem}', ${idUser});`;

  return database.executar(instrucaoSql)
    .then((resultadoDiario) => {

      var idDiario = resultadoDiario.insertId;

      var instrucaoSql2 = `INSERT INTO musica (link, nome, artista, fkdiario) VALUES ('${link}','${nome}','${artista}',${idDiario});`;

      console.log("Executando a instrução SQL: \n" + instrucaoSql + instrucaoSql2);

      return database.executar(instrucaoSql2);
    });
}

function buscarUsuarioPeloDiario(idDiario, idUser) {
  var instrucaoSql = `select imagem from diario where fkUser = ${idUser} and idDiario = ${idDiario};`

  return database.executar(instrucaoSql);
}
module.exports = {
  enviarDiario,
  buscarUsuarioPeloDiario
}