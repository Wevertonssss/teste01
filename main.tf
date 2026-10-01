# Avisa que vamos usar o terreno da AWS
provider "aws" {
  region = "us-east-1"
}

# Constrói um muro de segurança (Firewall)
resource "aws_security_group" "meu_muro" {
  name        = "muro-da-fabrica"
  description = "Deixa as pessoas entrarem so pela porta 5000"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Compra o computador na nuvem (EC2)
resource "aws_instance" "meu_computador_nuvem" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro" 
  
  vpc_security_group_ids = [aws_security_group.meu_muro.id]

  tags = {
    Name = "Meu-Servidor-Protegido"
  }
}