variable "region" {
  type        = string
  description = "Linode Region"
  default     = "ap-northeast"

}

variable "resource_prefix" {
  type        = string
  description = "Prefix to be used for every created resources, Please use 3-4 char. (Required)"
}

variable "node_on_prem_public_key_path" {
  description = "Local path to you public key to connect to YB Node instance (Default: empty)"
  type        = string
  default     = null
}

variable "node_on_prem_test" {
  description = "Will create X nodes to test on_prem"
  default     = 0
  type        = number
}

variable "volume_size" {
  description = "Volume size for onn prem node (default: 100)"
  type        = string
  default     = "100"
}
