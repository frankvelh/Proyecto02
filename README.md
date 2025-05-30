# Proyecto: Infraestructura como Código para Sistema de Reservas en AWS

Este proyecto implementa una arquitectura escalable en AWS para un sistema de reservas de hotel, utilizando *Terraform como herramienta de aprovisionamiento*. La solución incluye frontend distribuido por CDN, backend en EC2, base de datos en RDS, API Gateway, monitoreo, y notificaciones por correo electrónico.

---

## Arquitectura General

*Componentes:*
- Amazon S3 + CloudFront: Distribución de archivos estáticos (frontend).
- Amazon EC2 (NGINX): Servidor backend para servicios de reservas y usuarios.
- Amazon RDS (MySQL): Base de datos relacional.
- Amazon API Gateway: Exposición de endpoints /reservas.
- Amazon SES: Envío de correos electrónicos de confirmación.
- Amazon CloudWatch: Registro y monitoreo de la API.

---

## Estructura del Proyecto

e
infra/
│
├── api_gateway.tf
├── cloudfront.tf
├── cloudwatch.tf
├── ec2.tf
├── key.tf
├── output.tf
├── provider.tf
├── rds.tf
├── s3.tf
├── ses.tf
├── sg.tf
├── terraform.tfvars
├── variables.tf


---

## Requisitos Previos

- Cuenta de AWS (acceso programático).
- Terraform ≥ v1.3.
- Clave SSH pública (nginx-server.key.pub) y privada (nginx-server.key) en la raíz del proyecto.
- Correo verificado en Amazon SES.
- VPC ya existente (colocar su vpc_id en terraform.tfvars).

---

## Variables (terraform.tfvars)

Asegúrate de definir los siguientes valores:

hcl
db_username = "admin"
db_password = "********"
db_name     = "hotel_reservas"
key_name    = "nginx-server.key"
ses_email   = "tucorreo@verificado.com"
vpc_id      = "vpc-xxxxxxxx"


---

## Despliegue

### 1. Inicializar Terraform

terraform init

### 2. Revisar el plan de ejecución

terraform plan

### 3. Aplicar los cambios (crear infraestructura)

terraform apply

> Confirma con yes cuando se te solicite.

---

## Outputs

Al finalizar, se mostrarán salidas como:

- nginx_public_ip: IP pública del servidor EC2.
- cloudfront_domain_name: Dominio CDN para el frontend.
- rds_endpoint: Dirección de conexión MySQL.
- api_gateway_id: ID de la API REST creada.

---

## Seguridad y Consideraciones

- *SSH*: Protege tu clave privada (chmod 400 nginx-server.key).
- *Puerto 22 abierto*: Úsalo solo en desarrollo; restringe por IP en producción.
- *SES en sandbox*: Solicita salida del sandbox si deseas enviar correos libremente.
- *Pruebas*: Accede a http://<nginx_public_ip> o prueba APIs con Postman.

---

## Limpieza de Recursos

terraform destroy

> Esta acción elimina *todos* los recursos provisionados.

---

## Créditos y Licencia

Autor: 
Oscar Arroyo Santillan
Franklin Velásquez Horna
Carlos Alexis Muñoz Villar
José Arturo Quiroz Amaya
Hernan Garcia Rodriguez 

Repositorio bajo licencia MIT.  
Inspirado en mejores prácticas de AWS y Terraform.

---

ssh-keygen -t rsa -b 4096 -f hotel-ssh-key.key# Proyecto02


