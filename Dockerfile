# 1. Utiliser une image avec Python et Java préinstallés
FROM openjdk:11-jre-slim-buster

# 2. Installer Python et pip
RUN apt-get update && apt-get install -y python3 python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 3. Définir le dossier de travail sur le serveur
WORKDIR /app

# 4. Copier et installer tes bibliothèques (FastAPI, PySpark, etc.)
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# 5. Copier ton fichier main.py et ton modèle local dans le serveur
COPY . .

# 6. Commander au serveur de démarrer ton API
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
