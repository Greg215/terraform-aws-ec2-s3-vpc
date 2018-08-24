#----storage outputs------
output "Bucket Name" {
  value = "${module.storage.bucketname}"
}

#---Networking Outputs -----
output "Public Subnets" {
  value = "${join(", ", module.networking.public_subnets)}"
}

output "Subnet IPs" {
  value = "${join(", ", module.networking.subnet_ips)}"
}

output "Public Security Group" {
  value = "${module.networking.public_sg}"
}
<<<<<<< HEAD
=======

#---Compute Outputs ------

output "Public Instance IDs" {
  value = "${module.compute.server_id}"
}

output "Public Instance IPs" {
  value = "${module.compute.server_ip}"
}
>>>>>>> a0983ebafb28afb00a1de17ace4e115608ae99f4
