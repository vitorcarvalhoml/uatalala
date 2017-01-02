# # s3

# # creating s3 resource - simple bucket
# resource "aws_s3_bucket" "default_bucket" {
# 	bucket = "${var.default_bucket}"	

# 	tags {
# 		Name = "Default bucket"
# 		Environment = "${var.default_environment}"
# 	}
# }

# # creating s3 resource - lifecycle enabled
# resource "aws_s3_bucket" "backup_bucket" {
# 	bucket = "uatalala_backup"
	
# 	lifecycle_rule {
# 		id = "backup"
# 		prefix = "/"
# 		enabled = true
		
# 		transition {
# 			days = 30
# 			storage_class = "GLACIER"
# 		} 
		
# 		expiration {
# 			days = 420 
# 		}
# 	} 

# 	tags {
# 		Name = "Backup bucket"
# 		Environment = "${var.default_environment}"
# 	}
# }

# resource "aws_s3_bucket" "cdn_bucket" {
# 	bucket = "${var.default_cdn_bucket}"
# 	acl = "public-read"	
	
# 	tags {
# 		Name = "CDN bucket"
# 		Environment = "${var.default_environment}"
# 	}
# }
