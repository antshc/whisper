# CUDA optional; this is CPU-only and works everywhere
FROM python:3.11-slim

# System deps: ffmpeg for whisper audio decoding + ca-certs
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Install Python deps
# (openai-whisper pulls torch; can be heavy on CPU images)
RUN pip install --no-cache-dir -U pip \
 && pip install --no-cache-dir openai-whisper
