pipeline {
  stages {
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
}
}
