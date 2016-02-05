backend "mysql" {
  address = "127.0.0.1:3306"
  username = "root"
  password = "vagrant"
  path = "vault"
}

listener "tcp" {
  address = "127.0.0.1:8200"
  tls_disable = 0
}
