# Project-2

## Requirements
- An Asana board or equivalent Kanban board tech (Trello board)
- An application that is fully integrated using the Feature-Branch model into a Version Control System which will be built through a CI server (Jenkins) and deployed to a cloud-based virtual machine (GCP Virtual machines)
- If a change is made to a codebase, webhooks should be used so Jenkins recreates and redeploys the changed application
- Project must follow the service-oriented architecture that has been asked for (4 services)
- Project must be deployed using containerisation (Docker) and an orchestration tool (Docker Swarm)
- Create an Ansible Playbook that will provision the environment that your application needs to run
- Project must make use of a reverse proxy (NGINX) to make your application accessible to the user

My trello board to plan my project and to track where I need to be upto date with can be found here:
https://trello.com/b/goLwBUbZ/qa-sfia2 

### My idea:
Service 1 is the User Interface
Service 2 generates a random footballer strength (Pace, Defending, Shooting) 
Service 3 generates a random footballer weakness (Passing, Dribbling, Heading)
Service 4 generates a footballer's most suitable and least suitable position (Centreback, Winger, Striker) and also their least suitable position (Centreback, Winger, Striker)
It would also save upto the 5 most recent strengths and its following most suitable position

The feature branch would change the positions and strengths and weaknesses as it adds a new strength, weakness and 2 new positions.  

### Risk assessment:

### My application and tests

My application is one where the user would click the refresh button and my service 2 would randomise a strength trait. Then my service 3 would randomise a weakness trait and this would all be sent to my service 4 using a json dictionary. My service 4 would then use the information provided to send a suitable position and an unsuitable position back to my user interface which is my service 1. Everytime the user clicks the refresh button the process starts again. My application also allows this information to be stored and read up to the most recent 5 traits and un/suitable positions. I then containerised my services and this made it easier to deploy my application through docker and docker compose with my yaml file.

The tests I used for my application were pytests. I used pytests for service 1 to see if i added a trait would it be stored. My pytest for service 2 and 3 was used by seeing if i randomised a trait, would that trait be shown. My pytest for service 4 was used by listing all the different suitable and unsuitable positions that could happen from the chosen strength and weakness traits. All my pytests came to 100% for each route. This shows my application was tried and tested.

### Jenkins 

Jenkins was used in my project as it is a way of automating tests and builds. My Jenkins was incorporated by using a Jenkins pipeline file where it would automate my tests (pytest), it would automate my build (docker-compose), it would also automate my configuration (using ansible to configure an environment for my jenkins build to operate so using the nginx configuration etc) and also deploying my application. This is helpful as Jenkins can automate it and with a Github webhook it wouldnt need any jenkins operations as it is attached to my Github main branch for this project via a webhook. This is helpful when changing my application to implement my feature branch so when I merge my feature branch into my main branch, this would trigger my github to build my Jenkins pipeline as it has a github webhook attached.

### Future improvements

Future improvements I would implement into my project would be to fully ensure that my jenkins pipeline was working as i did have some bugs with it. Also to reduce the downtime to zero when implementing my feature branch. Another improvement I would intake would be to apply an nginx vm to allow the user to use my application on a different ip address which is attached to a different virtual machine and with a port :80 to allow any port.
