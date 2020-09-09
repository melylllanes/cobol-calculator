pipeline {
    agent none

    stages {
        stage('unit testing phase') {
            agent {
                docker { image 'lozahec/open-cobol-gnu:latest' }
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
                docker { image 'lozahec/open-cobol-gnu:latest' }
            }
            steps {
                echo 'Build the calculator '
                sh 'docker build -t .'
                echo 'run the image'
                sh 'docker run calculator:latest 9 8 "a"
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
