pipeline {
    agent any
    parameters {
        string(name: 'fname', defaultValue: 'Abhi', description: 'this is my first name')
    }
    tools { 
        maven 'Maven 3.3.9' 
        jdk 'jdk8' 
    }
    stages {
        stage('FIRSTNAME') {
            steps {
                echo "###################### ${params.fname}"
            }
        }
        stage('Build Step') {
            steps {
                parallel(
                    single: {
                        bat 'mvn compile -f single-module/pom.xml'
                    },
                    Multi: {
                        bat 'mvn compile -f multi-module/pom.xml'
                    }
                )
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
