FROM python:3.10

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    rabbitmq-server \
    pandoc \
    default-jre \
    graphviz \
    plantuml \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the requirements file first
COPY requirements.txt /app

# Upgrade pip and install Python dependencies from requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Install Docker CLI using the official Docker installation script
RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh
