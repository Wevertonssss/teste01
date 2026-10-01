# 1. Usando o Alpine: um Linux ultra leve e focado em seguranca
FROM python:3.12-alpine

WORKDIR /app

COPY requirements.txt .

# 2. Instalacao simples, pois o Alpine nao tem dependencias antigas para criar conflito
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]