pipeline {
    agent none
     stages {
    //     stage('unit testing phase') {
    //         agent {
    //             label 'cobol-bin'
    //         }
    //         steps {
    //             echo 'Compile unit testing framework'
    //             echo 'Unit test'
    //             sh './compile ZUTZCPC'
    //             echo 'Run test suite calculator'
    //             sh './run-ut CALCULATOR2C CALCULATOR2 CALCULATOR2T'
    //         }
    //     }
    //     stage('SonarCloud Analysis') {
    //         agent {
    //             label 'cobol-bin'
    //         }            
    //         environment {
    //             scannerHome = tool 'SonarCubeScanner'
    //         }            
    //         steps {
    //             withSonarQubeEnv('sonar') {
    //                 sh "${scannerHome}/bin/sonar-scanner"
    //             }               
    //         }
    //     }
        //stage('Development | Build') {
        //    agent {
        //        label 'cobol-bin'
        //    }
        //    steps {
        //        echo 'Build the calculator '
        //        //sh 'docker build -t .'
        //        echo 'run the image'
        //        //sh 'docker run calculator:latest 9 8 "a"'
        //    }
        //}
        stage('Functional testing maven') {
           agent {
                label 'cobol-bin'
            }
            steps {
                checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/diana-estrada/hellocucumber.git']]]
                echo 'Buid the calculator binary'
                sh 'cd src/main/cobol; pwd; ls -al; cobc -free -x -o calculator2-exe CALCULATOR2.CBL; ls -al; cp src/main/cobol/calculator2-exe /tmp; ls /tmp; mvn clean test'
            }
        }       
    }
    // post {
    //     always {
    //         cucumber buildStatus: 'UNSTABLE',
    //             reportTitle: 'My report',
    //             fileIncludePattern: '**/*.json'
    //     }
    // }
}
