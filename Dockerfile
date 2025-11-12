# Use the official Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the contents of your project into the container
COPY . /app

# Install dependencies if you have requirements.txt
RUN pip install --no-cache-dir -r requirements.txt || true

# Run the Python app
CMD ["python", "hello.py"]
