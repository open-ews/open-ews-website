module "ssl_certificate" {
  source = "./modules/ssl_certificate"

  domain_name               = "open-ews.org"
  subject_alternative_names = ["*.open-ews.org"]
  route53_zone              = data.aws_route53_zone.this

  providers = {
    aws = aws.us-east-1
  }
}
