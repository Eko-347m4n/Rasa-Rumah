require("dotenv").config(); // Muat variabel dari .env
const admin = require("firebase-admin");
const fs = require("fs");
const path = require("path");

// Ambil path dari environment variable
const serviceAccountPath = path.join(__dirname, process.env.GOOGLE_APPLICATION_CREDENTIALS);

admin.initializeApp({
  // Langsung gunakan path ke file, ini lebih aman dan praktik terbaik
  credential: admin.credential.cert(serviceAccountPath),
  databaseURL: process.env.DATABASE_URL, // Tambahkan databaseURL dari .env
});

const db = admin.firestore();

const importData = async () => {
  try {
    const data = JSON.parse(fs.readFileSync("resep.json", "utf-8"));

    // Gunakan Promise.all untuk menunggu semua operasi selesai dengan batching dan retry
    const BATCH_SIZE = 20000; // Jumlah resep yang akan diimpor secara paralel dalam satu batch
    const MAX_BATCH_RETRIES = 3;
    const INITIAL_BATCH_DELAY = 100; // Penundaan awal jika terjadi error (dalam milidetik)

    const sleep = (ms) => new Promise(resolve => setTimeout(resolve, ms));

    for (let i = 0; i < data.length; i += BATCH_SIZE) {
      const batch = data.slice(i, i + BATCH_SIZE);
      let retries = 0;
      let success = false;

      while (!success && retries < MAX_BATCH_RETRIES) {
        try {
          const importPromises = batch.map(async (resep) => {
            console.log(`Importing resep: ${resep.id} - ${resep.judul}`);
            await db.collection("resep").doc(resep.id).set(resep);
          });
          await Promise.all(importPromises);
          success = true;
        } catch (error) {
          retries++;
          const delay = INITIAL_BATCH_DELAY * Math.pow(2, retries - 1);
          console.error(`Error importing batch (starting with resep ${batch[0].id}): ${error.message}. Retrying in ${delay}ms...`);
          await sleep(delay);
          if (retries === MAX_BATCH_RETRIES) {
            throw error; // Re-throw if max retries reached for the batch
          }
        }
      }
    }
    console.log("✅ All recipes have been successfully imported!");
  } catch (error) {
    console.error("Error during import:", error);
    process.exit(1); // Keluar dari skrip jika ada error
  }
};

importData();
