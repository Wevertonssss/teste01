from flask import Flask

# Criando o nosso brinquedo
app = Flask(__name__)

# Dizendo o que o brinquedo faz
@app.route('/')
def hello_cloud():
    return "Olá! Meu robô de segurança deixou esse site passar!"

# Ligando o brinquedo na porta 5000
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)