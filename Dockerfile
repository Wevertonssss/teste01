# --- ESTÁGIO 1: O Construtor (Alpine) ---
FROM python:3.12-alpine as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# --- ESTÁGIO 2: O Servidor Seguro e Minimalista ---
FROM python:3.12-alpine
WORKDIR /app

# Copia apenas as dependências do estágio 1
COPY --from=builder /root/.local /home/appuser/.local
# Copia o código da aplicação
COPY . .

# HARDENING: Criar utilizador no Alpine
RUN adduser -D appuser && chown -R appuser /app
USER appuser

ENV PATH=/home/appuser/.local/bin:$PATH

EXPOSE 5000
CMD ["python", "app.py"]