# Étape 1 : Build de l'application React
FROM node:22 AS builder

# Créer un répertoire de travail
WORKDIR /app

# Copier les fichiers de configuration
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste du code
COPY . .

# Lancer la build de production
RUN npm run build

# Étape 2 : Utiliser Nginx pour servir l'app compilée
FROM nginx:alpine

# Supprimer la configuration par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copier les fichiers build de React vers le dossier Nginx
COPY --from=builder /app/build /usr/share/nginx/html

# Copier la configuration Nginx personnalisée
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exposer le port Nginx (exemple : 8081)
EXPOSE 8082

# Lancer Nginx (la commande par défaut dans l'image nginx)
CMD ["nginx", "-g", "daemon off;"]
