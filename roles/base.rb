name "base"
description "Base role applied to all nodes."
run_list "recipe[chef-client::delete_validation]", "recipe[chef-client]","recipe[ntp]", "recipe[motd]", "recipe[users]"
