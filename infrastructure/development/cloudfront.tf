# # cloudfront

# # simple cloudfront with s3 objects
# resource "aws_cloudfront_distribution" "default_cdn" {
#   origin {
#     domain_name =  "${var.default_domain_name}"
#     origin_id = "${var.default_cdn_bucket}"
#   }

#   enabled = true
#   default_root_object = "index.html"

#   default_cache_behavior {
#     allowed_methods = ["GET", "HEAD"]
#     cached_methods = ["GET", "HEAD"]
#     target_origin_id = "${var.default_cdn_bucket}"

#     forwarded_values {
#       query_string = false

#       cookies {
#         forward = "none"
#       }
#     }

#     viewer_protocol_policy = "allow-all"
#     min_ttl = 0
#     default_ttl = 3600
#     max_ttl = 7200
#   }

#   price_class = "PriceClass_All"

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#     }
#   }

#    viewer_certificate {
#      cloudfront_default_certificate = true
#    }

#    tags {
#       Name = "Default CDN"
#       Environment = "${var.default_environment}"
#    }
# }
