##resource
# Lanza una instancia EC2 que servirá como servidor web (Nginx)
# - Utiliza Amazon Linux 2
# - Usa el Security Group 'web_sg' para permitir acceso externo
# - Asocia la clave SSH 'hotel_project'
# - Inicializa Nginx automáticamente con user_data
resource "aws_instance" "nginx_server" {
  ami                    = "ami-058a8a5ab36292159"  # Amazon Linux 2 AMI (HVM3
  instance_type          = var.instance_type
  key_name               = aws_key_pair.hotel_project.key_name  # apunta al recurso en key.tf
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "HotelNginxServer"
  }
#que inicializa el servicio 
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  
}
