# Excelsior Mobile Database in SQL
Running data analysis using SQL queries. In this project I used multiple funtions:
    **Subqueries, joins, functions: group by, order by, having** 

## Summary

I was recently hired by Excelsior Mobile to be their new business analyst. Excelsior Mobile is a very small mobile company and is looking to expand so they want me to run some analysis on their customer database and figure out where they should put their marketing efforts and some other important analytical questions.
 
## Deliverables
The deliverables of this projects are a combination of answered questions and copied tables in Excel and a .sql file with the queries. 
  **SQL File: There are 16 queries necessary.**
 
**Database Information**
There are some terms you need to understand in order to use this DB:
-	**MIN:** Mobile Identification Number: unique number assigned by the wireless service provider. (account #)
-	**MDN:** The phone number
-	**IMEI:** International Mobile Equipment Identity: unique number for identifying a device on a mobile network. (like your vehicles VIN)

There are 6 tables in the sample of Excelsior Mobile's DB.
-	**Subscriber:** Subscriber information including address, MDN and MIN.
-	**Device:** information about the devices used at Excelsior Mobile and has IMEI
-	**DirNums:** identifys the city and state of each MDN and connects it with an IMEI
-	**MPlan:** table of the plans used at Excelsior Mobile. Has data, throttle and cost
-	**Bill:** table of the current bills for each MIN, includes bill costs
-	**LastMonthUsage:** table of the last month of usage for each MIN, includes minutes, data in MB and texts
 
 
## The Report Questions (with Visualizations)

Our first goal is to get an idea of some summary data. Please get us the following summary tables and show a visualization for each:
- **A.** Show us the first and last names of our customers along with their minute usage, data usage, text usage and total bill. Order them by their full name.
- **B.** Show us the average of the minutes, data, texts and total bills by city.
- **C.** Show us the sum of the minutes, data, texts and total bills by city.
- **D.** Show us the average of the minutes, data, texts and total bills by mobile plan.
- **E.** Show us the sum of the minutes, data, texts and total bills by mobile plan.
 
## The Report Questions (without Visualizations)

For the following questions, you do not need to create visualizations but rather it will be about answering questions based on the query results. Please copy the table into the sheet for the question section (so 1 is one sheet. 2 is another sheet with A, B and C on it). To the right of the table, do analysis on the table and answer the question posed by the question. The answer may be obvious and you are encouraged to analyze it anyway, providing recommendations on how to use the data. Be creative! You still need to have these SQL queries in the SQL file. This must be done in Excel.

1.	Marketing asked where we should be focusing our new marketing at. We have decided that we want to put our efforts increasing our customer base in cities we currently have customers in instead of marketing in cities we have no customers in. Let's figure out which three cities we should point our markets to. (Hint: we should  be marketing to cities we have the least number of customers in. Be careful and keep this in mind when answering the three queries below.)
    - (A) First though, I want to know which two cities we have the most customers in.
    - (B) Then show me which cities we should increase our marketing in.
    - (C) Finally, show us which plans we should market the most based on the number of people who have them (independent of which city they live in).

2.	Next we want some information on the actual devices our customers use.
    - (A) Show us the count of cell phone types among our customers. What type do most of our customers use?
    - (B) Show us which customers (first and last name) use the phone type that is least used by our customers so we can send them a promotion for their friends and family.  You can use the answer from 2A in this query.
    - (C) Finally, show us our customers and the year of their phones who have phones released before 2018?

3.	Now we are trying to figure out if our customers are using our data plans efficiently. We have Unlimited plans that throttle the data at specific limits and then there are plans for caps on data usage. We want to know ultimately if there is a city that uses a lot of data (within the top 3 data using cities) but none of our customers in that city are using the Unlimited Plans. If there is a city like that, which one is it?


4.	Our financial department has requested a few items of information.
    - (A) They wish to know the first and last name of the customer who has the most expensive bill every month.
    - (B) They also want to know which mobile plan brings us in the most revenue each month.

5.	Finally, we want to get some information on minutes usage.
    - (A) Please tell us which area code (only the area code) uses the most minutes.
    - (B) Lastly, Which cities do we see the biggest difference in terms of minutes usage? In other words, which cities have the biggest difference between the customers who use smallest amount of minutes to customers that use the largest. Use the difference of customers who use less than 200 and customers who use more than 700 minutes.
