SELECT row_num, col_num, sum(prod)
FROM
(
	SELECT Left.i as row_num, Right.j as col_num, (Left.val * Right.val) prod
	FROM Left, Right
	WHERE Left.j = Right.i
)
GROUP BY row_num, col_num;
