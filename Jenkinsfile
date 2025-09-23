pipeline {
    agent any
    
    environment {
        GITHUB_CREDENTIALS = credentials('github-credentials')
        AWS_CREDENTIALS = credentials('aws-credentials')
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
                sh './deployment/scripts/build.sh'
            }
        }
        
        stage('Test') {
            steps {
                sh './deployment/scripts/test.sh'
            }
        }
        
        stage('Deploy') {
            steps {
                withCredentials([aws(credentialsId: 'aws-credentials')]) {
                    sh './deployment/scripts/deploy.sh'
                }
            }
        }
    }
    
    post {
        always {
            publishTestResults testResultsPattern: 'reports/junit.xml'
        }
    }
}