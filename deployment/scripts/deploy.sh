#!/bin/bash
set -e

echo "Logging into ECR..."
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $(terraform -chdir=infrastructure/terraform output -raw ecr_repository_url)

echo "Pushing image to ECR..."
ECR_REPO=$(terraform -chdir=infrastructure/terraform output -raw ecr_repository_url)
docker push $ECR_REPO:latest

echo "Updating ECS service..."
aws ecs update-service --cluster $(terraform -chdir=infrastructure/terraform output -raw ecs_cluster_name) --service cicd-app --force-new-deployment

echo "Deployment completed successfully!"