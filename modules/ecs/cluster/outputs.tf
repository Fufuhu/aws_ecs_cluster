output "cluster_arn" {
  description = "ECSクラスターのARN"
  value = aws_ecs_cluster.cluster.arn
}