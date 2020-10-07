
pipeline {
    parameters {
        booleanParam(name: 'isJAVA', defaultValue: true, description: 'Execute Java')
        booleanParam(name: 'isCOBOL', defaultValue: true, description: 'Execute Cobol')
        booleanParam(name: 'isCUCUMBER', defaultValue: true, description: 'Execute Cucumber')
        booleanParam(name: 'isSONAR', defaultValue: true, description: 'Execute Sonar')
    }

    environment {
        TAGSX = ""
    }

    agent { label 'Right_node' }

    stages {
        stage('Check Environment') {
            steps {
                script {
                 
                    print(params.isJAVA.toBoolean())
                    if(params.isJAVA.toBoolean()) {
                        TAGSX = 'java' 
                              
                    } 

                    if (params.isCOBOL.toBoolean()) {
                        if (TAGSX){
                            TAGSX = TAGSX + ',cobol'
                        }else{
                            TAGSX = 'cobol'
                        }
                    }

                    if (params.isCUCUMBER.toBoolean()) {
                         if (TAGSX){
                            TAGSX = TAGSX + ',cucumber'
                        }else{
                            TAGSX = 'cucumber'
                        }
                    }

                    if (params.isSONAR.toBoolean()) {
                         if (TAGSX){
                            TAGSX = TAGSX + ',sonar'
                        }else{
                            TAGSX = 'sonar'
                        }
                    } 

                 
                }

                ansiblePlaybook become: true, installation: 'Ansible', inventory: 'l',
                playbook: 'ansible/check_playbook.yml', tags: ""
            }
        }
    }
}
