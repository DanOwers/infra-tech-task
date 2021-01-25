# infra-tech-task

## Background

Developers finished the first version a RESTful application, and it’s now ready to be deployed to production. 


**Your task is to deploy this application to production in AWS.**


<br/>
 

We do expect this application to expand a lot in the next few months, both in features and number of requests.  T

he application doesn’t yet require any external datastorage. 

<br/>

The application is available in this link, and can be started with:

```
# Java 11 

$ java -jar rezdy-application.jar
```

<br/>

The application started from the command line will be available on port 8080. Endpoints available are:

  -  `/`  : main application endpoint, the one that should be exposed to customers

  -  `/actuator/health` : health/ping endpoint

 
## Requirements

 -  After deployment, application main endpoint should be available from the internet; 

 -  You can assume whatever pre-existing infrastructure in the AWS account you’d want (e.g. network infrastructure, CDNs, container clusters, IAM roles), but make sure to document those assumptions; 

 -  Document all trade-offs and decisions and what are the steps missing to make this deployment production-ready;

 -  Answer is expected to be at least partially in Cloudformation; 

 -  Answer should be submitted from a GitHub repository; 

 
## Suggestions

  - Please note you will need your own AWS account to complete this task, and it might incur costs. We advise you take care with AWS costs and to carefully delete all resources you created for this exercise after submitting your answer. If you changed your answer to fit the free tier, make sure to document that and how you’d do differently in a paid account. 

  - Documented trade-offs and assumptions are a very important part of your submission. We should be able to replicate your setup. 

  - Play to your strengths. We aren’t looking for a specific solution, but rather a showcase of what you can do. You can use any tools or languages to complement Cloudformation if you think it will improve your answer. 

