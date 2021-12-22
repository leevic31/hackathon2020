import psycopg2 as psg
import pickle as pck
import datetime

#Have the potus .pck file in the same folder
#RUN pip3 install psycopg2
#RUN python3 db_pop.py

def populate_db(potus):
    db_config = {
        "host":"localhost",
        "database":"hackathon2020_dev",
        "user":"postgres",
        "password":"YOURPASSWORD"
    }


    connection = psg.connect(**db_config, connect_timeout = 5)
    cursor = connection.cursor()

    for i, data in potus.iterrows():

        query = f'INSERT INTO sentiments ("tweetId", "sentiment", "irony", "hate", "emotion", "created_at", "updated_at") VALUES(%s, %s, %s, %s, %s, %s, %s)'
        cursor.execute(query, (int(data['tweetId']), data['sentiment'], data['irony'], data['hate'], data['emotion'], data['publishedAt'], datetime.datetime.now()))

    connection.commit()
    cursor.close()
    connection.close()

def fetch_potus():
    with open("./potus.pck", "rb") as file:
        potus = pck.load(file)

    return potus

if __name__ == '__main__':
    potus = fetch_potus()
    populate_db(potus)