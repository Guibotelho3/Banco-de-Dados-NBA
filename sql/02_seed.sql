-- =====================================================================
-- Carga inicial de dados
-- ATENÇÃO: apenas a linha do LeBron James 2025-26 foi conferida com a
-- tabela da ESPN/Google. Os demais valores de estatísticas são
-- ILUSTRATIVOS (aproximados) - substitua pelos números reais da ESPN
-- ou Basketball-Reference antes de apresentar, se quiser precisão.
-- =====================================================================

INSERT INTO paises (nome, sigla) VALUES
    ('Estados Unidos', 'USA'),
    ('Eslovênia',      'SVN'),
    ('Sérvia',         'SRB'),
    ('Grécia',         'GRC'),
    ('França',         'FRA'),
    ('Canadá',         'CAN'),
    ('Austrália',      'AUS'),
    ('Camarões',       'CMR'),
    ('Letônia',        'LVA'),
    ('Alemanha',       'DEU'),
    ('Croácia',        'HRV'),
    ('Bahamas',        'BHS'),
    ('República Checa','CZE');

INSERT INTO posicoes (sigla, descricao) VALUES
    ('PG', 'Armador'),
    ('SG', 'Ala-armador'),
    ('SF', 'Ala'),
    ('PF', 'Ala-pivô'),
    ('C',  'Pivô');

INSERT INTO temporadas (ano) VALUES ('2024-25'), ('2025-26');

INSERT INTO equipes (nome, cidade, sigla, conferencia) VALUES
    ('Lakers',      'Los Angeles',   'LAL', 'Oeste'),
    ('Warriors',    'Golden State',  'GSW', 'Oeste'),
    ('Nuggets',     'Denver',        'DEN', 'Oeste'),
    ('Bucks',       'Milwaukee',     'MIL', 'Leste'),
    ('Spurs',       'San Antonio',   'SAS', 'Oeste'),
    ('Thunder',     'Oklahoma City', 'OKC', 'Oeste'),
    ('Rockets',     'Houston',       'HOU', 'Oeste'),
    ('Celtics',     'Boston',        'BOS', 'Leste'),
    ('76ers',       'Philadelphia',  'PHI', 'Leste'),
    ('Nets',        'Brooklyn',      'BKN', 'Leste'),
    ('Suns',        'Phoenix',       'PHX', 'Oeste'),
    ('Clippers',    'Los Angeles',   'LAC', 'Oeste'),
    ('Heat',        'Miami',         'MIA', 'Leste'),
    ('Knicks',      'New York',      'NYK', 'Leste'),
    ('Timberwolves','Minnesota',     'MIN', 'Oeste'),
    ('Cavaliers',   'Cleveland',     'CLE', 'Leste'),
    ('Mavericks',   'Dallas',        'DAL', 'Oeste'),
    ('Pacers',      'Indiana',       'IND', 'Leste');

