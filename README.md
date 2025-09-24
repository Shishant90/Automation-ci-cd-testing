# CI/CD Jenkins AWS Project 🚀

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)](https://github.com/Shishant90/ci-cd-jenkins-aws)
[![AWS](https://img.shields.io/badge/AWS-ECS%20%7C%20ECR%20%7C%20EKS-orange)](https://aws.amazon.com/)
[![Jenkins](https://img.shields.io/badge/Jenkins-Pipeline-blue)](https://jenkins.io/)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)](https://terraform.io/)

A complete CI/CD pipeline implementation using Jenkins and AWS services for automated application deployment.

## 🏗️ Architecture Overview

This project demonstrates a production-ready CI/CD pipeline that:
- Pulls code from private GitHub repository
- Runs build stage
- Uses Terraform to provision AWS infrastructure
- Creates EC2 instance in eu-north-1 with Ubuntu 22.04
- Installs and configures Nginx web server
- Deploys custom index.html page

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

#### GitHub Credentials Setup (Private Repository)
1. **Generate GitHub Personal Access Token**:
   - Go to GitHub Settings → Developer settings → Personal access tokens
   - Generate new token with `repo` scope for private repositories
   - Copy the token securely

2. **Configure Jenkins Credentials**:
   - Navigate to Jenkins → Manage Jenkins → Manage Credentials
   - Add new credential:
     - Kind: `Username with password`
     - Username: Your GitHub username
     - Password: Your GitHub personal access token
     - ID: `github-credentials`
     - Description: `GitHub Access Token`

3. **Update Jenkinsfile for Private Repo**:
   ```groovy
   pipeline {
       agent any
       
       environment {
           GITHUB_CREDENTIALS = credentials('github-credentials')
       }
       
       stages {
           stage('Checkout') {
               steps {
                   git credentialsId: 'github-credentials', 
                       url: 'https://github.com/Shishant90/ci-cd-jenkins-aws.git'
               }
           }
           // ... other stages
       }
   }
   ```

### 5. Run Pipeline
- Create new Jenkins pipeline job
- Point to this repository
- Jenkins will automatically detect Jenkinsfile
- Execute the pipeline

## 🔧 Pipeline Stages

1. **Checkout** - Pulls code from private GitHub repository using credentials
2. **Build** - Runs application build process
3. **Terraform Init** - Initializes Terraform configuration
4. **Terraform Plan** - Creates execution plan for infrastructure changes
5. **Terraform Apply** - Provisions EC2 instance with Nginx and custom webpage

## 🛠️ Technologies Used

- **CI/CD**: Jenkins Pipeline
- **Cloud**: AWS EC2 (eu-north-1)
- **IaC**: Terraform
- **OS**: Ubuntu 22.04 LTS
- **Web Server**: Nginx
- **Version Control**: Private GitHub Repository
- **Security**: AWS Security Groups, SSH Key Pairs

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