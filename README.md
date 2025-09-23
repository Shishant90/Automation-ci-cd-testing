# CI/CD Jenkins AWS Project 🚀

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)](https://github.com/Shishant90/ci-cd-jenkins-aws)
[![AWS](https://img.shields.io/badge/AWS-ECS%20%7C%20ECR%20%7C%20EKS-orange)](https://aws.amazon.com/)
[![Jenkins](https://img.shields.io/badge/Jenkins-Pipeline-blue)](https://jenkins.io/)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)](https://terraform.io/)

A complete CI/CD pipeline implementation using Jenkins and AWS services for automated application deployment.

## 🏗️ Architecture Overview

This project demonstrates a production-ready CI/CD pipeline that:
- Builds a Flask web application
- Runs automated tests
- Creates Docker containers
- Pushes images to AWS ECR
- Deploys to AWS ECS/EKS
- Provides infrastructure as code with Terraform

## 📁 Project Structure

```
ci-cd-jenkins-aws/
├── Jenkinsfile                # Pipeline as code
├── README.md                  # Project documentation
├── .gitignore                 # Git ignore patterns
│
├── src/                       # Application source code
│   ├── app.py                 # Flask web application
│   ├── requirements.txt       # Python dependencies
│   └── tests/                 # Unit tests
│       └── test_app.py
│
├── infrastructure/            # Infrastructure as Code
│   ├── terraform/             # AWS resource provisioning
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── ansible/               # Configuration management
│       └── playbook.yml
│
├── deployment/                # Deployment configurations
│   ├── docker/                # Container definitions
│   │   ├── Dockerfile
│   │   └── docker-compose.yml
│   ├── k8s/                   # Kubernetes manifests
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   └── ingress.yaml
│   └── scripts/               # Automation scripts
│       ├── build.sh
│       ├── deploy.sh
│       └── test.sh
│
├── config/                    # Configuration files
│   ├── jenkins/               # Jenkins setup
│   │   └── jenkins-plugins.txt
│   └── aws/                   # AWS configurations
│       └── iam-policy.json
│
└── reports/                   # Test and coverage reports
    ├── junit.xml
    └── coverage.xml
```

## 🚀 Quick Start

### Prerequisites
- AWS Account with appropriate permissions
- Jenkins server with Docker support
- Terraform >= 1.0
- Docker installed
- Git configured

### 1. Clone Repository
```bash
git clone https://github.com/Shishant90/ci-cd-jenkins-aws.git
cd ci-cd-jenkins-aws
```

### 2. AWS Setup
```bash
# Configure AWS credentials
aws configure

# Create IAM policy for Jenkins
aws iam create-policy --policy-name JenkinsECRPolicy --policy-document file://config/aws/iam-policy.json
```

### 3. Infrastructure Deployment
```bash
cd infrastructure/terraform
terraform init
terraform plan
terraform apply
```

### 4. Jenkins Configuration
```bash
# Install required plugins
cat config/jenkins/jenkins-plugins.txt

# Configure AWS credentials in Jenkins
# Add ECR repository URL from Terraform output
```

### 5. Run Pipeline
- Create new Jenkins pipeline job
- Point to this repository
- Jenkins will automatically detect Jenkinsfile
- Execute the pipeline

## 🔧 Pipeline Stages

1. **Build** - Creates Docker image from Flask application
2. **Test** - Runs unit tests and generates coverage reports
3. **Deploy** - Pushes image to ECR and updates ECS service

## 🛠️ Technologies Used

- **Application**: Python Flask
- **CI/CD**: Jenkins Pipeline
- **Containerization**: Docker
- **Cloud**: AWS (ECS, ECR, EKS)
- **IaC**: Terraform
- **Configuration**: Ansible
- **Orchestration**: Kubernetes
- **Testing**: Python unittest

## 📊 Monitoring & Reports

- Test results: `reports/junit.xml`
- Coverage reports: `reports/coverage.xml`
- Jenkins pipeline visualization
- AWS CloudWatch metrics

## 🔒 Security Best Practices

- IAM roles with minimal required permissions
- Secrets managed through Jenkins credentials
- Container image scanning
- Network security groups
- HTTPS/TLS encryption

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨💻 Author

**Shishant** - [GitHub](https://github.com/Shishant90)

## 🙏 Acknowledgments

- AWS Documentation
- Jenkins Community
- Terraform Providers
- Open Source Community

---

⭐ Star this repository if you find it helpful!