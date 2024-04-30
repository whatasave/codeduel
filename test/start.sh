#!/bin/bash
echo "Starting CodeDuel services..."

ENV=production

echo " DB host: $MARIADB_HOST:$MARIADB_PORT"

echo "  Runner..."
/app/docker_setup.sh
PORT=5020 codeduel-runner &

echo "  Lobby..."
codeduel-lobby &

echo "  Backend..."
codeduel-be &

echo "Everything is up and running!"

sleep 360