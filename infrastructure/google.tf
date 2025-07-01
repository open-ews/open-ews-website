resource "aws_route53_record" "google" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = ""
  type    = "TXT"
  ttl     = "5"

  records = [
    "google-site-verification=oPTW0AFt7hNvsq7GiBe1ghZENpzR-eNYhXmuXS0rpgQ",
  ]
}

resource "aws_route53_record" "google_mx" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = ""
  type    = "MX"
  ttl     = "5"

  records = [
    "1 SMTP.GOOGLE.COM"
  ]
}
