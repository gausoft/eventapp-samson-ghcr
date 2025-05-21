#!/bin/bash
# wait-for.sh

# Vérifie que les variables d'environnement DB_HOST et DB_PORT sont définies
if [ -z "$DB_HOST" ] || [ -z "$DB_PORT" ]; then
  echo "❌ Les variables DB_HOST et DB_PORT doivent être définies."
  exit 1
fi

# Boucle jusqu'à ce que la connexion TCP soit possible
while ! echo > /dev/tcp/$DB_HOST/$DB_PORT 2>/dev/null; do
  echo "⏳ En attente de PostgreSQL à $DB_HOST:$DB_PORT..."
  sleep 2
done

echo "✅ PostgreSQL est prêt. Démarrage du serveur..."
exec "$@"
