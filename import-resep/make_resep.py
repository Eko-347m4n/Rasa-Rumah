import pandas as pd

# Baca file CSV (ganti path jika perlu)
csv_file = "Indonesian_Food_Recipes.csv"

# Baca CSV
df = pd.read_csv(csv_file)

# Ambil 50 baris pertama
df_first50 = df.head(50)

# Simpan ke file JSON
json_file = "Indonesian_Food_Recipes_first50.json"
df_first50.to_json(json_file, orient="records", indent=2, force_ascii=False)

print(f"File JSON berhasil dibuat: {json_file}")
