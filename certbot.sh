#!/bin/bash

# Domains to get certificates for
DOMAINS=(
    "portrainer.pahang.ai"
)

# Create certificates for each domain
for domain in "${DOMAINS[@]}"; do
    docker-compose run --rm certbot certonly --webroot --webroot-path=/var/www/html --email admin@pahang.ai --agree-tos --no-eff-email --force-renewal -d $domain
done

# Create a cron job for renewal
echo "0 0 1 * * docker-compose run --rm certbot renew && docker-compose exec nginx nginx -s reload" > certbot-cron
crontab certbot-cron
rm certbot-cron 