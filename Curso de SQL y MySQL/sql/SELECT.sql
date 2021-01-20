SELECT a.author_id, a.name, count(b.author_id) as books
FROM books AS b
INNER JOIN authors AS a
  ON a.author_id = b.author_id
GROUP BY author_id
ORDER BY books DESC



SELECT c.name, b.title, t.type, a.name
FROM transactions AS t
JOIN books as b
  on t.book_id = b.book_id
JOIN clients as c 
  on t.client_id = c.client_id
JOIN authors as a 
  on b.author_id = a.author_id 
WHERE c.gender = 'F' AND t.type IN ('sell', 'lend')