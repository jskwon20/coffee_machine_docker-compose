#!/bin/bash
set -e

# AWS ECR Login
echo "🔑 AWS ECR 로그인 중..."
aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 637341921879.dkr.ecr.ap-northeast-2.amazonaws.com

# Build and Push Images
echo "🏗️ Order 서비스 빌드 중..."
docker build -t 637341921879.dkr.ecr.ap-northeast-2.amazonaws.com/coffee_machine:order-latest ./services/order
docker push 637341921879.dkr.ecr.ap-northeast-2.amazonaws.com/coffee_machine:order-latest

echo "🏗️ Inventory 서비스 빌드 중..."
docker build -t 637341921879.dkr.ecr.ap-northeast-2.amazonaws.com/coffee_machine:inventory-latest ./services/inventory
docker push 637341921879.dkr.ecr.ap-northeast-2.amazonaws.com/coffee_machine:inventory-latest

echo "🏗️ Billing 서비스 빌드 중..."
docker build -t 637341921879.dkr.ecr.ap-northeast-2.amazonaws.com/coffee_machine:billing-latest ./services/billing
docker push 637341921879.dkr.ecr.ap-northeast-2.amazonaws.com/coffee_machine:billing-latest

echo "🏗️ Frontend 서비스 빌드 중..."
docker build -t 637341921879.dkr.ecr.ap-northeast-2.amazonaws.com/coffee_machine:frontend-latest ./frontend
docker push 637341921879.dkr.ecr.ap-northeast-2.amazonaws.com/coffee_machine:frontend-latest

echo "✅ 모든 이미지 빌드 및 Push 완료!"
echo "🔄 Pod를 재시작하여 변경 사항을 적용하세요:"
echo "kubectl rollout restart deployment order inventory billing frontend"
