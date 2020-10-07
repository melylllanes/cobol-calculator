
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

                    if(params.isJAVA.toBoolean()) {
                        TAGS = TAGS + 'java' 
                              
                    } else {
                        TAGS = ''
                    }

                    if (params.isCOBOL.toBoolean()) {
                        if (TAGS){
                            TAGS = TAGS + ',cobol'
                        }else{
                            TAGS = 'cobol'
                        }
                    }else {
                        TAGS = ''
                    }

                    if (params.isCUCUMBER.toBoolean()) {
                         if (TAGS){
                            TAGS = TAGS + ',cucumber'
                        }else{
                            TAGS = 'cucumber'
                        }
                    }else {
                        TAGS = ''
                    }
                    if (params.isSONAR.toBoolean()) {
                         if (TAGS){
                            TAGS = TAGS + ',sonar'
                        }else{
                            TAGS = 'sonar'
                        }
                    } else {
                        TAGS = ''
                    }
                }

                ansiblePlaybook become: true, installation: 'Ansible', inventory: 'l',
                playbook: 'ansible/check_playbook.yml', tags: "$TAG_JAVA, $TAG_COBOL, $TAG_CUCUMBER, $TAG_SONAR"
            }
        }
    }
}
