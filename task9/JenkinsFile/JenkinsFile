pipeline {
    agent any
    environment{
      FLUTTER_VERSION         = "2.2.2"
    }
    stages {
        stage('Analyze') {
            steps {
                sh '''
                    date
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    ls -la
                '''
            }
        }   

    }
}
