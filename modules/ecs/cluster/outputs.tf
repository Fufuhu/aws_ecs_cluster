output "cluster_arn" {
  description = "ECSクラスターのARN"
  value = aws_ecs_cluster.cluster.arn
}

output "cluster_tags" {
  description = "ECSクラスターのタグ"
  value = aws_ecs_cluster.cluster.tags
}