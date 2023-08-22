CREATE TABLE Product (
    Maker VARCHAR(1),
    Model INTEGER PRIMARY KEY,
    Type VARCHAR(7)
);

CREATE TABLE Pc (
    Model INTEGER PRIMARY KEY,
    Speed INTEGER,
    Ram INTEGER,
    Hd INTEGER,
    Price INTEGER
);

CREATE TABLE Laptop (
    Model INTEGER PRIMARY KEY,
    Speed INTEGER,
    Ram INTEGER,
    Hd INTEGER,
    Screen NUMERIC(3,1),
    Price INTEGER
);

CREATE TABLE Printer (
    Model INTEGER PRIMARY KEY,
    Color VARCHAR(5),
    Type VARCHAR(7),
    Price INTEGER
);


