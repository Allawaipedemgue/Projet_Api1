# 1. Utiliser Python
FROM python:3.10-slim

# 2. Installer Java pour Pyspark
RUN apt-get update && apt-get install -y openjdk-11-jre && \        apt-get clean && rm -rf /var/lib/apt/lists/*

# 3. Définir le dossier de travail sur le serveur
WORKDIR /app

# 4. Copier et installer tes bibliothèques (FastAPI, PySpark, etc.)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copier ton fichier main.py et ton modèle local dans le serveur
COPY . .
# 6. Exposer le PORT
EXPOSE 10000
# 7. Commander au serveur de démarrer ton API
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]

