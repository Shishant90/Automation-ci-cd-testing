pipeline {
    agent any
    
    stages {
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
                sh './deployment/scripts/deploy.sh'
            }
        }
    }
    
    post {
        always {
            publishTestResults testResultsPattern: 'reports/junit.xml'
        }
    }
}