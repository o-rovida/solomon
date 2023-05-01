USE solomon;

CREATE TABLE book (
	bookAbbreviation CHAR(2) PRIMARY KEY,
    bookName VARCHAR(255) UNIQUE NOT NULL,
    testament CHAR(2) NOT NULL -- VT para Velho Testamento ou NT para Novo Testamento
);

CREATE TABLE author (
	authorName VARCHAR(255) PRIMARY KEY,
    authorBiography VARCHAR(255)
);

CREATE TABLE verse (
	bookAbbreviation CHAR(2) NOT NULL,
    chapterNumber SMALLINT NOT NULL,
    chapterAuthor VARCHAR(255),
    verseNumber SMALLINT NOT NULL,
    verseContent VARCHAR(1020) NOT NULL UNIQUE,
    PRIMARY KEY(bookAbbreviation,chapterNumber,verseNumber),
    FOREIGN KEY (bookAbbreviation) REFERENCES book(bookAbbreviation),
    FOREIGN KEY (chapterAuthor) REFERENCES author(authorName)
);

CREATE TABLE comment (

)

