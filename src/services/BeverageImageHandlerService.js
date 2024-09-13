const multer = require('multer');
const path = require('path');

class BeverageImageHandlerService {
  constructor() {
    this.storage = multer.diskStorage({
      destination: (req, file, cb) => {
        cb(null, 'public/uploads/images');
      },
      filename: (req, file, cb) => {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        cb(null, file.fieldname + '-' + uniqueSuffix + path.extname(file.originalname));
      }
    });

    this.upload = multer({ 
      storage: this.storage,
      fileFilter: (req, file, cb) => {
        const filetypes = /jpeg|jpg|png|gif/;
        const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
        const mimetype = filetypes.test(file.mimetype);
        if (mimetype && extname) {
          return cb(null, true);
        } else {
          cb('Error: Images Only!');
        }
      }
    });
  }

  getUploadMiddleware() {
    return this.upload.single('beverageImg');
  }
}

module.exports = new BeverageImageHandlerService();