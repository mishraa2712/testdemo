pipeline {
    agent any
    tools { 
        maven 'Maven 3.3.9' 
        jdk 'jdk8' 
    }
    stages {
        stage('Build Step') {
            steps {
                bat 'mvn clean compile'
            }
        }
        stage('Install Artifact locally') {
            steps {
                bat 'mvn install'
            }
        }
        stage('Test Result') {
            steps {
                bat 'mvn test'
            }
            post {
                always {
                    junit '**/target/surefire-reports/*.xml'
                }
            }
        }
    }
}
