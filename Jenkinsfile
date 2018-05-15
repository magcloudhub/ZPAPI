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
       /* Finally, we'll push the image with two tags:
        * First, the incremental build number from Jenkins
        * Second, the 'latest' tag.
        * Pushing multiple tags is cheap, as all the layers are reused. */
       docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
           app.push("${env.BUILD_NUMBER}")
           app.push("latest")
       }
        }
      
   /* stage("Tag & Push image"){
        steps {
withDockerRegistry([credentialsId: 'a2190088-0d8d-47ae-a558-fb0344c5524f', url: 'https://hub.docker.com/']) {
        sh 'docker tag docker.io/pavan52/zpui-api:1.1 docker.io/pavan52/zpui-api:1.1'
         sh 'docker push docker.io/pavan52/zpui-api:1.1'
         sh 'docker push docker.io/pavan52/zpui-api:1.1'            
}
        }
     }  */
        stage("Launch service"){
           steps {
               sh "docker run -d -p 6060:6060 --name zervplatform zpui-api:1.1"
           }
}
    }
}
