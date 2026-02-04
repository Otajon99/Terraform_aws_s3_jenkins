pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:latest'
            args  '--entrypoint=' 
        }
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }
    stages {
        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    // -auto-approve is required for CI/CD
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        stage('Upload Content') {
            agent any // Switch to main node to use AWS CLI
            steps {
                // Syncs your index.html to the new bucket
                sh 'aws s3 sync . s3://my-unique-static-site-2026 --exclude "terraform/*" --exclude "Jenkinsfile"'
            }
        }
    }
}
