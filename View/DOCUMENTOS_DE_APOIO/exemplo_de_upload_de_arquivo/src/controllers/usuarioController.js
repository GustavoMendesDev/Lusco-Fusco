var diarioModel = require('../models/diarioModel');

function enviarDiario(req, res) {

    var foto = req.file ? req.file.filename : null;

    var diario = {
        relato: relatoServer,
        link: LinkServer,
        nomeMusica: NomeMusicaServer,
        artista: ArtistaServer,
        idUser: idUserServer,
        foto: foto
    };

    diarioModel.enviarDiario(diario)
        .then(function(resultado) {
            res.status(201).send("Diário criado com sucesso");
        })
        .catch(function(err) {
            console.log(err);
            res.status(500).send(err);
        });
}

function buscarUsuarioPeloDiario(req, res) {
    console.log(req.params.id);
    diarioModel.buscarUsuarioPeloDiario(req.params.id)
        .then(function(resultado) {
            res.json(resultado);
        })
        .catch(function(err) {
            res.status(500).send(err);
        });
}

module.exports = { enviarDiario, buscarUsuarioPeloDiario }