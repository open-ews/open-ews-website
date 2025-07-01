resource "aws_route53_record" "github" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "_gh-open-ews-o"
  type    = "TXT"
  ttl     = "5"

  records = [
    "aef4155c0f"
  ]
}
