const express = require('express');
const router = express.Router();
const BeverageImageHandlerController = require('../controllers/BeverageImageHandlerController');
const BeverageImageHandlerService = require('../services/BeverageImageHandlerService');

router.post('/upload-beverage-image', 
  BeverageImageHandlerService.getUploadMiddleware(),
  BeverageImageHandlerController.uploadImage
);

router.get('/beverage-image/:imageName', BeverageImageHandlerController.serveImage);

module.exports = router;