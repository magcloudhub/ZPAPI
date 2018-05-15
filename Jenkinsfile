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
       docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
           app.push("${env.BUILD_NUMBER}")
           app.push("latest")
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
