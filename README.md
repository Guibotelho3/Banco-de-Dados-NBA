# NBA Stats DB

Banco de dados relacional em PostgreSQL com estatísticas de jogadores da NBA, inspirado na tabela da ESPN. Projeto da disciplina Banco de Dados 1 (UFOP).

Cada jogador tem nome, nacionalidade, posição, time e estatísticas da temporada: jogos, minutos, pontos, aproveitamento de quadra, 3 pontos e lances livres, rebotes, assistências, roubos, bloqueios e bolas perdidas.

Exemplo (temporada 2025-26):

LeBron James, EUA, Lakers: 20.9 pts, 6.1 reb, 7.2 ast
Stephen Curry, EUA, Warriors: 26.0 pts, 4.5 reb, 6.0 ast
Nikola Jokić, Sérvia, Nuggets: 28.0 pts, 12.5 reb, 10.0 ast

Os dados do LeBron foram conferidos na ESPN; os dos demais são aproximados.

## Como rodar

Com Docker instalado, na pasta do projeto:

docker compose up -d
docker exec -it nba_db psql -U nba -d nba_stats

Depois, dentro do psql:

SELECT * FROM vw_tabela_espn WHERE jogador = 'LeBron James';
