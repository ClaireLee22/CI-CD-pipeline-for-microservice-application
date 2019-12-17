pipeline {
    agent any
    stages {
        stage('Lint HTML') {
            steps {
		sh 'echo "Lint check"'
                sh 'tidy -q -e *.html'
            }
        }
	stage('Build Docker Image') {
   	    steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DockerhubUser', passwordVariable: 'DockerhubPwd')]){
		    sh 'echo "Building Docker Image"'
     	    	    sh '''
                        docker build -t clairelee7522/clouddevopscapstone .
                    '''
		}
           }
        }
	stage('Push Image To Dockerhub') {
   	    steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DockerhubUser', passwordVariable: 'DockerhubPwd')]){
		    sh 'echo "Pushing Docker Image"'
     	    	    sh '''
                        docker login -u ${DockerhubUser} -p ${DockerhubPwd}
			docker push clairelee7522/clouddevopscapstone
                    '''
		}
           }
        }
 
    }   
}
