variable "service_name" {
  type        = string
  description = "クラスタを利用するサービス名"
}

variable "service_suffix" {
  type        = string
  description = "サービス名のサフィックス(サブサービス名やコンポーネント名)"
  default     = ""
}

variable "env" {
  description = "環境識別子（dev, stg, prod）"
  type        = string
}

variable "cluster_additional_tags" {
  description = "クラスタの追加タグ"
  type        = map(string)

  validation {
    condition     = length(setintersection(keys(var.cluster_additional_tags), ["Name", "Env", "ServiceName", "ServiceSuffix"])) == 0
    error_message = "Key names, Name and Env, ServiceName, ServiceSuffix is reserved. Not allowed to use them."
  }
}

locals {
  cluster_name = var.service_suffix == "" ? "${var.service_name}-${var.env}-cluster" : "${var.service_name}-${var.service_suffix}-${var.env}-cluster"

  default_tags = var.service_suffix == "" ? {
    ServiceName = var.service_name
    Env         = var.env
    } : {
    ServiceName   = var.service_name
    ServiceSuffix = var.service_suffix
    Env           = var.env
  }

  cluster_tags = merge(
    {
      Name = local.cluster_name
    },
    var.cluster_additional_tags,
    local.default_tags,
  )
}