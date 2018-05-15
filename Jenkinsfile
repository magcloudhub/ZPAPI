pipeline{
    agent any
    stages
    {
        stage("get source code"){
            step{
                   echo 'api build started..'
                   checkout scm
            }
      }
      
      stage("build docker image"){
            steps {
                sh "docker build -t pavan52/Zpui-api:1.0 ."
            }
      }
      
    stage("Tag & Push image"){
withDockerRegistry([credentialsId: 'Docker-ID', url: 'https://index.docker.io/v1/']) {
         sh 'docker tag docker.io/pavan52/Zpui-api:1.0 docker.io/pavan52/Zpui-api:1.0'
         sh 'docker push docker.io/pavan52/Zpui-api:1.0'
         sh 'docker push docker.io/pavan52/Zpui-api:1.0'              }
       }
    }
}
