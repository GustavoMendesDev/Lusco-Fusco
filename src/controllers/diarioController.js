var diarioModel = require("../models/diarioModel");

function enviarDiario(req, res) {
  var relato = req.body.relatoServer;
  var link = req.body.LinkServer;
  var nome = req.body.NomeMusicaServer;
  var artista = req.body.ArtistaServer;
  var idUser = req.body.idUserServer;

   var imagem = req.file ? req.file.filename : null;

  // Faça as validações dos valores
  if (relato == undefined) {
    res.status(400).send("Seu relato está undefined!");
  } else if (link == undefined) {
    res.status(400).send("Seu link está undefined!");
  } else if (nome == undefined) {
    res.status(400).send("Sua nome está undefined!");
  } else if (artista == undefined) {
    res.status(400).send("Sua artista a vincular está undefined!");
  } else if (idUser == undefined) {
    res.status(400).send("Sua artista a vincular está undefined!");
  } else {
    diarioModel.enviarDiario(relato, imagem, link, nome, artista, idUser).then(function (resultado) {
      if (resultado.length > 0) {
        res.json(resultado);
      } else {
        res.status(204).send("nenhuma ação encontrada para este diario!")
      }
    }).catch(function (erro) {
      console.log(erro)
      console.log("Houve um erro ao buscar as ações do diario. ", erro.sqlMessage);
      res.status(500).json(erro.sqlMessage)
    });
  }
}

function buscarUsuarioPeloDiario(req, res) {
  console.log(req.params.id);
  diarioModel.buscarUsuarioPeloDiario(req.params.id)
    .then(resultado => {
      res.json(resultado);
    }).catch(err => {
      res.status(500).send(err);
    });
}

module.exports = {
  enviarDiario,
  buscarUsuarioPeloDiario
}