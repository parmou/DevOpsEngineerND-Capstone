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
                sh 'docker build --tag=parveshmourya/web-resume .'
                sh 'docker images ls'
            }
        }

        stage('Upload Image'){
            steps{
                sh 'docker login -u $DOCKERHUB_CREDS_USR -p $DOCKERHUB_CREDS_PSW'
                sh 'docker push parveshmourya/web-resume'
            }
        }

        stage('Set eksctl contet'){
            steps{
                 withAWS(region: 'us-east-2', credentials: 'aws-static'){
                      sh '/home/ubuntu/.local/bin/aws eks --region ap-south-1 update-kubeconfig --name web-resume-prod'
                 }
           
        }

        }
        
        stage('Deploy to AWS'){
            steps{
            withAWS(region: 'us-east-2', credentials: 'aws-static'){
                sh 'echo Starting with setup on AWS EKS'
                sh '/home/ubuntu/bin/kubectl apply -f k8/app.yaml'
                sh '/home/ubuntu/bin/kubectl get nodes'
                sh '/home/ubuntu/bin/kubectl expose deployment web-resume --type=LoadBalancer --name=webapp'
                sh '/home/ubuntu/bin/kubectl get pods'
                sh '/home/ubuntu/bin/kubectl get svc'
            }
        }
        }
        
    }
}
