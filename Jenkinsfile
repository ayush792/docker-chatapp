pipeline {
	agent any
	stages {
		stage('Clone Repository') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@3.135.192.4 '
				sudo rm -rf chatPipeline/
				'
				scp -r /var/lib/jenkins/workspace/chatPipeline root@3.135.192.4:
				'''
			}
		}
		stage('Build Image') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@3.135.192.4 '
				cd chatPipeline/
				docker stop $(docker ps -a -q)
				docker rm $(docker ps -a -q)
				docker rmi -f chatPipeline_chat:latest
				docker-compose up -d
				'
				'''
			}
		}
		
	}
	post {
		always {
			echo 'Stage is success'
		}
	}
}
