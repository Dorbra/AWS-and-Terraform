output "db_servers_private_ips" {
  value = aws_instance.db_servers.*.private_ip
}

output "web_servers_public_ips" {
  value = aws_instance.ec2_web_servers.*.public_ip
}

output "aws_s3_bucket_web_servers_logs_bucket" {
  value = aws_s3_bucket.web_servers_logs_bucket.bucket
}

output "alb_public_dns" {
  value = aws_lb.web_alb.dns_name
}
