# 1. Pega um computador pequenininho e limpo na internet
FROM python:3.11-slim

# 2. Cria uma pasta chamada /app lá dentro
WORKDIR /app

# 3. Coloca a lista de compras dentro da caixa
COPY requirements.txt .

# 4. Manda o computador ler a lista e baixar as peças
RUN pip install --no-cache-dir -r requirements.txt

# 5. Coloca o seu brinquedo (app.py) dentro da caixa
COPY app.py .

# 6. Faz um furinho na caixa (porta 5000) para as pessoas verem o brinquedo
EXPOSE 5000

# 7. O botão de ligar!
CMD ["python", "app.py"]