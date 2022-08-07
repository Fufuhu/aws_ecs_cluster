resource "aws_ecs_cluster" "cluster" {
  name = local.cluster_name
  tags = local.cluster_tags
}

resource "aws_ecs_cluster_capacity_providers" "cluster_capacity_provider" {
  cluster_name = aws_ecs_cluster.cluster.name

  capacity_providers = [
    "FARGATE"
  ]
}