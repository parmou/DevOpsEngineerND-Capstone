pipeline{

    environment{
        registry="parveshmourya/web-resume"
        DOCKERHUB_CREDS = credentials('dockerhub')

    }
    agent any
    stages{
        stage('Lint HTML') {
             steps {
                 sh 'ls -ltr'
                 sh 'tidy -q -e ./web-resume/*.html'
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
    }
}
