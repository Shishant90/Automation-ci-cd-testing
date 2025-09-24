pipeline {
    agent any
    
    environment {
        GITHUB_CREDENTIALS = credentials('github-credentials')
        AWS_CREDENTIALS = credentials('aws-credentials')
        TF_VAR_key_name = 'my-ec2-key'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github-credentials', 
                    url: 'https://github.com/Shishant90/ci-cd-jenkins-aws.git'
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building application...'
                sh 'echo "Build completed successfully"'
            }
        }
        
        stage('Terraform Init') {
            steps {
                dir('infrastructure/terraform') {
                    withCredentials([aws(credentialsId: 'aws-credentials')]) {
                        sh 'terraform init'
                    }
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                dir('infrastructure/terraform') {
                    withCredentials([aws(credentialsId: 'aws-credentials')]) {
                        sh 'terraform plan -out=tfplan'
                    }
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                dir('infrastructure/terraform') {
                    withCredentials([aws(credentialsId: 'aws-credentials')]) {
                        sh 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }
    }
    
    post {
        always {
            dir('infrastructure/terraform') {
                archiveArtifacts artifacts: 'terraform.tfstate', allowEmptyArchive: true
            }
        }
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
    }
}