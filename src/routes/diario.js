var express = require("express");
var rota = express.Router();
var upload = require('../config/configUpload'); // ARQUIVO COM A CONFIGURAÇÃO DO UPLOAD
var diarioController = require ('../controllers/diarioController');
var multer = require('multer');
var upload = multer({ dest: 'uploads/' });

rota.post('/enviarDiario', upload.single('foto'), (req, res) => {
    diarioController.enviarDiario(req, res);
});


rota.post('/enviarDiarioFoto', upload.single('foto'), (req, res) => {
  diarioController.enviarDiarioFoto(req, res);
});

module.exports = rota;