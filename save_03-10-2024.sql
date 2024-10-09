CREATE DATABASE livraria;

USE livraria;

SELECT * FROM autores;

SELECT * FROM generos;

SELECT * FROM livros;

ALTER TABLE livros
MODIFY COLUMN dt_lancamento DATE;


-- inner join
SELECT l.titulo, a.name
FROM livros as l
INNER JOIN autores as a
ON a.autor_id = l.autor_id;

-- left join
SELECT l.titulo, a.name
FROM livros as l
LEFT JOIN autores as a
ON a.autor_id = l.autor_id;

-- right join
SELECT l.titulo, a.name
FROM livros as l
RIGHT JOIN autores as a
ON a.autor_id = l.autor_id;

-- cross join
SELECT l.titulo, a.name
FROM livros as l
CROSS JOIN autores as a;

-- left excluding join
SELECT l.titulo, a.name
FROM livros as l
LEFT JOIN autores as a
ON a.autor_id = l.autor_id
WHERE a.autor_id is null;

-- right excluding join
SELECT l.titulo, a.name
FROM livros as l
RIGHT JOIN autores as a
ON a.autor_id = l.autor_id
WHERE l.autor_id is null;

-- full outer join
SELECT l.titulo, a.name
FROM livros as l
LEFT JOIN autores as a
ON a.autor_id = l.autor_id

UNION

SELECT l.titulo, a.name
FROM livros as l
RIGHT JOIN autores as a
ON a.autor_id = l.autor_id;

-- full outer join excluding
SELECT l.titulo, a.name
FROM livros as l
LEFT JOIN autores as a
ON a.autor_id = l.autor_id
WHERE a.autor_id is null

UNION

SELECT l.titulo, a.name
FROM livros as l
RIGHT JOIN autores as a
ON a.autor_id = l.autor_id
WHERE l.autor_id is null;

-- inner join com 3 tabelas
SELECT l.titulo, a.name, g.name
FROM livros as l
INNER JOIN autores as a
ON a.autor_id = l.autor_id
INNER JOIN generos as g
ON l.genero_id = g.genero_id;