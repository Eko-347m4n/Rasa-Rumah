require("dotenv").config(); // Muat variabel dari .env
const admin = require("firebase-admin");
const fs = require("fs");

// Ambil path dari environment variable
const serviceAccountPath = process.env.GOOGLE_APPLICATION_CREDENTIALS;
const serviceAccount = require(serviceAccountPath);

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: process.env.DATABASE_URL, // Tambahkan databaseURL dari .env
});

const db = admin.firestore();

const data = JSON.parse(fs.readFileSync("resep.json", "utf-8")); // file JSON data kamu

data.forEach(async (resep) => {
  await db.collection("resep").doc(resep.id).set({
    judul: resep.judul,
    bahan: resep.bahan,
    langkah: resep.langkah,
    jumlahSuka: resep.jumlahSuka,
    kategori: resep.kategori,
  });
  console.log(`✅ Imported resep: ${resep.id}`);
});