INSERT INTO jogadores (nome, data_nascimento, altura_cm, peso_kg, pais_id, posicao_id) VALUES
    ('LeBron James',            '1984-12-30', 206, 113, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='SF')),
    ('Stephen Curry',           '1988-03-14', 188,  84, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='PG')),
    ('Luka Dončić',             '1999-02-28', 201, 104, (SELECT id FROM paises WHERE sigla='SVN'), (SELECT id FROM posicoes WHERE sigla='PG')),
    ('Nikola Jokić',            '1995-02-19', 211, 129, (SELECT id FROM paises WHERE sigla='SRB'), (SELECT id FROM posicoes WHERE sigla='C')),
    ('Giannis Antetokounmpo',   '1994-12-06', 211, 110, (SELECT id FROM paises WHERE sigla='GRC'), (SELECT id FROM posicoes WHERE sigla='PF')),
    ('Victor Wembanyama',       '2004-01-04', 224, 104, (SELECT id FROM paises WHERE sigla='FRA'), (SELECT id FROM posicoes WHERE sigla='C')),
    ('Shai Gilgeous-Alexander', '1998-07-12', 198,  91, (SELECT id FROM paises WHERE sigla='CAN'), (SELECT id FROM posicoes WHERE sigla='PG')),
    ('Kevin Durant',            '1988-09-29', 211, 109, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='SF')),
    ('Jayson Tatum',            '1998-03-03', 203,  95, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='SF')),
    ('Joel Embiid',             '1994-03-16', 213, 127, (SELECT id FROM paises WHERE sigla='CMR'), (SELECT id FROM posicoes WHERE sigla='C')),
    ('Devin Booker',            '1996-10-30', 196,  93, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='SG')),
    ('Kawhi Leonard',           '1991-06-29', 201, 102, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='SF')),
    ('Jimmy Butler',            '1989-09-14', 201,  98, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='SF')),
    ('Jalen Brunson',           '1996-08-31', 185,  86, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='PG')),
    ('Anthony Edwards',         '2001-08-05', 193,  98, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='SG')),
    ('Donovan Mitchell',        '1996-09-07', 191,  91, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='SG')),
    ('Paolo Banchero',          '2002-11-12', 208, 113, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='PF')),
    ('Tyrese Haliburton',       '2000-02-29', 196,  84, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='PG')),
    ('Alperen Şengün',          '2002-07-25', 211, 113, (SELECT id FROM paises WHERE sigla='DEU'), (SELECT id FROM posicoes WHERE sigla='C')),
    ('Kristaps Porziņģis',      '1995-08-02', 221, 109, (SELECT id FROM paises WHERE sigla='LVA'), (SELECT id FROM posicoes WHERE sigla='C')),
    ('Domantas Sabonis',        '1996-05-03', 211, 113, (SELECT id FROM paises WHERE sigla='LVA'), (SELECT id FROM posicoes WHERE sigla='C')),
    ('Franz Wagner',            '2001-08-27', 206,  95, (SELECT id FROM paises WHERE sigla='DEU'), (SELECT id FROM posicoes WHERE sigla='SF')),
    ('Ivica Zubac',             '1997-03-18', 216, 120, (SELECT id FROM paises WHERE sigla='HRV'), (SELECT id FROM posicoes WHERE sigla='C')),
    ('Jaylen Brown',            '1996-10-24', 198, 101, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='SG')),
    ('Andrew Wiggins',          '1995-02-23', 201,  88, (SELECT id FROM paises WHERE sigla='CAN'), (SELECT id FROM posicoes WHERE sigla='SF')),
    ('Bam Adebayo',             '1997-07-18', 206, 116, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='C')),
    ('De''Aaron Fox',           '1997-12-20', 193,  86, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='PG')),
    ('Cade Cunningham',         '2001-09-25', 201,  99, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='PG')),
    ('Josh Giddey',             '2002-10-10', 203,  93, (SELECT id FROM paises WHERE sigla='AUS'), (SELECT id FROM posicoes WHERE sigla='PG')),
    ('Jaime Jaquez Jr.',        '2001-12-30', 198,  97, (SELECT id FROM paises WHERE sigla='USA'), (SELECT id FROM posicoes WHERE sigla='SF'));

-- Estatísticas 2025-26 ---------------------------------------------------
-- Colunas: jd, min, pts, aq%, 3pt%, ll%, reb, ast, rbd, blq, bp
INSERT INTO estatisticas_temporada
    (jogador_id, temporada_id, equipe_id, jd, min, pts, aq_pct, tres_pt_pct, ll_pct, reb, ast, rbd, blq, bp)
