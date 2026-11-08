FROM python:3.10-slim-bullseye

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    curl \
    git \
    ffmpeg \
    aria2 \
    gcc \
    build-essential \
    libffi-dev \
    libssl-dev \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -U pip setuptools wheel && \
    pip3 install --no-cache-dir -U -r requirements.txt

COPY . .

EXPOSE 7860

CMD ["bash", "start"]
