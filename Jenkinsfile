pipeline {
    agent none

    stages {
        stage('unit testing phase') {
            agent {
                label 'cobol-bin'
            }
            steps {
                //Compile unit testing framework
                echo 'Unit test'
                sh './compile ZUTZCPC'
                //run test suite calculator
                sh './run-ut CALCULATOR2C CALCULATOR2 CALCULATOR2T'
            }
        }
        stage('Development | Build') {
            agent {
                label 'cobol-bin'
            }
            steps {
                echo 'Build the calculator '
                //sh 'docker build -t .'
                echo 'run the image'
                //sh 'docker run calculator:latest 9 8 "a"'
            }
        }
       stage('Funtional testing') {
           agent {
                label 'cobol-bin'
            }
            steps {
                echo 'Buid the calculator binary'
                sh 'pwd'
                sh 'cobc -free -x -o calculator2-exe src/main/cobol/CALCULATOR2.CBL'
                sh 'ls src/main/cobol/'
                sh 'cp src/main/cobol/calculator2-exe /tmp'
                echo 'Downloading Cucumber project'
                
                checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/diana-estrada/hellocucumber.git']]]
                sh 'cd hellocucumber'
                sh 'mvn test'
            }
        }
   
                
    }
}
