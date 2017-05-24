# Toolchain Instructions

> Note: This toolchain instructions is based on this [tutorial](https://developer.ibm.com/recipes/tutorials/deploy-kubernetes-pods-to-the-bluemix-container-service-using-devops-pipelines).

1. Click the **Deploy to Bluemix** button.

2. If you have not authenticated to GitHub you will see an Authorize button.

3. Click **Delivery Pipeline** and fill in all the non-optional environment variables before you click the create button.

> You can view more information about each environment variable by clicking the information button.

![Delivery Pipeline](images/delivery.png)

4. After you filled in your environment variables, click **CREATE**. Once the repository is cloned on your GitHub, you will be taken to the Bluemix Continuous Delivery toolchain setup. 

![toolchain](images/toolchain.png)

6. Select the Delivery Pipeline tile from the toolchain view to open the pipeline stages view.

7. Click **View logs and history** of the Deploy stage to find the URL/Endpoint of the application.

8. Congratulation, now you can click the URL link to load the web application in your browser. For other applications, you can also find the applcation endpoint at the end of your logs. Note it takes a few seconds from the time the pods deploy until they are ready to serve requests.
