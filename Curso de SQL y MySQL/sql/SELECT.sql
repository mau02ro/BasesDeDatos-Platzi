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



-- Casos de negocios

SELECT DISTINCT nationality FROM authors;

SELECT nationality, count(author_id) AS c_author
FROM authors
WHERE nationality IS NOT NULL
GROUP BY nationality
ORDER BY c_author DESC, nationality ASC;

SELECT AVG(price) AS promedio, STDDEV(price) AS std
FROM books;

SELECT nationality, AVG(price) AS promedio, STDDEV(price) AS std
FROM books AS b
JOIN authors AS a
  ON b.author_id = a.author_id
GROUP BY nationality
ORDER BY promedio DESC


select a.name, a.nationality, count(b.author_id) as books, AVG(b.price) AS prm
from authors as a
  left join books as b
    on a.author_id = b.author_id
where a.nationality is not null
group by b.author_id
order by a.nationality, books desc;


select c.name, t.type, b.title,
  concat(a.name, "(", a.nationality, ")") as autor,
  to_days(now() - t.created_at) as ago
from transactions as t
left join clients as c
  on c.client_id = t.client_id
left join books as b
  on b.book_id = t.book_id
left join authors as a
  on b.author_id = a.author_id

