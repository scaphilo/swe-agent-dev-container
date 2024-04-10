FROM python:3.10

# Set the working directory
WORKDIR /app

# Copy the requirements file first
COPY requirements.txt /app

# Install Python dependencies from requirements.txt
RUN pip install -r requirements.txt

# Install Docker CLI using the official Docker installation script
RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh
