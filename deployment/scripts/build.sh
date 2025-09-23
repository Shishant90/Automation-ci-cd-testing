#!/bin/bash
set -e

echo "Building Docker image..."
docker build -t cicd-app:latest -f deployment/docker/Dockerfile .

echo "Tagging image for ECR..."
ECR_REPO=$(terraform -chdir=infrastructure/terraform output -raw ecr_repository_url)
docker tag cicd-app:latest $ECR_REPO:latest

echo "Build completed successfully!"