name "base"
description "Base role applied to all nodes."
run_list( 
  "recipe[chef-client::delete_validation]", 
  "recipe[chef-client]",
  "recipe[ntp]", 
  "recipe[motd]", 
  "recipe[sudo]",
  "recipe[postfix::client]",
  "recipe[users]"
)

default_attributes(
  "authorization" => {
    "sudo" => {
      "users" => ["ubuntu"],
      "groups" => ["admin", "sudo"],
      "passwordless" => true
    }
  },
  "postfix" => {
    "relayhost_role" => "monitoring"
  }
)
