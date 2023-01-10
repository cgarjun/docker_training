# Defines the base image you want to build from
FROM python:3.10-alpine

# Install dependencies
# Copy the app code
COPY . /app/
RUN ls -l /app/
RUN pip install -r requirements.txt
EXPOSE 8000
# Set the default command to run when starting the container
CMD ["python", "/app/app.py"]
