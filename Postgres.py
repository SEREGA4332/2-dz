import psycopg2
from psycopg2.sql import SQL, Identifier


def create_db(conn):
    with conn.cursor() as cur:
        cur.execute("""
        DROP TABLE IF EXISTS Phone;
        DROP TABLE IF EXISTS Client;
        """)

        cur.execute("""
                CREATE TABLE IF NOT EXISTS Client(
                client_id SERIAL PRIMARY KEY,
                name VARCHAR(60) NOT NULL,
                surname VARCHAR(60) NOT NULL,
                e_mail VARCHAR(60) NOT NULL UNIQUE);
                """)

        cur.execute("""
                CREATE TABLE IF NOT EXISTS Phone(
                number TEXT [],
                client_id INTEGER REFERENCES Client(client_id));
                """)
        conn.commit()


def add_client(conn, name, surname, e_mail, phones=None):
    conn.execute("""
            INSERT INTO Client(name, surname, e_mail)
            VALUES(%s, %s, %s)
            RETURNING client_id, name, surname, e_mail;
            """, (name, surname, e_mail))
    return cur.fetchall()

def add_phone (conn, client_id, number):
	conn.execute("""
			INSERT INTO Phone (client_id, number)
			VALUES (%s,%s)
			RETURNING client_id, number;
			""", (client_id, number))
	return cur.fetchall()


def change_client(conn, client_id, name=None, surname=None, e_mail=None):
    arg_list = {'name': name, "surname": surname, 'e_mail': e_mail}
    for key, arg in arg_list.items():
        if arg:
            conn.execute(SQL("UPDATE Client SET {}=%s WHERE client_id=%s").format(Identifier(key)), (arg, client_id))
    conn.execute("""
            SELECT * FROM Client
            WHERE client_id=%s
            """, client_id)
    return cur.fetchall()

        
def change_phone(conn, client_id, number):
       arg_list = {'number': number, }
       for key, arg in arg_list.items():
        if arg:
            conn.execute(SQL("UPDATE Phone SET {}=%s WHERE client_id=%s").format(Identifier(key)), (arg, client_id))
       conn.execute("""
            SELECT * FROM Phone
            WHERE client_id=%s
            """, client_id)
       return cur.fetchall()
    

def delete_phone(conn, client_id, number=None):
    conn.execute("""
            DELETE FROM Phone
            WHERE client_id=%s
            """, (client_id,))
    conn.execute("""
            SELECT * FROM Phone
            """, (number, client_id))
    return cur.fetchall()

def delete_client(conn, client_id, name=None, surname=None, e_mail=None, number=None):
    conn.execute("""
            DELETE FROM Client
            WHERE client_id=%s
            """, (client_id,))
    conn.execute("""
            SELECT * FROM Client
            """, (name, surname, e_mail,client_id))
    return cur.fetchall()


def find_client(conn, client_id, name=None, surname=None, e_mail=None, number=None):
      arg_list = {'name': name, "surname": surname, 'e_mail': e_mail, 'number': number}
      for key, arg in arg_list.items():
        if arg:
            conn.execute(SQL("UPDATE Client SET {}=%s WHERE client_id=%s").format(Identifier(key)), (arg, client_id))
      conn.execute("""
            SELECT c.name, c.surname, c.e_mail, p.number FROM Client AS c
            LEFT JOIN Phone AS p ON c.client_id = p.client_id
            WHERE c.client_id=%s
            """, client_id)
      return cur.fetchall()

conn = psycopg2.connect(database="netol_db", user="postgres", password="220261")

create_db(conn)
with conn.cursor() as cur:
    print (add_client(cur, 'Tom','Adoms', 'tomad@mail.ru'))
    print (add_client(cur, 'Jon', 'Varon', 'samual@mail.com'))
    print (add_client(cur, 'JonI', 'Varonas', 'joni@mail.com'))
    print (add_phone(cur, '1', ['89109101314', '89101111213']))
    print (add_phone(cur, '2', ['89109101012']))
    print (add_phone(cur, '3', ['89109103322', '89167231415']))
    print(change_client(cur, '1', name='Tomas', e_mail='a_tomas@mail.ru'))
    print (change_phone(cur, '1', ['89109101315']))
    print (delete_phone(cur, '2'))
    print (delete_client(cur, '2'))
    print (find_client(cur,'3',))
    conn.commit()
