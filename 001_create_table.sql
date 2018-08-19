CREATE DATABASE alpha;

\c alpha;

CREATE TABLE balance_sheet (
    cikNumber INT,
    assetsTotal BIGINT,
    liabilitiesTotal BIGINT,
    liabilitiesAndEquityTotal BIGINT,
    cashAndCashEquivalents BIGINT
);

CREATE TABLE income_statement (
    cikNumber INT
);

CREATE TABLE cashflow_statement (
    cikNumber INT
);

CREATE TABLE ratios (
    cikNumber INT,
    operatingAssets BIGINT,
    operatingLiabilities BIGINT,
    netOperatingAssets BIGINT
);

CREATE TABLE price (
    cikNumber INT,
    Symbol character varying(15),
    date DATE,
    Open float,
    High float,
    Low float,
    Close float,
    Adj_Close float,
    Volume BIGINT
);


\dt;
