# infra-tech-task

## Progress

I created a fresh AWS account.
I didn't actually have a personal AWS but didn't think my current work would appreciate me using my dev account for getting a position somewhere else.
Additionally there's a lot of prebuilt infrastructure in the work accounts that mean a lot less of my ability would be showcased in deploying the application.
Installed Docker and Maven on my Ubuntu VM
Cloned the repo from GitHub

My aim is to host the application using Fargate and Cloudformation as these are the technologies I have learnt Rezdy use. 
I also have no experience with them so this would serve as creating some preliminary knowledge before starting the position

I haven't used Maven before either but I ran mvn package and got the rezdy-application.jar file at the end.

I had some issues with docker and had to install it from the website, not using apt-get.
I then built the image and ran it locally and I can access the website on 172.17.0.2:8080.

I created an IAM User for myself with full admin so that I have CLI access.

Started writing deploy.sh, home a simple script that can completely host the image in my account from scratch.
To run it in a different account will require going in and change a few variables around.

I had to take a break to actually learn about ECS, Fargate and Cloudformation because I've never previously used them and trying incremental changes was very slow progress. 

Finally got it working in cloudformation using a public loadbalancer that talks to ECS in the private subnet. 
It's mostly copy and paste from https://github.com/nathanpeck/aws-cloudformation-fargate

I did mess around with API Gateway.
I came across an issue that when I hit the api it returns content-type application/json instead of text.
It shouts errors in Mozilla when it fails to interpret the response as JSON but displays fine in Chrome.

I bought my own domain, danowers.xyz, and tried to host the application as api.danowers.xyz.
I got stuck on validating to Certificate required to do this because, as I would find out later, the Name Servers in the Hosted Zone did not match the Name Servers in the domain Registrar.
I resolved this after some troubleshooting.

I manually created an A record aliased to the public load balancer and attached AWS WAF to the load balancer.
Then I did this using cloudformation.

I'm currently having issues where the Target Group marks the ECS instances as unhealthy when I set the Health Check Path to /actuator/health
If I change the path to "/" and wait for it to become healthy and then change back to "/actuator/health" it works.

The application *should* be visible at danowers.xyz

## Improvements

A lot of improvements could be made on top of this to get it production ready.

* Fix the health check endpoint
* Hide the health check endpoint from being available to the internet
* Add some actual rules to AWS WAF
* Reign in the Security Groups
* Create resources to make everything more easily extensible
* Break the Cloud Formation template into multiple, sectioned into the components that would be used across multiple ECS Clusters and the ECS Clusters themselves.
* deploy.sh is not good CI/CD
* danowers.xyz is available on HTTP, make it HTTPS
* Turn on logging for all the important stuff
* Add all the other relevant AWS Security Controls

## Take Aways

I definitely learnt some new stuff that I hadn't previously touched on before.
Working in enterprise, and especially entering our AWS team after it was already established, a lot of this networking kind of stuff had already been done before I was in the team.
While I knew most of the concepts about VPC, Subnets and Route53 it's different to know the architecture and support it than to actually build it.
Similarly, working with Cloudformation and ECS was a new concept, but it was adjacent to the Terraform and compute using Lambda or EC2 that I'm used to.
The task was pretty unfamiliar waters to me but it's increased my confidence in myself that I know how to troubleshoot issues well enough to put something like this together.