# HomeTask: Jenkins/-CI pipelines/Groovy
In this task, I automatically install Jenkins using a bash script and Docker. In this task, Jenkins plays the role of an automated service for the 
initialization, testing and deployment of the project to the cloud using Terraform.If you don't have [Docker installed](https://docs.docker.com/engine/install/ubuntu/), you should install it<br> Elements that were used in this task:<br>
[Multibranch-Pipeline](#Multibranch-Pipeline) | [Credentials](#Credentials) | [Telegram-Notification](#Telegram-Notification) | [WebHooks](#WebHooks)

# How to start?

In order to start working with the project, you need:
```
git clone https://github.com/BohdanHavran/DevOps-Basecamp-HomeTask.git
```
```
cd DevOps-Basecamp-HomeTask/Task9
```
Before installing Jenkins, you need to run this command to edit the Jenkins URL, Jenkins User(Optional) and add the plugins you need:
```
sudo vim Install_Jenkins.sh
```
OR
```
sudo nano Install_Jenkins.sh
```
To install Jenkins:
```
sudo chmod +x Install_Jenkins.sh
```
```
sudo ./Install_Jenkins.sh
```

# <a name="Multibranch-Pipeline">Multibranch-Pipeline</a>
![image](https://user-images.githubusercontent.com/7732624/213931448-2b32c143-3f43-40ce-865f-462b432b8280.png)
![image](https://user-images.githubusercontent.com/7732624/213931501-601eacc6-5aba-44fb-9387-37af0ac5a299.png)
![image](https://user-images.githubusercontent.com/7732624/213931518-96d95b1a-aeeb-4fa9-8076-39a9b220dfdd.png)

# <a name="Credentials">Credentials</a>
![image](https://user-images.githubusercontent.com/7732624/213934111-a2b80303-5d7a-45c0-9fb7-74f224f70de6.png)
![image](https://user-images.githubusercontent.com/7732624/213934135-c38b6d71-00b5-4db1-9347-39173e9469fe.png)

# <a name="Telegram-Notification">Telegram-Notification</a>
![image](https://user-images.githubusercontent.com/7732624/213931715-274df55e-9d8e-4f0d-a2e3-8233b32bc1c2.png)![image](https://user-images.githubusercontent.com/7732624/213931746-61ca863c-51c3-455a-8e2a-df8efc8e5b5d.png)
```
post {
     success { 
        sh  ("""
            curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d parse_mode=markdown -d text='*Full project name*: ${env.JOB_NAME} \n*Branch*: [$GIT_BRANCH]($GIT_URL) \n*Build* : [OK](${BUILD_URL}consoleFull)'
        """)
     }
     aborted {
        sh  ("""
            curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d parse_mode=markdown -d text='*Full project name*: ${env.JOB_NAME} \n*Branch*: [$GIT_BRANCH]($GIT_URL) \n*Build* : [Aborted](${BUILD_URL}consoleFull)'
        """)
     }
     failure {
        sh  ("""
            curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d parse_mode=markdown -d text='*Full project name*: ${env.JOB_NAME} \n*Branch*: [$GIT_BRANCH]($GIT_URL) \n*Build* : [Not OK](${BUILD_URL}consoleFull)'
        """)
    }
}
```

# <a name="WebHooks">WebHooks</a>
![image](https://user-images.githubusercontent.com/7732624/213931369-4a488b49-133c-496d-a65c-a138f9699614.png)

