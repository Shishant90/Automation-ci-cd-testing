# CI/CD Jenkins AWS Project

A complete CI/CD pipeline using Jenkins and AWS services.

## Structure
- `src/` - Application source code
- `infrastructure/` - Infrastructure as Code (Terraform/Ansible)
- `deployment/` - Deployment configurations and scripts
- `config/` - Jenkins and AWS configurations
- `reports/` - Test and coverage reports

## Setup
1. Configure Jenkins with required plugins
2. Set up AWS credentials
3. Run `terraform apply` in infrastructure/terraform/
4. Execute Jenkins pipeline