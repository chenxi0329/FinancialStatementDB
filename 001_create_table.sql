CREATE DATABASE alpha;

\c alpha;

CREATE TABLE tickers (
    cikNumber INT PRIMARY KEY,
    symbol VARCHAR(15)
);

CREATE TABLE balance_sheet (
    cikNumber INT PRIMARY KEY,
    assetsTotal BIGINT,
    liabilitiesTotal BIGINT,
    liabilitiesAndEquityTotal BIGINT,
    cashAndCashEquivalents BIGINT
);

CREATE TABLE income_statement (
    cikNumber INT PRIMARY KEY
);

CREATE TABLE cashflow_statement (
    cikNumber INT PRIMARY KEY
);

CREATE TABLE ratios (
    cikNumber INT PRIMARY KEY,
    operatingAssets BIGINT,
    operatingLiabilities BIGINT,
    netOperatingAssets BIGINT
);

CREATE TABLE prices (
    cikNumber INT PRIMARY KEY,
    symbol VARCHAR(15),
    date DATE,
    open float,
    high float,
    low float,
    close float,
    adjClose float,
    volume BIGINT
);


\dt;
