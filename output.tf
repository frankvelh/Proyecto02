output "nginx_public_ip" {
  value = aws_instance.nginx_server.public_ip
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.cdn.domain_name
}

output "rds_endpoint" {
  value = aws_db_instance.hotel_db.endpoint
}

output "api_gateway_id" {
  value = aws_api_gateway_rest_api.hotel_api.id
}

output "ec2_public_ip" {
  description = "Public IP of the Nginx EC2 instance"
  value       = aws_instance.nginx_server.public_ip
}