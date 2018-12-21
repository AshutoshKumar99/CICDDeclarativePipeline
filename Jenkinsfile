
pipeline
  {
      
      agent any
	  triggers{
		pollSCM('*/5 * * * *')
	  }	
      stages
      {
          
          stage('CodeBuild')
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
          
          
          stage('Archive artifact')
          {
              steps
              {
                archive "target/**/*.war"

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
				slackSend color: 'good', message: 'Build successfully completed'
				
			}
		}

      
  }
	  
