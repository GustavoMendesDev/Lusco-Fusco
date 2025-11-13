var diarioModel = require("../models/diarioModel");

function enviarDiario(req , res) {
    var diario = req.params.diario;
    diarioModel.Enviardiario(diario).then(function(resultado){
        if(resultado.length > 0) {
            res.json(resultado);
        } else {
            res.status(204).send("nenhuma ação encontrada para este setor!")
        }
    }).catch(function(erro){
        console.log(erro)
        console.log("Houve um erro ao buscar as ações do setor. ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage)
    });


}

module.exports = {
    enviarDiario
}