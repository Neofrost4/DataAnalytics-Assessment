WITH savings_deposits AS (
    SELECT
        a.owner_id,
        SUM(a.confirmed_amount) AS total_savings,
        count(a.confirmed_amount) as savings_count
    FROM savings_savingsaccount a
    JOIN plans_plan p ON a.plan_id = p.id
    WHERE p.is_regular_savings = 1
      AND a.confirmed_amount > 0
    GROUP BY 1
),
investment_deposits AS (
    SELECT
        a.owner_id,
        SUM(a.confirmed_amount) AS total_investments,
        count(a.confirmed_amount) AS investment_count
    FROM savings_savingsaccount a
    JOIN plans_plan p ON a.plan_id = p.id
    WHERE p.is_a_fund = 1
      AND a.confirmed_amount > 0
    GROUP BY 1
)
SELECT
    a.id AS owners_id,
    a.first_name as name,
    savings_count,
    investment_count,
    (total_savings + total_investments)/ 100.0  AS total_deposits
FROM users_customuser a
JOIN savings_deposits b ON a.id = b.owner_id
JOIN investment_deposits c ON a.id = c.owner_id
ORDER BY total_deposits DESC;
