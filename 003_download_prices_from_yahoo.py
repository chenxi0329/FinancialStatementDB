import psycopg2
import os, time, subprocess

conn_string = "host='192.168.99.100' dbname='alpha' user='postgres' password='password'"
query_symbols = 'SELECT * FROM tickers'
sleep_time_in_second = 1
wait_between_download = False

def request_cursor(conn_string):
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

def is_file_exist_in_current_folder(file_name):
    return os.path.exists(file_name)

cursor = request_cursor(conn_string)
records = execute_read_query(query_symbols, cursor)
tickers = [record[1] for record in records]
failedList = []

for ticker in tickers:
    failedTimes = 0
    while not is_file_exist_in_current_folder(ticker + '.' + 'csv'):
        download(ticker)
        sleep_time_in_second *= 2
        if wait_between_download:
            time.sleep(sleep_time_in_second)
        failedTimes += 1
        if failedTimes > 5:
            failedList.append(ticker)
            break

print(failedList)