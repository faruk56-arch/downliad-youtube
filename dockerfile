# Utilisez une image de base Python
FROM python:3.8-buster

# Installons quelques dépendances système potentiellement nécessaires
RUN apt-get update && apt-get install -y \
    libjpeg-dev \
    zlib1g-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/* 
# Définir les variables d'environnement pour Django
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE djangohotelprojet.settings

# Créez un répertoire pour notre projet
RUN mkdir /app
WORKDIR /app

# Copiez le fichier requirements.txt et installez les dépendances
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copiez le reste du projet
COPY . /app/

# Exposez le port sur lequel le service Django s'exécutera
EXPOSE 8000

# Commande pour démarrer le serveur Django
CMD ["gunicorn", "djangohotelprojet.hotel.wsgi:application", "--bind", "0.0.0.0:8000"]