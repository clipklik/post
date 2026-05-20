const express = require('express');
const router = express.Router();

// Import controller milikmu (sesuai nama file di foldermu)
const notifController = require('../controllers/notifController');

// ========================================================
// === STATIC ROUTES (Tanpa Parameter :id) ===
// WAJIB ditaruh di atas agar "read" tidak dianggap sebagai :id
// ========================================================

// Mengambil semua notifikasi
router.get('/', notifController.getNotifications);

// Menandai semua notifikasi sudah dibaca
router.put('/read', notifController.markAllAsRead);

// ========================================================
// === DYNAMIC ROUTES (Pakai Parameter :id) ===
// ========================================================

// Menandai SATU notifikasi sudah dibaca berdasarkan ID
router.put('/:id/read', notifController.markSingleAsRead);

module.exports = router;