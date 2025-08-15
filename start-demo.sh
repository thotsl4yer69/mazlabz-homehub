#!/bin/bash
set -e

echo "🏠 Starting Home Hub Demo..."

# Check if .env exists
if [ ! -f ".env" ]; then
    echo "⚠️  .env file not found, copying from example..."
    cp .env.example .env
    echo "✅ Please edit .env file with your settings"
fi

# Create necessary directories
echo "📁 Creating directories..."
mkdir -p homeassistant/config habridge/data plex/config plex/transcode

# Start demo services (without Plex and WARP for simplicity)
echo "🚀 Starting Demo Docker services..."
docker compose -f docker-compose.demo.yml up -d --build

# Wait for services to start
echo "⏳ Waiting for services to initialize..."
sleep 45

# Check service health
echo "🔍 Checking service health..."
echo "Proxy health: $(curl -s http://localhost:8080/healthz || echo 'FAILED')"

echo ""
echo "🎉 Home Hub Demo is running!"
echo "📊 Dashboard: http://localhost:8080"
echo "🏠 Home Assistant: http://localhost:8080/ha"
echo "📰 RSS: http://localhost:8080/rss"
echo "🔊 HA Bridge: http://localhost:8080/hue"
echo "📺 StepDaddyLive: http://localhost:8080/step"
echo "🏡 Homer Dashboard: http://localhost:8080/homer"
echo ""
echo "⚡ Use 'docker compose -f docker-compose.demo.yml logs -f' to view logs"
echo "🛑 Use 'docker compose -f docker-compose.demo.yml down' to stop all services"