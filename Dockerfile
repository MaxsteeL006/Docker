FROM python:3.9-slim

WORKDIR /app

# Install required system packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gcc \
       libmariadb-dev \
       libmariadb-dev-compat \
       pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

CMD ["python", "app.py"]
