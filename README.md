# Building an Azure Data Warehouse for Bike Share Data Analytics

## Project Overview
Divvy is a bike sharing program in Chicago, Illinois USA that allows riders to purchase a pass at a kiosk or use a mobile application to unlock a bike at stations around the city and use the bike for a specified amount of time. The bikes can be returned to the same station or to another station. The City of Chicago makes the anonymized bike trip data publicly available for projects like this where we can analyze the data.

![image](https://user-images.githubusercontent.com/58150666/233222972-b2916b9d-014f-4bc5-9594-f2c0dfdc7294.png)

Relational ERD for the Divvy Bikeshare Dataset (with fake data tables)

### The **Goal** of this project is to develop a data warehouse solution using **Azure Synapse Analytics**.:
* `Design` a star schema based on the business outcomes listed below
* `Import` the data into **Synapse**.
* `Transform` the data into the star schema
* and finally, `view` the report from Analytics.

### **The business outcomes you are designing for are as follows:**
1. Analyze how much time is spend per ride
    * Based on date and time factors such as day of week and time of day
    * Based on which station is the startin and / or ending station
    * Based on age of the rider at time of the ride
    * Based on whether the rider is a memeber or a casual rider
2. Analyze how much money is spent
    * Per month, quarter, year
    * Per member, based on the age of the rider at account start
3. EXTRA CREDIT - Analyze how much money is spent per member
    * Based on how many rides the rider averages per month
    * Based on how many minutes the rider spends on a bike per month

### **Task 1:** Create your Azure resources
* Azure Database for PostgresSQL
* Azure Synapse workspace
* Azure Synapse SQL Dedicated Pool

![image](https://user-images.githubusercontent.com/58150666/233466281-33a244db-fe86-4593-8b2f-aa35fbaafac2.png)


### **Task 2:** Design a star schema

![image](https://user-images.githubusercontent.com/58150666/233725431-f27ef08d-1cac-45b3-aa0b-fd7db536ee37.png)


### **Task 3:** Create the data in PostgresSQL

![image](https://user-images.githubusercontent.com/58150666/233461083-18fcd7d3-ad3f-4525-8a2c-fb83a8b7e04e.png)


### **Task 4:** EXTRACT the data from PostgresSQL

![image](https://user-images.githubusercontent.com/58150666/233222501-1301f11b-21bc-4541-8b9a-d8a017c896fb.png)

![image](https://user-images.githubusercontent.com/58150666/233222675-5c7f8fe7-70b9-4aa3-8527-7a08e275aee1.png)


### **Task 5:** LOAD the data into external tables in the data warehouse

![image](https://user-images.githubusercontent.com/58150666/233643993-f2f8d094-6bb9-4c85-ad50-22ce8f6691a8.png)


### **Task 6:** TRANSFORM the dat to the star schema using CETAS


[How do locate tables have created on PostgreSQL database.](https://knowledge.udacity.com/questions/952800)
