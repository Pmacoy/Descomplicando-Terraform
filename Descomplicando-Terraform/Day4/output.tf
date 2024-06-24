output "ip_address" {
  value = {
    for instance in aws_instance.web:
    instance.id => instance.public_ip
  }
}

# output "dns_name" {
#   value = "${aws_instance.web[*].public_dns}"
# }