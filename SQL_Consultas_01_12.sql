-- ## 1 - Buscar o nome e ano dos filmes
		  SELECT Nome,Ano FROM Filmes

-- ## 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
		  SELECT Nome, Ano, Duracao FROM Filmes
		  ORDER BY Ano

-- ## 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração

			-- BUSCA MAIS ABRANGENTE:
		  SELECT Nome, Ano, Duracao FROM Filmes
		  WHERE Nome LIKE '%Volta%'

			-- BUSCA EXATA:
		  SELECT Nome, Ano, Duracao FROM Filmes
		  WHERE Nome = 'De Volta para o Futuro'

-- ## 4 - Buscar os filmes lançados em 1997
		  SELECT Nome, Ano, Duracao FROM Filmes
		  WHERE ANO = 1997

-- ## 5 - Buscar os filmes lançados APÓS o ano 2000
		  SELECT Nome, Ano, Duracao FROM Filmes
		  WHERE ANO > 2000

-- ## 6 - Buscar os filmes com a duracao maior que 100 e menor que 150,
--		  ordenando pela duracao em ordem crescente
		  SELECT Nome, Ano, Duracao FROM Filmes
		  WHERE Duracao > 100 AND Duracao < 150
		  ORDER BY Duracao

-- ## 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, 
--		  ordenando pela duracao em ordem decrescente
		  SELECT Ano, COUNT(*) AS Quantidade FROM Filmes
		  GROUP BY Ano
		  ORDER BY Quantidade DESC, MAX(Duracao);

		  -- * pelo enunciado a Query omitiria 'Quantidade DESC' do ORDER BY, no entanto,
		  --   pelo arquivo de imagem '7.png' faz-se necessária aquela expressão.

-- ## 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
		  SELECT Id, PrimeiroNome, UltimoNome, Genero FROM Atores

		  -- * no arquivo de imagem 8.png, estão aparecendo as colunas Id e Genero também.

-- ## 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
		  SELECT Id, PrimeiroNome, UltimoNome, Genero FROM Atores
		  WHERE Genero = 'F'
		  ORDER BY PrimeiroNome

-- ## 10 - Buscar o nome do filme e o gênero
		  -- via INNER JOIN
		  SELECT Nome, Genero FROM Filmes
		  INNER JOIN FilmesGenero on FilmesGenero.IdFilme= Filmes.Id
		  INNER JOIN Generos on Generos.id=FilmesGenero.id
		  order by Nome

		  -- via LEFT JOIN
		  SELECT Nome, Genero FROM Filmes
		  LEFT JOIN FilmesGenero on FilmesGenero.IdFilme= Filmes.Id
		  LEFT JOIN Generos on Generos.id=FilmesGenero.id
		  order by Nome

		  -- via RIGHT JOIN
		  SELECT Nome, Genero FROM Filmes
		  RIGHT JOIN FilmesGenero on FilmesGenero.IdFilme= Filmes.Id
		  RIGHT JOIN Generos on Generos.id=FilmesGenero.id
		  order by Nome

		  -- * O conteúdo das tabelas está modificado em relação ao arquivo de imagem '10.png'

-- ## 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
		  SELECT Nome, Genero FROM Filmes
		  INNER JOIN FilmesGenero on FilmesGenero.IdFilme= Filmes.Id
		  INNER JOIN Generos on Generos.id=FilmesGenero.id
		  where Genero = 'Mistério'
		  order by Nome

		  -- * O conteúdo das tabelas está modificado em relação ao arquivo de imagem '11.png'

-- ## 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
		  SELECT Filmes.Nome, Atores.PrimeiroNome, Atores.UltimoNome, ElencoFilme.Papel FROM Filmes
		  INNER JOIN ElencoFilme on ElencoFilme.IdFilme = Filmes.Id
		  INNER JOIN Atores on Atores.id = Elencofilme.idAtor
