#!/bin/bash

# Domains to get certificates for
DOMAINS=(
    "chat.pahang.ai"
)

# Check if we're forcing renewal (first-time setup)
if [ "$1" == "--force" ]; then
    # Initial certificate request
    for domain in "${DOMAINS[@]}"; do
        docker compose run --rm certbot certonly --webroot --webroot-path=/var/www/html --email admin@pahang.ai --agree-tos --no-eff-email --force-renewal -d $domain
    done
else
    # Regular renewal (only renews if within 30 days of expiration)
    docker compose run --rm certbot renew
fi

# Create a cron job for renewal
echo "0 0 1 * * docker compose run --rm certbot renew && docker compose exec nginx nginx -s reload" > certbot-cron
crontab certbot-cron
rm certbot-cron 