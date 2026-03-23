#!/bin/bash

# Configuration
COMPOSE_FILE="docker-compose.yml"
# Updated to reflect your custom port mapping
HOST_PORT="3901"

# Function to print logs with timestamp
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

# Function to display help information
show_help() {
    echo "-------------------------------------------------------"
    echo "AnythingLLM Docker Management Script"
    echo "-------------------------------------------------------"
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "Options:"
    echo "  --restart   Pull the latest image and (re)start the container."
    echo "              Use this to apply changes or update the app."
    echo "  --stop      Stop and pause the running AnythingLLM container."
    echo "  --wipe      CRITICAL: Remove container and DELETE all local data"
    echo "              (documents, vector cache, and settings)."
    echo "  --help      Display this help message."
    echo ""
    echo "Example: ./run.sh --restart"
    echo "-------------------------------------------------------"
}

# Check if docker-compose.yml exists
if [ ! -f "$COMPOSE_FILE" ]; then
    log "ERROR: $COMPOSE_FILE not found in the current directory."
    exit 1
fi

# If no arguments are provided, default to --help
if [ $# -eq 0 ]; then
    show_help
    exit 0
fi

case "$1" in
    --restart)
        log "Action: Restarting AnythingLLM..."
        docker compose pull
        docker compose up -d --force-recreate
        log "SUCCESS: AnythingLLM is running at http://localhost:$HOST_PORT"
        ;;

    --stop)
        log "Action: Stopping AnythingLLM container..."
        docker compose stop
        log "SUCCESS: Container stopped."
        ;;

    --wipe)
        log "WARNING: This will permanently delete './storage' and all containers."
        read -p "Confirm full wipe? (y/N): " confirm
        if [[ "$confirm" == [yY] || "$confirm" == [yY][eE][sS] ]]; then
            log "Action: Wiping all data..."
            docker compose down --volumes --remove-orphans
            if [ -d "./storage" ]; then
                rm -rf ./storage
                log "SUCCESS: Local storage directory deleted."
            fi
            log "Wipe operation completed successfully."
        else
            log "CANCELLED: Wipe operation aborted by user."
        fi
        ;;

    --help)
        show_help
        ;;

    *)
        log "ERROR: Unknown option '$1'"
        show_help
        exit 1
        ;;
esac