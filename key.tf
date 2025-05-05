resource "aws_key_pair" "hotel_project" {
  key_name   = var.key_name
  public_key = file("nginx-server.key.pub")  # ajusta la ruta si está en otra carpeta
}