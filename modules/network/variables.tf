variable "cloud" {
  type = string
}

variable "res_type" {
  type = string
}

variable "eip_name" {
  default = ""
  type    = string
}

variable "eip_bandwidth" {
  default = 0
  type    = number
}

variable "eip_route_type" {
  default = ""
  type    = string
}

variable "payment_timing" {
  default = ""
  type    = string
}

variable "reservation_length" {
  default = 0
  type    = number
}

variable "reservation_time_unit" {
  default = "month"
  type    = string
}

variable "name" {
  default = ""
  type    = string
}

variable "vpc_id" {
  default = ""
  type    = string
}

variable "subnet_id" {
  default = ""
  type    = string
}

variable "tags" {
  default = {}
  type    = map(string)
}

variable "lb_id" {
  default = ""
  type    = string
}

variable "port" {
  default = 0
  type    = number
}

variable "load_balancing_algorithm_type" {
  default = "round_robin"
  type    = string
}

variable "cert_ids" {
  default = []
  type    = list(string)
}

variable "client_cert_ids" {
  default = []
  type    = list(string)
}

variable "dual_auth" {
  default = false
  type    = bool
}

variable "lb_srv_gp_description" {
  default = ""
  type    = string
}

variable "eip" {
  default = ""
  type    = string
}

variable "instance_type" {
  default = ""
  type    = string
}

variable "instance_id" {
  default = ""
  type    = string
}

variable "backend_server_list" {
  default = []
  type    = list(map(string))
}

variable "port_list" {
  default = []
  type    = list(map(string))
}

variable "protocol" {
  default = ""
  type    = string
}

variable "protocol_version" {
  default = "HTTP1"
  type    = string
}

variable "proxy_protocol_v2" {
  default = true
  type    = bool
}

variable "encryption_protocols" {
  default = ["tlsv11", "tlsv12"]
  type    = list(string)
}

variable "encryption_type" {
  default = "incompatibleIE"
  type    = string
}

variable "ie6_compatible" {
  default = false
  type    = bool
}

variable "keep_session_timeout" {
  default = 3600
  type    = number
}

variable "keep_session_type" {
  default = "insert"
  type    = string
}

variable "keep_session" {
  default = true
  type    = bool
}

variable "server_timeout" {
  default = 30
  type    = number
}

variable "x_forwarded_for" {
  default = true
  type    = bool
}

variable "tcp_session_timeout" {
  default = 900
  type    = number
}

variable "natGateway_name" {
  default = ""
  type    = string
}

variable "description" {
  default = ""
  type    = string
}

variable "connectivity_type" {
  default = "public"
  type    = string
}

variable "natGateway_spec" {
  default = "small"
  type    = string
}

variable "allocation_id" {
  default = ""
  type    = string
}

variable "internetGatewayId" {
  default = ""
  type    = string
}

variable "internetGateway_name" {
  default = ""
  type    = string
}

variable "isInternal" {
  default = true
  type    = bool
}

variable "preserve_host_header" {
  default = true
  type    = bool
}

variable "subnets" {
  default = []
  type    = list(string)
}

variable "idle_timeout" {
  default = 60
  type    = number
}

variable "enable_cross_zone_load_balancing" {
  default = true
  type    = bool
}

variable "preserve_client_ip" {
  default = true
  type    = bool
}

variable "target_type" {
  default = ""
  type    = string
}

variable "ip_address_type" {
  default = "ipv4"
  type    = string
}

variable "target_group_arn" {
  default = ""
  type    = string
}

variable "target_id" {
  default = ""
  type    = string
}

variable "actions" {
  default = []
  type    = any
  # example
  # type = list(object({
  #   type             = string,
  #   order            = number,
  #   target_group_arn = string
  #   forward          = object({
  #     target_group = list(object({
  #       arn      = string,
  #       weight   = number
  #     })),
  #     stickiness   = object({
  #       duration = number,
  #       enabled  = bool
  #     })
  #   })
  # }))
}

variable "alpn_policy" {
  default = ""
  type    = string
}

variable "cert_arn" {
  default = ""
  type    = string
}

variable "ssl_policy" {
  default = ""
  type    = string
}

variable "lb_listener_id" {
  default = ""
  type    = string
}

variable "lb_type" {
  default = ""
  type    = string
}

variable "secGps" {
  default = []
  type    = list(string)
}

variable "priority" {
  default = 0
  type    = number
}

variable "condition" {
  default = []
  type = list(object({
    host_header         = list(string),
    http_header         = list(map(string)),
    http_request_method = list(string),
    path_pattern        = list(string),
    query_string        = list(map(string)),
    source_ip           = list(string)
  }))
}

variable "subnet_mapping" {
  default = {}
  type    = map(string)
}

variable "health_check" {
  default = []
  type    = list(map(string))
}

variable "stickiness" {
  default = []
  type    = list(map(string))
}

variable "log_bucket" {
  default = ""
  type    = string
}

variable "log_enabled" {
  default = false
  type    = bool
}

variable "log_bucket_prefix" {
  default = ""
  type    = string
}

variable "scheduler" {
  default = ""
  type    = string
}
