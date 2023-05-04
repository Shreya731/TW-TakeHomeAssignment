# Output
output "vpc-id" {
  value = aws_vpc.terraform-vpc.id
}

output "pub-sub1-id" {
  value = aws_subnet.mediawiki-sub1.id
}

output "pub-sub2-id" {
  value = aws_subnet.mediawiki-sub2.id
}

output "terraform-igw" {
  value = aws_internet_gateway.terraform-igw.id
}

output "priv-sub1-id" {
  value = aws_subnet.mediawiki-privsub1.id
}

output "priv-sub2-id" {
  value = aws_subnet.mediawiki-privsub2.id
}

output "alb-dns" {
  value = aws_lb.pub-sub-alb.dns_name
}