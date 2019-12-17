pipeline {
    agent any
    stages {
        stage('Lint HTML') {
            steps {
		sh 'echo "Lint check..."'
                sh 'tidy -q -e *.html'
            }
        }
	stage('Build Docker Image') {
   	    steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]){
		    sh 'echo "Building Docker Image..."'
     	    	    sh '''
                        docker build -t clairelee7522/clouddevopscapstone .
                    '''
		}
           }
        }
	stage('Push Image To Dockerhub') {
   	    steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]){
		    sh 'echo "Pushing Docker Image..."'
     	    	    sh '''
                        docker login -u $USERNAME -p $PASSWORD
			docker push clairelee7522/clouddevopscapstone
                    '''
		}
           }
        }
	stage('Create k8s cluster') {
	    steps {
		withAWS(credentials: 'aws-kubectl', region: 'us-west-2a') {
		    sh '''
			eksctl create cluster \
			--name clouddevopscapstonecluster \
			--version 1.14 \
			--region us-west-2 \
			--nodegroup-name standard-workers \
			--node-type t2.micro \
			--nodes 2 \
			--nodes-min 1 \
			--nodes-max 3 \
			--managed
		'''
		}
	    }
        }							
	stage('Create kubectl cluster config') {
	   steps {
		withAWS(credentials: 'aws-kubectl', region: 'us-west-2a') {
		    sh '''
		        aws eks --region us-west-2 update-kubeconfig --name clouddevopscapstonecluster
		    '''
		}
	   }
	}
	    
    }   
}
