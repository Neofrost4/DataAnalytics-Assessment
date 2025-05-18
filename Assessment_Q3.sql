-- Savings Plans with inactivity
SELECT 
    s.plan_id,
    s.owner_id,
    'Savings' AS type,
    MAX(s.transaction_date) AS last_transaction_date,
    DATEDIFF(NOW(), MAX(s.transaction_date)) AS inactivity_days
FROM savings_savingsaccount s
WHERE s.confirmed_amount > 0
GROUP BY s.plan_id, s.owner_id
HAVING MAX(s.transaction_date) < DATE_SUB(NOW(), INTERVAL 365 DAY)
UNION
-- Investment Plans with inactivity
SELECT 
    p.id AS plan_id,
    p.owner_id,
    'Investment' AS type,
    MAX(ss.transaction_date) AS last_transaction_date,
    DATEDIFF(NOW(), MAX(ss.transaction_date)) AS inactivity_days
FROM plans_plan p
LEFT JOIN savings_savingsaccount ss ON p.id = ss.plan_id AND ss.confirmed_amount > 0
WHERE p.is_archived = 0 AND p.is_deleted = 0
GROUP BY p.id, p.owner_id
HAVING MAX(ss.transaction_date) < DATE_SUB(NOW(), INTERVAL 365 DAY) OR MAX(ss.transaction_date) IS NULL;

