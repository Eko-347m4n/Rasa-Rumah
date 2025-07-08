require("dotenv").config(); // Muat variabel dari .env
const admin = require("firebase-admin");
const fs = require("fs");
const path = require("path");

// Ambil path dari environment variable
const serviceAccountPath = process.env.GOOGLE_APPLICATION_CREDENTIALS;

admin.initializeApp({
  // Langsung gunakan path ke file, ini lebih aman dan praktik terbaik
  credential: admin.credential.cert(path.resolve(serviceAccountPath)),
  databaseURL: process.env.DATABASE_URL, // Tambahkan databaseURL dari .env
});

const db = admin.firestore();

const importData = async () => {
  try {
    const data = JSON.parse(fs.readFileSync("resep.json", "utf-8"));

    // Gunakan Promise.all untuk menunggu semua operasi selesai
    const importPromises = data.map(resep => {
      console.log(`Importing resep: ${resep.id} - ${resep.judul}`);
      return db.collection("resep").doc(resep.id).set(resep);
    });

    await Promise.all(importPromises);
    console.log("✅ All recipes have been successfully imported!");
  } catch (error) {
    console.error("Error during import:", error);
    process.exit(1); // Keluar dari skrip jika ada error
  }
};

importData();
