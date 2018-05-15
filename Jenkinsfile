pipeline{
    agent any
    stages
    {
        stage("checkout"){
            steps {
               git 'https://github.com/pavants52/ZPAPI.git'

            }
      }
      
      stage("build docker image"){
            steps {
                sh "docker build -t zpui-api:1.1 ."
            }
      }
      
    stage("Tag & Push image"){
withDockerRegistry([credentialsId: '1df43e81-cf69-401c-a047-af5549f03de4', url: 'https://hub.docker.com']){
        sh 'docker tag docker.io/pavan52/zpui-api:1.1 docker.io/pavan52/zpui-api:1.1'
         sh 'docker push docker.io/pavan52/zpui-api:1.1'
         sh 'docker push docker.io/pavan52/zpui-api:1.1'            
}
     }
    
}
