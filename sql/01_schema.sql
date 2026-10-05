-- =====================================================================
-- NBA Stats DB - Banco de Dados 1
-- Modelo relacional (3FN) inspirado na tabela de estatísticas da ESPN
-- SGBD: PostgreSQL 14+
-- =====================================================================

DROP VIEW  IF EXISTS vw_tabela_espn CASCADE;
DROP VIEW  IF EXISTS vw_lideres_temporada CASCADE;
DROP TABLE IF EXISTS estatisticas_temporada CASCADE;
DROP TABLE IF EXISTS jogadores CASCADE;
DROP TABLE IF EXISTS equipes CASCADE;
DROP TABLE IF EXISTS temporadas CASCADE;
DROP TABLE IF EXISTS posicoes CASCADE;
DROP TABLE IF EXISTS paises CASCADE;

-- ---------------------------------------------------------------------
-- Tabelas de domínio
-- ---------------------------------------------------------------------
CREATE TABLE paises (
    id     SERIAL       PRIMARY KEY,
    nome   VARCHAR(60)  NOT NULL UNIQUE,
    sigla  CHAR(3)      NOT NULL UNIQUE
);

CREATE TABLE posicoes (
    id         SERIAL      PRIMARY KEY,
    sigla      VARCHAR(2)  NOT NULL UNIQUE,   -- PG, SG, SF, PF, C
    descricao  VARCHAR(30) NOT NULL
);

CREATE TABLE temporadas (
    id      SERIAL      PRIMARY KEY,
    ano     VARCHAR(7)  NOT NULL UNIQUE,      -- ex.: '2025-26'
    CONSTRAINT ck_temporada_formato CHECK (ano ~ '^[0-9]{4}-[0-9]{2}$')
);

CREATE TABLE equipes (
    id          SERIAL       PRIMARY KEY,
    nome        VARCHAR(40)  NOT NULL UNIQUE, -- ex.: 'Lakers'
    cidade      VARCHAR(40)  NOT NULL,
    sigla       CHAR(3)      NOT NULL UNIQUE,
    conferencia VARCHAR(5)   NOT NULL,
    CONSTRAINT ck_conferencia CHECK (conferencia IN ('Leste', 'Oeste'))
);

-- ---------------------------------------------------------------------
-- Jogadores
-- ---------------------------------------------------------------------
CREATE TABLE jogadores (
    id               SERIAL        PRIMARY KEY,
    nome             VARCHAR(80)   NOT NULL,
    data_nascimento  DATE          NOT NULL,
    altura_cm        SMALLINT      NOT NULL,
    peso_kg          SMALLINT,
    pais_id          INT           NOT NULL REFERENCES paises(id),
    posicao_id       INT           NOT NULL REFERENCES posicoes(id),
    CONSTRAINT ck_altura CHECK (altura_cm BETWEEN 150 AND 250),
    CONSTRAINT ck_peso   CHECK (peso_kg IS NULL OR peso_kg BETWEEN 50 AND 200),
    CONSTRAINT uq_jogador UNIQUE (nome, data_nascimento)
);

-- ---------------------------------------------------------------------
-- Estatísticas por jogador / temporada / equipe
-- (colunas espelham a tabela da ESPN: JD, MIN, PTS, AQ%, 3PT%, LL%,
--  REB, AST, RBD, BLQ, BP)
-- ---------------------------------------------------------------------
CREATE TABLE estatisticas_temporada (
    id            SERIAL        PRIMARY KEY,
    jogador_id    INT           NOT NULL REFERENCES jogadores(id) ON DELETE CASCADE,
    temporada_id  INT           NOT NULL REFERENCES temporadas(id),
    equipe_id     INT           NOT NULL REFERENCES equipes(id),
    jd            SMALLINT      NOT NULL,           -- jogos disputados
    min           NUMERIC(4,1)  NOT NULL,           -- minutos por jogo
    pts           NUMERIC(4,1)  NOT NULL,           -- pontos por jogo
    aq_pct        NUMERIC(4,1)  NOT NULL,           -- aproveitamento de quadra %
    tres_pt_pct   NUMERIC(4,1)  NOT NULL,           -- aproveitamento 3 pontos %
    ll_pct        NUMERIC(4,1)  NOT NULL,           -- lances livres %
    reb           NUMERIC(4,1)  NOT NULL,           -- rebotes por jogo
    ast           NUMERIC(4,1)  NOT NULL,           -- assistências por jogo
    rbd           NUMERIC(3,1)  NOT NULL,           -- roubos de bola por jogo
    blq           NUMERIC(3,1)  NOT NULL,           -- bloqueios por jogo
    bp            NUMERIC(3,1)  NOT NULL,           -- bolas perdidas por jogo
    CONSTRAINT uq_stat UNIQUE (jogador_id, temporada_id, equipe_id),
    CONSTRAINT ck_jd   CHECK (jd BETWEEN 0 AND 82),
    CONSTRAINT ck_min  CHECK (min BETWEEN 0 AND 48),
    CONSTRAINT ck_pct  CHECK (aq_pct BETWEEN 0 AND 100
                          AND tres_pt_pct BETWEEN 0 AND 100
                          AND ll_pct BETWEEN 0 AND 100),
    CONSTRAINT ck_pos  CHECK (pts >= 0 AND reb >= 0 AND ast >= 0
                          AND rbd >= 0 AND blq >= 0 AND bp >= 0)
);

-- Índices para as consultas mais comuns
CREATE INDEX idx_jogadores_pais      ON jogadores(pais_id);
CREATE INDEX idx_jogadores_posicao   ON jogadores(posicao_id);
CREATE INDEX idx_stats_temporada     ON estatisticas_temporada(temporada_id);
CREATE INDEX idx_stats_equipe        ON estatisticas_temporada(equipe_id);
CREATE INDEX idx_stats_pts           ON estatisticas_temporada(pts DESC);

-- ---------------------------------------------------------------------
-- Views
-- ---------------------------------------------------------------------

-- Visual idêntico ao da ESPN: Ano | Equipe | JD | MIN | PTS | AQ% ...
CREATE VIEW vw_tabela_espn AS
SELECT  j.nome                  AS jogador,
        t.ano                   AS "Ano",
        e.nome                  AS "Equipe",
        s.jd                    AS "JD",
        s.min                   AS "MIN",
        s.pts                   AS "PTS",
        s.aq_pct                AS "AQ%",
        s.tres_pt_pct           AS "3PT%",
        s.ll_pct                AS "LL%",
        s.reb                   AS "REB",
        s.ast                   AS "AST",
        s.rbd                   AS "RBD",
        s.blq                   AS "BLQ",
        s.bp                    AS "BP"
FROM estatisticas_temporada s
JOIN jogadores  j ON j.id = s.jogador_id
JOIN temporadas t ON t.id = s.temporada_id
JOIN equipes    e ON e.id = s.equipe_id;

-- Ranking de pontos por temporada
CREATE VIEW vw_lideres_temporada AS
SELECT  t.ano,
        j.nome,
        e.sigla AS equipe,
        s.pts, s.reb, s.ast,
        RANK() OVER (PARTITION BY t.ano ORDER BY s.pts DESC) AS ranking_pts
FROM estatisticas_temporada s
JOIN jogadores  j ON j.id = s.jogador_id
JOIN temporadas t ON t.id = s.temporada_id
JOIN equipes    e ON e.id = s.equipe_id;
