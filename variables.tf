variable project {
  description = "Map of project names to configuration."
  type        = map
  default     = {
    lb = {
	name        = "lb"
        server_type = "cx11"
        image   = "centos-8"
    },
    front = {
	name        = "front"
        server_type = "cx11"
        image   = "centos-8"
    }
    back = {
	name        = "back"
        server_type = "cx11"
        image   = "centos-8"
    },
    db = {
	name        = "db"
        server_type = "cx11"
        image   = "centos-8"
    }

  }
}
