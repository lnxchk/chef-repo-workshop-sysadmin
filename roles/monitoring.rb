name "monitoring"
description "Monitoring server"
run_list(
  "role[base]",
  "recipe[nagios::server]",
  "recipe[postfix::server]"
)

default_attributes(
  "nagios" => {
    "server_auth_method" => "htauth"
  },
  "postfix" => {
    "mydomain" => "example.com",
    "mail_relay_networks" => "127.0.0.0/8 172.16.0.0/16 10.223.30.88"
  }
)
