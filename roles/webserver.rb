name "webserver"
description "webservers"
run_list "recipe[apache]"
default_attributes({
  "apache" => {
    "sites" => {
      "admin" => {
        "port" => 82
      },
      "bears" => {
        "port" => 8081
      }
    }
  }
})
