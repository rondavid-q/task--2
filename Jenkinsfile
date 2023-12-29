pipeline {
    agent any
    
    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Select Action')
        string(name: 'VPC_NAME', defaultValue: 'idz-tf-test', description: 'Enter VPC name')
        string(name: 'VPC_CIDR', defaultValue: '10.0.0.0/16', description: 'Enter VPC CIDR range')
        string(name: 'PRIVATE1_SUBNET_CIDR', defaultValue: '10.0.1.0/24', description: 'Enter CIDR range for private subnet1')
        string(name: 'PRIVATE2_SUBNET_CIDR', defaultValue: '10.0.2.0/24', description: 'Enter CIDR range for private subnet2')
        string(name: 'PUBLIC1_SUBNET_CIDR', defaultValue: '10.0.3.0/24', description: 'Enter CIDR range for public subnet1')
        string(name: 'PUBLIC2_SUBNET_CIDR', defaultValue: '10.0.4.0/24', description: 'Enter CIDR range for public subnet2')
        string(name: 'PROJECT_NAME_ENV', defaultValue: 'idz-dev', description: 'Enter the env with project name')
        
    }
    
    stages {
        stage('Git Checkout') {
            steps {
                git ( url: "https://github.com/rondavid-q/task-2-infra.git", credentialsId: "github", branch: "main" )
            }
        }
        
        
        stage('Create vars.tf') {
            steps {
                script {
                    def filePath = "${env.WORKSPACE}/terraform.tfvars"
                    
                    def fileContent = "vpc_name = \"${params.VPC_NAME}\" \n"
                    fileContent += "cidr_block = \"${params.VPC_CIDR}\" \n"
                    fileContent += "private1_subnet_cidr = \"${params.PRIVATE1_SUBNET_CIDR}\" \n"
                    fileContent += "private2_subnet_cidr = \"${params.PRIVATE2_SUBNET_CIDR}\" \n"
                    fileContent += "public1_subnet_cidr = \"${params.PUBLIC1_SUBNET_CIDR}\" \n"
                    fileContent += "public2_subnet_cidr = \"${params.PUBLIC2_SUBNET_CIDR}\" \n"
                    fileContent += "project_name_env = \"${params.PROJECT_NAME_ENV}\" \n"
                    
                    writeFile(file: "${filePath}", text: "${fileContent}")
                }
                
                sh "cat terraform.tfvars"
            }
        }
        
        stage('Terraform Initialize') {
            steps {
                //sh "cd infra"
                sh "terraform init -reconfigure"
            }
        }
        stage('Terraform Workspace') {
                steps {
                    script {
                        // Check if the workspace already exists
                        def workspaceExists = sh(script: "terraform workspace list | grep -q ${params.VPC_NAME}", returnStatus: true)
    
                        if (workspaceExists == 0) {
                            // If the workspace exists, select it
                            sh "terraform workspace select ${params.VPC_NAME}"
                        } else {
                            // If the workspace doesn't exist, create it
                            sh "terraform workspace new ${params.VPC_NAME}"
                        }
                    }
                }
            }
        
        stage('Terraform Plan') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: "aws-key", secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        sh "terraform plan ${ params.ACTION == 'destroy' ? '-destroy' : '' }"
                    }
                }
            }
        }
        
        stage('Approval') {
            steps {
                input('Do you want to ${params.ACTION} the plan?')
            }
        }
        
        stage('Action') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: "aws-key", secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh "terraform ${params.ACTION} --auto-approve"
                    }
                }
            }
        }
    }
}