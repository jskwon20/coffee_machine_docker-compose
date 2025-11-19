# Coffee Machine Microservices

FastAPI 기반 커피 자판기 마이크로서비스 프로젝트

## Architecture

- **Order Service** (Port 8000): 주문 및 메뉴 관리
- **Inventory Service** (Port 8001): 재고 관리
- **Billing Service** (Port 8002): 결제 및 매출 관리
- **MySQL** (Port 3306): 데이터베이스
- **Frontend** (Port 8080): 관리 웹 인터페이스

## Quick Start

```bash
# 서비스 시작
docker-compose up -d

# 프론트엔드 실행
cd frontend && python3 -m http.server 8080
```

브라우저에서 http://localhost:8080 접속

## API Endpoints

### Order Service (8000)
- `GET /menu` - 메뉴 조회
- `POST /orders` - 주문 생성

### Inventory Service (8001)
- `GET /inventory` - 재고 조회
- `POST /inventory/use` - 재고 차감
- `POST /inventory/add` - 재고 추가

### Billing Service (8002)
- `GET /sales` - 매출 조회
- `POST /payment` - 결제 처리
- `POST /inventory-cost` - 재고 비용 처리

## Project Structure

```
coffee_machine/
├── services/
│   ├── order/          # 주문 서비스
│   ├── inventory/      # 재고 서비스
│   └── billing/        # 결제 서비스
├── database/
│   └── init.sql        # MySQL 초기화
├── frontend/
│   └── index.html      # 관리 페이지
├── k8s/                # Kubernetes 매니페스트 (예정)
└── docker-compose.yml
```

## Tech Stack

- FastAPI
- MySQL 8.0
- Docker & Docker Compose
- httpx (async HTTP client)
- mysql-connector-python

## Next Steps

- [ ] Kubernetes 매니페스트 작성
- [ ] EKS 배포
- [ ] Gateway API 구성
