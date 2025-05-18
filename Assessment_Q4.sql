SELECT 
    u.id AS customer_id,
    u.first_name as name,
    TIMESTAMPDIFF(MONTH, u.date_joined, NOW()) AS tenure_months,
    SUM(s.confirmed_amount) AS total_transactions,
    ROUND(((SUM(s.confirmed_amount) / NULLIF(TIMESTAMPDIFF(MONTH, u.date_joined, NOW()), 0)) * 12 * 0.001), 2) AS estimated_clv
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
WHERE s.confirmed_amount > 0
GROUP BY u.id, u.name, u.date_joined
ORDER BY estimated_clv DESC;
