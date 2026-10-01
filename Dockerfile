# --- ESTÁGIO 1: O Construtor (Faz o trabalho sujo) ---
FROM python:3.12-slim as builder
WORKDIR /app
COPY requirements.txt .
# Instala as dependências numa pasta isolada
RUN pip install --user --no-cache-dir -r requirements.txt

# --- ESTÁGIO 2: O Servidor Seguro (Limpo e Leve) ---
FROM python:3.12-slim
WORKDIR /app

# Copia apenas as dependências limpas do estágio 1
COPY --from=builder /root/.local /home/appuser/.local
# Copia o código da sua aplicação
COPY . .

# HARDENING: Criar um utilizador sem privilégios de administrador
RUN useradd -m appuser && chown -R appuser /app
USER appuser

# Garante que o sistema encontra os pacotes instalados
ENV PATH=/home/appuser/.local/bin:$PATH

EXPOSE 5000
CMD ["python", "app.py"]