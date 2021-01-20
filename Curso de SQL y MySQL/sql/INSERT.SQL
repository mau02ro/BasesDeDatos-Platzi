-- ================================
-- INSERT TABLES
-- ================================

INSERT INTO authors(name, nationality)
  VALUES('Juan Rulfo', 'MEX');

INSERT INTO authors(name, nationality)
  VALUES('Gabriel García Márquez', 'COL');

INSERT INTO authors(name, nationality)
  VALUES('Juan Gabriel Vasquez', 'COL');

INSERT INTO authors(name, nationality)
  VALUES
    ('Julio Cortázar', 'ARG'),
    ('Isabel Allende', 'CHI'),
    ('Octavio Paz', 'MEX');





INSERT INTO clients (name, email, birthdate, gender, active) 
  VALUES ('Maria Dolores Gomez','Maria Dolores.95983222J@random.names','1971-06-06','F',0)

-- NUNCA USAR
-- NUNCA USAR
-- NUNCA USAR
-- NUNCA USAR
INSERT INTO clients (name, email, birthdate, gender, active) 
  VALUES ('Maria Dolores Gomez','Maria Dolores.95983222J@random.names','1971-06-06','F',0)
  ON DUPLICATE KEY IGNORE All
-- NUNCA USAR
-- NUNCA USAR
-- NUNCA USAR
-- NUNCA USAR


INSERT INTO clients (name, email, birthdate, gender, active) 
  VALUES ('Maria Dolores Gomez','Maria Dolores.95983222J@random.names','1971-06-06','F',0)
  ON DUPLICATE KEY UPDATE ACTIVE = VALUES(active)




El laberinto de la soledad, Octavio Paz, 1955
Vuelta al laberinto de la soledad, Octavio Paz, 1960

INSERT INTO books (title, author_id, language)
  VALUES('El laberinto de la soledad', 6, 'ES');

INSERT INTO books (title, author_id, language)
  VALUES(
    'Vuelta al laberinto de la soledad',
    (SELECT author_id FROM authors WHERE name = 'Octavio Paz' LIMIT 1), 
    'ES'
  );
