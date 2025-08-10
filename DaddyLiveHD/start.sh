#!/bin/sh
set -e

if [ -f "/app/StepDaddyLiveHD.py" ]; then
  exec python /app/StepDaddyLiveHD.py
elif [ -f "/app/app.py" ]; then
  exec uvicorn app:app --host 0.0.0.0 --port 8000
elif [ -f "/app/main.py" ]; then
  exec uvicorn main:app --host 0.0.0.0 --port 8000
elif [ -f "/app/server.py" ]; then
  exec uvicorn server:app --host 0.0.0.0 --port 8000
else
  exec uvicorn app:app --host 0.0.0.0 --port 8000
fi
