
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

 
CMD ["bash", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8001 & uvicorn main:app --host 0.0.0.0 --port 8000 --reload"]
