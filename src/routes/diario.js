var express = require("express");
var rota = express.Router();

var diarioController = require ('../controllers/diarioController');

rota.post('/enviarDiario/', function(req , res){
    diarioController.enviarDiario(req , res);
});

rota.post('/diarioController/:imagem', function(req , res){
    diarioController.enviarDiario(req , res);
})

module.exports = rota;