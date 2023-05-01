USE solomon;

CREATE TABLE book (
    bookId SMALLINT AUTO_INCREMENT PRIMARY KEY,
	bookAbbreviation VARCHAR(3) CHARACTER SET utf8 COLLATE utf8_bin,
    bookName VARCHAR(255) UNIQUE NOT NULL,
    testament CHAR(2) NOT NULL -- VT para Velho Testamento ou NT para Novo Testamento
);

INSERT INTO book(bookName, bookAbbreviation, testament) 
VALUES ('Gênesis','gn','VT'),('Êxodo','ex','VT'),('Levítico','lv','VT'),('Números','nm','VT'),('Deuteronômio','dt','VT'),
('Josué','js','VT'),('Juízes','jz','VT'),('Rute','rt','VT'),('1º Samuel','1sm','VT'),('2º Samuel','2sm','VT'),
('1º Reis','1rs','VT'),('2º Reis','2rs','VT'),('1º Crônicas','1cr','VT'),('2º Crônicas','2cr','VT'),('Esdras','ed','VT'),
('Neemias','ne','VT'),('Ester','et','VT'),('Jó','jó','VT'),('Salmos','sl','VT'),('Provérbios','pv','VT'),('Eclesiastes','ec','VT'),
('Cânticos','ct','VT'),('Isaías','is','VT'),('Jeremias','jr','VT'),('Lamentações de Jeremias','lm','VT'),('Ezequiel','ez','VT'),
('Daniel','dn','VT'),('Oséias','os','VT'),('Joel','jl','VT'),('Amós','am','VT'),('Obadias','ob','VT'),('Jonas','jn','VT'),
('Miquéias','mq','VT'),('Naum','na','VT'),('Habacuque','hc','VT'),('Sofonias','sf','VT'),('Ageu','ag','VT'),('Zacarias','zc','VT'),
('Malaquias','ml','VT'), ('Mateus','mt','NT'),('Marcos','mc','NT'),('Lucas','lc','NT'),('João','jo','NT'),
('Atos','at','NT'),('Romanos','rm','NT'),('1ª Coríntios','1co','NT'),('2ª Coríntios','2co','NT'), ('Gálatas','gl','NT'),
('Efésios','ef','NT'),('Filipenses','fp','NT'),('Colossenses','cl','NT'),('1ª Tessalonicenses','1ts','NT'),
('2ª Tessalonicenses','2ts','NT'),('1ª Timóteo','1tm','NT'),('2ª Timóteo','2tm','NT'),('Tito','tt','NT'),('Filemom','fm','NT'),
('Hebreus','hb','NT'),('Tiago','tg','NT'),('1ª Pedro','1pe','NT'),('2ª Pedro','2pe','NT'), ('1ª João','1jo','NT'),
('2ª João','2jo','NT'),('3ª João','3jo','NT'),('Judas','jd','NT'),('Apocalipse','ap','NT');

CREATE TABLE verse (
	verseId SMALLINT AUTO_INCREMENT PRIMARY KEY,
    bookId SMALLINT NOT NULL,
    chapterNumber SMALLINT NOT NULL,
    verseNumber SMALLINT NOT NULL,
    verseContent VARCHAR(75) NOT NULL UNIQUE,
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