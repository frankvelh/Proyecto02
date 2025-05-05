resource "aws_api_gateway_rest_api" "hotel_api" {
  name        = "HotelReservasAPI"
  description = "API for hotel reservations"
}

resource "aws_api_gateway_resource" "reservas" {
  rest_api_id = aws_api_gateway_rest_api.hotel_api.id
  parent_id   = aws_api_gateway_rest_api.hotel_api.root_resource_id
  path_part   = "reservas"
}

resource "aws_api_gateway_method" "get_reservas" {
  rest_api_id   = aws_api_gateway_rest_api.hotel_api.id
  resource_id   = aws_api_gateway_resource.reservas.id
  http_method   = "GET"
  authorization = "NONE"
}
