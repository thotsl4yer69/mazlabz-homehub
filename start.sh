#!/bin/bash
set -e

echo "🏠 Starting Home Hub..."

# Check if .env exists
if [ ! -f ".env" ]; then
    echo "⚠️  .env file not found, copying from example..."
    cp .env.example .env
    echo "✅ Please edit .env file with your settings"
fi

# Create necessary directories
echo "📁 Creating directories..."
mkdir -p homeassistant/config
mkdir -p habridge/data  
mkdir -p plex/config plex/transcode
mkdir -p warp/config
mkdir -p nodered/data
mkdir -p mosquitto/config

# Start services
echo "🚀 Starting Docker services..."
docker compose up -d --build

# Wait for services to start
echo "⏳ Waiting for services to initialize..."
sleep 30

# Check service health
echo "🔍 Checking service health..."
echo "Proxy health: $(curl -s http://localhost:8080/healthz || echo 'FAILED')"

echo ""
echo "🎉 Home Hub is starting up!"
echo "📊 Dashboard: http://localhost:8080"
echo "🏠 Home Assistant: http://localhost:8080/ha"
echo "🎬 Plex: http://localhost:8080/plex"
echo "📰 RSS: http://localhost:8080/rss"
echo "🔊 HA Bridge: http://localhost:8080/hue"
echo "📺 StepDaddyLive: http://localhost:8080/step"
echo ""
echo "⚡ Use 'docker compose logs -f' to view logs"
echo "🛑 Use 'docker compose down' to stop all services"