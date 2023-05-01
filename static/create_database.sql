USE solomon;

CREATE TABLE book (
	bookAbbreviation CHAR(2) PRIMARY KEY,
    bookName VARCHAR(255) UNIQUE NOT NULL,
    testament CHAR(2) NOT NULL -- VT para Velho Testamento ou NT para Novo Testamento
);

CREATE TABLE verse (
	verseId SMALLINT AUTO_INCREMENT PRIMARY KEY,
    bookAbbreviation CHAR(2) NOT NULL,
    chapterNumber SMALLINT NOT NULL,
    verseNumber SMALLINT NOT NULL,
    verseContent VARCHAR(1020) NOT NULL UNIQUE,
    FOREIGN KEY (bookAbbreviation) REFERENCES book(bookAbbreviation)
);

CREATE TABLE quote (
    quoteId SMALLINT AUTO_INCREMENT PRIMARY KEY,
    quoteReference VARCHAR(15)
);

CREATE TABLE quoteVerse (
    quoteId SMALLINT,
    verseId SMALLINT,
    PRIMARY KEY(quoteId,verseId),
    FOREIGN KEY (quoteId) REFERENCES quote(quoteId)
    FOREIGN KEY (verseId) REFERENCES verse(verseId)
);

CREATE TABLE comment (
    commentId SMALLINT AUTO_INCREMENT PRIMARY KEY,
    quoteId SMALLINT, FOREIGN KEY (quoteId) REFERENCES quote(quoteId),
    commentContent VARCHAR(8000) NOT NULL UNIQUE 
);

CREATE TABLE ref (
    refId SMALLINT AUTO_INCREMENT PRIMARY KEY,
    quote1Id SMALLINT, FOREIGN KEY (quote1Id) REFERENCES quote(quoteId),
    quote2Id SMALLINT, FOREIGN KEY (quote2Id) REFERENCES quote(quoteId)
);