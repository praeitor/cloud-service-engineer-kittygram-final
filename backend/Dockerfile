FROM python:3.9
#нужно дле тестов
RUN apt-get update && apt-get install -y \
    telnet \
    net-tools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir
COPY . .
CMD ["gunicorn", "--bind", "0.0.0.0:9000", "kittygram_backend.wsgi"]