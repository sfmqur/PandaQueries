DROP TABLE IF EXISTS PUBLIC.CARDS_BAK;

CREATE TABLE PUBLIC.CARDS_BAK AS
SELECT
	*
FROM
	CARDS;

DROP TABLE PUBLIC.CARDS;

--new table format setup with adjusted layout
CREATE TABLE IF NOT EXISTS PUBLIC.CARDS (
	NAME TEXT COLLATE PG_CATALOG."default" NOT NULL,
	SET TEXT COLLATE PG_CATALOG."default",
	RARITY TEXT COLLATE PG_CATALOG."default" NOT NULL,
	TYPE TEXT COLLATE PG_CATALOG."default" NOT NULL,
	COST SMALLINT,
	THRESHOLD TEXT[] COLLATE PG_CATALOG."default",
	SUBTYPES TEXT[] COLLATE PG_CATALOG."default",
	TEXT TEXT COLLATE PG_CATALOG."default" NOT NULL,
	KEYWORDS TEXT[] COLLATE PG_CATALOG."default",
	POWER SMALLINT,
	DEFENSE SMALLINT,
	FLAVORTEXT TEXT COLLATE PG_CATALOG."default",
	PRICE MONEY,
	FOILPRICE MONEY,
	CONSTRAINT CARDS_PKEY PRIMARY KEY (NAME)
) TABLESPACE PG_DEFAULT;

ALTER TABLE IF EXISTS PUBLIC.CARDS OWNER TO SAM;

-- i renamed some columns hence the quotes. this just maps the columns together,
INSERT INTO
	PUBLIC.CARDS (name, set, rarity, type, cost, threshold, subtypes, text, keywords, power, defense, flavortext, price, foilprice)
SELECT
	name, set, rarity, type, cost, threshold, subtypes, text, keywords, power, defense, "flavorText", price, "foilPrice"
FROM
	public.cards_bak;

SELECT
	*
FROM
	PUBLIC.CARDS;