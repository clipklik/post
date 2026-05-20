const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');
const docController = require('../controllers/docController'); 

// 1. Konfigurasi Multer
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, 'uploads/'),
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, uniqueSuffix + path.extname(file.originalname));
  }
});

const upload = multer({ 
  storage: storage,
  limits: { fileSize: 15 * 1024 * 1024 } // 15MB
});

// 2. Daftar Rute (Gunakan Inline Handler untuk menangkap error)

// Rute GET / Public
router.get('/', docController.getAllDocs);
router.get('/:id', docController.getDocumentById);
router.get('/preview/:id', docController.previewDoc);
router.get('/download/:id', docController.downloadDoc);
router.post('/:id/view', docController.addView);
router.delete('/:id', docController.deleteDoc);

// Rute POST / PUT dengan Error Handling Langsung
router.post('/upload', (req, res) => {
  upload.single('document_file')(req, res, (err) => {
    if (err) return res.status(400).json({ message: err.message });
    docController.uploadDoc(req, res);
  });
});

router.put('/:id/status', (req, res) => {
  upload.single('document_file')(req, res, (err) => {
    if (err) return res.status(400).json({ message: err.message });
    docController.updateStatus(req, res);
  });
});

router.put('/:id', (req, res) => {
  upload.single('document_file')(req, res, (err) => {
    if (err) return res.status(400).json({ message: err.message });
    docController.updateDoc(req, res);
  });
});

module.exports = router;