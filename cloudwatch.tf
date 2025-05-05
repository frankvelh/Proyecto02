resource "aws_cloudwatch_log_group" "hotel_api_logs" {
  name              = "/aws/api-gateway/hotel-reservas"
  retention_in_days = 14
}
