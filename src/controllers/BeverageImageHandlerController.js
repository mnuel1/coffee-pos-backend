const path = require('path');

class BeverageImageHandlerController {
  uploadImage(req, res) {
    if (!req.file) {
      return res.status(400).json({ message: 'No file uploaded' });
    }
    res.status(200).json({ 
      message: 'File uploaded successfully',
      filename: req.file.filename
    });
  }

  serveImage(req, res) {
    const imageName = req.params.imageName;
    const imagePath = path.join(__dirname, '../../public/uploads/images', imageName);
    res.sendFile(imagePath, (err) => {
      if (err) {
        console.error('Error serving image:', err);
        res.status(404).json({ message: 'Image not found' });
      }
    });
  }
}

module.exports = new BeverageImageHandlerController();