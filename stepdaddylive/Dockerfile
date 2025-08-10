# Build StepDaddyLive from source; serves on \ (default 8000)
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends git curl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
# Skip DaddyLiveHD for now and use our working streaming interface
# RUN git clone https://github.com/Sternpaul/DaddyLiveHD.git /app
# RUN pip install --no-cache-dir -r requirements.txt || true

# Health endpoint and runner
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENV PORT=8000
EXPOSE 8000
HEALTHCHECK --interval=20s --timeout=5s --retries=30 CMD curl -fsS http://127.0.0.1:8000/ || exit 1
CMD ["/start.sh"]
