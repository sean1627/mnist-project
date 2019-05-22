# Use an official Python runtime as a parent image
FROM python:3.6.4-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
Run chmod 644 app.py
# Make port 8000 available to the world outside this container
EXPOSE 8000 9042

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python3.6", "app.py"]

