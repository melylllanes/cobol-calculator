pipeline { 
    
    agent any
    
    parameters {
     
        booleanParam(name: 'TAG_JAVA', defaultValue: true, description: 'Execute Java')

    }

     stages {
         stage('Check Environment') {    
            
             steps {

                script {

               if(params.TAG_JAVA.toBoolean()){
                        TAG_JAVA = "java";
                 } else {
                     TAG_JAVA = ""
                     }
                }
                     
                 ansiblePlaybook become: true, installation: 'Ansible', inventory: 'l', playbook: 'ansible/check_playbook.yml', tags: 'TAG_JAVA'
             }
         }
     }
}
