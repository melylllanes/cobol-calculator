
pipeline {
    parameters {
        booleanParam(name: 'isJAVA', defaultValue: true, description: 'Execute Java')
        booleanParam(name: 'isCOBOL', defaultValue: true, description: 'Execute Cobol')
        booleanParam(name: 'isCUCUMBER', defaultValue: true, description: 'Execute Cucumber')
        booleanParam(name: 'isSONAR', defaultValue: true, description: 'Execute Sonar')
    }

    agent { label 'Right_node' }

    stages {
        stage('Check Environment') {
            steps {
                script {
                    def TAGSX = ''


                    if(params.isJAVA.toBoolean()) {
                        TAGSX = TAGSX + 'java' 
                              
                    } else {
                        TAGSX = ''
                    }

                    if (params.isCOBOL.toBoolean()) {
                        if (TAGSX){
                            TAGSX = TAGSX + ',cobol'
                        }else{
                            TAGSX = 'cobol'
                        }
                    }else {
                        TAGSX = ''
                    }

                    if (params.isCUCUMBER.toBoolean()) {
                         if (TAGSX){
                            TAGSX = TAGSX + ',cucumber'
                        }else{
                            TAGSX = 'cucumber'
                        }
                    }else {
                        TAGSX = ''
                    }

                    if (params.isSONAR.toBoolean()) {
                         if (TAGSX){
                            TAGSX = TAGSX + ',sonar'
                        }else{
                            TAGSX = 'sonar'
                        }
                    } else {
                        TAGSX = ''
                    }
                }

                ansiblePlaybook become: true, installation: 'Ansible', inventory: 'l',
                playbook: 'ansible/check_playbook.yml', tags: "$TAGSX"
            }
        }
    }
}
