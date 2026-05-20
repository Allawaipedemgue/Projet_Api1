# 1. Utiliser une image Python officielle stable et légère
FROM python:3.10-slim

# 2. Installer Java (OpenJDK 11) proprement
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 3. Définir le dossier de travail
WORKDIR /app

# 4. Copier le fichier des dépendances
COPY requirements.txt .

# 5. Installer les bibliothèques Python
RUN pip install --no-cache-dir -r requirements.txt

# 6. Copier le reste du code
COPY . .

# 7. Exposer le port configuré
EXPOSE 10000

# 8. Commande de démarrage de l'API FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]

EXPOSE 10000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]
