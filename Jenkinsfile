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
        
        stage('Push image') {
            steps {
             withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://hub.docker.com/']) {
           sh 'docker tag zpui-api:1.1 pavan52/zpui-api:1.1'
          sh 'docker push pavan52/zpui-api:1.1'
           // app.push("${env.BUILD_NUMBER}")
          // app.push("latest")
       }
        }
        }
  
        stage("Launch service"){
           steps {
               sh "docker run -d -p 6060:6060 --name zervplatform zpui-api:1.1"
           }
}
    }
}
