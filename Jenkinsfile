pipeline {
    agent any
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
        }
    }
}
