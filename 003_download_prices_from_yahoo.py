import psycopg2
import os, time, subprocess

conn_string = "host='192.168.99.100' dbname='alpha' user='postgres' password='password'"
select_records_query = 'SELECT * FROM tickers'
sleep_time_in_second = 1

def requestCursor(conn_string):
    conn = psycopg2.connect(conn_string)
    cursor = conn.cursor()
    return cursor

def execute_read_query(sql_query, cursor):
    cursor.execute(sql_query)
    records = cursor.fetchall()
    return records

def download(ticker):
    print(ticker)
    subprocess.call(['sh', 'get-yahoo-quotes.sh', ticker])

cursor = requestCursor(conn_string)
records = execute_read_query(select_records_query, cursor)

tickers = [record[1] for record in records]

for ticker in tickers:
    while not os.path.exists(ticker + '.' + 'csv'):
        download(ticker)
        sleep_time_in_second *= 2
        time.sleep(sleep_time_in_second)