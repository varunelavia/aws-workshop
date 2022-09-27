output "App_URL_US" {
  value = aws_apprunner_service.us.service_url
}
output "App_URL_Asia" {
  value = aws_apprunner_service.ap.service_url
}
output "App_URL_Europe" {
  value = aws_apprunner_service.eu.service_url
}
output "URL_for_simple_routing_US" {
  value = "simple-us.${var.student_id}.cgpit.xyz"
}
output "URL_for_simple_routing_Asia" {
  value = "simple-us.${var.student_id}.cgpit.xyz"
}
output "URL_for_simple_routing_Europe" {
  value = "simple-us.${var.student_id}.cgpit.xyz"
}
output "URL_for_geolocation_based_routing" {
  value = "geo.${var.student_id}.cgpit.xyz"
}
output "URL_for_weighted_routing" {
  value = "weighted.${var.student_id}.cgpit.xyz"
}
output "URL_for_latency_based_routing" {
  value = "latency.${var.student_id}.cgpit.xyz"
}
output "URL_for_failover_routing" {
  value = "failover.${var.student_id}.cgpit.xyz"
}