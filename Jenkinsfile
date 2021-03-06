pipeline{
    agent any
    tools {
        terraform 'terraform'
    }
    stages{
        stage('Git checkout'){
            steps{
               git branch: 'main', credentialsId: '836f1cd0-78c0-4c51-a21c-d365f759f7b6', url: 'https://github.com/naveena3993/Jenkins.git'
           }
        }
        stage('Terraform Init'){
            
            steps {
                    
                      sh """
                                
                        echo "Initialising Terraform"
                      terraform init
                        """
                           }
                   }

        stage('Terraform Validate'){
            
            steps {
                        sh """
                                
                        terraform validate
                        """
                           }
                
        }
                stage('Terraform Plan'){
                 steps {
                withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                    ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {
                    
                        sh """
                        
                        echo "Creating Terraform Plan"
                        terraform plan -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET" -var "subscription_id=$ARM_SUBSCRIPT
                        """
                        }
            } 
        }

        stage('Waiting for Approval'){
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    input (message: "Deploy the infrastructure?")
                }
            }
        
        }
        stage('Terraform Apply'){
            steps {
                        sh """
                        echo "Applying the plan"
                       cd /var/lib/jenkins & terraform apply 
                        """
                    }
            }
        }
}
