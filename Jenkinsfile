
pipeline
  {
      
      agent any
	  triggers{
		pollSCM('*/5 * * * *')
	  }	
      stages
      {
          
          stage('Project Name')
          {
              steps 
              {
                  echo 'Ashutosh Kumar'
              }
          }
          
          stage('Checkout Code')
          {
             steps
             {
                 git 'https://github.com/AshutoshKumar99/CICDDeclarativePipeline.git'
             }
          }
          
          stage('Build code')
          {
              
              steps
              {
                  sh 'mvn clean package'
              }
          }
          
          stage('JUnit Report')
          {
              steps
              {
                  junit 'target/surefire-reports/*.xml' 
              }
          }
          
          
          stage('Archieve_it')
          {
              steps
              {
                  archive "target/**/*"
              }
          }
          
          stage('Deploy WAR to Tomcat')
          {
              steps
              {
                  sshagent(['apachetomcat']) 
			   {
				sh 'scp -o StrictHostKeyChecking=no target/*.war ubuntu@13.233.95.186:/var/lib/tomcat8/webapps/'
			   }  
              }
          }
		}	
		  post { 
			failure { 
				slackSend color: 'good', message: 'Build is failing.....'
			
				
			}
			success{
				slackSend color: 'good', message: 'SUCCESS.....'
				
			}
		}

      
  }
	  