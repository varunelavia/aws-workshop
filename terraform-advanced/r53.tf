resource "aws_route53_zone" "student" {
  provider = aws.us
  name     = "${var.student_id}.cgpit.xyz"
}

resource "aws_route53_record" "ns" {
  provider = aws.host_account
  zone_id  = var.root_zone_id
  name     = "${var.student_id}.cgpit.xyz"
  type     = "NS"
  ttl      = "3"
  records  = aws_route53_zone.student.name_servers
}

### Healthchecks
resource "aws_route53_health_check" "us" {
  provider          = aws.us
  fqdn              = aws_apprunner_service.us.service_url
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = "1"
  request_interval  = "10"

  tags = {
    Name = "us-app-hc"
  }
}
resource "aws_route53_health_check" "ap" {
  provider          = aws.ap
  fqdn              = aws_apprunner_service.ap.service_url
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = "1"
  request_interval  = "10"

  tags = {
    Name = "ap-app-hc"
  }
}
resource "aws_route53_health_check" "eu" {
  provider          = aws.eu
  fqdn              = aws_apprunner_service.eu.service_url
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = "1"
  request_interval  = "10"

  tags = {
    Name = "eu-app-hc"
  }
}

### Domain Validation Records for simple routes
resource "aws_route53_record" "us-simple-domain-validation" {
  count    = 3
  provider = aws.us
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.us-simple.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.us-simple.certificate_validation_records)[count.index].value]
}
resource "aws_route53_record" "ap-simple-domain-validation" {
  count    = 3
  provider = aws.ap
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.ap-simple.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.ap-simple.certificate_validation_records)[count.index].value]
}
resource "aws_route53_record" "eu-simple-domain-validation" {
  count    = 3
  provider = aws.eu
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.eu-simple.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.eu-simple.certificate_validation_records)[count.index].value]
}

### Domain Validation Records for Geolocation based routes
resource "aws_route53_record" "us-geo-domain-validation" {
  count    = 3
  provider = aws.us
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.us-geo.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.us-geo.certificate_validation_records)[count.index].value]
}
resource "aws_route53_record" "ap-geo-domain-validation" {
  count    = 3
  provider = aws.ap
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.ap-geo.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.ap-geo.certificate_validation_records)[count.index].value]
}
resource "aws_route53_record" "eu-geo-domain-validation" {
  count    = 3
  provider = aws.eu
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.eu-geo.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.eu-geo.certificate_validation_records)[count.index].value]
}

### Domain Validation Records for Weighted routes
resource "aws_route53_record" "us-weighted-domain-validation" {
  count    = 3
  provider = aws.us
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.us-weighted.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.us-weighted.certificate_validation_records)[count.index].value]
}
resource "aws_route53_record" "ap-weighted-domain-validation" {
  count    = 3
  provider = aws.ap
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.ap-weighted.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.ap-weighted.certificate_validation_records)[count.index].value]
}
resource "aws_route53_record" "eu-weighted-domain-validation" {
  count    = 3
  provider = aws.eu
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.eu-weighted.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.eu-weighted.certificate_validation_records)[count.index].value]
}

### Domain Validation Records for Latency based routes
resource "aws_route53_record" "us-latency-domain-validation" {
  count    = 3
  provider = aws.us
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.us-latency.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.us-latency.certificate_validation_records)[count.index].value]
}
resource "aws_route53_record" "ap-latency-domain-validation" {
  count    = 3
  provider = aws.ap
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.ap-latency.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.ap-latency.certificate_validation_records)[count.index].value]
}
resource "aws_route53_record" "eu-latency-domain-validation" {
  count    = 3
  provider = aws.eu
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.eu-latency.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.eu-latency.certificate_validation_records)[count.index].value]
}
### Domain Validation Records for failover based routes
resource "aws_route53_record" "us-failover-domain-validation" {
  count    = 3
  provider = aws.us
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.us-failover.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.us-failover.certificate_validation_records)[count.index].value]
}
resource "aws_route53_record" "ap-failover-domain-validation" {
  count    = 3
  provider = aws.ap
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.ap-failover.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.ap-failover.certificate_validation_records)[count.index].value]
}
resource "aws_route53_record" "eu-failover-domain-validation" {
  count    = 3
  provider = aws.eu
  zone_id  = aws_route53_zone.student.zone_id
  name     = tolist(aws_apprunner_custom_domain_association.eu-failover.certificate_validation_records)[count.index].name
  type     = "CNAME"
  ttl      = "3"
  records  = [tolist(aws_apprunner_custom_domain_association.eu-failover.certificate_validation_records)[count.index].value]
}
