pipeline{

    environment{
        registry="parveshmourya/web-resume"
        DOCKERHUB_CREDS = credentials('dockerhub')

    }
    agent any
    stages{
        stage('Lint DockerFile') {
             steps {
                 sh 'ls -ltr'
                 sh 'echo Linting Dockerfile'
                 sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
             }
        }

        

        stage('Build Image from Dockerfile'){
            steps{
                sh 'docker build --tag=parveshmourya/capstone .'
                sh 'docker images ls'
            }
        }

        stage('Upload Image'){
            steps{
                sh 'docker login -u $DOCKERHUB_CREDS_USR -p $DOCKERHUB_CREDS_PSW'
                sh 'docker push parveshmourya/capstone'
            }
        }

        stage('Set eksctl contet'){
            steps{
                 withAWS(region: 'us-east-2', credentials: 'aws-static'){
                      sh 'aws eks --region ap-south-1 update-kubeconfig --name web-resume-prod'
                 }
           
        }

        }
        
        stage('Deploy to AWS'){
            steps{
            withAWS(region: 'us-east-2', credentials: 'aws-static'){
                sh 'echo Starting with setup on AWS EKS'
                sh 'kubectl apply -f k8/app.yaml'
                sh 'kubectl get nodes'
                sh 'kubectl expose deployment web-resume --type=LoadBalancer --name=webapp'
                sh 'kubectl get pods'
                sh 'kubectl get svc'
            }
        }
        }
        
    }
}
