# DataAnalytics-Assessment

Assessment_Q1.sql
Use Common Table Expressions to get:
Users with funded savings
Users with funded investment plans

inplace of name we used first_name to replace name
Join on user ID and aggregate total deposits.

Assessment_Q2.sql
To analyze transaction frequency per customer per month, and categorize users based on activity, we’ll do the following:
Define Frequency Categories:
High Frequency: ≥ 10 transactions/month
Medium Frequency: 3–9 transactions/month
Low Frequency: ≤ 2 transactions/month

Assessment_Q3.sql
For plans_plan: assume plans where is_archived = 0 and is_deleted = 0
For savings_savingsaccount: use confirmed_amount > 0 (indicating inflow)
No inflow transactions in the past 365 days from today (NOW())
Get last inflow date per plan from savings_savingsaccount and plans_plan
Calculate inactivity_days using DATEDIFF(NOW(), last_transaction_date)
Filter where the last inflow was more than 365 days ago


Assessment_Q4.sql
generate formulars for the formulars;
Profit per transaction = 0.1% of transaction value = 0.001 * confirmed_amount
Tenure (months) = Months since users_customuser.date_joined
Total transactions = Sum of all confirmed_amount per customer
