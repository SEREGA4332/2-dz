CREATE TABLE IF NOT EXISTS Genre (
    Genre_ID SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Performer (
    Performer_ID SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre_Performer (
    Genre_ID INTEGER REFERENCES Genre(Genre_ID),
    Performer_ID INTEGER REFERENCES Performer(Performer_ID),
    CONSTRAINT G_P PRIMARY KEY (Genre_ID, Performer_ID)
);

CREATE TABLE IF NOT EXISTS Album (
    Album_ID SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    release_date date
);

CREATE TABLE IF NOT exists Performer_Album (
    Performer_ID INTEGER REFERENCES Performer(Performer_ID),
    Album_ID INTEGER REFERENCES Album(Album_ID),
    CONSTRAINT P_A PRIMARY KEY (Album_ID, Performer_ID)
);

CREATE TABLE IF NOT EXISTS Track (
    Track_ID SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    Duration time,
    Album INTEGER REFERENCES Album(Album_ID)
);

CREATE TABLE IF NOT EXISTS Collection (
    Collection_ID SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    release_date date
);

CREATE TABLE IF NOT exists Track_Collection (
    Track_ID INTEGER REFERENCES Track(Track_ID),
    Collection_ID INTEGER REFERENCES Collection(Collection_ID),
    CONSTRAINT T_C PRIMARY KEY (Track_ID, Collection_ID)
);
