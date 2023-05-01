import requests
from bs4 import BeautifulSoup

class theme:
    def __init__(self, name,quote=None):
        self.name = name.capitalize()
        self.quote = quote or []


    def __str__(self):
        return self.name
    
    def addQuote(self, book, chapter, verse=None):
        new_quote = biblicalQuote(book, chapter, verse)
        self.quote.append(new_quote)

    def excQuote(self, quote_str):
        for i, quote in enumerate(self.quote):
            if str(quote) == quote_str:
                self.quote.pop(i)
                print(f"Citação {quote_str} removida do tema: {self.name}.")
                return
    
    def printQuote(self):
        n = 1
        for r in self.quote:
            print(f'{n}. {r}')
            n += 1


class biblicalQuote:
    def __init__(self, book, chapter, verse=None, ref=None, comment=None):
        self.book = book
        self.chapter = chapter
        self.verse = verse # 18-20 => de 18 á 20; 18,20 => 18 e 20
        self.ref = ref or []
        self.comment = comment or []

    def __str__(self):
        return f"{self.book.capitalize()} {self.chapter}:{self.verse}"
    
    def printQuote(self):
        
        hyperlink = f'https://www.bibliaonline.com.br/ara/{self.book}/{self.chapter}/{self.verse}'
        html = requests.get(hyperlink)
        soup = BeautifulSoup(html.content, 'html.parser')

        passage = soup.find_all('p')

        n = 0

        for v in passage:
            n += 1

            if len(passage) > n:
                print(v.text)

    #referências

    def addRef(self, book, chapter, verse=None):
        new_ref = biblicalQuote(book, chapter, verse)
        self.ref.append(new_ref)

    def excRef(self, ref_str):
        for i, ref in enumerate(self.ref):
            if str(ref) == ref_str:
                self.ref.pop(i)
                print(f"Citação {ref_str} removida da lista de referências.")
                return
            
        print(f"Citação {ref_str} não encontrada na lista de referências.")
    
    def printRef(self):
        n = 1
        for r in self.ref:
            print(f'{n}. {r}')
            n += 1
    
    #comentários

    def addComment(self, comment):
        self.comment.append(comment)

    def excComment(self, comment):
        if comment in self.comment:
            self.comment.remove(comment)
            print("Comentário removido da lista de comentários.")
        else:
            print("Comentário não encontrado na lista de comentários.")

    def printComment(self):
        n = 1
        for comment in self.comment:
            print(f'{n}. {comment}')
            n += 1