output "web_public_ip" {
  description = "Public IP of the web server EC2 instance"
  value       = aws_eip.web.public_ip
}

output "db_private_ip" {
  description = "Private IP of the database EC2 instance (not reachable from the internet)"
  value       = aws_instance.db.private_ip
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "ssh_command_web" {
  description = "Command to SSH into the web server"
  value       = "ssh -i ~/.ssh/mern-key ubuntu@${aws_eip.web.public_ip}"
}

output "ssh_command_db" {
  description = "Command to SSH into the DB server through the web server (jump host)"
  value       = "ssh -i ~/.ssh/mern-key -o ProxyCommand=\"ssh -W %h:%p -i ~/.ssh/mern-key ubuntu@${aws_eip.web.public_ip}\" ubuntu@${aws_instance.db.private_ip}"
}

