year_1953_1996_novels(Book) :-
    novel(Book,1953);
    %% semicolon means OR
    novel(Book,1996).

period_1800_1900_novels(Book) :-
    novel(Book,Date),Date>=1800,Date=<1900.
    %%first extract date, then check if in bounds

lotr_fans(Fan) :-
    fan(Fan,X), member(the_lord_of_the_rings,X).
    %check if the books this fan likes includes rings

author_names(Author) :-
    author(Author,Novels), fan(chandler,Favs),
    %get the list of an authors books and compaare
    %it with chandlers favs to see if author is one of his fav
    repeater(Novels,Favs).

fans_names(Fan) :-
    fan(Fan,Favs),author(brandon_sanderson,Novels),
    %get the list of the fans favs, and check if
    %the list has one of brandons novels
    repeater(Favs,Novels).

    repeater([X|L1],L2) :-
      member(X,L2);
      repeater(L1,L2).

mutual_novels(Book) :-
    fan(phoebe,X),fan(ross,Y),fan(monica,Z),
    (common_item(Book,X,Y);
    common_item(Book,Y,Z);
    common_item(Book,X,Z)).


common_item(Item,A,B):-
        member(Item,A),member(Item,B).
