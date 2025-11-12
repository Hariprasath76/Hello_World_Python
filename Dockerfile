#official Python base image
FROM python:3.9-slim 

# Set the working directory
WORKDIR /app

#Copy the project into the container
COPY . /app

#Install dependencies - requirements.txt
RUN pip install --no-cache-dir django
EXPOSE 8000


# Run the Python app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
