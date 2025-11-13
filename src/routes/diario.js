var express = require("express");
var rota = express.Router();

var diarioController = require ('../controllers/diarioController');

rota.get('/controllers/diarioController', function(req , res){
    diarioController.enviarDiario(req , res);
});

module.exports = rota;