pipeline {
    agent any 
    stages {
        stage('pull') { 
            steps {
                echo  "code pulling successful"
            }
        }
        stage('Build') { 
            steps {
                echo "building successful" 
            }
        }
        stage('Test') { 
            steps {
                echo "testing is successful"
            }
        }
        stage('Deploy') { 
            steps {
                echo "deploy is successful"
            }
        }
    }
}