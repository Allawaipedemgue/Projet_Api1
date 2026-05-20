WORKDIR /app

# Copier le fichier des dépendances
COPY requirements.txt .

# Installer les bibliothèques Python
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste du code
COPY . .

EXPOSE 10000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]
