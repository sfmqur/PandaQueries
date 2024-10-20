DROP TABLE IF EXISTS cards_bak;

CREATE TABLE cards_bak AS
SELECT
    *
FROM
    cards;

DROP TABLE cards;

--new table format setup with adjusted layout
CREATE TABLE IF NOT EXISTS public.cards (
    name text COLLATE pg_catalog."default" NOT NULL,
    SET text COLLATE pg_catalog."default",
    rarity text COLLATE pg_catalog."default" NOT NULL,
    type text COLLATE pg_catalog."default" NOT NULL,
    cost smallint,
    threshold TEXT[] COLLATE pg_catalog."default",
    subtypes TEXT[] COLLATE pg_catalog."default",
    text text COLLATE pg_catalog."default" NOT NULL,
    keywords TEXT[] COLLATE pg_catalog."default",
    power smallint,
    defense smallint,
    flavortext text COLLATE pg_catalog."default",
    price money,
    foilprice money,
    CONSTRAINT cards_pkey PRIMARY KEY (name)
) tablespace pg_default;

ALTER TABLE IF EXISTS public.cards owner TO sam;

-- i renamed some columns hence the quotes. this just maps the columns together,
INSERT INTO
    cards (
        name,
        set,
        rarity,
        type,
        cost,
        threshold,
        subtypes,
        text,
        keywords,
        power,
        defense,
        flavortext,
        price,
        foilprice
    )
SELECT
    name,
    set,
    rarity,
    type,
    cost,
    threshold,
    subtypes,
    text,
    keywords,
    power,
    defense,
    "flavorText",
    price,
    "foilPrice"
FROM
    cards_bak;

SELECT
    *
FROM
    cards;