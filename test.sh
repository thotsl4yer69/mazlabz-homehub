#!/bin/bash
set -e

echo "🧪 Testing Home Hub Demo Setup..."

cd /home/runner/work/mazlabz-homehub/mazlabz-homehub

# Test 1: Check .env exists
if [ -f ".env" ]; then
    echo "✅ .env file exists"
else
    echo "❌ .env file missing"
    exit 1
fi

# Test 2: Validate demo docker-compose
echo "🔍 Validating demo docker-compose..."
docker compose -f docker-compose.demo.yml config --quiet && echo "✅ Demo compose file is valid"

# Test 3: Check required directories
required_dirs=("homeassistant/config" "habridge/data" "proxy" "dashboard" "stepdaddylive")
for dir in "${required_dirs[@]}"; do
    if [ -d "$dir" ]; then
        echo "✅ Directory $dir exists"
    else
        echo "❌ Directory $dir missing"
        exit 1
    fi
done

# Test 4: Check Caddyfile exists
if [ -f "proxy/Caddyfile" ]; then
    echo "✅ Caddyfile exists"
else
    echo "❌ Caddyfile missing"
    exit 1
fi

# Test 5: Check dashboard index.html exists
if [ -f "dashboard/index.html" ]; then
    echo "✅ Dashboard index.html exists"
else
    echo "❌ Dashboard index.html missing"
    exit 1
fi

# Test 6: Try building the stepdaddylive image
echo "🔨 Testing StepDaddyLive build..."
docker build -t stepdaddylive-test ./stepdaddylive && echo "✅ StepDaddyLive builds successfully"

echo ""
echo "🎉 All tests passed! Demo should be ready."
echo "🚀 Run './start-demo.sh' to start the demo"