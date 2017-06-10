# # outputs

# # CDN
# output "default_cdn" {
#   value = "${aws_cloudfront_distribution.default_cdn.domain_name}"
# }

output "subnet_1" {
  value = "${aws_subnet.subnet_1.cidr_block}"
}
