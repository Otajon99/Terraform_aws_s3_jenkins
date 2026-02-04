pipeline {
    agent any
    
    tools {
        // This must match the name you gave in Step 1
        terraform 'terraform'
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    stage('Terraform Init') {
    steps {
        sh 'terraform init'
    }
}

stage('Terraform Plan') {
    steps {
        sh 'terraform plan -out=tfplan'
    }
}

stage('Terraform Apply') {
    steps {
        sh 'terraform apply -auto-approve tfplan'
    }
}

    
        }
    }
}
