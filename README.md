# Portainer and SCIRA MCP Chat Setup

This repository contains Docker Compose configuration for running Portainer and SCIRA MCP Chat services.

## Setup

1. Clone this repository
```bash
git clone https://github.com/pahangkrisdyan/portrainer.pahang.ai.git
cd portrainer.pahang.ai
```

2. Copy the example environment file and update it with your values
```bash
cp env.example .env
```

3. Edit the `.env` file with your actual values:
- `XAI_API_KEY`: Your XAI API key
- `OPENAI_API_KEY`: Your OpenAI API key
- `SCIRA_DB_USER`: Database username
- `SCIRA_DB_PASSWORD`: Database password
- `SCIRA_DB_NAME`: Database name (default: scira_mcp_chat_db)

4. Start the services
```bash
docker compose up -d
```

5. Set up SSL certificates
```bash
./certbot.sh
```

## Services

- Portainer: https://portrainer.pahang.ai
- SCIRA MCP Chat: https://chat.pahang.ai
- PostgreSQL Database (internal)
