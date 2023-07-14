SELECT count_positive_user.user_id
	, products
	, reviews
FROM (SELECT user_id
			, COUNT(CASE WHEN helpful >= 1 THEN 1 END) AS helpful_count
			, COUNT(helpful) AS qty_helpful
		FROM users
		GROUP BY user_id
		) AS count_positive_user 
LEFT JOIN recommendations r ON r.user_id=count_positive_user.user_id
WHERE helpful_count > 50 AND qty_helpful = helpful_count
