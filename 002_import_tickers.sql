COPY tickers_full
FROM '/tmp/ticker.csv' DELIMITER '|' CSV HEADER;

INSERT INTO tickers (ciknumber, symbol)
SELECT ciknumber, symbol
FROM tickers_full;