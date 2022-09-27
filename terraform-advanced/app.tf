resource "aws_apprunner_service" "us" {
  provider     = aws.us
  service_name = "${var.student_id}-us-php-calc"

  source_configuration {
    auto_deployments_enabled = false
    image_repository {
      image_configuration {
        port = var.app_port
        runtime_environment_variables = {
          HOSTED_REGION = "United States"
        }
      }
      image_identifier      = var.image_identifier
      image_repository_type = var.image_repository_type
    }
  }
}
resource "aws_apprunner_service" "ap" {
  provider     = aws.ap
  service_name = "${var.student_id}-ap-php-calc"

  source_configuration {
    auto_deployments_enabled = false
    image_repository {
      image_configuration {
        port = var.app_port
        runtime_environment_variables = {
          HOSTED_REGION = "Asia"
        }
      }
      image_identifier      = var.image_identifier
      image_repository_type = var.image_repository_type
    }
  }
}
resource "aws_apprunner_service" "eu" {
  provider     = aws.eu
  service_name = "${var.student_id}-eu-php-calc"

  source_configuration {
    auto_deployments_enabled = false
    image_repository {
      image_configuration {
        port = var.app_port
        runtime_environment_variables = {
          HOSTED_REGION = "Europe"
        }
      }
      image_identifier      = var.image_identifier
      image_repository_type = var.image_repository_type
    }
  }
}

## Domain Associations for Simple routes
resource "aws_apprunner_custom_domain_association" "us-simple" {
  provider    = aws.us
  domain_name = "us-simple.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.us.arn
}
resource "aws_apprunner_custom_domain_association" "ap-simple" {
  provider    = aws.ap
  domain_name = "ap-simple.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.ap.arn
}
resource "aws_apprunner_custom_domain_association" "eu-simple" {
  provider    = aws.eu
  domain_name = "eu-simple.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.eu.arn
}
## Domain Associations for Geolocation based routes
resource "aws_apprunner_custom_domain_association" "us-geo" {
  provider    = aws.us
  domain_name = "geo.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.us.arn
}
resource "aws_apprunner_custom_domain_association" "ap-geo" {
  provider    = aws.ap
  domain_name = "geo.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.ap.arn
}
resource "aws_apprunner_custom_domain_association" "eu-geo" {
  provider    = aws.eu
  domain_name = "geo.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.eu.arn
}
## Domain Associations for Weighted routes
resource "aws_apprunner_custom_domain_association" "us-weighted" {
  provider    = aws.us
  domain_name = "weighted.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.us.arn
}
resource "aws_apprunner_custom_domain_association" "ap-weighted" {
  provider    = aws.ap
  domain_name = "weighted.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.ap.arn
}
resource "aws_apprunner_custom_domain_association" "eu-weighted" {
  provider    = aws.eu
  domain_name = "weighted.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.eu.arn
}
## Domain Associations for Latency based routes
resource "aws_apprunner_custom_domain_association" "us-latency" {
  provider    = aws.us
  domain_name = "latency.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.us.arn
}
resource "aws_apprunner_custom_domain_association" "ap-latency" {
  provider    = aws.ap
  domain_name = "latency.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.ap.arn
}
resource "aws_apprunner_custom_domain_association" "eu-latency" {
  provider    = aws.eu
  domain_name = "latency.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.eu.arn
}
## Domain Associations for failover based routes
resource "aws_apprunner_custom_domain_association" "us-failover" {
  provider    = aws.us
  domain_name = "failover.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.us.arn
}
resource "aws_apprunner_custom_domain_association" "ap-failover" {
  provider    = aws.ap
  domain_name = "failover.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.ap.arn
}
resource "aws_apprunner_custom_domain_association" "eu-failover" {
  provider    = aws.eu
  domain_name = "failover.${var.student_id}.cgpit.xyz"
  service_arn = aws_apprunner_service.eu.arn
}
