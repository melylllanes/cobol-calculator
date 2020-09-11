pipeline {
    agent none

    stages {
        stage('SonarCloudScanner') {
            agent {
                label 'opencobol'
            }
            steps {
                export SONAR_SCANNER_VERSION=4.4.0.2170
                export SONAR_SCANNER_HOME=$HOME/.sonar/sonar-scanner-$SONAR_SCANNER_VERSION-linux
                curl --create-dirs -sSLo $HOME/.sonar/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip
                unzip -o $HOME/.sonar/sonar-scanner.zip -d $HOME/.sonar/
                export PATH=$SONAR_SCANNER_HOME/bin:$PATH
                export SONAR_SCANNER_OPTS="-server"
            }
        }
        stage('unit testing phase') {
            agent {
                label 'opencobol'
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
                label 'opencobol'
            }
            steps {
                echo 'Build the calculator '
                sh 'docker build -t .'
                echo 'run the image'
                sh 'docker run calculator:latest 9 8 "a"'
            }
        }
       //stage('Funtional testing') {
       //     agent {
       //         docker { image 'lozahec/open-cobol-gnu:latest' }
       //     }
       //     steps {
       //         echo 'Build the calculator '
       //         sh 'docker build -t .'
       //         echo 'run the image'
       //         sh 'docker run calculator:latest 9 8 "a"
       //     }
       // }
   
                
    }
}
