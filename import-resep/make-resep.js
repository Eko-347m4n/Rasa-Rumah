const fs = require('fs');
const path = require('path');
const { parse } = require('csv-parse/sync');

function transformRecipes(csvPath = 'Indonesian_Food_Recipes.csv', jsonPath = 'resep.json') {
  console.log(`Membaca dari: ${csvPath}`);

  let csvData;
  try {
    csvData = fs.readFileSync(path.resolve(__dirname, csvPath), 'utf-8');
  } catch (err) {
    console.error(`Error: File CSV tidak ditemukan di '${csvPath}'`);
    return;
  }

  let records;
  try {
    records = parse(csvData, {
      columns: true,
      skip_empty_lines: true,
      trim: true,
    });
  } catch (err) {
    console.error(`Error saat parsing CSV: ${err.message}`);
    return;
  }

  const results = [];
  let idCounter = 1;

  for (const row of records) {
    const title = row['Title'];
    if (!title || title.trim() === '') {
      continue;
    }

    try {
      // Process bahan (Ingredients)
      let bahan = [];
      if (row['Ingredients']) {
        bahan = row['Ingredients'].split('--').map(item => item.trim()).filter(item => item.length > 0);
      }

      // Process langkah (Steps)
      let langkah = [];
      if (row['Steps']) {
        // Split by numbered steps like "1) ", "2) ", etc.
        const splitSteps = row['Steps'].split(/\s*\d+\)\s*/);
        langkah = splitSteps
          .map(step => step.replace(/\s+/g, ' ').replace(/\n/g, ' ').trim())
          .filter(step => step.length > 0);
      }

      // Process jumlahSuka (Loves)
      let jumlahSuka = 0;
      if (row['Loves']) {
        const lovesNum = parseInt(row['Loves'], 10);
        jumlahSuka = isNaN(lovesNum) ? 0 : lovesNum;
      }

      // Process kategori (Category)
      const kategori = row['Category'] ? row['Category'].trim() : '';

      const resep = {
        id: idCounter.toString(),
        judul: title.trim(),
        bahan,
        langkah,
        jumlahSuka,
        kategori,
      };

      results.push(resep);
      idCounter++;
    } catch (err) {
      console.error(`Error saat memproses baris dengan judul '${title}': ${err.message}`);
    }
  }

  try {
    fs.writeFileSync(path.resolve(__dirname, jsonPath), JSON.stringify(results, null, 2), 'utf-8');
    console.log(`Berhasil mengonversi CSV ke ${jsonPath}. Total resep: ${results.length}`);
  } catch (err) {
    console.error(`Error saat menulis file JSON ke ${jsonPath}: ${err.message}`);
  }
}

// Jika dijalankan langsung dari command line
if (require.main === module) {
  transformRecipes();
}

module.exports = { transformRecipes };
