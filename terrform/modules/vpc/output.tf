output "pvt_subnet_id" {
  value = aws_subnet.pvt_subnet.id
}
output "pub_subnet_id" {
  value = aws_subnet.pub_subnet.id
}
output "vpc_id" {
  value = aws_vpc.mynetwork.id
}
