CREATE TABLE balance_sheet (
    cikNumber INT,
    assetsTotal BIGINT,
    liabilitiesTotal BIGINT,
    liabilitiesAndEquityTotal BIGINT,
    cashAndCashEquivalents BITINT
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