SELECT j.id, t.id, e.id, v.jd, v.min, v.pts, v.aq, v.tres, v.ll, v.reb, v.ast, v.rbd, v.blq, v.bp
FROM (VALUES
    -- Linha REAL (conferida na imagem da ESPN/Google)
    ('LeBron James',            'Lakers',       60, 33.2, 20.9, 51.5, 31.7, 73.7,  6.1,  7.2, 1.2, 0.6, 3.0),
    -- Linhas ILUSTRATIVAS (substituir pelos valores reais)
    ('Stephen Curry',           'Warriors',     55, 32.0, 26.0, 46.0, 39.5, 92.0,  4.5,  6.0, 1.1, 0.4, 3.0),
    ('Luka Dončić',             'Lakers',       58, 35.0, 33.0, 47.0, 35.0, 78.0,  8.0,  8.5, 1.5, 0.5, 3.8),
    ('Nikola Jokić',            'Nuggets',      62, 34.0, 28.0, 57.0, 38.0, 82.0, 12.5, 10.0, 1.4, 0.8, 3.2),
    ('Giannis Antetokounmpo',   'Bucks',        57, 33.0, 30.0, 61.0, 25.0, 65.0, 11.5,  6.5, 1.0, 1.1, 3.3),
    ('Victor Wembanyama',       'Spurs',        59, 31.0, 24.0, 48.0, 34.0, 80.0, 11.0,  3.5, 1.2, 3.3, 2.8),
    ('Shai Gilgeous-Alexander', 'Thunder',      63, 33.5, 31.5, 53.0, 37.0, 88.0,  5.0,  6.3, 1.7, 0.9, 2.3),
    ('Kevin Durant',            'Rockets',      56, 35.0, 26.0, 52.0, 40.0, 87.0,  6.0,  4.5, 0.8, 1.2, 3.0),
    ('Jayson Tatum',            'Celtics',      61, 36.0, 27.5, 46.0, 37.0, 85.0,  8.5,  5.0, 1.0, 0.7, 2.8),
    ('Joel Embiid',             '76ers',        48, 34.0, 33.0, 53.0, 35.0, 88.0, 11.0,  4.5, 1.0, 1.6, 3.5),
    ('Devin Booker',            'Suns',         60, 35.0, 27.0, 47.0, 36.0, 86.0,  4.5,  6.5, 0.8, 0.4, 3.2),
    ('Kawhi Leonard',           'Clippers',     44, 30.0, 22.0, 51.0, 38.0, 87.0,  6.5,  3.5, 1.5, 0.5, 1.8),
    ('Jimmy Butler',            'Heat',         55, 33.0, 21.0, 49.0, 28.0, 84.0,  5.5,  5.0, 1.3, 0.5, 2.5),
    ('Jalen Brunson',           'Knicks',       62, 34.5, 26.5, 47.0, 38.0, 84.0,  3.5,  6.5, 0.9, 0.2, 2.2),
    ('Anthony Edwards',         'Timberwolves', 64, 35.0, 28.0, 46.0, 36.0, 79.0,  5.5,  5.0, 1.3, 0.6, 3.0),
    ('Donovan Mitchell',        'Cavaliers',    60, 34.0, 26.0, 46.0, 37.0, 83.0,  4.5,  5.5, 1.4, 0.3, 2.8),
    ('Paolo Banchero',          'Mavericks',    58, 34.0, 24.0, 47.0, 33.0, 77.0,  7.0,  5.5, 1.0, 0.7, 2.9),
    ('Tyrese Haliburton',       'Pacers',       62, 33.0, 21.0, 47.0, 39.0, 83.0,  4.0, 10.5, 1.2, 0.3, 3.1),
    ('Alperen Şengün',          'Rockets',      65, 30.0, 21.0, 54.0, 31.0, 78.0,  9.5,  5.0, 1.1, 1.3, 2.7),
    ('Kristaps Porziņģis',      'Celtics',      50, 28.0, 18.0, 50.0, 40.0, 85.0,  7.0,  2.5, 0.7, 1.8, 1.8),
    ('Domantas Sabonis',        'Cavaliers',    63, 31.0, 18.0, 58.0, 30.0, 72.0, 13.5,  7.5, 1.0, 0.5, 2.5),
    ('Franz Wagner',            'Mavericks',    60, 33.0, 22.0, 48.0, 35.0, 80.0,  5.5,  4.5, 1.1, 0.5, 2.3),
    ('Ivica Zubac',             'Clippers',     61, 27.0, 14.0, 64.0, 20.0, 72.0, 11.0,  2.0, 0.6, 1.8, 1.5),
    ('Jaylen Brown',            'Celtics',      60, 33.0, 23.0, 47.0, 36.0, 77.0,  5.5,  3.5, 1.1, 0.4, 2.5),
    ('Andrew Wiggins',          'Warriors',     58, 30.0, 17.0, 46.0, 38.0, 73.0,  4.5,  2.5, 1.0, 0.7, 1.5),
    ('Bam Adebayo',             'Heat',         60, 33.0, 20.0, 54.0, 20.0, 78.0, 10.5,  4.5, 1.2, 0.8, 2.2),
    ('De''Aaron Fox',           'Spurs',        63, 33.0, 25.0, 49.0, 33.0, 76.0,  4.5,  7.5, 1.6, 0.3, 3.0),
    ('Cade Cunningham',         'Nets',         59, 34.0, 24.0, 46.0, 34.0, 81.0,  5.5,  8.0, 1.3, 0.4, 3.2),
    ('Josh Giddey',             'Thunder',      58, 29.0, 15.0, 47.0, 32.0, 70.0,  7.5,  6.5, 1.0, 0.3, 2.5),
    ('Jaime Jaquez Jr.',        'Heat',         60, 28.0, 14.0, 47.0, 34.0, 75.0,  4.5,  3.0, 1.1, 0.3, 1.8)
) AS v(nome, equipe, jd, min, pts, aq, tres, ll, reb, ast, rbd, blq, bp)
JOIN jogadores  j ON j.nome = v.nome
JOIN equipes    e ON e.nome = v.equipe
JOIN temporadas t ON t.ano  = '2025-26';
